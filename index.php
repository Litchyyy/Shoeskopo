
<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';

$pageTitle = 'Home';

// Search, audience, category, and sorting
$search = trim($_GET['q'] ?? '');
$audience = $_GET['audience'] ?? 'all';
$categoryId = $_GET['category'] ?? '';
$sort = $_GET['sort'] ?? 'newest';

// Validate audience
$allowedAudiences = ['all', 'men', 'women', 'kids'];

if (!in_array($audience, $allowedAudiences, true)) {
    $audience = 'all';
}

// Validate sorting
$orderBy = [
    'newest' => 'p.created_at DESC',
    'price_low' => 'p.price ASC',
    'price_high' => 'p.price DESC',
    'name' => 'p.name ASC'
];

if (!isset($orderBy[$sort])) {
    $sort = 'newest';
}

// Load categories
$categories = $pdo->query(
    "SELECT id, name, audience FROM categories ORDER BY name"
)->fetchAll();

// Load featured products
$featured = $pdo->query(
    "SELECT id, name, image_url
     FROM products
     WHERE is_featured = 1
     ORDER BY created_at DESC
     LIMIT 4"
)->fetchAll();

// Build product query
$sql = "SELECT p.*, c.name AS category_name
        FROM products p
        LEFT JOIN categories c ON c.id = p.category_id
        WHERE 1=1";

$args = [];

// Filter by audience
if ($audience !== 'all') {
    $sql .= " AND (p.audience = ? OR p.audience = 'all')";
    $args[] = $audience;
}

// Filter by category
if ($categoryId !== '' && ctype_digit((string)$categoryId)) {
    $sql .= " AND p.category_id = ?";
    $args[] = (int)$categoryId;
}

// Search products
if ($search !== '') {
    $sql .= " AND (
        p.name LIKE ?
        OR p.description LIKE ?
        OR c.name LIKE ?
    )";

    $like = '%' . $search . '%';
    array_push($args, $like, $like, $like);
}

// Sort results
$sql .= " ORDER BY " . $orderBy[$sort];

$stmt = $pdo->prepare($sql);
$stmt->execute($args);
$products = $stmt->fetchAll();

include __DIR__ . '/includes/header.php';
?>

<section class="hero">
  <div class="hero-slides">
    <div class="hero-slide"
         style="background-image:url('https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=1800')"></div>
    <div class="hero-slide"
         style="background-image:url('https://images.unsplash.com/photo-1552346154-21d32810aba3?w=1800')"></div>
    <div class="hero-slide"
         style="background-image:url('https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=1800')"></div>
  </div>

  <div class="hero-copy">
    <p>FIND YOUR NEXT PAIR</p>
    <h1>Step into<br>your style.</h1>
    <p>Explore everyday essentials, court classics, and performance footwear.</p>
    <a class="btn" href="index.php?audience=all#items">SHOP ALL</a>
  </div>
</section>

<section class="section">
  <div class="section-heading">
    <h2>FEATURED</h2>
    <a href="index.php?audience=all#items">Explore all →</a>
  </div>

  <div class="feature-grid">
    <?php
    $featureDefaults = [
        ['Men', 'index.php?audience=men#items',
         'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=900'],
        ['Women', 'index.php?audience=women#items',
         'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=900'],
        ['Kids', 'index.php?audience=kids#items',
         'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=900'],
        ['New arrivals', 'index.php?audience=all&sort=newest#items',
         'https://images.unsplash.com/photo-1495555961986-6d4c1ecb7be3?w=900']
    ];

    foreach ($featureDefaults as $f):
    ?>
      <a class="feature-card"
         href="<?= e($f[1]) ?>"
         style="background-image:url('<?= e($f[2]) ?>')">
        <span><?= e($f[0]) ?></span>
      </a>
    <?php endforeach; ?>
  </div>
</section>

<section class="section" id="items">
  <div class="section-heading">
  <h2>ITEMS</h2>
</div>

  <form method="get" action="index.php" class="inline-form search-filter">
    <input
      type="search"
      name="q"
      placeholder="Search shoes by name or category..."
      value="<?= e($search) ?>">

    <select name="audience">
      <option value="all" <?= $audience === 'all' ? 'selected' : '' ?>>All audiences</option>
      <option value="men" <?= $audience === 'men' ? 'selected' : '' ?>>Men</option>
      <option value="women" <?= $audience === 'women' ? 'selected' : '' ?>>Women</option>
      <option value="kids" <?= $audience === 'kids' ? 'selected' : '' ?>>Kids</option>
    </select>

    <select name="category">
      <option value="">All categories</option>
      <?php foreach ($categories as $category): ?>
        <option
          value="<?= (int)$category['id'] ?>"
          <?= (string)$categoryId === (string)$category['id'] ? 'selected' : '' ?>>
          <?= e($category['name']) ?>
        </option>
      <?php endforeach; ?>
    </select>

    <select name="sort">
      <option value="newest" <?= $sort === 'newest' ? 'selected' : '' ?>>Newest</option>
      <option value="price_low" <?= $sort === 'price_low' ? 'selected' : '' ?>>Price: low to high</option>
      <option value="price_high" <?= $sort === 'price_high' ? 'selected' : '' ?>>Price: high to low</option>
      <option value="name" <?= $sort === 'name' ? 'selected' : '' ?>>Name A-Z</option>
    </select>

    <button type="submit" class="btn btn-blue">Apply</button>

    <a class="btn" href="index.php#items">Clear filters</a>
  </form>

  <?php if (!$products): ?>
    <div class="empty-state">
      <h3>No shoes found</h3>
      <p>Try another search or clear the filters to see all available products.</p>
      <a class="btn" href="index.php?audience=all#items">View all shoes</a>
    </div>
  <?php else: ?>
    <div class="product-grid">
      <?php foreach ($products as $p): ?>
        <article class="product-card">
          <a class="product-image" href="product.php?id=<?= (int)$p['id'] ?>">
            <img
              src="<?= e($p['image_url'] ?: 'https://placehold.co/700x700?text=Shoes') ?>"
              alt="<?= e($p['name']) ?>"
              loading="lazy">
          </a>

          <div class="product-info">
            <h3>
              <a href="product.php?id=<?= (int)$p['id'] ?>">
                <?= e($p['name']) ?>
              </a>
            </h3>

            <div class="muted">
              <?= e($p['category_name'] ?? 'Shoes') ?>
            </div>

            <div class="price"><?= money($p['price']) ?></div>
          </div>
        </article>
      <?php endforeach; ?>
    </div>
  <?php endif; ?>
</section>

<?php include __DIR__ . '/includes/footer.php'; ?>
