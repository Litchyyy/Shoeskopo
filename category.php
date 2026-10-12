
<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';

$audience = strtolower($_GET['audience'] ?? 'all');

if (!in_array($audience, ['men', 'women', 'kids', 'all'], true)) {
    $audience = 'all';
}

$categoryId = filter_input(INPUT_GET, 'category', FILTER_VALIDATE_INT) ?: 0;

$pageTitle = $audience === 'all'
    ? 'All Shoes'
    : ucfirst($audience) . "'s Shoes";

$search = trim($_GET['q'] ?? '');
$sort = $_GET['sort'] ?? 'newest';

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
    "SELECT * FROM categories ORDER BY name"
)->fetchAll();

// Build products query
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
if ($categoryId > 0) {
    $sql .= " AND p.category_id = ?";
    $args[] = $categoryId;
}

// Search
if ($search !== '') {
    $sql .= " AND (
        p.name LIKE ?
        OR p.description LIKE ?
        OR c.name LIKE ?
    )";

    $like = '%' . $search . '%';
    array_push($args, $like, $like, $like);
}

// Sort
$sql .= " ORDER BY " . $orderBy[$sort];

$stmt = $pdo->prepare($sql);
$stmt->execute($args);
$products = $stmt->fetchAll();

include __DIR__ . '/includes/header.php';
?>

<div class="category-layout">

    <aside class="sidebar">
        <h3>CATEGORIES</h3>

        <ul class="category-list">
            <li>
                <a
                    class="<?= $categoryId === 0 ? 'active' : '' ?>"
                    href="category.php?audience=<?= e($audience) ?>">
                    All shoes
                </a>
            </li>

            <?php foreach ($categories as $c): ?>
                <li>
                    <a
                        class="<?= $categoryId === (int)$c['id'] ? 'active' : '' ?>"
                        href="category.php?audience=<?= e($audience) ?>&category=<?= (int)$c['id'] ?>">
                        <?= e($c['name']) ?>
                    </a>
                </li>
            <?php endforeach; ?>
        </ul>
    </aside>

    <section class="category-main">

        <h1>ITEMS - <?= e(strtoupper($audience === 'all' ? 'ALL' : $audience)) ?></h1>

        <form method="get" action="category.php" class="inline-form search-filter">

            <input type="hidden" name="audience" value="<?= e($audience) ?>">

            <?php if ($categoryId > 0): ?>
                <input type="hidden" name="category" value="<?= (int)$categoryId ?>">
            <?php endif; ?>

            <input
                type="search"
                name="q"
                placeholder="Search shoes..."
                value="<?= e($search) ?>">

            <select name="sort">
                <option value="newest" <?= $sort === 'newest' ? 'selected' : '' ?>>
                    Newest
                </option>
                <option value="price_low" <?= $sort === 'price_low' ? 'selected' : '' ?>>
                    Price: low to high
                </option>
                <option value="price_high" <?= $sort === 'price_high' ? 'selected' : '' ?>>
                    Price: high to low
                </option>
                <option value="name" <?= $sort === 'name' ? 'selected' : '' ?>>
                    Name A-Z
                </option>
            </select>

            <button type="submit" class="btn btn-blue">Search / Filter</button>

            <a class="btn" href="category.php?audience=<?= e($audience) ?>">
                Clear
            </a>

        </form>

        <?php if (!$products): ?>

            <div class="empty-state">
                <h3>No shoes found</h3>
                <p>Try another category or clear your search filters.</p>
                <a class="btn" href="category.php?audience=<?= e($audience) ?>">
                    Show all shoes
                </a>
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

                            <div class="price">
                                <?= money($p['price']) ?>
                            </div>

                        </div>

                    </article>

                <?php endforeach; ?>

            </div>

        <?php endif; ?>

    </section>

</div>

<?php include __DIR__ . '/includes/footer.php'; ?>
