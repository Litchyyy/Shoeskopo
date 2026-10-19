<?php
if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}
function e(?string $value): string {
    return htmlspecialchars($value ?? '', ENT_QUOTES, 'UTF-8');
}
function current_user(): ?array {
    return $_SESSION['user'] ?? null;
}

/** Persistent, account-specific shopping cart storage. */
function shoeskopo_cart_table(PDO $pdo): void {
    static $ready = false;
    if ($ready) return;
    $pdo->exec("CREATE TABLE IF NOT EXISTS customer_cart_items (
        id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        user_id INT NOT NULL,
        product_id INT NOT NULL,
        product_name VARCHAR(255) NOT NULL,
        price DECIMAL(10,2) NOT NULL DEFAULT 0,
        image_url VARCHAR(500) DEFAULT NULL,
        size VARCHAR(50) NOT NULL DEFAULT '',
        quantity INT NOT NULL DEFAULT 1,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        UNIQUE KEY unique_user_product_size (user_id, product_id, size),
        KEY idx_customer_cart_user (user_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
    $ready = true;
}
function shoeskopo_load_cart(PDO $pdo): array {
    $user = current_user();
    if ($user && ($user['role'] ?? '') === 'customer') {
        shoeskopo_cart_table($pdo);
        $st = $pdo->prepare('SELECT product_id, product_name AS name, price, image_url, size, quantity FROM customer_cart_items WHERE user_id=? ORDER BY id');
        $st->execute([(int)$user['id']]);
        $cart = [];
        foreach ($st->fetchAll() as $item) {
            $key = (int)$item['product_id'] . '_' . (string)$item['size'];
            $cart[$key] = ['product_id'=>(int)$item['product_id'], 'name'=>$item['name'], 'price'=>(float)$item['price'], 'image_url'=>$item['image_url'], 'size'=>$item['size'], 'quantity'=>(int)$item['quantity']];
        }
        $_SESSION['cart'] = $cart;
        return $cart;
    }
    $_SESSION['cart'] = $_SESSION['cart'] ?? [];
    return $_SESSION['cart'];
}
function shoeskopo_save_cart(PDO $pdo, array $cart): void {
    $_SESSION['cart'] = $cart;
    $user = current_user();
    if (!$user || ($user['role'] ?? '') !== 'customer') return;
    shoeskopo_cart_table($pdo);
    $pdo->beginTransaction();
    try {
        $del = $pdo->prepare('DELETE FROM customer_cart_items WHERE user_id=?');
        $del->execute([(int)$user['id']]);
        $ins = $pdo->prepare('INSERT INTO customer_cart_items (user_id,product_id,product_name,price,image_url,size,quantity) VALUES (?,?,?,?,?,?,?)');
        foreach ($cart as $item) {
            $ins->execute([(int)$user['id'], (int)$item['product_id'], (string)$item['name'], (float)$item['price'], $item['image_url'] ?? null, (string)($item['size'] ?? ''), max(1,(int)$item['quantity'])]);
        }
        $pdo->commit();
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }
}
function shoeskopo_clear_cart(PDO $pdo): void {
    $_SESSION['cart'] = [];
    $user = current_user();
    if ($user && ($user['role'] ?? '') === 'customer') {
        shoeskopo_cart_table($pdo);
        $st = $pdo->prepare('DELETE FROM customer_cart_items WHERE user_id=?');
        $st->execute([(int)$user['id']]);
    }
}

function require_login(): void {
    if (!current_user()) {
        $_SESSION['flash_error'] = 'Please log in to access that page.';
        $target = basename($_SERVER['SCRIPT_NAME'] ?? 'index.php');
        header('Location: ' . (str_contains($_SERVER['SCRIPT_NAME'] ?? '', '/admin/') ? '../login.php' : (str_contains($_SERVER['SCRIPT_NAME'] ?? '', '/employee/') ? '../login.php' : 'login.php')));
        exit;
    }
    // Refresh the account status from the database so deactivated accounts lose access.
    if (isset($GLOBALS['pdo'])) {
        try {
            $st = $GLOBALS['pdo']->prepare('SELECT is_active, role FROM users WHERE id = ?');
            $st->execute([(int)current_user()['id']]);
            $account = $st->fetch();
            if (!$account || (int)($account['is_active'] ?? 1) !== 1) {
                $_SESSION = [];
                if (session_status() === PHP_SESSION_ACTIVE) session_destroy();
                header('Location: ' . (str_contains($_SERVER['SCRIPT_NAME'] ?? '', '/') ? (str_contains($_SERVER['SCRIPT_NAME'] ?? '', '/admin/') || str_contains($_SERVER['SCRIPT_NAME'] ?? '', '/employee/') ? '../login.php?disabled=1' : 'login.php?disabled=1') : 'login.php?disabled=1'));
                exit;
            }
        } catch (Throwable $e) { /* Migration may not have been imported yet. */ }
    }
}
/** Build a receipt-style PDF using the same receipt fields and order data as receipt.php. */
function shoeskopo_make_receipt_pdf(array $receipt): string {
    $items = is_array($receipt['items'] ?? null) ? $receipt['items'] : [];
    $subtotal = (float)($receipt['subtotal'] ?? 0);
    $discount = (float)($receipt['discount'] ?? 0);
    $grandTotal = (float)($receipt['grand_total'] ?? $subtotal - $discount);
    $cashReceived = (float)($receipt['cash_received'] ?? 0);
    $change = (float)($receipt['change'] ?? max(0, $cashReceived - $grandTotal));
    $pageW = 595; $pageH = max(842, 850 + max(0, count($items) - 14) * 22);
    $commands = [];
    $esc = static function ($value): string {
        $value = (string)($value ?? '');
        if (function_exists('iconv')) {
            $converted = @iconv('UTF-8', 'Windows-1252//TRANSLIT//IGNORE', $value);
            if ($converted !== false) $value = $converted;
        }
        $value = preg_replace('/[^\x20-\xFF]/', '?', $value);
        return str_replace(['\\', '(', ')'], ['\\\\', '\\(', '\\)'], $value);
    };
    $text = static function (float $x, float $y, string $value, int $size = 10, bool $bold = false, string $align = 'left') use (&$commands, $esc, $pageH): void {
        $value = $esc($value);
        $font = $bold ? 'F2' : 'F1';
        // Approximate alignment with Helvetica character widths.
        if ($align === 'right') $x -= strlen($value) * $size * 0.52;
        if ($align === 'center') $x -= strlen($value) * $size * 0.26;
        // Explicitly set PDF text to black so receipt details remain visible on white backgrounds.
        $commands[] = "0 0 0 rg BT /{$font} {$size} Tf 1 0 0 1 {$x} " . ($GLOBALS['__unused_pdf_y'] ?? ($pageH - $y)) . " Tm ({$value}) Tj ET";
    };
    $line = static function (float $x1, float $y1, float $x2, float $y2, float $width = 0.7, array $dash = []) use (&$commands, $pageH): void {
        $dashCmd = $dash ? '[' . implode(' ', $dash) . '] 0 d' : '[] 0 d';
        $commands[] = "{$width} w {$dashCmd} {$x1} " . ($pageH - $y1) . " m {$x2} " . ($pageH - $y2) . " l S [] 0 d";
    };
    $rect = static function (float $x, float $y, float $w, float $h, bool $fill = false) use (&$commands, $pageH): void {
        $bottom = $pageH - $y - $h;
        $commands[] = ($fill ? '0.97 0.97 0.97 rg ' : '0.85 0.85 0.85 RG ') . "{$x} {$bottom} {$w} {$h} re " . ($fill ? 'f' : 'S');
    };
    $money = static fn($amount): string => 'P' . number_format((float)$amount, 2);

    // Header and receipt identity
    $text(297.5, 48, 'SHOESKOPO', 22, true, 'center');
    $text(297.5, 70, 'SALES RECEIPT', 13, true, 'center');
    $text(297.5, 88, 'Thank you for your purchase!', 10, false, 'center');
    $line(42, 104, 553, 104, 1.1, [4, 3]);

    $text(44, 126, 'Receipt No.: #' . (int)($receipt['receipt_no'] ?? 0), 9, true);
    $text(330, 126, 'Date: ' . (string)($receipt['date'] ?? ''), 9);
    $text(44, 144, 'Customer: ' . (string)($receipt['customer'] ?? 'Customer'), 9);
    $text(330, 144, 'Payment: ' . (string)($receipt['payment_method'] ?? 'Cash'), 9);
    $text(44, 162, 'Payment status: ' . (string)($receipt['payment_status'] ?? 'Paid'), 9);
    $text(330, 162, 'Sale status: ' . (string)($receipt['sale_status'] ?? 'Pending'), 9);

    $text(44, 195, 'PURCHASE DETAILS', 11, true);
    $rect(42, 207, 511, 25, true);
    $text(50, 223, 'Item', 9, true);
    $text(370, 223, 'Qty.', 9, true, 'center');
    $text(445, 223, 'Unit price', 9, true, 'right');
    $text(543, 223, 'Subtotal', 9, true, 'right');
    $line(42, 232, 553, 232, 0.6);
    $y = 251;
    foreach ($items as $item) {
        $name = (string)($item['name'] ?? 'Product');
        if (!empty($item['size'])) $name .= ' (Size ' . (string)$item['size'] . ')';
        // Keep long names within the item column.
        if (strlen($name) > 43) $name = substr($name, 0, 40) . '...';
        $qty = max(0, (int)($item['quantity'] ?? 0));
        $unit = (float)($item['unit_price'] ?? $item['price'] ?? 0);
        $rowTotal = $unit * $qty;
        $text(50, $y, $name, 9);
        $text(370, $y, (string)$qty, 9, false, 'center');
        $text(445, $y, number_format($unit, 2), 9, false, 'right');
        $text(543, $y, number_format($rowTotal, 2), 9, false, 'right');
        $line(42, $y + 8, 553, $y + 8, 0.35);
        $y += 22;
        // Do not silently omit remaining purchased items from the emailed receipt.
    }
    $y += 12;
    $labelX = 390; $valueX = 543;
    $text($labelX, $y, 'Subtotal', 10);
    $text($valueX, $y, $money($subtotal), 10, false, 'right'); $y += 21;
    $text($labelX, $y, 'Discount', 10);
    $text($valueX, $y, $money($discount), 10, false, 'right'); $y += 10;
    $line(365, $y, 553, $y, 1.2); $y += 22;
    $text($labelX, $y, 'GRAND TOTAL', 12, true);
    $text($valueX, $y, $money($grandTotal), 12, true, 'right'); $y += 23;
    $text($labelX, $y, 'Cash received', 10);
    $text($valueX, $y, $money($cashReceived), 10, false, 'right'); $y += 20;
    $text($labelX, $y, 'Change', 10);
    $text($valueX, $y, $money($change), 10, false, 'right');

    $footerY = max(760, $y + 62);
    $line(42, $footerY, 553, $footerY, 1.1, [4, 3]);
    $text(297.5, $footerY + 22, 'Thank you for shopping at Shoeskopo!', 10, true, 'center');
    $text(297.5, $footerY + 40, 'This is your sales receipt.', 9, false, 'center');

    $stream = implode("\n", $commands) . "\n";
    $objs = [
        '<< /Type /Catalog /Pages 2 0 R >>',
        '<< /Type /Pages /Kids [3 0 R] /Count 1 >>',
        '<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 ' . $pageH . '] /Resources << /Font << /F1 4 0 R /F2 5 0 R >> >> /Contents 6 0 R >>',
        '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica /Encoding /WinAnsiEncoding >>',
        '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold /Encoding /WinAnsiEncoding >>',
        '<< /Length ' . strlen($stream) . ">>\nstream\n" . $stream . "endstream",
    ];
    $pdf = "%PDF-1.4\n"; $offsets = [0];
    foreach ($objs as $i => $obj) { $offsets[] = strlen($pdf); $pdf .= ($i + 1) . " 0 obj\n" . $obj . "\nendobj\n"; }
    $xref = strlen($pdf); $pdf .= "xref\n0 7\n0000000000 65535 f \n";
    for ($i = 1; $i <= 6; $i++) $pdf .= sprintf('%010d 00000 n ', $offsets[$i]) . "\n";
    return $pdf . "trailer\n<< /Size 7 /Root 1 0 R >>\nstartxref\n" . $xref . "\n%%EOF";
}

/** Send through PHPMailer and return true only when the SMTP server accepts it. */
function shoeskopo_send_mail(string $to, string $subject, string $body, ?string $attachmentName = null, ?string $attachmentData = null): bool {
    $log = static function (string $message): void { error_log('[Shoeskopo mail] ' . $message); };
    try {
        $cfg = require __DIR__ . '/../config/mail.php';
        $autoload = __DIR__ . '/../vendor/autoload.php';
        if (!is_file($autoload)) { $log('PHPMailer is not installed. Run composer require phpmailer/phpmailer from the project folder.'); return false; }
        require_once $autoload;
        if (empty($cfg['enabled'])) { $log('Sending is disabled in config/mail.php.'); return false; }
        if (empty($cfg['username']) || empty($cfg['password'])) { $log('SMTP username/password missing. Configure MAILTRAP_USERNAME and MAILTRAP_PASSWORD.'); return false; }
        if (!filter_var($to, FILTER_VALIDATE_EMAIL)) { $log('Recipient email is missing or invalid.'); return false; }
        if (!filter_var((string)($cfg['from_email'] ?? ''), FILTER_VALIDATE_EMAIL)) { $log('Sender email is missing or invalid.'); return false; }
        $mail = new PHPMailer\PHPMailer\PHPMailer(true);
        $mail->isSMTP();
        $mail->Host = (string)$cfg['host'];
        $mail->SMTPAuth = true;
        $mail->Username = (string)$cfg['username'];
        $mail->Password = (string)$cfg['password'];
        $mail->Port = (int)$cfg['port'];
        $mail->SMTPSecure = PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Timeout = 15;
        $mail->CharSet = 'UTF-8';
        $mail->setFrom((string)$cfg['from_email'], (string)($cfg['from_name'] ?? 'Shoeskopo'));
        $mail->addAddress($to);
        $mail->Subject = $subject;
        // Render readable, consistently formatted HTML while preserving a plain-text fallback.
        $mail->isHTML(true);
        $mail->Body = (strpos(ltrim($body), '<div') === 0 || strpos(ltrim($body), '<!doctype') === 0)
            ? $body
            : '<!doctype html><html><body style="margin:0;padding:24px;background:#f4f5f7;font-family:Arial,Helvetica,sans-serif;color:#222;"><div style="max-width:640px;margin:0 auto;background:#fff;border:1px solid #e5e7eb;border-radius:10px;overflow:hidden;"><div style="background:#f6a23a;padding:22px 26px;color:#222;"><h1 style="margin:0;font-size:24px;letter-spacing:1px;">SHOESKOPO</h1><p style="margin:6px 0 0;">Order update</p></div><div style="padding:26px;line-height:1.65;font-size:14px;">' . nl2br(htmlspecialchars($body, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8')) . '</div><div style="padding:16px 26px;background:#f8f8f8;border-top:1px solid #eee;color:#666;font-size:12px;">Thank you for shopping with Shoeskopo.</div></div></body></html>';
        $mail->AltBody = $body;
        if ($attachmentName !== null && $attachmentData !== null) $mail->addStringAttachment($attachmentData, basename($attachmentName), 'base64', 'application/pdf');
        $mail->send();
        $log('SMTP accepted message for recipient ' . $to . ' (subject: ' . str_replace(["\r", "\n"], '', $subject) . ').');
        return true;
    } catch (Throwable $e) {
        $log('Send failed: ' . get_class($e) . ': ' . $e->getMessage());
        return false;
    }
}

function require_role(array $roles): void {
    require_login();
    if (!in_array(current_user()['role'] ?? '', $roles, true)) {
        http_response_code(403);
        exit('Access denied.');
    }
}
function money($amount): string {
    return '₱' . number_format((float)$amount, 2);
}

function admin_navigation(string $active = ''): string {
    $items = [
        'index.php' => 'Dashboard', 'orders.php' => 'Sale Management',
        'completed_sales.php' => 'Completed Sales', 'products.php' => 'Products',
        'categories.php' => 'Categories', 'suppliers.php' => 'Suppliers',
        'inventory.php' => 'Inventory', 'users.php' => 'Users', 'reports.php' => 'Reports & Expenses'
    ];
    $html = '<nav class="admin-nav" aria-label="Admin menu">';
    foreach ($items as $file => $label) {
        $current = ($active === $file) ? ' aria-current="page" class="active"' : '';
        $html .= '<a href="' . e($file) . '"' . $current . '>' . e($label) . '</a>';
    }
    return $html . '</nav>';
}
