<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['employee', 'admin']);

$pageTitle = 'Employee Dashboard';
$productCount = (int)$pdo->query('SELECT COUNT(*) 
FROM products')->fetchColumn();
$lowStockCount = (int)$pdo->query('SELECT COUNT(*) 
FROM products 
WHERE stock <= 5')->fetchColumn();
$todaySalesStmt = $pdo->prepare(
    "SELECT COALESCE(SUM(total), 0) 
FROM orders 
WHERE status = 'Completed'
    AND DATE(created_at) = CURDATE()"
);
$todaySalesStmt->execute();
$todaySales = (float)$todaySalesStmt->fetchColumn();

include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell employee-dashboard">
    <h1>EMPLOYEE DASHBOARD</h1>
    <p>Welcome, <?= e(current_user()['username']) ?>.</p>

    <nav class="admin-nav">
        <a href="index.php">Dashboard</a>
        <a href="manual_order.php">Manual Ordering / Cashier</a>
        <a href="inventory.php">Inventory</a>
    </nav>

    <div class="stat-grid">
        <div class="stat-card">Products<strong><?= $productCount ?></strong></div>
        <div class="stat-card">Low-stock products<strong><?= $lowStockCount ?></strong></div>
        <div class="stat-card">Completed sales today<strong><?= money($todaySales) ?></strong></div>
    </div>

    <section class="form-wrap employee-quick-actions" style="margin-top:20px;padding:18px">
        <h2 style="margin-top:0">Quick Actions</h2>
        <div style="display:flex;gap:12px;flex-wrap:wrap;align-items:center">
            <a class="btn" style="background:#e9a15b;color:#4a2d1b" href="manual_order.php">Manual Ordering / Cashier</a>
            <a class="btn" href="inventory.php">Inventory</a>
        </div>
    </section>
</div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
