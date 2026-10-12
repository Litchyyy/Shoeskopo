<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
$pageTitle='Shopping Cart';
$_SESSION['cart']=$_SESSION['cart'] ?? [];
if ($_SERVER['REQUEST_METHOD']==='POST') {
  if (isset($_POST['remove'])) unset($_SESSION['cart'][$_POST['remove']]);
  if (isset($_POST['update']) && is_array($_POST['qty'] ?? null)) {
    foreach ($_POST['qty'] as $key=>$qty) if (isset($_SESSION['cart'][$key])) {
      $qty=max(1,min(20,(int)$qty)); $_SESSION['cart'][$key]['quantity']=$qty;
    }
  }
  header('Location: cart.php'); exit;
}
$cart=$_SESSION['cart']; $total=0; foreach($cart as $item) $total += $item['price']*$item['quantity'];
include __DIR__ . '/includes/header.php';
?>
<section class="section"><h1>YOUR CART</h1>
<?php if (isset($_GET['added'])): ?><div class="form-success">Item added to cart.</div><?php endif; ?>
<?php if (!$cart): ?><div class="empty-state"><h2>Your cart is empty</h2><a class="btn" href="index.php">CONTINUE SHOPPING</a></div>
<?php else: ?><form method="post"><div class="table-wrap"><table class="data-table"><thead><tr><th>Item</th><th>Size</th><th>Price</th><th>Quantity</th><th>Subtotal</th><th></th></tr></thead><tbody>
<?php foreach($cart as $key=>$item): ?><tr><td><?= e($item['name']) ?></td><td><?= e($item['size'] ?: '—') ?></td><td><?= money($item['price']) ?></td><td><input class="quantity" type="number" min="1" max="20" name="qty[<?= e($key) ?>]" value="<?= (int)$item['quantity'] ?>"></td><td><?= money($item['price']*$item['quantity']) ?></td><td><button class="btn" name="remove" value="<?= e($key) ?>">Remove</button></td></tr><?php endforeach; ?>
</tbody></table></div><p style="text-align:right;font-size:22px;font-weight:800">Total: <?= money($total) ?></p><div class="inline-form"><button class="btn" name="update" value="1">UPDATE CART</button><a class="btn btn-blue" href="checkout.php">CHECKOUT</a></div></form><?php endif; ?>
</section>
<?php include __DIR__ . '/includes/footer.php'; ?>
