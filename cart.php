<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
$pageTitle='Shopping Cart';
$cart=shoeskopo_load_cart($pdo);
if ($_SERVER['REQUEST_METHOD']==='POST') {
  if (isset($_POST['remove'])) unset($cart[$_POST['remove']]);
  if (isset($_POST['update']) && is_array($_POST['qty'] ?? null)) {
    foreach ($_POST['qty'] as $key=>$qty) if (isset($cart[$key])) {
      $qty=max(1,min(20,(int)$qty)); $cart[$key]['quantity']=$qty;
    }
  }
  shoeskopo_save_cart($pdo, $cart);
  if (isset($_POST['checkout'])) {
    $selected = array_values(array_filter($_POST['selected'] ?? [], fn($key) => is_string($key) && isset($cart[$key])));
    if (!$selected) { header('Location: cart.php?select_items=1'); exit; }
    $_SESSION['checkout_items'] = $selected;
    header('Location: checkout.php'); exit;
  }
  header('Location: cart.php'); exit;
}
$cart=shoeskopo_load_cart($pdo); $total=0;
$selected = $_SESSION['checkout_items'] ?? array_keys($cart);
foreach($cart as $key=>$item) if(in_array((string)$key, array_map('strval',$selected), true)) $total += $item['price']*$item['quantity'];
include __DIR__ . '/includes/header.php';
?>
<section class="section"><h1>YOUR CART</h1>
<?php if (isset($_GET['added'])): ?><div class="form-success">Item added to cart.</div><?php endif; ?>
<?php if (isset($_GET['select_items'])): ?><div class="form-error">Please select at least one item to checkout.</div><?php endif; ?>
<?php if (!$cart): ?><div class="empty-state"><h2>Your cart is empty</h2><a class="btn" href="index.php">CONTINUE SHOPPING</a></div>
<?php else: ?>
<form method="post"><div class="table-wrap"><table class="data-table"><thead><tr><th>Checkout</th><th>Item</th><th>Size</th><th>Price</th><th>Quantity</th><th>Subtotal</th><th></th></tr></thead><tbody>
<?php foreach($cart as $key=>$item): ?><tr><td><input type="checkbox" name="selected[]" value="<?= e((string)$key) ?>" <?= in_array((string)$key,array_map('strval',$selected),true)?'checked':'' ?> aria-label="Select <?= e($item['name']) ?> for checkout"></td><td><?= e($item['name']) ?></td><td><?= e($item['size'] ?: '—') ?></td><td><?= money($item['price']) ?></td><td><input class="quantity" type="number" min="1" max="20" name="qty[<?= e((string)$key) ?>]" value="<?= (int)$item['quantity'] ?>"></td><td><?= money($item['price']*$item['quantity']) ?></td><td><button class="btn" name="remove" value="<?= e((string)$key) ?>" aria-label="Remove item" title="Remove">🗑</button></td></tr><?php endforeach; ?>
</tbody></table></div><p style="text-align:right;font-size:22px;font-weight:800">Selected items total: <?= money($total) ?></p><div class="inline-form"><button class="btn" name="update" value="1">UPDATE CART</button><button class="btn btn-blue" name="checkout" value="1">CHECKOUT SELECTED</button></div></form><?php endif; ?>
</section>
<?php include __DIR__ . '/includes/footer.php'; ?>
