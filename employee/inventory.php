<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['employee', 'admin']);

$search = trim($_GET['q'] ?? '');
$sql = 'SELECT p.id, p.name, p.price, p.stock, c.name AS category_name 
FROM products p 
    LEFT 
    JOIN categories c ON c.id = p.category_id';
$params = [];

if ($search !== '') {
    $sql .= ' WHERE p.name LIKE ? OR c.name LIKE ?';
    $params = ['%' . $search . '%', '%' . $search . '%'];
}
$sql .= ' ORDER BY p.stock ASC, p.name';

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$products = $stmt->fetchAll();

$pageTitle = 'Employee Inventory';
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell">
    <h1>INVENTORY</h1>
    <nav class="admin-nav">
        <a href="index.php">Dashboard</a>
        <a href="manual_order.php">Manual Ordering / Cashier</a>
        <a href="inventory.php">Inventory</a>
    </nav>

    <p class="muted">Employee inventory access is for checking product availability. Stock changes automatically when an in-store sale is completed. Manual stock adjustments remain available to administrators.</p>

    <form method="get" class="inline-form" style="margin:18px 0">
        <input type="search" name="q" placeholder="Search product or category" value="<?= e($search) ?>">
        <button class="btn btn-blue" type="submit">SEARCH</button>
        <?php if ($search !== ''): ?><a class="btn" href="inventory.php">CLEAR</a><?php endif; ?>
    </form>

    <div class="table-wrap">
        <table class="data-table">
            <thead><tr><th>Product</th><th>Category</th><th>Unit price</th><th>Available stock</th><th>Status</th></tr></thead>
            <tbody>
            <?php foreach ($products as $product): ?>
                <tr>
                    <td><?= e($product['name']) ?></td>
                    <td><?= e($product['category_name'] ?? '—') ?></td>
                    <td><?= money($product['price']) ?></td>
                    <td><?= (int)$product['stock'] ?></td>
                    <td>
                        <?php if ((int)$product['stock'] < 1): ?>
                            Out of stock
                        <?php elseif ((int)$product['stock'] <= 5): ?>
                            Low stock
                        <?php else: ?>
                            In stock
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
            <?php if (!$products): ?><tr><td colspan="5">No products found.</td></tr><?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
