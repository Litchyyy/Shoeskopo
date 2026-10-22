<?php
require_once __DIR__ . '/functions.php';
$pageTitle = $pageTitle ?? 'shoeskopo';
$user = current_user();
$role = $user['role'] ?? null;
$isAdminArea = strpos($_SERVER['SCRIPT_NAME'] ?? '', '/admin/') !== false || ($user && in_array($role, ['admin', 'employee'], true));
$dashboardUrl = $role === 'employee' ? '/shoeskopo/employee/index.php' : '/shoeskopo/admin/index.php';
?>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?= e($pageTitle) ?> | shoeskopo</title>
<link rel="stylesheet" href="/shoeskopo/assets/css/style.css">
</head>
<body>
<header class="site-header">
  <a class="logo" href="<?= e($isAdminArea ? $dashboardUrl : '/shoeskopo/index.php') ?>">shoeskopo</a>
  <?php if (!$isAdminArea): ?>
  <nav class="main-nav" aria-label="Main navigation">
    <a href="/shoeskopo/category.php?audience=men">Mens</a>
    <a href="/shoeskopo/category.php?audience=women">Womens</a>
    <a href="/shoeskopo/category.php?audience=kids">Kids</a>
  </nav>
  <?php endif; ?>
  <div class="header-actions">
    <?php if (!$isAdminArea && (!$user || $user['role']==='customer')): ?>
      <a class="cart-icon-link" href="/shoeskopo/cart.php" aria-label="Shopping cart (<?= array_sum(array_column($_SESSION['cart'] ?? [], 'quantity')) ?> items)" title="Shopping cart">
        <svg class="header-cart-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
        </svg>
        <span class="cart-count"><?= array_sum(array_column($_SESSION['cart'] ?? [], 'quantity')) ?></span>
      </a>
    <?php endif; ?>
    <?php if ($user): ?>
      <?php if (in_array($user['role'], ['admin','employee'], true)): ?><a href="<?= e($dashboardUrl) ?>">DASHBOARD</a><?php endif; ?>
      <?php if (!$isAdminArea && $user['role']==='customer'): ?><a href="/shoeskopo/orders.php">ORDERS</a><a href="/shoeskopo/profile.php">MY PROFILE</a><?php endif; ?>
      <?php if ($isAdminArea): ?><a href="/shoeskopo/profile.php">MY ACCOUNT</a><?php endif; ?>
      <a href="/shoeskopo/logout.php" onclick="return confirm('Are you sure you want to sign out?')">SIGN OUT</a>
    <?php else: ?>
      <a href="/shoeskopo/login.php">SIGN IN</a>
    <?php endif; ?>
  </div>
</header>
<main class="page">
