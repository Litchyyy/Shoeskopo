<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);
$pageTitle = 'Admin Dashboard';
$productCount = (int) $pdo->query('SELECT COUNT(*) FROM products')->fetchColumn();
$userCount = (int) $pdo->query('SELECT COUNT(*) FROM users')->fetchColumn();
$supplierCount = (int) $pdo->query('SELECT COUNT(*) FROM suppliers')->fetchColumn();
$lowStock = (int) $pdo->query('SELECT COUNT(*) FROM products WHERE stock <= 5')->fetchColumn();
$completedSales = (float) $pdo->query("SELECT COALESCE(SUM(total), 0) FROM orders WHERE status = 'Completed'")->fetchColumn();
$orderCount = (int) $pdo->query('SELECT COUNT(*) FROM orders')->fetchColumn();
$dailyStmt = $pdo->query("SELECT DATE(created_at) AS sale_day, COALESCE(SUM(total), 0) AS amount FROM orders WHERE status = 'Completed' AND created_at >= DATE_SUB(CURDATE(), INTERVAL 6 DAY) GROUP BY DATE(created_at) ORDER BY sale_day");
$dailyRows = $dailyStmt->fetchAll(PDO::FETCH_ASSOC);
$dailyLabels = []; $dailyValues = []; $salesByDate = [];
foreach ($dailyRows as $row) { $salesByDate[$row['sale_day']] = (float) $row['amount']; }
for ($i = 6; $i >= 0; $i--) { $day = date('Y-m-d', strtotime("-$i days")); $dailyLabels[] = date('M j', strtotime($day)); $dailyValues[] = $salesByDate[$day] ?? 0; }
$recentOrders = $pdo->query("SELECT o.id, o.created_at, o.total, o.status, u.full_name FROM orders o JOIN users u ON u.id = o.user_id ORDER BY o.created_at DESC LIMIT 6")->fetchAll(PDO::FETCH_ASSOC);
include __DIR__ . '/../includes/header.php';
?>
<style>
.admin-dashboard{background:#f3f4f8;min-height:80vh;padding:28px 3.5%;}.dashboard-heading{display:flex;justify-content:space-between;align-items:center;gap:16px;flex-wrap:wrap;margin-bottom:24px}.dashboard-heading h1{margin:0;font-size:28px}.dashboard-heading p{color:#747b8a;margin:7px 0 0}.dashboard-kpis{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:18px;margin-bottom:20px}.dashboard-card,.dashboard-panel{background:#fff;border-radius:12px;padding:22px;box-shadow:0 4px 18px #26334d0a}.dashboard-card span{color:#737b8b;font-size:14px}.dashboard-card strong{display:block;font-size:29px;margin:12px 0 6px;color:#202b40}.dashboard-card small{color:#28a98f}.dashboard-columns{display:grid;grid-template-columns:minmax(0,1.7fr) minmax(280px,1fr);gap:20px}.dashboard-panel h2{font-size:18px;margin:0 0 18px}.dashboard-chart{height:290px}.dashboard-links{display:flex;gap:10px;flex-wrap:wrap;margin-top:18px}.dashboard-links a{padding:10px 13px;border-radius:7px;background:#f1f3f9;color:#334c91;font-weight:700;font-size:13px}.dashboard-table{width:100%;border-collapse:collapse}.dashboard-table th,.dashboard-table td{text-align:left;padding:12px 8px;border-bottom:1px solid #edf0f5;font-size:13px}.dashboard-table th{color:#778092}.dashboard-badge{display:inline-block;border-radius:20px;padding:5px 9px;background:#e8f7f2;color:#16876f;font-size:11px;font-weight:700}.dashboard-badge.pending{background:#fff3d9;color:#9b6b00}.dashboard-badge.other{background:#edf0f6;color:#5e6678}.btn-danger{background:#d9384f!important}.status-locked{font-size:12px;color:#16876f;font-weight:700;white-space:nowrap}
@media(max-width:900px){.dashboard-kpis{grid-template-columns:repeat(2,minmax(0,1fr))}.dashboard-columns{grid-template-columns:1fr}}@media(max-width:520px){.dashboard-kpis{grid-template-columns:1fr}.admin-dashboard{padding:20px 14px}.dashboard-card,.dashboard-panel{padding:16px}}
</style>
<div class="admin-dashboard"><div class="dashboard-heading"><div><h1>Dashboard</h1><p>Welcome back, <?= e(current_user()['username']) ?>. Here is your store overview.</p></div></div>
<?= admin_navigation('index.php') ?>
<div class="dashboard-kpis">
<div class="dashboard-card"><span>Completed Sales</span><strong><?= money($completedSales) ?></strong><small>Confirmed completed orders</small></div>
<div class="dashboard-card"><span>Total Orders</span><strong><?= number_format($orderCount) ?></strong><small>All order statuses</small></div>
<div class="dashboard-card"><span>Products</span><strong><?= number_format($productCount) ?></strong><small>Products in catalog</small></div>
<div class="dashboard-card"><span>Low Stock</span><strong><?= number_format($lowStock) ?></strong><small>Products with stock at or below 5</small></div>
</div>
<div class="dashboard-columns"><section class="dashboard-panel"><h2>Completed Sales — Last 7 Days</h2><div class="dashboard-chart"><canvas id="salesChart" aria-label="Completed sales over the last seven days" role="img"></canvas></div></section>
<section class="dashboard-panel"><h2>Store Overview</h2><div class="dashboard-card" style="background:#f7f8fc;margin-bottom:12px"><span>Registered Users</span><strong><?= number_format($userCount) ?></strong></div><div class="dashboard-card" style="background:#f7f8fc"><span>Suppliers</span><strong><?= number_format($supplierCount) ?></strong></div><div class="dashboard-links"><a href="products.php">Manage Products</a><a href="users.php">Manage Users</a><a href="inventory.php">Inventory</a><a href="reports.php">Reports & Expenses</a></div></section></div>
<section class="dashboard-panel" style="margin-top:20px"><h2>Recent Orders</h2><div class="table-wrap"><table class="dashboard-table"><thead><tr><th>Order</th><th>Customer</th><th>Date</th><th>Total</th><th>Status</th></tr></thead><tbody>
<?php if (!$recentOrders): ?><tr><td colspan="5">No orders have been placed yet.</td></tr><?php else: foreach ($recentOrders as $order): $badge = $order['status'] === 'Completed' ? '' : ($order['status'] === 'Pending' ? 'pending' : 'other'); ?><tr><td>#<?= (int) $order['id'] ?></td><td><?= e($order['full_name'] ?? 'Customer') ?></td><td><?= e(date('M j, Y', strtotime($order['created_at']))) ?></td><td><?= money($order['total']) ?></td><td><span class="dashboard-badge <?= $badge ?>"><?= e($order['status']) ?></span></td></tr><?php endforeach; endif; ?>
</tbody></table></div></section></div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script><script>new Chart(document.getElementById('salesChart'),{type:'line',data:{labels:<?= json_encode($dailyLabels) ?>,datasets:[{label:'Completed sales',data:<?= json_encode($dailyValues) ?>,borderColor:'#35c9b2',backgroundColor:'rgba(53,201,178,.14)',fill:true,tension:.35,pointRadius:4,pointBackgroundColor:'#35c9b2'}]},options:{responsive:true,maintainAspectRatio:false,plugins:{legend:{display:false}},scales:{y:{beginAtZero:true,ticks:{callback:function(v){return '₱'+v}}}}}});</script>
<?php include __DIR__ . '/../includes/footer.php'; ?>
