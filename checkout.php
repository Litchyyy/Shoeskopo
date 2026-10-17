<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
require_login();
$cart=shoeskopo_load_cart($pdo); if (!$cart) { header('Location: cart.php'); exit; }
$total=0; foreach($cart as $item) $total += $item['price']*$item['quantity'];
$pageTitle='Checkout'; $error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $name=trim($_POST['full_name'] ?? ''); $phone=trim($_POST['phone'] ?? ''); $address=trim($_POST['address'] ?? ''); $cashReceived=(float)($_POST['cash_received'] ?? 0);
  if ($name==='' || $phone==='' || $address==='') $error='Please complete all delivery details.';
  elseif ($cashReceived < $total) $error='Payment amount must be at least the order total before a receipt can be issued.';
  else {
    try {
      $pdo->beginTransaction();
      foreach($cart as $item) {
        $check=$pdo->prepare('SELECT stock FROM products WHERE id=? FOR UPDATE'); $check->execute([$item['product_id']]); $row=$check->fetch();
        if (!$row || (int)$row['stock'] < (int)$item['quantity']) throw new RuntimeException('A product no longer has enough stock. Please update your cart.');
      }
      $stmt=$pdo->prepare("INSERT INTO orders(user_id,total,status,full_name,phone,address) VALUES(?,?, 'Pending',?,?,?)");
      $stmt->execute([current_user()['id'],$total,$name,$phone,$address]); $orderId=(int)$pdo->lastInsertId();
      $pay=$pdo->prepare("INSERT INTO payments(order_id,payment_method,payment_status,cash_received,change_due,paid_at) VALUES(?,'Cash','Paid',?,?,NOW())");
      $pay->execute([$orderId,$cashReceived,$cashReceived-$total]);
      $itemStmt=$pdo->prepare('INSERT INTO order_items(order_id,product_id,product_name,size,quantity,unit_price) VALUES(?,?,?,?,?,?)');
      $stockStmt=$pdo->prepare('UPDATE products SET stock=stock-? WHERE id=?');
      $logStmt=$pdo->prepare("INSERT INTO inventory_logs(product_id,change_qty,reason,reference_type,reference_id) VALUES(?,?,'Customer order','order',?)");
      foreach($cart as $item) {
        $itemStmt->execute([$orderId,$item['product_id'],$item['name'],$item['size'],$item['quantity'],$item['price']]);
        $stockStmt->execute([$item['quantity'],$item['product_id']]);
        $logStmt->execute([$item['product_id'],-(int)$item['quantity'],$orderId]);
      }
      $pdo->commit();

      // Send the order confirmation only after the order and payment are safely saved.
      // Email failure must not undo a successfully placed order.
      $customerEmail = (string)(current_user()['email'] ?? '');
      $customerName = $name !== '' ? $name : (string)(current_user()['username'] ?? 'Customer');
      $emailBody = "Hello {$customerName},\n\nThank you for shopping with Shoeskopo! Your order has been placed and your cash payment has been recorded.\n\nOrder number: #{$orderId}\nOrder date: " . date('Y-m-d H:i:s') . "\nOrder status: Pending\nPayment status: Paid\n\nORDER DETAILS\n";
      $pdfText = "SHOESKOPO - ORDER CONFIRMATION / RECEIPT\nOrder #{$orderId}\nDate: " . date('Y-m-d H:i:s') . "\nCustomer: {$customerName}\nPayment: Cash (Paid)\nOrder status: Pending\n\n";
      foreach ($cart as $item) {
        $lineTotal = (float)$item['price'] * (int)$item['quantity'];
        $sizeText = !empty($item['size']) ? (string)$item['size'] : 'N/A';
        $itemLine = (string)$item['name'] . ' (Size ' . $sizeText . ') x ' . (int)$item['quantity'] . ' @ PHP ' . number_format((float)$item['price'], 2) . ' = PHP ' . number_format($lineTotal, 2);
        $emailBody .= $itemLine . "\n";
        $pdfText .= $itemLine . "\n";
      }
      $emailBody .= "\nOrder total: PHP " . number_format($total, 2) . "\nCash received: PHP " . number_format($cashReceived, 2) . "\nChange: PHP " . number_format($cashReceived - $total, 2) . "\n\nYou can view and print your receipt on the Shoeskopo website.\n\nThank you for shopping with Shoeskopo!";
      $pdfText .= "\nOrder total: PHP " . number_format($total, 2) . "\nCash received: PHP " . number_format($cashReceived, 2) . "\nChange: PHP " . number_format($cashReceived - $total, 2) . "\n\nThank you for shopping with Shoeskopo!";
      $emailSent = false;
      if (filter_var($customerEmail, FILTER_VALIDATE_EMAIL)) {
        $emailSent = shoeskopo_send_mail(
          $customerEmail,
          'Shoeskopo Order Confirmation - Order #' . $orderId,
          $emailBody,
          'Shoeskopo-Order-' . $orderId . '-Receipt.pdf',
          shoeskopo_make_pdf($pdfText)
        );
      } else {
        error_log('[Shoeskopo mail] Could not send order confirmation: logged-in customer email is missing or invalid.');
      }
      $_SESSION['order_confirmation_notice'] = $emailSent
        ? 'Your order was placed successfully. The confirmation email was accepted by Mailtrap.'
        : 'Your order was placed successfully, but the confirmation email could not be sent. Check the PHP/Apache error log for a [Shoeskopo mail] diagnostic.';

      shoeskopo_clear_cart($pdo);
      header('Location: receipt.php?order='.$orderId);
      exit;
    } catch (Throwable $e) {
      if ($pdo->inTransaction()) $pdo->rollBack();
      $error=$e instanceof RuntimeException ? $e->getMessage() : 'Could not place order. Please try again.';
    }
  }
}
$pageTitle='Checkout'; include __DIR__ . '/includes/header.php';
?>
<section class="section"><h1>CHECKOUT</h1><div class="product-detail" style="padding:20px 0"><div><section class="form-wrap" style="margin:0;max-width:none"><h2>Delivery details</h2><?php if($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?><form method="post"><div class="field"><label>Full name</label><input name="full_name" required></div><div class="field"><label>Phone</label><input name="phone" required></div><div class="field"><label>Delivery address</label><textarea name="address" rows="4" required></textarea></div><div class="field"><label>Cash payment amount (PHP)</label><input type="number" name="cash_received" min="<?= e((string)$total) ?>" step="0.01" required value="<?= e((string)$total) ?>"><small class="muted">Enter the amount paid. It must cover the order total. Your receipt will be available after payment is confirmed.</small></div><button class="btn btn-blue">PAY AND PLACE ORDER</button></form></section></div><div><h2>Order summary</h2><?php foreach($cart as $item): ?><p><?= e($item['name']) ?> × <?= (int)$item['quantity'] ?> — <?= money($item['price']*$item['quantity']) ?></p><?php endforeach; ?><hr><h2>Total: <?= money($total) ?></h2></div></div></section>
<?php include __DIR__ . '/includes/footer.php'; ?>
