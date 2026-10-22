<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
require_login();

$user = current_user();
$role = strtolower(trim((string)($user['role'] ?? '')));
if ($role !== 'customer') {
    if ($role === 'admin') { header('Location: admin/orders.php'); exit; }
    if ($role === 'employee') { header('Location: employee/index.php'); exit; }
    http_response_code(403);
    exit('Access denied.');
}

// A customer can only see orders associated with their own account.
$stmt = $pdo->prepare(
    'SELECT o.id, o.created_at, o.total, o.status, o.full_name,
            p.payment_method, p.payment_status
     FROM orders o
     LEFT JOIN payments p ON p.order_id = o.id
     WHERE o.user_id = ?
     ORDER BY o.created_at DESC, o.id DESC'
);
$stmt->execute([(int)($user['id'] ?? 0)]);
$orders = $stmt->fetchAll(PDO::FETCH_ASSOC);

$itemStmt = $pdo->prepare(
    'SELECT product_name, size, quantity, unit_price
     FROM order_items
     WHERE order_id = ?
     ORDER BY id ASC'
);

$pageTitle = 'My Orders';
include __DIR__ . '/includes/header.php';

$statusClass = static function ($value): string {
    $value = strtolower(trim((string)$value));
    if (in_array($value, ['completed', 'delivered', 'paid', 'success'], true)) return 'is-success';
    if (in_array($value, ['cancelled', 'canceled', 'failed', 'refunded'], true)) return 'is-danger';
    if (in_array($value, ['processing', 'shipped', 'out for delivery'], true)) return 'is-progress';
    return 'is-pending';
};
?>
<style>
.orders-page{max-width:1180px;margin:0 auto;padding:38px 4% 56px;color:#171717}
.orders-heading{display:flex;align-items:flex-end;justify-content:space-between;gap:18px;margin-bottom:26px;flex-wrap:wrap}
.orders-heading h1{font-size:clamp(28px,4vw,38px);letter-spacing:-.8px;margin:0 0 8px}
.orders-heading p{margin:0;color:#707070;line-height:1.5}
.orders-count{background:#f3f3f3;border-radius:999px;padding:9px 14px;font-size:13px;font-weight:700;white-space:nowrap}
.orders-list{display:grid;gap:22px}
.order-card{border:1px solid #e6e6e6;border-radius:15px;background:#fff;overflow:hidden;box-shadow:0 5px 20px rgba(0,0,0,.045)}
.order-card-head{display:flex;justify-content:space-between;align-items:flex-start;gap:16px;padding:22px 24px;background:#fafafa;border-bottom:1px solid #e9e9e9;flex-wrap:wrap}
.order-number{margin:0 0 7px;font-size:20px;font-weight:800}
.order-date{margin:0;color:#777;font-size:13px}
.order-statuses{display:flex;gap:8px;flex-wrap:wrap;justify-content:flex-end}
.order-pill{display:inline-flex;align-items:center;gap:6px;padding:7px 11px;border-radius:999px;font-size:12px;font-weight:800;text-transform:capitalize;white-space:nowrap}
.order-pill.is-success{background:#e6f6eb;color:#176b36}.order-pill.is-danger{background:#fde8e7;color:#a12622}.order-pill.is-progress{background:#e8efff;color:#244e9a}.order-pill.is-pending{background:#fff1d8;color:#8b5a08}
.order-items-wrap{padding:4px 24px 0}
.order-items{width:100%;border-collapse:collapse;min-width:420px}
.order-items th{font-size:11px;text-transform:uppercase;letter-spacing:.6px;color:#777;font-weight:800;background:#fff}
.order-items th,.order-items td{padding:15px 12px;border-bottom:1px solid #eee;text-align:left;vertical-align:middle}
.order-items th:first-child,.order-items td:first-child{padding-left:0}
.order-items th:last-child,.order-items td:last-child{padding-right:0;text-align:right}
.order-items td{font-size:14px}.order-product{font-weight:700}.order-size,.order-qty{color:#666}.order-money{white-space:nowrap;font-variant-numeric:tabular-nums}
.order-bottom{display:flex;align-items:flex-start;justify-content:space-between;gap:22px;padding:20px 24px 24px;flex-wrap:wrap}
.order-payment{color:#737373;font-size:13px;line-height:1.8}.order-payment strong{color:#333;font-weight:700}
.order-total{min-width:220px;text-align:right;margin-left:auto}.order-total-label{font-size:12px;color:#777;text-transform:uppercase;letter-spacing:.7px;font-weight:800}.order-total-amount{font-size:26px;font-weight:800;letter-spacing:-.5px;margin:4px 0 14px;font-variant-numeric:tabular-nums}
.order-actions{display:flex;justify-content:flex-end;gap:10px;flex-wrap:wrap}.order-receipt-btn{display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:11px 16px;border-radius:8px;background:#315da9;color:#fff;font-size:12px;font-weight:800;letter-spacing:.25px}.order-receipt-btn:hover{background:#254a88}
.orders-empty{border:1px dashed #d7d7d7;background:#fafafa;border-radius:16px;padding:54px 20px;text-align:center}.orders-empty-icon{width:58px;height:58px;display:grid;place-items:center;margin:0 auto 16px;background:#eee;border-radius:50%;font-size:27px}.orders-empty h2{font-size:22px;margin:0 0 9px}.orders-empty p{color:#777;margin:0 auto 22px;line-height:1.6;max-width:420px}.orders-shop-btn{display:inline-flex;padding:12px 18px;background:#171717;color:#fff;border-radius:8px;font-weight:800;font-size:12px;letter-spacing:.3px}.orders-shop-btn:hover{background:#333}
@media(max-width:640px){.orders-page{padding:27px 16px 40px}.order-card-head{padding:18px}.order-statuses{justify-content:flex-start}.order-items-wrap{padding:0 18px}.order-bottom{padding:18px;display:block}.order-total{min-width:0;text-align:left;margin-top:18px;padding-top:16px;border-top:1px solid #eee}.order-actions{justify-content:flex-start}.order-receipt-btn{width:100%}.order-items{min-width:400px}.order-number{font-size:18px}}
</style>

<section class="orders-page">
  <div class="orders-heading">
    <div>
      <h1>My Orders</h1>
      <p>Track your purchases, check payment details, and view your receipts.</p>
    </div>
    <div class="orders-count"><?= count($orders) ?> <?= count($orders) === 1 ? 'order' : 'orders' ?></div>
  </div>

  <?php if (!$orders): ?>
    <div class="orders-empty">
      <div class="orders-empty-icon" aria-hidden="true">🛍</div>
      <h2>No orders yet</h2>
      <p>Your orders will appear here after you complete a checkout. Start shopping and your purchase history will be saved to your account.</p>
      <a class="orders-shop-btn" href="index.php">CONTINUE SHOPPING</a>
    </div>
  <?php else: ?>
    <div class="orders-list">
      <?php foreach ($orders as $order): ?>
        <?php
          $itemStmt->execute([(int)$order['id']]);
          $items = $itemStmt->fetchAll(PDO::FETCH_ASSOC);
          $orderStatus = trim((string)($order['status'] ?? 'Pending')) ?: 'Pending';
          $paymentStatus = trim((string)($order['payment_status'] ?? 'Pending')) ?: 'Pending';
          $paymentMethod = trim((string)($order['payment_method'] ?? ''));
          try {
              $orderDate = (new DateTime((string)$order['created_at']))->format('M j, Y · g:i A');
          } catch (Throwable $exception) {
              $orderDate = (string)$order['created_at'];
          }
        ?>
        <article class="order-card">
          <div class="order-card-head">
            <div>
              <p class="order-date">Placed on <?= e($orderDate) ?></p>
            </div>
            <div class="order-statuses" aria-label="Order and payment status">
              <span class="order-pill <?= e($statusClass($orderStatus)) ?>">Order: <?= e($orderStatus) ?></span>
              <span class="order-pill <?= e($statusClass($paymentStatus)) ?>">Payment: <?= e($paymentStatus) ?></span>
            </div>
          </div>

          <div class="order-items-wrap">
            <div class="table-wrap">
              <table class="order-items">
                <thead>
                  <tr><th>Product</th><th>Size</th><th>Qty</th></tr>
                </thead>
                <tbody>
                  <?php if (!$items): ?>
                    <tr><td colspan="3" style="padding:20px 0;color:#777">No item details are available for this order.</td></tr>
                  <?php else: ?>
                    <?php foreach ($items as $item): ?>
                      <?php $qty = max(0, (int)$item['quantity']); ?>
                      <tr>
                        <td class="order-product"><?= e((string)$item['product_name']) ?></td>
                        <td class="order-size"><?= e(trim((string)($item['size'] ?? '')) ?: '—') ?></td>
                        <td class="order-qty"><?= $qty ?></td>
                      </tr>
                    <?php endforeach; ?>
                  <?php endif; ?>
                </tbody>
              </table>
            </div>
          </div>

          <div class="order-bottom">
            <div class="order-payment">
              <?php if ($paymentMethod !== ''): ?><div>Payment method: <strong><?= e($paymentMethod) ?></strong></div><?php endif; ?>
            </div>
            <div class="order-total">
              <div class="order-total-label">Order total</div>
              <div class="order-total-amount"><?= money($order['total'] ?? 0) ?></div>
              <div class="order-actions">
                <?php if (strtolower($paymentStatus) === 'paid'): ?>
                  <a class="order-receipt-btn" href="receipt.php?order=<?= (int)$order['id'] ?>">
                    <span aria-hidden="true">▤</span> VIEW RECEIPT
                  </a>
                <?php endif; ?>
              </div>
            </div>
          </div>
        </article>
      <?php endforeach; ?>
    </div>
  <?php endif; ?>
</section>

<?php include __DIR__ . '/includes/footer.php'; ?>
