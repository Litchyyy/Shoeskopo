<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
$pageTitle = 'Home';
$featured = $pdo->query("SELECT id,name,image_url FROM products WHERE is_featured=1 ORDER BY created_at DESC LIMIT 4")->fetchAll();
$products = $pdo->query("SELECT p.*, c.name AS category_name FROM products p LEFT JOIN categories c ON c.id=p.category_id ORDER BY p.created_at DESC LIMIT 12")->fetchAll();
include __DIR__ . '/includes/header.php';
?>
<section class="hero">
  <div class="hero-slides">
    <div class="hero-slide" style="background-image:url('https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=1800')"></div>
    <div class="hero-slide" style="background-image:url('https://images.unsplash.com/photo-1552346154-21d32810aba3?w=1800')"></div>
    <div class="hero-slide" style="background-image:url('https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=1800')"></div>
  </div>
  <div class="hero-copy"><p>FIND YOUR NEXT PAIR</p><h1>Step into<br>your style.</h1><p>Explore everyday essentials, court classics, and performance footwear.</p><a class="btn" href="category.php?audience=all">SHOP ALL</a></div>
</section>
<section class="section">
  <div class="section-heading"><h2>FEATURED</h2><a href="category.php?audience=all">Explore all →</a></div>
  <div class="feature-grid">
  <?php
  $featureDefaults = [
    ['Men','category.php?audience=men','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=900'],
    ['Women','category.php?audience=women','https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=900'],
    ['Kids','category.php?audience=kids','https://images.unsplash.com/photo-1552346154-21d32810aba3?w=900'],
    ['New arrivals','category.php?audience=all','https://images.unsplash.com/photo-1495555961986-6d4c1ecb7be3?w=900']
  ];
  foreach ($featureDefaults as $f): ?>
    <a class="feature-card" href="<?= e($f[1]) ?>" style="background-image:url('<?= e($f[2]) ?>')"><span><?= e($f[0]) ?></span></a>
  <?php endforeach; ?>
  </div>
</section>
<section class="section">
  <div class="section-heading"><h2>ITEMS</h2><a href="category.php?audience=all">View all →</a></div>
  <?php if (!$products): ?><div class="empty-state"><h3>Products coming soon</h3><p>Add shoes through the admin panel after creating your admin account.</p></div>
  <?php else: ?><div class="product-grid"><?php foreach ($products as $p): ?>
    <article class="product-card"><a class="product-image" href="product.php?id=<?= (int)$p['id'] ?>"><img src="<?= e($p['image_url'] ?: 'https://placehold.co/700x700?text=Shoes') ?>" alt="<?= e($p['name']) ?>" loading="lazy"></a><div class="product-info"><h3><a href="product.php?id=<?= (int)$p['id'] ?>"><?= e($p['name']) ?></a></h3><div class="muted"><?= e($p['category_name'] ?? 'Shoes') ?></div><div class="price"><?= money($p['price']) ?></div></div></article>
  <?php endforeach; ?></div><?php endif; ?>
</section>
<?php include __DIR__ . '/includes/footer.php'; ?>
