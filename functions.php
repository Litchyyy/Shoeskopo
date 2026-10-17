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
function shoeskopo_make_pdf(string $text): string {
    // Minimal valid one-page PDF for receipt attachment; text is kept ASCII-safe.
    $clean = preg_replace('/[^ -~]/', '?', $text);
    $lines = explode("\n", wordwrap($clean, 82, "\n", true));
    $stream = "BT\n/F1 11 Tf\n50 790 Td\n14 TL\n";
    foreach (array_slice($lines, 0, 48) as $line) {
        $line = str_replace(['\\', '(', ')'], ['\\\\', '\\(', '\\)'], $line);
        $stream .= '(' . $line . ") Tj\nT*\n";
    }
    $stream .= "ET";
    $objs = [];
    $objs[] = '<< /Type /Catalog /Pages 2 0 R >>';
    $objs[] = '<< /Type /Pages /Kids [3 0 R] /Count 1 >>';
    $objs[] = '<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842] /Resources << /Font << /F1 4 0 R >> >> /Contents 5 0 R >>';
    $objs[] = '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>';
    $objs[] = '<< /Length ' . strlen($stream) . ">>\nstream\n" . $stream . "\nendstream";
    $pdf = "%PDF-1.4\n"; $offsets = [0];
    foreach ($objs as $i => $obj) { $offsets[] = strlen($pdf); $pdf .= ($i+1) . " 0 obj\n" . $obj . "\nendobj\n"; }
    $xref = strlen($pdf); $pdf .= "xref\n0 6\n0000000000 65535 f \n";
    for ($i=1; $i<=5; $i++) $pdf .= sprintf('%010d 00000 n ', $offsets[$i]) . "\n";
    $pdf .= "trailer\n<< /Size 6 /Root 1 0 R >>\nstartxref\n" . $xref . "\n%%EOF";
    return $pdf;
}
function shoeskopo_send_mail(string $to, string $subject, string $body, ?string $attachmentName = null, ?string $attachmentData = null): bool {
    $cfg = require __DIR__ . '/../config/mail.php';
    $log = static function (string $message): void {
        // Writes to the PHP error log (XAMPP: usually apache/logs/error.log).
        // Never log SMTP passwords or message bodies.
        error_log('[Shoeskopo mail] ' . $message);
    };

    if (empty($cfg['enabled'])) { $log('Sending disabled in config/mail.php.'); return false; }
    if (empty($cfg['username']) || empty($cfg['password'])) { $log('SMTP username or password is empty in config/mail.php.'); return false; }
    if (!filter_var($to, FILTER_VALIDATE_EMAIL)) { $log('Recipient email is invalid.'); return false; }
    if (!filter_var((string)($cfg['from_email'] ?? ''), FILTER_VALIDATE_EMAIL)) { $log('from_email is invalid in config/mail.php.'); return false; }

    $host = (string)($cfg['host'] ?? '');
    $port = (int)($cfg['port'] ?? 0);
    if ($host === '' || $port < 1) { $log('SMTP host or port is missing/invalid.'); return false; }

    $boundary = '=_Shoeskopo_' . bin2hex(random_bytes(10));
    $headers = 'From: ' . ($cfg['from_name'] ?? 'Shoeskopo') . ' <' . $cfg['from_email'] . ">\r\n";
    $headers .= "MIME-Version: 1.0\r\nContent-Type: multipart/mixed; boundary=\"$boundary\"";
    $message = "--$boundary\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: 8bit\r\n\r\n$body\r\n";
    if ($attachmentName !== null && $attachmentData !== null) {
        $safeAttachmentName = str_replace(['"', "\r", "\n"], '', $attachmentName);
        $message .= "--$boundary\r\nContent-Type: application/pdf; name=\"$safeAttachmentName\"\r\nContent-Transfer-Encoding: base64\r\nContent-Disposition: attachment; filename=\"$safeAttachmentName\"\r\n\r\n" . chunk_split(base64_encode($attachmentData)) . "\r\n";
    }
    $message .= "--$boundary--\r\n";

    $errno = 0; $errstr = '';
    $fp = @stream_socket_client('tcp://' . $host . ':' . $port, $errno, $errstr, 10);
    if (!$fp) {
        $log("Connection failed to {$host}:{$port} (code {$errno}): {$errstr}");
        return false;
    }
    stream_set_timeout($fp, 10);
    $lastReply = '';
    $read = static function () use ($fp, &$lastReply): string {
        $reply = '';
        while (($line = fgets($fp, 515)) !== false) {
            $reply .= $line;
            if (strlen($line) >= 4 && $line[3] === ' ') break;
        }
        $lastReply = trim($reply);
        return $reply;
    };
    $step = 'server greeting';
    $cmd = static function (string $line, array $acceptedCodes) use ($fp, $read, &$step, $log): bool {
        $step = preg_replace('/\s+/', ' ', strtok($line, ' ')) ?: 'SMTP command';
        $written = @fwrite($fp, $line . "\r\n");
        if ($written === false) { $log("Write failed at {$step}."); return false; }
        $reply = $read();
        foreach ($acceptedCodes as $code) {
            if (str_starts_with($reply, (string)$code)) return true;
        }
        $log("SMTP rejected {$step}; server replied: " . trim($reply));
        return false;
    };

    try {
        $greeting = $read();
        $ok = str_starts_with($greeting, '220');
        if (!$ok) $log('Unexpected SMTP greeting: ' . trim($greeting));
        if ($ok) $ok = $cmd('EHLO shoeskopo.local', [250]);
        if ($ok && $port !== 465) {
            $ok = $cmd('STARTTLS', [220]);
            if ($ok) {
                $crypto = @stream_socket_enable_crypto($fp, true, STREAM_CRYPTO_METHOD_TLS_CLIENT);
                if ($crypto !== true) { $log('TLS negotiation failed after STARTTLS.'); $ok = false; }
            }
            if ($ok) $ok = $cmd('EHLO shoeskopo.local', [250]);
        } elseif ($ok && $port === 465) {
            $log('Port 465 requires implicit TLS; use Mailtrap Sandbox port 2525 or 587 with STARTTLS.');
            $ok = false;
        }
        if ($ok) $ok = $cmd('AUTH LOGIN', [334]);
        if ($ok) $ok = $cmd(base64_encode((string)$cfg['username']), [334]);
        if ($ok) $ok = $cmd(base64_encode((string)$cfg['password']), [235]);
        if ($ok) $ok = $cmd('MAIL FROM:<' . $cfg['from_email'] . '>', [250]);
        if ($ok) $ok = $cmd('RCPT TO:<' . $to . '>', [250, 251]);
        if ($ok) $ok = $cmd('DATA', [354]);
        if ($ok) {
            $safeSubject = str_replace(["\r", "\n"], '', $subject);
            $message = preg_replace('/(^|\r\n)\./', '$1..', $message);
            $payload = 'Subject: ' . $safeSubject . "\r\n" . $headers . "\r\n" . $message . "\r\n.\r\n";
            if (@fwrite($fp, $payload) === false) {
                $log('Could not write the email message payload.');
                $ok = false;
            } else {
                $finalReply = $read();
                $ok = str_starts_with($finalReply, '250');
                if (!$ok) $log('Message submission was rejected; server replied: ' . trim($finalReply));
                else $log("Message accepted by SMTP server for recipient {$to} (subject: " . str_replace(["\r", "\n"], '', $subject) . ').');
            }
        }
        if (!$ok) $log('Email sending failed during SMTP step: ' . $step . '.');
        @fwrite($fp, "QUIT\r\n");
        fclose($fp);
        return $ok;
    } catch (Throwable $e) {
        $log('Unexpected mail error: ' . get_class($e) . ': ' . $e->getMessage());
        if (is_resource($fp)) fclose($fp);
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
