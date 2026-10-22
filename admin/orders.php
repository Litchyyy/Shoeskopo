<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);

$statuses = ['Pending', 'Processing', 'Shipped', 'Completed', 'Cancelled'];
$error = '';
function notify_order_status(PDO $pdo, int $orderId, string $newStatus): bool {
    $st = $pdo->prepare('SELECT o.*, u.email, p.payment_method, p.payment_status, p.cash_received, p.change_due, p.paid_at 
FROM orders o 
    JOIN users u ON u.id=o.user_id 
    LEFT 
    JOIN payments p ON p.order_id=o.id 
WHERE o.id=?');
    $st->execute([$orderId]); $o = $st->fetch();
    if (!$o || !filter_var((string)($o['email'] ?? ''), FILTER_VALIDATE_EMAIL)) return false;
    $it = $pdo->prepare('SELECT product_name,size,quantity,unit_price 
FROM order_items 
WHERE order_id=?');
    $it->execute([$orderId]); $rows = $it->fetchAll();
    $items = []; $subtotal = 0.0; $details = '';
    foreach ($rows as $item) {
        $line = (float)$item['unit_price'] * (int)$item['quantity']; $subtotal += $line;
        $items[] = ['name'=>(string)$item['product_name'], 'size'=>(string)($item['size'] ?? ''), 'quantity'=>(int)$item['quantity'], 'unit_price'=>(float)$item['unit_price']];
        $details .= '<tr><td style="padding:10px;border-bottom:1px solid #ddd">'.htmlspecialchars((string)$item['product_name'], ENT_QUOTES, 'UTF-8').(!empty($item['size']) ? ' (Size '.htmlspecialchars((string)$item['size'], ENT_QUOTES, 'UTF-8').')' : '').'</td><td style="padding:10px;text-align:center;border-bottom:1px solid #ddd">'.(int)$item['quantity'].'</td><td style="padding:10px;text-align:right;border-bottom:1px solid #ddd">₱'.number_format($line,2).'</td></tr>';
    }
    $name = htmlspecialchars((string)($o['full_name'] ?? 'Customer'), ENT_QUOTES, 'UTF-8');
    $date = htmlspecialchars((string)($o['paid_at'] ?: $o['created_at']), ENT_QUOTES, 'UTF-8');
    $total = (float)$o['total']; $discount = max(0, $subtotal - $total);
    $money = static fn($v) => '₱'.number_format((float)$v, 2);
    $body = '<div style="font-family:Arial,sans-serif;color:#222;line-height:1.6;max-width:680px;margin:auto"><p>Dear '.$name.',</p><p>Thank you for shopping with Shoeskopo! We are pleased to inform you that your purchase has been successfully completed.</p><p>Please find your official sales receipt attached to this email for your reference.</p><div style="text-align:center;background:#f6a23a;padding:20px"><h1 style="margin:0">SHOESKOPO</h1><h2 style="margin:6px 0">OFFICIAL SALES RECEIPT</h2><strong>Payment Confirmed</strong><p style="margin:5px 0">Thank you for your purchase!</p></div><p><b>Receipt No.:</b> #'.$orderId.'<br><b>Date:</b> '.$date.'<br><b>Customer:</b> '.$name.'</p><h3>Purchase Details</h3><table style="width:100%;border-collapse:collapse"><thead><tr><th style="text-align:left;padding:10px;border-bottom:2px solid #222">Product</th><th style="padding:10px;border-bottom:2px solid #222">Qty.</th><th style="text-align:right;padding:10px;border-bottom:2px solid #222">Subtotal</th></tr></thead><tbody>'.$details.'</tbody></table><p style="text-align:right">Subtotal: '.$money($subtotal).'<br>Discount: '.$money($discount).'<br><strong style="font-size:18px">Grand Total: '.$money($total).'</strong></p><p><b>Payment Method:</b> '.htmlspecialchars((string)($o['payment_method'] ?: 'Cash'), ENT_QUOTES, 'UTF-8').'<br><b>Payment Status:</b> '.htmlspecialchars((string)($o['payment_status'] ?: 'Paid'), ENT_QUOTES, 'UTF-8').'<br><b>Sale Status:</b> '.htmlspecialchars($newStatus, ENT_QUOTES, 'UTF-8').'</p><p>Your transaction has been recorded successfully. Please keep this email and the attached official sales receipt as proof of your purchase.</p><p>If you have any questions or concerns regarding your purchase, please feel free to contact our support team. We will be happy to assist you.</p><p>Thank you for choosing Shoeskopo and for your continued trust and support. We look forward to serving you again!</p><p>Best regards,<br><b>Shoeskopo Sales Team</b><br>Customer Support<br>Shoeskopo | Quality Footwear, Reliable Service</p></div>';
    $pdf = shoeskopo_make_receipt_pdf([
        'receipt_no'=>$orderId, 'date'=>(string)($o['paid_at'] ?: $o['created_at']),
        'customer'=>(string)($o['full_name'] ?? 'Customer'), 'items'=>$items,
        'subtotal'=>$subtotal, 'discount'=>$discount, 'grand_total'=>$total,
        'cash_received'=>(float)($o['cash_received'] ?? $total), 'change'=>(float)($o['change_due'] ?? 0),
        'payment_method'=>(string)($o['payment_method'] ?: 'Cash'),
        'payment_status'=>(string)($o['payment_status'] ?: 'Paid'), 'sale_status'=>$newStatus
    ]);
    return shoeskopo_send_mail((string)$o['email'], 'Shoeskopo | Sale Completed – Official Sales Receipt', $body, 'Shoeskopo-Order-'.$orderId.'-Receipt.pdf', $pdf);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)($_POST['id'] ?? 0);
    $action = $_POST['action'] ?? 'status';

    try {
        if ($id < 1 && $action !== 'create') {
            throw new RuntimeException('Invalid order.');
        }

        if ($action === 'create') {
            throw new RuntimeException('Sales can only be created through customer purchases.');
        } elseif ($action === 'edit') {
            $total = (float)($_POST['total'] ?? 0);
            $status = $_POST['status'] ?? '';
            if ($total <= 0 || !in_array($status, $statuses, true)) {
                throw new RuntimeException('Enter a valid sale total and status.');
            }
            if ($status === 'Completed') {
                $paymentStmt = $pdo->prepare('SELECT payment_status 
FROM payments 
WHERE order_id = ?');
                $paymentStmt->execute([$id]);
                if ($paymentStmt->fetchColumn() !== 'Paid') {
                    throw new RuntimeException('Record the cash payment before completing this sale.');
                }
            }
            $oldStmt = $pdo->prepare('SELECT status FROM orders WHERE id = ?');
            $oldStmt->execute([$id]);
            $oldStatus = $oldStmt->fetchColumn();
            if ($oldStatus === 'Completed' && $status !== 'Completed') {
                throw new RuntimeException('Completed orders are locked and their status cannot be changed.');
            }
            $stmt = $pdo->prepare('UPDATE orders SET total = ?, status = ? WHERE id = ?');
            $stmt->execute([$total, $status, $id]);
            if ($oldStatus !== $status) { $mailSent = notify_order_status($pdo,$id,$status); $_SESSION['order_mail_notice'] = $mailSent ? 'Customer notification sent to the email sandbox.' : 'Order updated, but email was not sent. Check Mailtrap SMTP settings and the customer email.'; }
        } elseif ($action === 'delete') {
            $pdo->beginTransaction();
            $items = $pdo->prepare('SELECT product_id, quantity 
FROM order_items 
WHERE order_id = ?');
            $items->execute([$id]);
            $restore = $pdo->prepare('UPDATE products 
SET stock = stock + ? 
WHERE id = ?');
            foreach ($items as $item) {
                $restore->execute([(int)$item['quantity'], (int)$item['product_id']]);
            }
            $stmt = $pdo->prepare('DELETE 
FROM inventory_logs 
WHERE reference_type = \'order\' AND reference_id = ?');
            $stmt->execute([$id]);
            $stmt = $pdo->prepare('DELETE 
FROM order_items 
WHERE order_id = ?');
            $stmt->execute([$id]);
            $stmt = $pdo->prepare('DELETE 
FROM payments 
WHERE order_id = ?');
            $stmt->execute([$id]);
            $stmt = $pdo->prepare('DELETE 
FROM orders 
WHERE id = ?');
            $stmt->execute([$id]);
            $pdo->commit();
            $_SESSION['swal_flash'] = 'Changes saved successfully.';
            header('Location: orders.php?updated=1');
            exit;
        } elseif ($action === 'status') {
            $status = $_POST['status'] ?? '';
            if (!in_array($status, $statuses, true)) {
                throw new RuntimeException('Invalid order status.');
            }
            // Completed sales must have recorded payment first.
            if ($status === 'Completed') {
                $stmt = $pdo->prepare("SELECT payment_status 
FROM payments 
WHERE order_id = ?");
                $stmt->execute([$id]);
                if ($stmt->fetchColumn() !== 'Paid') {
                    throw new RuntimeException('Record the cash payment before completing this sale.');
                }
            }
            $oldStmt = $pdo->prepare('SELECT status FROM orders WHERE id = ?');
            $oldStmt->execute([$id]);
            $oldStatus = $oldStmt->fetchColumn();
            if ($oldStatus === 'Completed' && $status !== 'Completed') {
                throw new RuntimeException('Completed orders are locked and their status cannot be changed.');
            }
            $stmt = $pdo->prepare('UPDATE orders SET status = ? WHERE id = ?');
            $stmt->execute([$status, $id]);
            if ($oldStatus !== $status) { $mailSent = notify_order_status($pdo,$id,$status); $_SESSION['order_mail_notice'] = $mailSent ? 'Customer notification sent to the email sandbox.' : 'Order updated, but email was not sent. Check Mailtrap SMTP settings and the customer email.'; }
        }

        $_SESSION['swal_flash'] = 'Changes saved successfully.';
            header('Location: orders.php?updated=1');
            exit;
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }

        // Keep the exact database error in Apache's PHP error log so the
        // underlying cause is visible instead of incorrectly blaming only
        // the payments migration.
        error_log('[Shoeskopo Sale Management] ' . get_class($e) . ': ' . $e->getMessage());

        if ($e instanceof RuntimeException) {
            $error = $e->getMessage();
        } elseif ($e instanceof PDOException) {
            $error = 'Sale update failed because of a database error: ' . $e->getMessage()
                . ' Please check the Apache/PHP error log for [Shoeskopo Sale Management].';
        } else {
            $error = 'Sale update failed: ' . $e->getMessage();
        }
    }
}

$orders = $pdo->query(
    'SELECT o.*, u.email, p.payment_status, p.cash_received, p.change_due
     FROM orders o JOIN users u ON u.id = o.user_id
     LEFT JOIN payments p ON p.order_id = o.id
     ORDER BY o.created_at DESC'
)->fetchAll();

$completedCount = (int)$pdo->query("SELECT COUNT(*) FROM orders WHERE status = 'Completed'")->fetchColumn();
$completedTotal = (float)$pdo->query(
    "SELECT COALESCE(SUM(total), 0)
     FROM orders
     WHERE status = 'Completed'"
)->fetchColumn();
$allExpenses = (float)$pdo->query(
    'SELECT COALESCE(SUM(amount), 0)
     FROM expenses'
)->fetchColumn();
$netCompletedSales = $completedTotal - $allExpenses;

$pageTitle = 'Sale Management';
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell">
<h1>SALE MANAGEMENT</h1>
<?= admin_navigation('orders.php') ?>
<div class="stat-grid"><div class="stat-card">Completed orders<strong><?= $completedCount ?></strong></div><div class="stat-card">Completed sales (gross)<strong><?= money($completedTotal) ?></strong></div><div class="stat-card">Total expenses<strong><?= money($allExpenses) ?></strong></div><div class="stat-card">Sales after expenses<strong><?= money($netCompletedSales) ?></strong></div></div>
<p class="muted">All orders, including pending and completed sales, are shown below. Update an order's status here. Completed orders are included in the completed sales totals above automatically.</p>
<?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<?php if (isset($_GET['updated'])): ?><div class="form-success">Sale updated successfully.</div><?php endif; ?><?php if (!empty($_SESSION['order_mail_notice'])): ?><div class="<?= (str_contains($_SESSION['order_mail_notice'], 'failed') || str_contains($_SESSION['order_mail_notice'], 'not sent')) ? 'form-error' : 'form-success' ?>"><?= e($_SESSION['order_mail_notice']) ?></div><?php unset($_SESSION['order_mail_notice']); endif; ?>
<div class="table-wrap"><table class="data-table"><thead><tr><th>Order</th><th>Customer</th><th>Date</th><th>Total</th><th>Payment</th><th>Receipt</th><th>Status</th></tr></thead><tbody>
<?php foreach ($orders as $o): ?>
<tr>
<td>#<?= (int)$o['id'] ?></td><td><?= e($o['full_name'] ?? '') ?><br><small><?= e($o['email']) ?></small></td><td><?= e($o['created_at']) ?></td><td><?= money($o['total']) ?></td><td><?= e($o['payment_status'] ?? 'Pending') ?></td>
<td><?php if (($o['payment_status'] ?? 'Pending') === 'Paid'): ?><a href="../receipt.php?order=<?= (int)$o['id'] ?>" target="_blank">View receipt</a><div class="muted"><?= money($o['cash_received']) ?> paid<br>Change <?= money($o['change_due']) ?></div><?php else: ?><span class="muted">Payment required</span><?php endif; ?></td>
<td>
<form method="post" class="inline-form">
    <input type="hidden" name="action" value="edit"><input type="hidden" name="id" value="<?= (int)$o['id'] ?>">
    <input type="number" name="total" min="0.01" step="0.01" value="<?= e((string)$o['total']) ?>" required style="width:110px" <?= $o['status'] === 'Completed' ? 'readonly aria-label="Completed order total is not editable"' : '' ?>>
    <select name="status" <?= $o['status'] === 'Completed' ? 'disabled aria-label="Completed order status is not editable"' : '' ?>><?php foreach ($statuses as $s): ?><option value="<?= e($s) ?>" <?= $o['status'] === $s ? 'selected' : '' ?>><?= e($s) ?></option><?php endforeach; ?></select>
    <?php if ($o['status'] !== 'Completed'): ?><button type="submit" class="btn icon-button" style="padding:8px" aria-label="Save changes" title="Save changes">💾</button><?php else: ?><span class="dashboard-badge" aria-label="Completed order status"><?= e($o['status']) ?></span><?php endif; ?>
</form>
<form method="post" data-confirm="Delete this sale? Product quantities will be returned to stock." style="margin-top:6px">
    <input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$o['id'] ?>">
    <button type="submit" class="btn btn-danger icon-button" style="padding:8px 10px" aria-label="Delete sale" title="Delete sale">🗑️</button>
</form>
</td>
</tr>
<?php endforeach; ?>
</tbody></table></div></div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
