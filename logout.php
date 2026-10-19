<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
// Persist the signed-in customer's current cart before removing authentication.
if (current_user() && (current_user()['role'] ?? '') === 'customer') {
    shoeskopo_save_cart($pdo, $_SESSION['cart'] ?? shoeskopo_load_cart($pdo));
}
// Clear the in-memory cart after saving it to the signed-in customer's own database rows.
// This prevents the previous account's cart from appearing for a guest or the next account.
unset($_SESSION['cart']);
unset($_SESSION['user'], $_SESSION['order_confirmation_notice'], $_SESSION['flash_error']);
session_regenerate_id(true);
header('Location: index.php');
exit;
