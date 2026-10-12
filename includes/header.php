<?php
require_once __DIR__ . '/functions.php';
$pageTitle = $pageTitle ?? 'shoeskopo';
$user = current_user();
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
  <a class="logo" href="/shoeskopo/index.php">shoeskopo</a>
  <nav class="main-nav" aria-label="Main navigation">
    <a href="/shoeskopo/category.php?audience=men">Mens</a>
    <a href="/shoeskopo/category.php?audience=women">Womens</a>
    <a href="/shoeskopo/category.php?audience=kids">Kids</a>
  </nav>
  <div class="header-actions">
    <a href="/shoeskopo/cart.php">CART (<?= array_sum(array_column($_SESSION['cart'] ?? [], 'quantity')) ?>)</a>
    <?php if ($user): ?>
      <?php if (in_array($user['role'], ['admin','employee'], true)): ?><a href="/shoeskopo/admin/index.php">DASHBOARD</a><?php endif; ?>
      <a href="/shoeskopo/orders.php">ORDERS</a>
      <a href="/shoeskopo/logout.php">SIGN OUT</a>
    <?php else: ?>
      <a href="/shoeskopo/login.php">SIGN IN</a>
    <?php endif; ?>
  </div>
</header>
<main class="page">
