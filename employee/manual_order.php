<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['employee', 'admin']);

$error = '';
$successOrderId = isset($_GET['completed']) ? (int)$_GET['completed'] : 0;
$products = $pdo->query(
    'SELECT id, name, price, stock
     FROM products
     ORDER BY name'
)->fetchAll();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $customerName = trim($_POST['customer_name'] ?? '');
    $customerPhone = trim($_POST['customer_phone'] ?? '');
    $cashReceived = (float)($_POST['cash_received'] ?? 0);
    $quantities = $_POST['quantity'] ?? [];

    if ($customerName === '') {
        $error = 'Enter the customer name.';
    } else {
        $cartItems = [];
        $total = 0.0;

        foreach ($quantities as $productId => $rawQty) {
            $qty = filter_var($rawQty, FILTER_VALIDATE_INT);
            if (!$qty || $qty < 1) {
                continue;
            }

            $stmt = $pdo->prepare(
                'SELECT id, name, price, stock
                 FROM products
                 WHERE id = ?'
            );
            $stmt->execute([(int)$productId]);
            $product = $stmt->fetch();

            if (!$product) {
                $error = 'One of the selected products could not be found.';
                break;
            }
            if ((int)$product['stock'] < $qty) {
                $error = 'Not enough stock for ' . $product['name'] . '. Available: ' . (int)$product['stock'] . '.';
                break;
            }

            $product['quantity'] = $qty;
            $product['line_total'] = (float)$product['price'] * $qty;
            $cartItems[] = $product;
            $total += $product['line_total'];
        }

        if (!$error && !$cartItems) {
            $error = 'Enter a quantity for at least one product.';
        }
        if (!$error && $cashReceived < $total) {
            $error = 'Cash received must be equal to or greater than the total (' . money($total) . ').';
        }

        if (!$error) {
            try {
                $pdo->beginTransaction();

                // Lock and re-check stock to avoid selling more than is available.
                $lockStmt = $pdo->prepare('SELECT stock FROM products WHERE id = ? FOR UPDATE');
                foreach ($cartItems as $item) {
                    $lockStmt->execute([(int)$item['id']]);
                    $available = $lockStmt->fetchColumn();
                    if ($available === false || (int)$available < (int)$item['quantity']) {
                        throw new RuntimeException('Stock changed while processing. Please check quantities and try again.');
                    }
                }

                $orderStmt = $pdo->prepare(
                    "INSERT INTO orders (user_id, total, status, full_name, phone, address)
                     VALUES (?, ?, 'Completed', ?, ?, ?)"
                );
                $orderStmt->execute([
                    (int)current_user()['id'],
                    $total,
                    $customerName,
                    $customerPhone,
                    'In-store purchase'
                ]);
                $orderId = (int)$pdo->lastInsertId();

                $paymentStmt = $pdo->prepare(
                    "INSERT INTO payments
                        (order_id, payment_method, payment_status, cash_received, change_due, paid_at)
                     VALUES (?, 'Cash', 'Paid', ?, ?, NOW())"
                );
                $paymentStmt->execute([$orderId, $cashReceived, $cashReceived - $total]);

                $itemStmt = $pdo->prepare(
                    'INSERT INTO order_items (order_id, product_id, product_name, size, quantity, unit_price)
                     VALUES (?, ?, ?, ?, ?, ?)'
                );
                $stockStmt = $pdo->prepare('UPDATE products SET stock = stock - ? WHERE id = ?');
                $logStmt = $pdo->prepare(
                    "INSERT INTO inventory_logs (product_id, change_qty, reason, reference_type, reference_id)
                     VALUES (?, ?, 'Employee manual sale', 'order', ?)"
                );

                foreach ($cartItems as $item) {
                    $itemStmt->execute([
                        $orderId,
                        (int)$item['id'],
                        $item['name'],
                        'N/A',
                        (int)$item['quantity'],
                        (float)$item['price']
                    ]);
                    $stockStmt->execute([(int)$item['quantity'], (int)$item['id']]);
                    $logStmt->execute([(int)$item['id'], -(int)$item['quantity'], $orderId]);
                }

                $pdo->commit();
                header('Location: manual_order.php?completed=' . $orderId);
                exit;
            } catch (Throwable $e) {
                if ($pdo->inTransaction()) {
                    $pdo->rollBack();
                }
                $error = $e instanceof RuntimeException
                    ? $e->getMessage()
                    : 'Could not complete this sale. Check that the orders, order_items, payments, and inventory_logs tables are available.';
            }
        }
    }
}

$pageTitle = 'Manual Ordering';
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell cashier-page">
    <div class="cashier-heading"><div><p class="cashier-eyebrow">EMPLOYEE POINT OF SALE</p><h1>Manual Ordering / Cashier</h1><p class="cashier-subtitle">Browse products, manage your cart, and complete checkout.</p></div><div class="cashier-tag">Cashier</div></div>
    <nav class="admin-nav">
        <a href="index.php">Dashboard</a>
        <a href="manual_order.php">Manual Ordering / Cashier</a>
        <a href="inventory.php">Inventory</a>
    </nav>

    <?php if ($successOrderId > 0): ?>
        <div class="form-success">
            Sale #<?= $successOrderId ?> completed successfully. Stock has been deducted and payment recorded.
            <a href="../receipt.php?order=<?= $successOrderId ?>" target="_blank">View receipt</a>
        </div>
    <?php endif; ?>
    <?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>

    <div class="pos-layout" style="display:grid;grid-template-columns:minmax(0,1.15fr) minmax(320px,.85fr);gap:20px;align-items:start;margin-top:20px">
      <section class="form-wrap cashier-card">
        <div class="section-heading"><div><h2>Browse Products</h2><p>Choose a product to add it to the cart.</p></div><span class="section-icon">▦</span></div>
        <div class="field">
          <label for="productSearch">Search product</label>
          <input id="productSearch" type="search" placeholder="Search by product name..." autocomplete="off">
        </div>
        <div class="table-wrap">
          <table class="data-table" id="productTable">
            <thead><tr><th>Product</th><th>Price</th><th>Stock</th><th> </th></tr></thead>
            <tbody>
            <?php foreach ($products as $product): ?>
              <tr data-name="<?= e(strtolower($product['name'])) ?>">
                <td><?= e($product['name']) ?></td>
                <td><?= money($product['price']) ?></td>
                <td><?= (int)$product['stock'] ?></td>
                <td><button type="button" class="btn btn-blue add-product"
                    data-id="<?= (int)$product['id'] ?>"
                    data-name="<?= e($product['name']) ?>"
                    data-price="<?= e((string)$product['price']) ?>"
                    data-stock="<?= (int)$product['stock'] ?>"
                    <?= (int)$product['stock'] < 1 ? 'disabled' : '' ?>>Add</button></td>
              </tr>
            <?php endforeach; ?>
            </tbody>
          </table>
        </div>
      </section>

      <section class="form-wrap cashier-card payment-card">
        <div class="section-heading"><div><h2>Cart &amp; Payment</h2><p>Review items and enter the cash received.</p></div><span class="section-icon">₱</span></div>
        <form method="post" id="checkoutForm">
          <div class="field">
            <label for="customer_name">Customer name</label>
            <input id="customer_name" name="customer_name" required value="<?= e($_POST['customer_name'] ?? 'Walk-in Customer') ?>">
          </div>
          <div class="field">
            <label for="customer_phone">Phone (optional)</label>
            <input id="customer_phone" name="customer_phone" value="<?= e($_POST['customer_phone'] ?? '') ?>">
          </div>
          <div class="table-wrap">
            <table class="data-table" id="cartTable">
              <thead><tr><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th><th></th></tr></thead>
              <tbody id="cartBody"><tr id="emptyCart"><td colspan="5" style="text-align:center">Your cart is empty. Browse products and click Add.</td></tr></tbody>
            </table>
          </div>
          <div style="display:flex;justify-content:space-between;align-items:center;margin:18px 0;font-size:1.2rem">
            <strong>TOTAL</strong><strong id="cartTotal">₱0.00</strong>
          </div>
          <div class="field">
            <label for="cash_received">Amount paid (cash)</label>
            <input id="cash_received" name="cash_received" type="number" min="0" step="0.01" required value="<?= e($_POST['cash_received'] ?? '') ?>">
          </div>
          <p>Change: <strong id="changeDue">₱0.00</strong></p>
          <div id="hiddenQuantities"></div>
          <button type="submit" class="btn btn-blue" style="width:100%;padding:14px" id="checkoutButton" disabled>CHECKOUT</button>
          <button type="button" class="btn" id="clearCart" style="width:100%;margin-top:8px">NEW TRANSACTION / CLEAR CART</button>
        </form>
      </section>
    </div>
    <style>
      .cashier-page{max-width:1500px;margin:0 auto;padding:24px;color:#1f2937}
      .cashier-heading{display:flex;justify-content:space-between;align-items:center;gap:18px;margin:6px 0 24px;padding:24px 28px;border-radius:18px;background:linear-gradient(135deg,#b85f22,#e9a15b);color:#fff;box-shadow:0 10px 26px rgba(184,95,34,.16)}
      .cashier-heading h1{margin:0;font-size:clamp(1.5rem,2.4vw,2.1rem);letter-spacing:.01em;color:#fff}
      .cashier-eyebrow{margin:0 0 7px;font-size:.75rem;font-weight:800;letter-spacing:.13em;opacity:.8}
      .cashier-subtitle{margin:8px 0 0;opacity:.88}
      .cashier-tag{padding:9px 15px;border:1px solid rgba(255,255,255,.45);border-radius:999px;font-weight:700;white-space:nowrap}
      .pos-layout{gap:22px!important}
      .cashier-card{min-width:0;padding:22px;border:1px solid #e4e8f0;border-radius:16px;background:#fff;box-shadow:0 5px 20px rgba(31,41,55,.06)}
      .section-heading{display:flex;justify-content:space-between;align-items:center;gap:14px;margin-bottom:18px}
      .section-heading h2{margin:0;font-size:1.25rem;color:#4a2d1b}
      .section-heading p{margin:5px 0 0;color:#6b7280;font-size:.9rem}
      .section-icon{display:grid;place-items:center;flex:0 0 42px;height:42px;border-radius:12px;background:#fff0df;color:#b85f22;font-size:1.3rem;font-weight:800}
      .cashier-card .field{margin-bottom:16px}
      .cashier-card input:not([type=hidden]),.cashier-card select{width:100%;max-width:100%;min-height:42px;border:1px solid #d7dce6;border-radius:9px;padding:10px 12px;background:#fff;box-sizing:border-box}
      .cashier-card input:focus{outline:3px solid rgba(233,161,91,.22);border-color:#e9a15b}
      .table-wrap{overflow-x:auto;border:1px solid #e5e7eb;border-radius:10px}
      #productTable,#cartTable{width:100%;border-collapse:collapse;margin:0}
      #productTable th,#cartTable th{background:#fff5e9;color:#374151;font-size:.84rem;font-weight:750;white-space:nowrap}
      #productTable td,#cartTable td,#productTable th,#cartTable th{padding:11px 12px;vertical-align:middle;border-bottom:1px solid #edf0f5}
      #productTable tbody tr:hover{background:#fffaf4}
      #productTable tbody tr:last-child td,#cartTable tbody tr:last-child td{border-bottom:0}
      .add-product{padding:8px 15px;white-space:nowrap;border-radius:8px;font-weight:700}
      .add-product:disabled{opacity:.45;cursor:not-allowed}
      #cartTable input[type=number]{width:70px;min-width:0;padding:7px;border:1px solid #d7dce6;border-radius:7px}
      #cartTable .remove-cart-item{background:#fff1f2;color:#be123c;border:1px solid #fecdd3;border-radius:8px;padding:7px 10px;font-weight:700;cursor:pointer;white-space:nowrap}
      #cartTable .remove-cart-item:hover{background:#ffe4e6}
      #cartTotal{font-size:1.5rem;color:#b85f22}
      #changeDue{color:#16834a;font-size:1.1rem}
      #checkoutButton{min-height:52px;border-radius:10px;font-size:1rem;font-weight:800;letter-spacing:.04em}
      #checkoutButton:disabled{opacity:.45;cursor:not-allowed}
      #clearCart{min-height:44px;border-radius:10px;border:1px solid #d1d5db;background:#fff;color:#374151}
      #clearCart:hover{background:#f9fafb}
      @media(max-width:850px){.pos-layout{grid-template-columns:1fr!important}.cashier-page{padding:12px}.cashier-heading{padding:20px;align-items:flex-start}.cashier-tag{display:none}.cashier-card{padding:16px}}
    </style>
    <script>
    (() => {
      const cart = new Map();
      const money = n => '₱' + Number(n || 0).toLocaleString('en-PH', {minimumFractionDigits:2, maximumFractionDigits:2});
      const body = document.getElementById('cartBody');
      const totalLabel = document.getElementById('cartTotal');
      const cashInput = document.getElementById('cash_received');
      const changeLabel = document.getElementById('changeDue');
      const hidden = document.getElementById('hiddenQuantities');
      const checkout = document.getElementById('checkoutButton');
      function renderCart() {
        body.innerHTML = ''; hidden.innerHTML = '';
        let total = 0;
        if (!cart.size) body.innerHTML = '<tr><td colspan="5" style="text-align:center">Your cart is empty. Browse products and click Add.</td></tr>';
        cart.forEach(item => {
          const subtotal = item.price * item.qty; total += subtotal;
          const tr = document.createElement('tr');
          tr.innerHTML = `<td></td><td>${money(item.price)}</td><td><input type="number" min="1" max="${item.stock}" value="${item.qty}" aria-label="Quantity"></td><td>${money(subtotal)}</td><td><button type="button" class="remove-cart-item">Remove</button></td>`;
          tr.children[0].textContent = item.name;
          tr.querySelector('input').addEventListener('change', e => {
            const q = Math.max(1, Math.min(item.stock, parseInt(e.target.value, 10) || 1)); item.qty = q; renderCart();
          });
          tr.querySelector('button').setAttribute('aria-label', `Remove ${item.name} from cart`);
          tr.querySelector('button').addEventListener('click', () => { cart.delete(item.id); renderCart(); });
          body.appendChild(tr);
          const input = document.createElement('input'); input.type = 'hidden'; input.name = `quantity[${item.id}]`; input.value = item.qty; hidden.appendChild(input);
        });
        totalLabel.textContent = money(total);
        const cash = parseFloat(cashInput.value) || 0;
        changeLabel.textContent = money(Math.max(0, cash - total));
        checkout.disabled = cart.size === 0 || cash < total;
      }
      document.querySelectorAll('.add-product').forEach(button => button.addEventListener('click', () => {
        const id = button.dataset.id, stock = parseInt(button.dataset.stock, 10);
        const item = cart.get(id);
        if (item) { if (item.qty < stock) item.qty++; else alert('Maximum available stock reached.'); }
        else cart.set(id, {id, name: button.dataset.name, price: parseFloat(button.dataset.price), stock, qty: 1});
        renderCart();
      }));
      document.getElementById('productSearch').addEventListener('input', e => {
        const q = e.target.value.trim().toLowerCase();
        document.querySelectorAll('#productTable tbody tr').forEach(row => { row.hidden = !row.dataset.name.includes(q); });
      });
      cashInput.addEventListener('input', renderCart);
      document.getElementById('clearCart').addEventListener('click', () => {
        cart.clear(); document.getElementById('customer_name').value = 'Walk-in Customer';
        document.getElementById('customer_phone').value = ''; cashInput.value = ''; renderCart();
      });
      document.getElementById('checkoutForm').addEventListener('submit', e => {
        if (!cart.size) { e.preventDefault(); alert('Please add a product to the cart first.'); }
      });
      renderCart();
    })();
    </script>
<?php include __DIR__ . '/../includes/footer.php'; ?>
