<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
$audience = strtolower($_GET['audience'] ?? 'all');
if (!in_array($audience, ['men','women','kids','all'], true)) $audience='all';
$categoryId = filter_input(INPUT_GET, 'category', FILTER_VALIDATE_INT) ?: 0;
$pageTitle = $audience === 'all' ? 'All Shoes' : ucfirst($audience) . "'s Shoes";
$categories = $pdo->query("SELECT * FROM categories ORDER BY name")->fetchAll();
$sql = "SELECT p.*, c.name AS category_name FROM products p LEFT JOIN categories c ON c.id=p.category_id WHERE (p.audience=? OR p.audience='all')";
$args = [$audience];
if ($categoryId) { $sql .= " AND p.category_id=?"; $args[] = $categoryId; }
$sql .= " ORDER BY p.created_at DESC";
$stmt = $pdo->prepare($sql); $stmt->execute($args); $products = $stmt->fetchAll();
include __DIR__ . '/includes/header.php';
?>
<div class="category-layout">
  <aside class="sidebar"><h3>CATEGORIES</h3><ul class="category-list">
    <li><a class="<?= !$categoryId?'active':'' ?>" href="category.php?audience=<?= e($audience) ?>">All shoes</a></li>
    <?php foreach ($categories as $c): ?><li><a class="<?= $categoryId===(int)$c['id']?'active':'' ?>" href="category.php?audience=<?= e($audience) ?>&category=<?= (int)$c['id'] ?>"><?= e($c['name']) ?></a></li><?php endforeach; ?>
  </ul></aside>
  <section class="category-main"><h1>ITEMS - <?= e(strtoupper($audience==='all'?'ALL':$audience)) ?></h1>
  <?php if (!$products): ?><div class="empty-state"><h3>No shoes found</h3><p>Try another category, or add products through the admin panel.</p></div>
  <?php else: ?><div class="product-grid"><?php foreach ($products as $p): ?>
    <article class="product-card"><a class="product-image" href="product.php?id=<?= (int)$p['id'] ?>"><img src="<?= e($p['image_url'] ?: 'https://placehold.co/700x700?text=Shoes') ?>" alt="<?= e($p['name']) ?>" loading="lazy"></a><div class="product-info"><h3><a href="product.php?id=<?= (int)$p['id'] ?>"><?= e($p['name']) ?></a></h3><div class="muted"><?= e($p['category_name'] ?? 'Shoes') ?></div><div class="price"><?= money($p['price']) ?></div></div></article>
  <?php endforeach; ?></div><?php endif; ?></section>
</div>
<?php include __DIR__ . '/includes/footer.php'; ?>
