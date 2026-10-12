<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);
$pageTitle='Admin Dashboard';
$productCount=(int)$pdo->query('SELECT COUNT(*) FROM products')->fetchColumn();
$orderCount=(int)$pdo->query('SELECT COUNT(*) FROM orders')->fetchColumn();
$userCount=(int)$pdo->query('SELECT COUNT(*) FROM users')->fetchColumn();
$sales=(float)$pdo->query("SELECT COALESCE(SUM(total),0) FROM orders WHERE status<>'Cancelled'")->fetchColumn();
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell"><h1>ADMIN DASHBOARD</h1><p>Welcome, <?= e(current_user()['username']) ?>.</p><nav class="admin-nav"><a href="products.php">Manage Products</a><a href="categories.php">Manage Categories</a><a href="orders.php">Manage Orders</a><a href="users.php">Manage Users</a></nav>
<div class="stat-grid"><div class="stat-card">Products<strong><?= $productCount ?></strong></div><div class="stat-card">Orders<strong><?= $orderCount ?></strong></div><div class="stat-card">Users<strong><?= $userCount ?></strong></div><div class="stat-card">Recorded sales<strong><?= money($sales) ?></strong></div></div>
<p class="muted">Admin-only area. Employee access can be extended for operational tasks.</p></div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
