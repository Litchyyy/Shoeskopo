<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);

$error = '';
$editExpense = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? 'save';
    try {
        if ($action === 'delete') {
            $id = (int)($_POST['id'] ?? 0);
            if ($id < 1) {
                throw new RuntimeException('Invalid expense.');
            }
            $stmt = $pdo->prepare('DELETE FROM expenses WHERE id = ?');
            $stmt->execute([$id]);
            header('Location: reports.php?type=expenses&period=' . urlencode($_POST['period'] ?? 'daily') . '&message=deleted');
            exit;
        }

        $id = (int)($_POST['id'] ?? 0);
        $date = $_POST['expense_date'] ?? date('Y-m-d');
        $category = trim($_POST['category'] ?? '');
        $description = trim($_POST['description'] ?? '');
        $amount = (float)($_POST['amount'] ?? 0);

        if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $date) || $category === '' || $description === '' || $amount <= 0) {
            throw new RuntimeException('Enter a valid date, category, description, and amount greater than zero.');
        }

        if ($action === 'update' && $id > 0) {
            $stmt = $pdo->prepare(
                'UPDATE expenses
                 SET expense_date = ?, category = ?, description = ?, amount = ?
                 WHERE id = ?'
            );
            $stmt->execute([$date, $category, $description, $amount, $id]);
            header('Location: reports.php?type=expenses&period=' . urlencode($_POST['period'] ?? 'daily') . '&message=updated');
            exit;
        }

        $stmt = $pdo->prepare(
            'INSERT INTO expenses (expense_date, category, description, amount)
             VALUES (?, ?, ?, ?)'
        );
        $stmt->execute([$date, $category, $description, $amount]);
        header('Location: reports.php?type=expenses&period=' . urlencode($_POST['period'] ?? 'daily') . '&message=added');
        exit;
    } catch (Throwable $e) {
        $error = $e instanceof RuntimeException ? $e->getMessage() : 'Could not save the expense. Check the expenses table structure.';
    }
}

$period = $_GET['period'] ?? 'daily';
if (!in_array($period, ['daily', 'weekly', 'monthly', 'annual'], true)) {
    $period = 'daily';
}
$reportType = $_GET['type'] ?? 'sales';
if (!in_array($reportType, ['sales', 'expenses', 'suppliers', 'customers', 'inventory'], true)) {
    $reportType = 'sales';
}
$today = date('Y-m-d');
$from = $today;
$to = $today;

if ($period === 'weekly') {
    $from = date('Y-m-d', strtotime('monday this week'));
    $to = date('Y-m-d', strtotime('sunday this week'));
} elseif ($period === 'monthly') {
    $from = date('Y-m-01');
    $to = date('Y-m-t');
} elseif ($period === 'annual') {
    $from = date('Y-01-01');
    $to = date('Y-12-31');
}

$stmt = $pdo->prepare(
    "SELECT COALESCE(SUM(total), 0)
     FROM orders
     WHERE status = 'Completed'
       AND DATE(created_at) BETWEEN ? AND ?"
);
$stmt->execute([$from, $to]);
$grossSales = (float)$stmt->fetchColumn();

$stmt = $pdo->prepare(
    'SELECT COALESCE(SUM(amount), 0)
     FROM expenses
     WHERE expense_date BETWEEN ? AND ?'
);
$stmt->execute([$from, $to]);
$expensesTotal = (float)$stmt->fetchColumn();

/* Net sales are completed sales minus expenses; the original order totals remain unchanged. */
$netSales = $grossSales - $expensesTotal;

$stmt = $pdo->prepare(
    'SELECT COUNT(*)
     FROM orders
     WHERE DATE(created_at) BETWEEN ? AND ?'
);
$stmt->execute([$from, $to]);
$orderCount = (int)$stmt->fetchColumn();

$stmt = $pdo->prepare(
    'SELECT COUNT(DISTINCT user_id)
     FROM orders
     WHERE DATE(created_at) BETWEEN ? AND ?'
);
$stmt->execute([$from, $to]);
$customers = (int)$stmt->fetchColumn();

$stmt = $pdo->prepare(
    'SELECT COALESCE(SUM(total_cost), 0)
     FROM purchase_orders
     WHERE order_date BETWEEN ? AND ?'
);
$stmt->execute([$from, $to]);
$supplierSpend = (float)$stmt->fetchColumn();

$stmt = $pdo->prepare(
    'SELECT id, expense_date, category, description, amount
     FROM expenses
     WHERE expense_date BETWEEN ? AND ?
     ORDER BY expense_date DESC, id DESC'
);
$stmt->execute([$from, $to]);
$expenseRows = $stmt->fetchAll();

if (isset($_GET['edit'])) {
    $stmt = $pdo->prepare('SELECT * FROM expenses WHERE id = ?');
    $stmt->execute([(int)$_GET['edit']]);
    $editExpense = $stmt->fetch() ?: null;
}

$inventory = $pdo->query(
    'SELECT COUNT(*) AS product_count,
            COALESCE(SUM(stock), 0) AS total_units,
            COALESCE(SUM(stock * price), 0) AS retail_value,
            COALESCE(SUM(stock <= 5), 0) AS low_stock
     FROM products'
)->fetch();
$supplierCount = (int)$pdo->query('SELECT COUNT(*) FROM suppliers')->fetchColumn();
$customerCount = (int)$pdo->query("SELECT COUNT(*) FROM users WHERE role = 'customer'")->fetchColumn();

$pageTitle = 'Reports & Expenses';
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell">
<h1>REPORTS &amp; EXPENSES</h1>
<nav class="admin-nav">
    <a href="index.php">Dashboard</a><a href="orders.php">Sale Management</a>
    <a href="products.php">Products</a><a href="categories.php">Categories</a>
    <a href="suppliers.php">Suppliers</a><a href="inventory.php">Inventory</a><a href="users.php">Users</a>
</nav>
<div class="report-toolbar report-controls">
    <form method="get" class="inline-form">
        <label for="report-type"><strong>Report type</strong></label>
        <select id="report-type" name="type" onchange="this.form.submit()">
            <?php foreach (['sales' => 'Sales Report', 'expenses' => 'Expenses Report', 'suppliers' => 'Supplier Report', 'customers' => 'Customer Sales Report', 'inventory' => 'Inventory Report'] as $key => $label): ?>
                <option value="<?= e($key) ?>" <?= $reportType === $key ? 'selected' : '' ?>><?= e($label) ?></option>
            <?php endforeach; ?>
        </select>
        <label for="report-period"><strong>Period</strong></label>
        <select id="report-period" name="period" onchange="this.form.submit()">
            <?php foreach (['daily' => 'Daily', 'weekly' => 'Weekly', 'monthly' => 'Monthly', 'annual' => 'Annual'] as $key => $label): ?>
                <option value="<?= e($key) ?>" <?= $period === $key ? 'selected' : '' ?>><?= e($label) ?></option>
            <?php endforeach; ?>
        </select>
        <button class="btn btn-blue" type="button" onclick="window.print()">PRINT REPORT</button>
    </form>
</div>
<div class="print-heading">
    <h2><?= e(['sales' => 'Sales Report', 'expenses' => 'Expenses Report', 'suppliers' => 'Supplier Report', 'customers' => 'Customer Sales Report', 'inventory' => 'Inventory Report'][$reportType]) ?></h2>
    <p>Reporting dates: <strong><?= e($from) ?></strong> to <strong><?= e($to) ?></strong></p>
</div>
<?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<?php if (isset($_GET['message'])): ?><div class="form-success">Expense <?= e($_GET['message']) ?> successfully.</div><?php endif; ?>

<?php if ($reportType === 'sales'): ?>
<div class="stat-grid">
    <div class="stat-card">Completed sales (gross)<strong><?= money($grossSales) ?></strong></div>
    <div class="stat-card">Expenses<strong><?= money($expensesTotal) ?></strong></div>
    <div class="stat-card">Sales after expenses<strong><?= money($netSales) ?></strong></div>
    <div class="stat-card">Supplier purchase orders<strong><?= money($supplierSpend) ?></strong></div>
    <div class="stat-card">Orders placed<strong><?= $orderCount ?></strong></div>
    <div class="stat-card">Customers with orders<strong><?= $customers ?></strong></div>
    <div class="stat-card">Inventory units<strong><?= (int)$inventory['total_units'] ?></strong></div>
    <div class="stat-card">Inventory retail value<strong><?= money($inventory['retail_value']) ?></strong></div>
    <div class="stat-card">Low-stock products<strong><?= (int)$inventory['low_stock'] ?></strong></div>
    <div class="stat-card">Suppliers / Customers<strong><?= $supplierCount ?> / <?= $customerCount ?></strong></div>
</div>
<?php endif; ?>

<?php if ($reportType === 'inventory'): ?>
<h2>Inventory Report</h2>
<div class="stat-grid">
    <div class="stat-card">Products<strong><?= (int)$inventory['product_count'] ?></strong></div>
    <div class="stat-card">Inventory units<strong><?= (int)$inventory['total_units'] ?></strong></div>
    <div class="stat-card">Inventory retail value<strong><?= money($inventory['retail_value']) ?></strong></div>
    <div class="stat-card">Low-stock products<strong><?= (int)$inventory['low_stock'] ?></strong></div>
</div>
<?php
$inventoryRows = $pdo->query(
    'SELECT id, name, stock, price
     FROM products
     ORDER BY name ASC'
)->fetchAll();
?>
<div class="table-wrap"><table class="data-table">
<thead><tr><th>Product</th><th>Stock</th><th>Unit price</th><th>Retail stock value</th></tr></thead><tbody>
<?php foreach ($inventoryRows as $item): ?>
<tr><td><?= e($item['name']) ?></td><td><?= (int)$item['stock'] ?></td><td><?= money($item['price']) ?></td><td><?= money((int)$item['stock'] * (float)$item['price']) ?></td></tr>
<?php endforeach; ?>
<?php if (!$inventoryRows): ?><tr><td colspan="4">No inventory records found.</td></tr><?php endif; ?>
</tbody></table></div>
<?php endif; ?>

<?php if ($reportType === 'suppliers'): ?>
<h2>Supplier report</h2>
<div class="table-wrap"><table class="data-table">
<thead><tr><th>Supplier</th><th>Purchase orders in period</th><th>Purchase cost</th></tr></thead><tbody>
<?php
$stmt = $pdo->prepare(
    'SELECT s.supplier_name, COUNT(po.id) AS order_count, COALESCE(SUM(po.total_cost), 0) AS spend
     FROM suppliers s
     LEFT JOIN purchase_orders po
       ON po.supplier_id = s.id
      AND po.order_date BETWEEN ? AND ?
     GROUP BY s.id, s.supplier_name
     ORDER BY spend DESC'
);
$stmt->execute([$from, $to]);
foreach ($stmt as $row):
?>
<tr><td><?= e($row['supplier_name']) ?></td><td><?= (int)$row['order_count'] ?></td><td><?= money($row['spend']) ?></td></tr>
<?php endforeach; ?>
</tbody></table></div>


<?php endif; ?>

<?php if ($reportType === 'customers'): ?>
<h2>Customer sales report</h2>
<div class="table-wrap"><table class="data-table">
<thead><tr><th>Customer</th><th>Email</th><th>Orders</th><th>Completed sales</th></tr></thead><tbody>
<?php
$stmt = $pdo->prepare(
    "SELECT u.username, u.email, COUNT(o.id) AS order_count,
            COALESCE(SUM(CASE WHEN o.status = 'Completed' THEN o.total ELSE 0 END), 0) AS sales_total
     FROM users u
     LEFT JOIN orders o
       ON o.user_id = u.id
      AND DATE(o.created_at) BETWEEN ? AND ?
     WHERE u.role = 'customer'
     GROUP BY u.id, u.username, u.email
     ORDER BY sales_total DESC"
);
$stmt->execute([$from, $to]);
foreach ($stmt as $row):
?>
<tr><td><?= e($row['username']) ?></td><td><?= e($row['email']) ?></td><td><?= (int)$row['order_count'] ?></td><td><?= money($row['sales_total']) ?></td></tr>
<?php endforeach; ?>
</tbody></table></div>


<?php endif; ?>

<?php if ($reportType === 'expenses'): ?>
<h2><?= $editExpense ? 'Edit expense' : 'Add expense' ?></h2>
<section class="form-wrap expense-form" style="margin:20px 0;max-width:760px">
<form method="post">
    <input type="hidden" name="action" value="<?= $editExpense ? 'update' : 'save' ?>">
    <input type="hidden" name="id" value="<?= (int)($editExpense['id'] ?? 0) ?>">
    <input type="hidden" name="period" value="<?= e($period) ?>">
    <input type="hidden" name="type" value="expenses">
    <div class="field"><label>Date</label><input type="date" name="expense_date" required value="<?= e($editExpense['expense_date'] ?? date('Y-m-d')) ?>"></div>
    <div class="field"><label>Category</label><select name="category" required>
        <?php foreach (['Rent','Utilities','Shipping','Payroll','Marketing','Supplies','Supplier Purchase','Other'] as $category): ?>
            <option value="<?= e($category) ?>" <?= ($editExpense['category'] ?? 'Other') === $category ? 'selected' : '' ?>><?= e($category) ?></option>
        <?php endforeach; ?>
    </select></div>
    <div class="field"><label>Description</label><input name="description" required value="<?= e($editExpense['description'] ?? '') ?>"></div>
    <div class="field"><label>Amount (PHP)</label><input type="number" min=".01" step=".01" name="amount" required value="<?= e((string)($editExpense['amount'] ?? '')) ?>"></div>
    <button class="btn btn-blue"><?= $editExpense ? 'UPDATE EXPENSE' : 'ADD EXPENSE' ?></button>
    <?php if ($editExpense): ?> <a class="btn" href="reports.php?type=expenses&amp;period=<?= e($period) ?>">Cancel</a><?php endif; ?>
</form></section>

<h2>Expense records for this period</h2>
<div class="table-wrap"><table class="data-table">
<thead><tr><th>Date</th><th>Category</th><th>Description</th><th>Amount</th><th>Actions</th></tr></thead><tbody>
<?php foreach ($expenseRows as $expense): ?>
<tr>
    <td><?= e($expense['expense_date']) ?></td><td><?= e($expense['category']) ?></td>
    <td><?= e($expense['description']) ?></td><td><?= money($expense['amount']) ?></td>
    <td><a href="reports.php?type=expenses&amp;period=<?= e($period) ?>&amp;edit=<?= (int)$expense['id'] ?>">Edit</a>
        <form method="post" class="inline-form" onsubmit="return confirm('Delete this expense?')" style="display:inline">
            <input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$expense['id'] ?>">
            <input type="hidden" name="period" value="<?= e($period) ?>">
    <input type="hidden" name="type" value="expenses"><button class="btn" type="submit">Delete</button>
        </form>
    </td>
</tr>
<?php endforeach; ?>
<?php if (!$expenseRows): ?><tr><td colspan="5">No expenses recorded for this period.</td></tr><?php endif; ?>
</tbody></table></div>
<?php endif; ?>
</div>
<style>
.report-toolbar form { display:flex; flex-wrap:wrap; align-items:center; gap:10px; }
.report-toolbar select { min-width:150px; padding:9px; }
.print-heading { margin:18px 0; }
@media print {
    @page { size: A4; margin: 12mm; }
    body { background:#fff !important; color:#000 !important; font: 10pt Arial, sans-serif; }
    header, footer, .admin-nav, .report-controls, .expense-form, .data-table form,
    .data-table th:last-child, .data-table td:last-child, .form-success, .form-error { display:none !important; }
    .admin-shell { width:100% !important; max-width:none !important; margin:0 !important; padding:0 !important; }
    h1 { font-size:18pt; margin:0 0 10px; }
    h2 { font-size:14pt; margin:18px 0 8px; }
    .print-heading { display:block !important; margin:0 0 12px; }
    .stat-grid { display:grid; grid-template-columns:repeat(2, 1fr); gap:8px; }
    .stat-card { border:1px solid #999 !important; box-shadow:none !important; padding:8px !important; break-inside:avoid; }
    .table-wrap { overflow:visible !important; }
    table.data-table { width:100% !important; border-collapse:collapse !important; font-size:9pt; }
    table.data-table th, table.data-table td { border:1px solid #777 !important; padding:6px !important; color:#000 !important; }
    table.data-table thead { display:table-header-group; }
    table.data-table tr { break-inside:avoid; }
} 
</style>
<?php include __DIR__ . '/../includes/footer.php'; ?>
