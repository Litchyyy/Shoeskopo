<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);

$ordersStmt = $pdo->prepare("SELECT o.*, u.email, p.payment_status 
FROM orders o 
    JOIN users u ON u.id = o.user_id 
    LEFT 
    JOIN payments p ON p.order_id = o.id 
WHERE o.status = ? 
ORDER BY o.created_at DESC");
$ordersStmt->execute(['Completed']);
$orders = $ordersStmt->fetchAll();

$totalSales = 0;
foreach ($orders as $order) { $totalSales += (float)$order['total']; }

$pageTitle = 'Completed Sales';
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell">
<h1>COMPLETED SALES</h1>
<?= admin_navigation('completed_sales.php') ?>
<div class="stat-grid"><div class="stat-card">Completed orders<strong><?= count($orders) ?></strong></div><div class="stat-card">Completed sales total<strong><?= money($totalSales) ?></strong></div></div>
<div class="table-wrap"><table class="data-table"><thead><tr><th>Order</th><th>Customer</th><th>Date</th><th>Payment</th><th>Total</th><th>Receipt</th></tr></thead><tbody>
<?php if (!$orders): ?><tr><td colspan="6">No completed sales yet. Complete an order in Sale Management and it will appear here automatically.</td></tr>
<?php else: foreach ($orders as $o): ?><tr><td>#<?= (int)$o['id'] ?></td><td><?= e($o['full_name'] ?? '') ?><br><small><?= e($o['email']) ?></small></td><td><?= e($o['created_at']) ?></td><td><?= e($o['payment_status'] ?? 'Pending') ?></td><td><?= money($o['total']) ?></td><td><a href="../receipt.php?order=<?= (int)$o['id'] ?>" target="_blank">Receipt</a></td></tr><?php endforeach; endif; ?>
</tbody></table></div></div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
