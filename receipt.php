<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
require_login();

$orderId = (int)($_GET['order'] ?? 0);
$sql = "SELECT o.*, p.payment_method, p.payment_status, p.cash_received, p.change_due, p.paid_at
        FROM orders o LEFT JOIN payments p ON p.order_id = o.id WHERE o.id = ?";
$args = [$orderId];
if ((current_user()['role'] ?? '') === 'customer') {
    $sql .= " AND o.user_id = ?";
    $args[] = current_user()['id'];
}
$stmt = $pdo->prepare($sql);
$stmt->execute($args);
$order = $stmt->fetch();
if (!$order) {
    http_response_code(404);
    exit('Receipt not found or access denied.');
}
if (($order['payment_status'] ?? '') !== 'Paid') {
    http_response_code(402);
    exit('Payment is required before a receipt can be issued. Please complete payment at checkout.');
}
$stmt = $pdo->prepare('SELECT product_name, size, quantity, unit_price FROM order_items WHERE order_id = ?');
$stmt->execute([$orderId]);
$items = $stmt->fetchAll();
function receipt_escape($v): string { return htmlspecialchars((string)($v ?? ''), ENT_QUOTES, 'UTF-8'); }
function receipt_money($v): string { return '₱' . number_format((float)$v, 2); }
?>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sales Receipt | Shoeskopo</title>
<style>
*{box-sizing:border-box}body{margin:0;padding:24px;background:#f3f3f3;color:#222;font:14px Arial,sans-serif}.receipt{max-width:720px;margin:0 auto;background:#fff;padding:32px;border:1px solid #ddd}.brand{text-align:center;border-bottom:2px dashed #bbb;padding-bottom:18px}.brand h1{margin:0;font-size:28px;letter-spacing:2px}.brand p{margin:6px 0}.meta{margin:22px 0;display:grid;grid-template-columns:1fr 1fr;gap:8px}.meta p{margin:0}.items{width:100%;border-collapse:collapse;margin:20px 0}.items th,.items td{text-align:left;padding:10px 6px;border-bottom:1px solid #ddd}.items th:last-child,.items td:last-child{text-align:right}.totals{margin-left:auto;max-width:280px}.totals p{display:flex;justify-content:space-between}.grand{font-size:20px;font-weight:bold;border-top:2px solid #222;padding-top:12px}.note{text-align:center;margin-top:24px;padding-top:16px;border-top:2px dashed #bbb}.actions{text-align:center;margin:18px}.actions button,.actions a{display:inline-block;padding:10px 16px;margin:4px;border:0;background:#222;color:white;text-decoration:none;cursor:pointer}@media print{body{background:#fff;padding:0}.receipt{border:0;max-width:none;padding:10px}.actions{display:none}}
</style>
</head>
<body>
<main class="receipt">
  <div class="brand"><h1>SHOESKOPO</h1><p>SALES RECEIPT</p><p>Thank you for your purchase!</p></div>
  <div class="meta">
    <p><strong>Receipt No.:</strong> #<?= (int)$order['id'] ?></p>
    <p><strong>Date:</strong> <?= receipt_escape($order['created_at']) ?></p>
    <p><strong>Customer:</strong> <?= receipt_escape($order['full_name'] ?? current_user()['username'] ?? 'Customer') ?></p>
    <p><strong>Payment:</strong> <?= receipt_escape($order['payment_method'] ?? 'Cash') ?></p>
    <p><strong>Payment status:</strong> <?= receipt_escape($order['payment_status'] ?? 'Pending') ?></p>
    <p><strong>Sale status:</strong> <?= receipt_escape($order['status'] ?? 'Pending') ?></p>
  </div>
  <table class="items"><thead><tr><th>Item</th><th>Qty</th><th>Unit price</th><th>Subtotal</th></tr></thead><tbody>
  <?php foreach ($items as $item): ?><tr><td><?= receipt_escape($item['product_name']) ?><?= !empty($item['size']) ? ' (Size ' . receipt_escape($item['size']) . ')' : '' ?></td><td><?= (int)$item['quantity'] ?></td><td><?= receipt_money($item['unit_price']) ?></td><td><?= receipt_money($item['unit_price'] * $item['quantity']) ?></td></tr><?php endforeach; ?>
  </tbody></table>
  <div class="totals"><p><span>Subtotal</span><strong><?= receipt_money($order['total']) ?></strong></p><p><span>Discount</span><strong><?= receipt_money(0) ?></strong></p><p class="grand"><span>Grand Total</span><span><?= receipt_money($order['total']) ?></span></p>
  <?php if (($order['payment_status'] ?? '') === 'Paid'): ?><p><span>Cash received</span><strong><?= receipt_money($order['cash_received']) ?></strong></p><p><span>Change</span><strong><?= receipt_money($order['change_due']) ?></strong></p><?php else: ?><p><span>Amount due</span><strong><?= receipt_money($order['total']) ?></strong></p><?php endif; ?></div>
  <div class="note"><strong>Thank you for shopping at Shoeskopo!</strong><p>This is your order receipt.</p>
  <?php if (!empty($_SESSION['order_confirmation_notice'])): ?>
    <p><?= receipt_escape($_SESSION['order_confirmation_notice']) ?></p>
    <?php unset($_SESSION['order_confirmation_notice']); ?>
  <?php endif; ?>
  </div>
</main>
<div class="actions"><button onclick="window.print()">Print receipt</button> <a href="<?= (current_user()['role'] ?? '') === 'admin' ? 'admin/orders.php' : ((current_user()['role'] ?? '') === 'employee' ? 'employee/index.php' : 'index.php') ?>">Back</a></div>
</body></html>
