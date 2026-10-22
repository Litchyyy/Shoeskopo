<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
require_login();
$cart=shoeskopo_load_cart($pdo);
$selectedKeys = $_SESSION['checkout_items'] ?? array_keys($cart);
$cart = array_intersect_key($cart, array_flip(array_map('strval', $selectedKeys)));
if (!$cart) { header('Location: cart.php'); exit; }
$profileStmt=$pdo->prepare('SELECT full_name, phone, address FROM users WHERE id=?');
$profileStmt->execute([current_user()['id']]);
$profile=$profileStmt->fetch(PDO::FETCH_ASSOC) ?: [];
$subtotal=0; foreach($cart as $item) $subtotal += (float)$item['price']*(int)$item['quantity'];
$isPwd = isset($_POST['pwd_discount']) && $_POST['pwd_discount'] === '1';
$discount = $isPwd ? round($subtotal * 0.20, 2) : 0.00;
$total = round($subtotal - $discount, 2);
$pageTitle='Checkout'; $error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $useSaved=($_POST['use_saved_delivery'] ?? '1')==='1'; $name=trim($useSaved ? ($profile['full_name'] ?? '') : ($_POST['full_name'] ?? '')); $phone=trim($useSaved ? ($profile['phone'] ?? '') : ($_POST['phone'] ?? '')); $address=trim($useSaved ? ($profile['address'] ?? '') : ($_POST['address'] ?? '')); $cashReceived=(float)($_POST['cash_received'] ?? 0);
  if ($name==='' || $phone==='' || $address==='') $error='Please complete all delivery details.';
  elseif ($cashReceived < $total) $error='Payment amount must be at least the order total before a receipt can be issued.';
  else {
    try {
      $pdo->beginTransaction();
      foreach($cart as $item) {
        $check=$pdo->prepare('SELECT stock 
FROM products 
WHERE id=? 
FOR UPDATE'); $check->execute([$item['product_id']]); $row=$check->fetch();
        if (!$row || (int)$row['stock'] < (int)$item['quantity']) throw new RuntimeException('A product no longer has enough stock. Please update your cart.');
      }
      $stmt=$pdo->prepare("INSERT INTO orders(user_id,total,status,full_name,phone,address) 
VALUES(?,?, 'Pending',?,?,?)");
      $stmt->execute([current_user()['id'],$total,$name,$phone,$address]); $orderId=(int)$pdo->lastInsertId();
      $pay=$pdo->prepare("INSERT INTO payments(order_id,payment_method,payment_status,cash_received,change_due,paid_at) 
VALUES(?,'Cash','Paid',?,?,NOW())");
      $pay->execute([$orderId,$cashReceived,$cashReceived-$total]);
      $itemStmt=$pdo->prepare('INSERT INTO order_items(order_id,product_id,product_name,size,quantity,unit_price) 
VALUES(?,?,?,?,?,?)');
      $stockStmt=$pdo->prepare('UPDATE products 
SET stock=stock-? 
WHERE id=?');
      $logStmt=$pdo->prepare("INSERT INTO inventory_logs(product_id,change_qty,reason,reference_type,reference_id) 
VALUES(?,?,'Customer order','order',?)");
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
      $orderMetaStmt = $pdo->prepare('SELECT created_at, status 
FROM orders 
WHERE id = ?');
      $orderMetaStmt->execute([$orderId]);
      $orderMeta = $orderMetaStmt->fetch() ?: ['created_at' => date('Y-m-d H:i:s'), 'status' => 'Pending'];
      $receiptItems = [];

      foreach ($cart as $item) {
        $lineTotal = (float)$item['price'] * (int)$item['quantity'];
        $sizeText = !empty($item['size']) ? (string)$item['size'] : 'N/A';
        $itemLine = (string)$item['name'] . ' (Size ' . $sizeText . ') x ' . (int)$item['quantity'] . ' @ PHP ' . number_format((float)$item['price'], 2) . ' = PHP ' . number_format($lineTotal, 2);
        $emailBody .= $itemLine . "\n";
        $receiptItems[] = ['name' => (string)$item['name'], 'size' => (string)($item['size'] ?? ''), 'quantity' => (int)$item['quantity'], 'unit_price' => (float)$item['price']];
      }
      $emailBody .= "\nSubtotal: PHP " . number_format($subtotal, 2) . "\nPWD discount: PHP " . number_format($discount, 2) . "\nOrder total: PHP " . number_format($total, 2) . "\nCash received: PHP " . number_format($cashReceived, 2) . "\nChange: PHP " . number_format($cashReceived - $total, 2) . "\n\nYou can view and print your receipt on the Shoeskopo website.\n\nThank you for shopping with Shoeskopo!";
      $receiptPdfData = shoeskopo_make_receipt_pdf([
        'receipt_no' => $orderId,
        'date' => (string)$orderMeta['created_at'],
        'customer' => $customerName,
        'payment_method' => 'Cash',
        'payment_status' => 'Paid',
        'sale_status' => (string)$orderMeta['status'],
        'items' => $receiptItems,
        'subtotal' => $subtotal,
        'discount' => $discount,
        'grand_total' => $total,
        'cash_received' => $cashReceived,
        'change' => $cashReceived - $total,
      ]);
      $emailSent = false;
      if (filter_var($customerEmail, FILTER_VALIDATE_EMAIL)) {
        $emailSent = shoeskopo_send_mail(
          $customerEmail,
          'Shoeskopo Order Confirmation - Order #' . $orderId,
          $emailBody,
          'Shoeskopo-Order-' . $orderId . '-Receipt.pdf',
          $receiptPdfData
        );
      } else {
        error_log('[Shoeskopo mail] Could not send order confirmation: logged-in customer email is missing or invalid.');
      }
      $_SESSION['order_confirmation_notice'] = $emailSent
        ? 'Your order was placed successfully. The confirmation email was accepted by Mailtrap.'
        : 'Your order was placed successfully, but the confirmation email could not be sent. Check the PHP/Apache error log for a [Shoeskopo mail] diagnostic.';

      $remainingCart=shoeskopo_load_cart($pdo);
      foreach(array_keys($cart) as $purchasedKey) unset($remainingCart[$purchasedKey]);
      shoeskopo_save_cart($pdo, $remainingCart);
      unset($_SESSION['checkout_items']);
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
<section class="section"><h1>CHECKOUT</h1><div class="product-detail" style="padding:20px 0"><div><section class="form-wrap" style="margin:0;max-width:none"><h2>Delivery details</h2><?php if($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?><form method="post"><div class="delivery-saved" style="border:1px solid #ddd;border-radius:12px;padding:14px;margin-bottom:16px"><h3>Saved delivery details</h3><p><strong>Name:</strong> <?= e($profile['full_name'] ?? '') ?></p><p><strong>Phone:</strong> <?= e($profile['phone'] ?? '') ?></p><p><strong>Address:</strong> <?= e($profile['address'] ?? '') ?></p><button type="button" class="btn" id="change-delivery">Change delivery details</button></div><div id="delivery-fields" hidden><div class="field"><label>Full name</label><input name="full_name" value="<?= e($_POST['full_name'] ?? ($profile['full_name'] ?? '')) ?>" required></div><div class="field"><label>Phone</label><input name="phone" value="<?= e($_POST['phone'] ?? ($profile['phone'] ?? '')) ?>" required></div><div class="field"><label>Delivery address</label><textarea name="address" rows="4" required><?= e($_POST['address'] ?? ($profile['address'] ?? '')) ?></textarea></div></div><input type="hidden" name="use_saved_delivery" id="use-saved-delivery" value="1"><div class="field" style="border:1px solid #ddd;border-radius:10px;padding:14px;margin:16px 0"><label style="display:flex;align-items:center;gap:8px"><input type="checkbox" id="pwd_discount" name="pwd_discount" value="1" <?= $isPwd ? 'checked' : '' ?> style="width:auto"> Apply 20% PWD discount</label></div><div class="field"><label>Cash payment amount (PHP)</label><input id="cash_received" type="number" name="cash_received" min="<?= e((string)$total) ?>" step="0.01" required value="<?= e((string)$total) ?>"><small class="muted">Enter the amount paid. It must cover the discounted order total.</small></div><button class="btn btn-blue">PAY AND PLACE ORDER</button></form></section></div><div><h2>Order summary</h2><?php foreach($cart as $item): ?><p><?= e($item['name']) ?> × <?= (int)$item['quantity'] ?> — <?= money($item['price']*$item['quantity']) ?></p><?php endforeach; ?><hr><p>Subtotal: <strong><?= money($subtotal) ?></strong></p><p>Discount (PWD): <strong id="pwd_discount_amount">−<?= money($discount) ?></strong></p><h2>Total: <span id="checkout_total"><?= money($total) ?></span></h2></div></div></section>
<script>
(function(){const change=document.getElementById('change-delivery'),fields=document.getElementById('delivery-fields'),saved=document.getElementById('use-saved-delivery');if(change)change.addEventListener('click',function(){fields.hidden=false;saved.value='0';change.hidden=true;});const cb=document.getElementById('pwd_discount'),cash=document.getElementById('cash_received');if(!cb)return;const subtotal=<?= json_encode(round($subtotal,2)) ?>;const money=n=>'₱'+Number(n).toLocaleString('en-PH',{minimumFractionDigits:2,maximumFractionDigits:2});function update(){const discount=cb.checked?Math.round(subtotal*0.20*100)/100:0;const total=Math.round((subtotal-discount)*100)/100;document.getElementById('pwd_discount_amount').textContent='−'+money(discount);document.getElementById('checkout_total').textContent=money(total);cash.min=total.toFixed(2);cash.value=total.toFixed(2);}cb.addEventListener('change',update);update();})();
</script>
<?php include __DIR__ . '/includes/footer.php'; ?>
