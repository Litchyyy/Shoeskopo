<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);

$statuses = ['Pending', 'Processing', 'Shipped', 'Completed', 'Cancelled'];
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)($_POST['id'] ?? 0);
    $action = $_POST['action'] ?? 'status';

    try {
        if ($id < 1) {
            throw new RuntimeException('Invalid order.');
        }

        if ($action === 'payment') {
            $cash = (float)($_POST['cash_received'] ?? 0);
            $stmt = $pdo->prepare('SELECT total FROM orders WHERE id = ?');
            $stmt->execute([$id]);
            $total = $stmt->fetchColumn();

            if ($total === false) {
                throw new RuntimeException('Order not found.');
            }
            if ($cash < (float)$total) {
                throw new RuntimeException('Cash received must be at least the order total.');
            }

            $stmt = $pdo->prepare(
                "INSERT INTO payments (order_id, payment_method, payment_status, cash_received, change_due, paid_at)
                 VALUES (?, 'Cash', 'Paid', ?, ?, NOW())
                 ON DUPLICATE KEY UPDATE payment_method='Cash', payment_status='Paid',
                 cash_received=VALUES(cash_received), change_due=VALUES(change_due), paid_at=NOW()"
            );
            $stmt->execute([$id, $cash, $cash - (float)$total]);
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
            $stmt = $pdo->prepare('UPDATE orders SET status = ? WHERE id = ?');
            $stmt->execute([$status, $id]);
        }

        header('Location: orders.php?updated=1');
        exit;
    } catch (Throwable $e) {
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
$completedTotal = (float)$pdo->query("SELECT COALESCE(SUM(total), 0) FROM orders WHERE status = 'Completed'")->fetchColumn();

$pageTitle = 'Sale Management';
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell">
<h1>SALE MANAGEMENT</h1>
<nav class="admin-nav"><a href="index.php">Dashboard</a><a href="orders.php">Sale Management</a><a href="products.php">Products</a><a href="categories.php">Categories</a><a href="suppliers.php">Suppliers</a><a href="inventory.php">Inventory</a><a href="users.php">Users</a><a href="reports.php">Reports &amp; Expenses</a></nav>
<div class="stat-grid"><div class="stat-card">Completed orders<strong><?= $completedCount ?></strong></div><div class="stat-card">Completed sales total<strong><?= money($completedTotal) ?></strong></div></div>
<p class="muted">All orders, including pending and completed sales, are shown below. Update an order's status here. Completed orders are included in the completed sales totals above automatically.</p>
<?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<?php if (isset($_GET['updated'])): ?><div class="form-success">Sale updated successfully.</div><?php endif; ?>
<div class="table-wrap"><table class="data-table"><thead><tr><th>Order</th><th>Customer</th><th>Date</th><th>Total</th><th>Payment</th><th>Receipt / Cash</th><th>Status</th></tr></thead><tbody>
<?php foreach ($orders as $o): ?>
<tr>
<td>#<?= (int)$o['id'] ?></td><td><?= e($o['full_name'] ?? '') ?><br><small><?= e($o['email']) ?></small></td><td><?= e($o['created_at']) ?></td><td><?= money($o['total']) ?></td><td><?= e($o['payment_status'] ?? 'Pending') ?></td>
<td><a href="../receipt.php?order=<?= (int)$o['id'] ?>" target="_blank">Receipt</a>
<?php if (($o['payment_status'] ?? 'Pending') !== 'Paid'): ?>
<form method="post" class="inline-form"><input type="hidden" name="action" value="payment"><input type="hidden" name="id" value="<?= (int)$o['id'] ?>"><input type="number" name="cash_received" min="<?= e((string)$o['total']) ?>" step="0.01" placeholder="Cash received" required style="width:130px"><button type="submit" class="btn" style="padding:8px">Record cash</button></form>
<?php else: ?><div><?= money($o['cash_received']) ?> received<br>Change <?= money($o['change_due']) ?></div><?php endif; ?></td>
<td><form method="post" class="inline-form"><input type="hidden" name="action" value="status"><input type="hidden" name="id" value="<?= (int)$o['id'] ?>"><select name="status"><?php foreach ($statuses as $s): ?><option value="<?= e($s) ?>" <?= $o['status'] === $s ? 'selected' : '' ?>><?= e($s) ?></option><?php endforeach; ?></select><button type="submit" class="btn" style="padding:8px">Update</button></form></td>
</tr>
<?php endforeach; ?>
</tbody></table></div></div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
