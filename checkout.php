<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
require_login();
$cart=$_SESSION['cart'] ?? []; if (!$cart) { header('Location: cart.php'); exit; }
$total=0; foreach($cart as $item) $total += $item['price']*$item['quantity'];
$pageTitle='Checkout'; $error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $name=trim($_POST['full_name'] ?? ''); $phone=trim($_POST['phone'] ?? ''); $address=trim($_POST['address'] ?? '');
  if ($name==='' || $phone==='' || $address==='') $error='Please complete all delivery details.';
  else {
    try {
      $pdo->beginTransaction();
      foreach($cart as $item) {
        $check=$pdo->prepare('SELECT stock FROM products WHERE id=? FOR UPDATE'); $check->execute([$item['product_id']]); $row=$check->fetch();
        if (!$row || (int)$row['stock'] < (int)$item['quantity']) throw new RuntimeException('A product no longer has enough stock. Please update your cart.');
      }
      $stmt=$pdo->prepare("INSERT INTO orders(user_id,total,status,full_name,phone,address) VALUES(?,?, 'Pending',?,?,?)");
      $stmt->execute([current_user()['id'],$total,$name,$phone,$address]); $orderId=(int)$pdo->lastInsertId();
      $itemStmt=$pdo->prepare('INSERT INTO order_items(order_id,product_id,product_name,size,quantity,unit_price) VALUES(?,?,?,?,?,?)');
      $stockStmt=$pdo->prepare('UPDATE products SET stock=stock-? WHERE id=?');
      $logStmt=$pdo->prepare("INSERT INTO inventory_logs(product_id,change_qty,reason,reference_type,reference_id) VALUES(?,?,'Customer order','order',?)");
      foreach($cart as $item) {
        $itemStmt->execute([$orderId,$item['product_id'],$item['name'],$item['size'],$item['quantity'],$item['price']]);
        $stockStmt->execute([$item['quantity'],$item['product_id']]);
        $logStmt->execute([$item['product_id'],-(int)$item['quantity'],$orderId]);
      }
      $pdo->commit(); unset($_SESSION['cart']); header('Location: orders.php?placed='.$orderId); exit;
    } catch (Throwable $e) {
      if ($pdo->inTransaction()) $pdo->rollBack();
      $error=$e instanceof RuntimeException ? $e->getMessage() : 'Could not place order. Please try again.';
    }
  }
}
$pageTitle='Checkout'; include __DIR__ . '/includes/header.php';
?>
<section class="section"><h1>CHECKOUT</h1><div class="product-detail" style="padding:20px 0"><div><section class="form-wrap" style="margin:0;max-width:none"><h2>Delivery details</h2><?php if($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?><form method="post"><div class="field"><label>Full name</label><input name="full_name" required></div><div class="field"><label>Phone</label><input name="phone" required></div><div class="field"><label>Delivery address</label><textarea name="address" rows="4" required></textarea></div><p class="muted">Payment: Cash on delivery (starter option)</p><button class="btn btn-blue">PLACE ORDER</button></form></section></div><div><h2>Order summary</h2><?php foreach($cart as $item): ?><p><?= e($item['name']) ?> × <?= (int)$item['quantity'] ?> — <?= money($item['price']*$item['quantity']) ?></p><?php endforeach; ?><hr><h2>Total: <?= money($total) ?></h2></div></div></section>
<?php include __DIR__ . '/includes/footer.php'; ?>
