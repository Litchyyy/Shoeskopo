<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
$stmt = $pdo->prepare("SELECT p.*, c.name AS category_name FROM products p LEFT JOIN categories c ON c.id=p.category_id WHERE p.id=?");
$stmt->execute([$id ?: 0]); $product = $stmt->fetch();
if (!$product) { http_response_code(404); $pageTitle='Product not found'; include __DIR__.'/includes/header.php'; echo '<div class="section"><div class="empty-state"><h1>Product not found</h1><a class="btn" href="index.php">Back home</a></div></div>'; include __DIR__.'/includes/footer.php'; exit; }
$pageTitle=$product['name']; $error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $size=trim($_POST['size'] ?? ''); $qty=filter_input(INPUT_POST,'quantity',FILTER_VALIDATE_INT) ?: 1; $qty=max(1,min(20,$qty));
  $sizes=array_filter(array_map('trim',explode(',',$product['sizes'] ?? '')));
  if ($sizes && !in_array($size,$sizes,true)) $error='Please choose an available size.';
  elseif ((int)$product['stock'] < $qty) $error='Not enough stock available.';
  else {
    $_SESSION['cart'] = $_SESSION['cart'] ?? [];
    $key=$product['id'].'_'.$size;
    if (!isset($_SESSION['cart'][$key])) $_SESSION['cart'][$key]=['product_id'=>(int)$product['id'],'name'=>$product['name'],'price'=>(float)$product['price'],'image_url'=>$product['image_url'],'size'=>$size,'quantity'=>0];
    $_SESSION['cart'][$key]['quantity'] += $qty;
    header('Location: cart.php?added=1'); exit;
  }
}
include __DIR__ . '/includes/header.php';
?>
<div class="product-detail">
  <div><img src="<?= e($product['image_url'] ?: 'https://placehold.co/900x900?text=Shoes') ?>" alt="<?= e($product['name']) ?>"></div>
  <div><p class="muted"><?= e($product['category_name'] ?? 'Shoes') ?></p><h1><?= e($product['name']) ?></h1><h2><?= money($product['price']) ?></h2><p><?= nl2br(e($product['description'] ?? '')) ?></p><p><?= (int)$product['stock']>0 ? 'In stock: '.(int)$product['stock'] : 'Out of stock' ?></p>
  <?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
  <?php if ((int)$product['stock']>0): ?><form method="post">
    <?php $sizes=array_filter(array_map('trim',explode(',',$product['sizes'] ?? ''))); if ($sizes): ?><div class="field"><label for="size">Choose size</label><select name="size" id="size" required><option value="">Select a size</option><?php foreach($sizes as $s): ?><option value="<?= e($s) ?>"><?= e($s) ?></option><?php endforeach; ?></select></div><?php endif; ?>
    <div class="field"><label for="quantity">Quantity</label><input class="quantity" id="quantity" name="quantity" type="number" min="1" max="<?= (int)$product['stock'] ?>" value="1"></div><button class="btn" type="submit">ADD TO CART</button>
  </form><?php endif; ?></div>
</div>
<?php include __DIR__ . '/includes/footer.php'; ?>
