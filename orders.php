<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
require_login(); $pageTitle='My Orders';
$stmt=$pdo->prepare('SELECT * FROM orders WHERE user_id=? ORDER BY created_at DESC'); $stmt->execute([current_user()['id']]); $orders=$stmt->fetchAll();
include __DIR__ . '/includes/header.php';
?>
<section class="section"><h1>MY ORDERS</h1><?php if(isset($_GET['placed'])): ?><div class="form-success">Your order has been placed.</div><?php endif; ?>
<?php if(!$orders): ?><div class="empty-state"><h2>No orders yet</h2><a class="btn" href="index.php">SHOP NOW</a></div><?php else: ?><div class="table-wrap"><table class="data-table"><thead><tr><th>Date</th><th>Total</th><th>Status</th></tr></thead><tbody><?php foreach($orders as $o): ?><tr><td><?= e($o['created_at']) ?></td><td><?= money($o['total']) ?></td><td><?= e($o['status']) ?></td></tr><?php endforeach; ?></tbody></table></div><?php endif; ?></section>
<?php include __DIR__ . '/includes/footer.php'; ?>
