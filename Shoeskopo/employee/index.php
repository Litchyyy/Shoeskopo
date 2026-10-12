<?php
require_once __DIR__ . '/../config/db.php';require_once __DIR__ . '/../includes/functions.php';require_role(['employee','admin']);$pageTitle='Employee Dashboard';
$orders=$pdo->query("SELECT id,full_name,total,status,created_at FROM orders ORDER BY created_at DESC LIMIT 20")->fetchAll();
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell"><h1>EMPLOYEE DASHBOARD</h1><p>Welcome, <?= e(current_user()['username']) ?>.</p><nav class="admin-nav"><a href="index.php">Dashboard</a><a href="../admin/orders.php">Orders</a></nav><h2>Recent orders</h2><div class="table-wrap"><table class="data-table"><thead><tr><th>Order</th><th>Customer</th><th>Total</th><th>Status</th><th>Date</th></tr></thead><tbody><?php foreach($orders as $o): ?><tr><td>#<?= (int)$o['id'] ?></td><td><?= e($o['full_name']) ?></td><td><?= money($o['total']) ?></td><td><?= e($o['status']) ?></td><td><?= e($o['created_at']) ?></td></tr><?php endforeach; ?></tbody></table></div><p class="muted">Employee role is restricted; full admin CRUD remains admin-only.</p></div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
