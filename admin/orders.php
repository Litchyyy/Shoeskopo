<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);

$statuses = ['Pending', 'Processing', 'Shipped', 'Completed', 'Cancelled'];
$error = '';
function notify_order_status(PDO $pdo, int $orderId, string $newStatus): bool {
    $st=$pdo->prepare('SELECT o.*,u.email FROM orders o JOIN users u ON u.id=o.user_id WHERE o.id=?'); $st->execute([$orderId]); $o=$st->fetch(); if(!$o || !filter_var((string)($o['email'] ?? ''), FILTER_VALIDATE_EMAIL)) return false;
    $it=$pdo->prepare('SELECT product_name,size,quantity,unit_price FROM order_items WHERE order_id=?'); $it->execute([$orderId]); $items=$it->fetchAll();
    $body="Hello {$o['full_name']},\n\nYour Shoeskopo order #{$orderId} status has been updated to: {$newStatus}.\n\nOrder details:\n"; $subtotal=0;
    foreach($items as $item) { $line=(float)$item['unit_price']*(int)$item['quantity']; $subtotal+=$line; $body.=$item['product_name'].' (size '.($item['size']?:'N/A').') x '.$item['quantity'].' @ PHP '.number_format((float)$item['unit_price'],2).' = PHP '.number_format($line,2)."\n"; }
    $body.="\nSubtotal: PHP ".number_format($subtotal,2)."\nGrand total: PHP ".number_format((float)$o['total'],2)."\n\nThank you for shopping with Shoeskopo.";
    $pdfText="SHOESKOPO - ORDER RECEIPT\nOrder #{$orderId}\nDate: {$o['created_at']}\nCustomer: {$o['full_name']}\nStatus: {$newStatus}\n\n";
    foreach($items as $item) $pdfText.=$item['product_name'].' | Size '.$item['size'].' | Qty '.$item['quantity'].' | Unit PHP '.number_format((float)$item['unit_price'],2).' | Subtotal PHP '.number_format((float)$item['unit_price']*(int)$item['quantity'],2)."\n";
    $pdfText.="\nSubtotal: PHP ".number_format($subtotal,2)."\nGrand total: PHP ".number_format((float)$o['total'],2);
    return shoeskopo_send_mail($o['email'], 'Shoeskopo order #'.$orderId.' status: '.$newStatus, $body, 'Shoeskopo-Receipt-'.$orderId.'.pdf', shoeskopo_make_pdf($pdfText));
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
                $paymentStmt = $pdo->prepare('SELECT payment_status FROM payments WHERE order_id = ?');
                $paymentStmt->execute([$id]);
                if ($paymentStmt->fetchColumn() !== 'Paid') {
                    throw new RuntimeException('Record the cash payment before completing this sale.');
                }
            }
            $oldStmt=$pdo->prepare('SELECT status FROM orders WHERE id=?'); $oldStmt->execute([$id]); $oldStatus=$oldStmt->fetchColumn();
            $stmt = $pdo->prepare('UPDATE orders SET total = ?, status = ? WHERE id = ?');
            $stmt->execute([$total, $status, $id]);
            if ($oldStatus !== $status) { $mailSent = notify_order_status($pdo,$id,$status); $_SESSION['order_mail_notice'] = $mailSent ? 'Customer notification sent through Mailtrap.' : 'Order updated, but email was not sent. Check Mailtrap SMTP settings and the customer email.'; }
        } elseif ($action === 'delete') {
            $pdo->beginTransaction();
            $items = $pdo->prepare('SELECT product_id, quantity FROM order_items WHERE order_id = ?');
            $items->execute([$id]);
            $restore = $pdo->prepare('UPDATE products SET stock = stock + ? WHERE id = ?');
            foreach ($items as $item) {
                $restore->execute([(int)$item['quantity'], (int)$item['product_id']]);
            }
            $stmt = $pdo->prepare('DELETE FROM inventory_logs WHERE reference_type = \'order\' AND reference_id = ?');
            $stmt->execute([$id]);
            $stmt = $pdo->prepare('DELETE FROM order_items WHERE order_id = ?');
            $stmt->execute([$id]);
            $stmt = $pdo->prepare('DELETE FROM payments WHERE order_id = ?');
            $stmt->execute([$id]);
            $stmt = $pdo->prepare('DELETE FROM orders WHERE id = ?');
            $stmt->execute([$id]);
            $pdo->commit();
            header('Location: orders.php?updated=1');
            exit;
        } elseif ($action === 'status') {
            $status = $_POST['status'] ?? '';
            if (!in_array($status, $statuses, true)) {
                throw new RuntimeException('Invalid order status.');
            }
            // Completed sales must have recorded payment first.
            if ($status === 'Completed') {
                $stmt = $pdo->prepare("SELECT payment_status FROM payments WHERE order_id = ?");
                $stmt->execute([$id]);
                if ($stmt->fetchColumn() !== 'Paid') {
                    throw new RuntimeException('Record the cash payment before completing this sale.');
                }
            }
            $oldStmt=$pdo->prepare('SELECT status FROM orders WHERE id=?'); $oldStmt->execute([$id]); $oldStatus=$oldStmt->fetchColumn();
            $stmt = $pdo->prepare('UPDATE orders SET status = ? WHERE id = ?');
            $stmt->execute([$status, $id]);
            if ($oldStatus !== $status) { $mailSent = notify_order_status($pdo,$id,$status); $_SESSION['order_mail_notice'] = $mailSent ? 'Customer notification sent through Mailtrap.' : 'Order updated, but email was not sent. Check Mailtrap SMTP settings and the customer email.'; }
        }

        header('Location: orders.php?updated=1');
        exit;
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) { $pdo->rollBack(); }
        $error = $e instanceof RuntimeException ? $e->getMessage() : 'Could not update this sale. Check that the payments table migration has been imported.';
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
    <input type="number" name="total" min="0.01" step="0.01" value="<?= e((string)$o['total']) ?>" required style="width:110px">
    <select name="status"><?php foreach ($statuses as $s): ?><option value="<?= e($s) ?>" <?= $o['status'] === $s ? 'selected' : '' ?>><?= e($s) ?></option><?php endforeach; ?></select>
    <button type="submit" class="btn icon-button" style="padding:8px" aria-label="Save changes" title="Save changes">✎</button>
</form>
<form method="post" onsubmit="return confirm('Delete this sale? Product quantities will be returned to stock.')" style="margin-top:6px">
    <input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$o['id'] ?>">
    <button type="submit" class="btn">Delete sale</button>
</form>
</td>
</tr>
<?php endforeach; ?>
</tbody></table></div></div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
