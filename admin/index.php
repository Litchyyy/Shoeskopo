<?php
require_once __DIR__ . '/../config/db.php'; require_once __DIR__ . '/../includes/functions.php'; require_role(['admin']);
$pageTitle='Admin Dashboard';
$productCount=(int)$pdo->query('SELECT COUNT(*) FROM products')->fetchColumn();
$userCount=(int)$pdo->query('SELECT COUNT(*) FROM users')->fetchColumn();
$sales=(float)$pdo->query("SELECT COALESCE(SUM(total),0) FROM orders WHERE status='Completed'")->fetchColumn();
$lowStock=(int)$pdo->query('SELECT COUNT(*) FROM products WHERE stock<=5')->fetchColumn();
$supplierCount=(int)$pdo->query('SELECT COUNT(*) FROM suppliers')->fetchColumn();
include __DIR__ . '/../includes/header.php'; ?>
<div class="admin-shell"><h1>ADMIN DASHBOARD</h1><p>Welcome, <?= e(current_user()['username']) ?>.</p>
<nav class="admin-nav"><a href="products.php">Manage Products</a><a href="categories.php">Manage Categories</a><a href="suppliers.php">Suppliers & Purchase Orders</a><a href="inventory.php">Inventory</a><a href="users.php">User Management</a><a href="reports.php">Reports & Expenses</a></nav>
<div class="stat-grid"><div class="stat-card">Products<strong><?= $productCount ?></strong></div><div class="stat-card">Users<strong><?= $userCount ?></strong></div><div class="stat-card">Suppliers<strong><?= $supplierCount ?></strong></div><div class="stat-card">Completed sales<strong><?= money($sales) ?></strong></div><div class="stat-card">Low-stock products<strong><?= $lowStock ?></strong></div></div>
<p class="muted">This area is restricted to administrators. Storefront navigation, cart, and order pages are hidden here.</p></div><?php include __DIR__ . '/../includes/footer.php'; ?>