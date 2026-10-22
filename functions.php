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
    $pdo->exec("CREATE TABLE IF NOT EXISTS customer_cart_items ( id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, user_id INT NOT NULL, product_id INT NOT NULL, product_name VARCHAR(255) NOT NULL, price DECIMAL(10,2) NOT NULL DEFAULT 0, image_url VARCHAR(500) DEFAULT NULL, size VARCHAR(50) NOT NULL DEFAULT '', quantity INT NOT NULL DEFAULT 1, updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, UNIQUE KEY unique_user_product_size (user_id, product_id, size), KEY idx_customer_cart_user (user_id) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
    $ready = true;
}
function shoeskopo_load_cart(PDO $pdo): array {
    $user = current_user();
    if ($user && ($user['role'] ?? '') === 'customer') {
        shoeskopo_cart_table($pdo);
        $st = $pdo->prepare('SELECT product_id, product_name AS name, price, image_url, size, quantity 
FROM customer_cart_items 
WHERE user_id=? 
ORDER BY id');
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
        $del = $pdo->prepare('DELETE 
FROM customer_cart_items 
WHERE user_id=?');
        $del->execute([(int)$user['id']]);
        $ins = $pdo->prepare('INSERT INTO customer_cart_items (user_id,product_id,product_name,price,image_url,size,quantity) 
VALUES (?,?,?,?,?,?,?)');
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
        $st = $pdo->prepare('DELETE 
FROM customer_cart_items 
WHERE user_id=?');
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
            $st = $GLOBALS['pdo']->prepare('SELECT is_active, role 
FROM users 
WHERE id = ?');
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
/** Build a small one-page PDF attachment for order emails. */
function shoeskopo_make_pdf(string $text): string {
    $clean = preg_replace('/[^ -~]/', '?', $text);
    $lines = explode("\n", wordwrap($clean, 82, "\n", true));
    $stream = "BT\n/F1 11 Tf\n50 790 Td\n14 TL\n";
    foreach (array_slice($lines, 0, 48) as $line) {
        $line = str_replace(['\\', '(', ')'], ['\\\\', '\\(', '\\)'], $line);
        $stream .= '(' . $line . ") Tj\nT*\n";
    }
    $stream .= 'ET';
    $objs = [
        '<< /Type /Catalog /Pages 2 0 R >>',
        '<< /Type /Pages /Kids [3 0 R] /Count 1 >>',
        '<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842] /Resources << /Font << /F1 4 0 R >> >> /Contents 5 0 R >>',
        '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>',
        '<< /Length ' . strlen($stream) . ">>\nstream\n" . $stream . "\nendstream",
    ];
    $pdf = "%PDF-1.4\n"; $offsets = [0];
    foreach ($objs as $i => $obj) { $offsets[] = strlen($pdf); $pdf .= ($i + 1) . " 0 obj\n" . $obj . "\nendobj\n"; }
    $xref = strlen($pdf); $pdf .= "xref\n0 6\n0000000000 65535 f \n";
    for ($i = 1; $i <= 5; $i++) $pdf .= sprintf('%010d 00000 n ', $offsets[$i]) . "\n";
    return $pdf . "trailer\n<< /Size 6 /Root 1 0 R >>\nstartxref\n" . $xref . "\n%%EOF";
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
        $isHtmlBody = preg_match('/<\s*(div|p|table|h1|h2|h3|html)\b/i', $body) === 1;
        $emailContent = $isHtmlBody ? $body : nl2br(htmlspecialchars($body, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'));
        $mail->Body = '<!doctype html><html><body style="margin:0;padding:24px;background:#f4f5f7;font-family:Arial,Helvetica,sans-serif;color:#222;"><div style="max-width:720px;margin:0 auto;background:#fff;border:1px solid #e5e7eb;border-radius:10px;overflow:hidden;">' . ($isHtmlBody ? '' : '<div style="background:#f6a23a;padding:18px 26px;color:#222;text-align:center;"><strong style="font-size:22px;letter-spacing:2px;">SHOESKOPO</strong></div>') . '<div style="padding:26px;line-height:1.65;font-size:14px;">' . $emailContent . '</div></div></body></html>';
        $mail->AltBody = $isHtmlBody ? trim(preg_replace('/[ \t]+/', ' ', html_entity_decode(strip_tags(preg_replace('/<\/tr>/i', "\n", preg_replace('/<\/t[dh]>/i', ' | ', $body))), ENT_QUOTES | ENT_HTML5, 'UTF-8'))) : $body;
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
