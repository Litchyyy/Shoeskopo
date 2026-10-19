<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);

$error = '';
$currentUserId = (int)(current_user()['id'] ?? 0);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? 'save';
    $id = (int)($_POST['id'] ?? 0);

    try {
        if ($action === 'delete') {
            if ($id < 1 || $id === $currentUserId) {
                throw new RuntimeException('You cannot delete your own signed-in account.');
            }
            $pdo->beginTransaction();

            $stmt = $pdo->prepare('SELECT id FROM orders WHERE user_id = ?');
            $stmt->execute([$id]);
            $orderIds = $stmt->fetchAll(PDO::FETCH_COLUMN);

            if ($orderIds) {
                $placeholders = implode(',', array_fill(0, count($orderIds), '?'));
                $stmt = $pdo->prepare("DELETE FROM order_items WHERE order_id IN ($placeholders)");
                $stmt->execute($orderIds);
                $stmt = $pdo->prepare("DELETE FROM payments WHERE order_id IN ($placeholders)");
                $stmt->execute($orderIds);
                $stmt = $pdo->prepare("DELETE FROM orders WHERE id IN ($placeholders)");
                $stmt->execute($orderIds);
            }

            $stmt = $pdo->prepare('DELETE FROM users WHERE id = ?');
            $stmt->execute([$id]);
            $pdo->commit();
            header('Location: users.php?message=deleted');
            exit;
        }

        if ($action === 'toggle_active') {
            if ($id < 1 || $id === $currentUserId) throw new RuntimeException('You cannot deactivate your own signed-in account.');
            $st=$pdo->prepare('UPDATE users SET is_active=IF(is_active=1,0,1) WHERE id=?'); $st->execute([$id]);
            header('Location: users.php?message=active'); exit;
        }

        if ($action === 'password') {
            $password = $_POST['new_password'] ?? '';
            if ($id < 1 || strlen($password) < 8) {
                throw new RuntimeException('Enter a new password with at least 8 characters.');
            }
            $stmt = $pdo->prepare('UPDATE users SET password_hash = ? WHERE id = ?');
            $stmt->execute([password_hash($password, PASSWORD_DEFAULT), $id]);
            header('Location: users.php?message=password');
            exit;
        }

        $fullName = trim($_POST['full_name'] ?? '');
        $username = trim($_POST['username'] ?? '');
        $email = strtolower(trim($_POST['email'] ?? ''));
        $phone = trim($_POST['phone'] ?? '');
        $address = trim($_POST['address'] ?? '');
        $role = $_POST['role'] ?? 'customer';
        $password = $_POST['password'] ?? '';

        if ($username === '' || !filter_var($email, FILTER_VALIDATE_EMAIL) || !in_array($role, ['admin', 'employee', 'customer'], true)) {
            throw new RuntimeException('Username, valid email, and a valid role are required.');
        }
        if ($action === 'create' && strlen($password) < 8) {
            throw new RuntimeException('New user passwords must be at least 8 characters.');
        }
        if ($id === $currentUserId && $role !== 'admin') {
            throw new RuntimeException('You cannot remove your own admin role while signed in.');
        }

        if ($action === 'create') {
            $stmt = $pdo->prepare(
                'INSERT INTO users (full_name, username, email, phone, address, role, password_hash)
                 VALUES (?, ?, ?, ?, ?, ?, ?)'
            );
            $stmt->execute([$fullName, $username, $email, $phone, $address, $role, password_hash($password, PASSWORD_DEFAULT)]);
            header('Location: users.php?message=created');
            exit;
        }

        if ($action === 'update' && $id > 0) {
            $stmt = $pdo->prepare(
                'UPDATE users
                 SET full_name = ?, username = ?, email = ?, phone = ?, address = ?, role = ?
                 WHERE id = ?'
            );
            $stmt->execute([$fullName, $username, $email, $phone, $address, $role, $id]);
            header('Location: users.php?message=updated');
            exit;
        }

        throw new RuntimeException('Invalid user action.');
    } catch (Throwable $e) {
        if ($pdo->inTransaction()) {
            $pdo->rollBack();
        }
        $error = $e instanceof RuntimeException
            ? $e->getMessage()
            : 'Could not save the user. Check that the username and email are not already in use.';
    }
}

$search = trim($_GET['q'] ?? '');
$stmt = $pdo->prepare(
    "SELECT id, username, email, role, created_at, full_name, phone, address, is_active
     FROM users
     WHERE username LIKE ?
        OR email LIKE ?
        OR COALESCE(full_name, '') LIKE ?
        OR COALESCE(phone, '') LIKE ?
     ORDER BY created_at DESC"
);
$like = '%' . $search . '%';
$stmt->execute([$like, $like, $like, $like]);
$users = $stmt->fetchAll();

$edit = null;
if (isset($_GET['edit'])) {
    $stmt = $pdo->prepare(
        'SELECT id, username, email, role, created_at, full_name, phone, address
         FROM users
         WHERE id = ?'
    );
    $stmt->execute([(int)$_GET['edit']]);
    $edit = $stmt->fetch() ?: null;
}

$history = [];
if (isset($_GET['history'])) {
    $stmt = $pdo->prepare(
        'SELECT id, total, status, created_at
         FROM orders
         WHERE user_id = ?
         ORDER BY created_at DESC'
    );
    $stmt->execute([(int)$_GET['history']]);
    $history = $stmt->fetchAll();
}

$pageTitle = 'User Management';
include __DIR__ . '/../includes/header.php';
?>
<div class="admin-shell">
<h1>USER MANAGEMENT</h1>
<?= admin_navigation('users.php') ?>
<?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<?php if (isset($_GET['message'])): ?><div class="form-success">User action completed successfully (<?= e($_GET['message']) ?>).</div><?php endif; ?>

<form method="get" class="inline-form" style="margin:20px 0">
    <input name="q" placeholder="Search name, username, email, phone" value="<?= e($search) ?>">
    <button class="btn btn-blue">SEARCH USERS</button><a class="btn" href="users.php">Clear</a>
</form>

<h2><?= $edit ? 'Edit user' : 'Add user' ?></h2>
<section class="form-wrap" style="margin:20px 0;max-width:760px">
<form method="post" novalidate>
    <input type="hidden" name="action" value="<?= $edit ? 'update' : 'create' ?>">
    <input type="hidden" name="id" value="<?= (int)($edit['id'] ?? 0) ?>">
    <div class="field"><label>Full name</label><input name="full_name" value="<?= e($edit['full_name'] ?? '') ?>"></div>
    <div class="field"><label>Username</label><input name="username" required maxlength="80" value="<?= e($edit['username'] ?? '') ?>"></div>
    <div class="field"><label>Email</label><input type="email" name="email" required maxlength="254" autocomplete="email" value="<?= e($edit['email'] ?? ($_POST['email'] ?? '')) ?>"></div>
    <div class="field"><label>Phone</label><input name="phone" value="<?= e($edit['phone'] ?? '') ?>"></div>
    <div class="field"><label>Address</label><textarea name="address"><?= e($edit['address'] ?? '') ?></textarea></div>
    <div class="field"><label>Role</label><select name="role"><?php foreach (['customer', 'employee', 'admin'] as $role): ?><option value="<?= e($role) ?>" <?= ($edit['role'] ?? 'customer') === $role ? 'selected' : '' ?>><?= ucfirst($role) ?></option><?php endforeach; ?></select></div>
    <?php if (!$edit): ?><div class="field"><label>Initial password (at least 8 characters)</label><input type="password" name="password" minlength="8" required autocomplete="new-password"></div><?php endif; ?>
    <button class="btn btn-blue"><?= $edit ? 'UPDATE USER' : 'ADD USER' ?></button>
    <?php if ($edit): ?> <a class="btn" href="users.php">Cancel</a><?php endif; ?>
</form>
</section>

<?php if (isset($_GET['history'])): ?>
<h2>User order history</h2><div class="table-wrap"><table class="data-table">
<thead><tr><th>Order</th><th>Date</th><th>Total</th><th>Status</th></tr></thead><tbody>
<?php foreach ($history as $h): ?><tr><td>#<?= (int)$h['id'] ?></td><td><?= e($h['created_at']) ?></td><td><?= money($h['total']) ?></td><td><?= e($h['status']) ?></td></tr><?php endforeach; ?>
</tbody></table></div>
<?php endif; ?>

<h2>User records</h2>
<div class="table-wrap"><table class="data-table">
<thead><tr><th>Name / Username</th><th>Email</th><th>Phone</th><th>Created</th><th>Role</th><th>Account</th><th>Actions</th></tr></thead><tbody>
<?php foreach ($users as $user): ?>
<tr>
    <td><?= e($user['full_name'] ?: $user['username']) ?><br><small><?= e($user['username']) ?></small></td>
    <td><?= e($user['email']) ?></td><td><?= e($user['phone'] ?? '') ?></td><td><?= e($user['created_at']) ?></td><td><?= e($user['role']) ?></td><td><?= (int)$user['is_active']===1 ? 'Active' : 'Inactive' ?></td>
    <td>
        <a href="users.php?edit=<?= (int)$user['id'] ?>" class="icon-button" aria-label="Edit" title="Edit">✎</a> |
        <a href="users.php?history=<?= (int)$user['id'] ?>">History</a>
        <details style="margin-top:8px"><summary>Change password</summary>
            <form method="post" style="margin-top:8px">
                <input type="hidden" name="action" value="password"><input type="hidden" name="id" value="<?= (int)$user['id'] ?>">
                <input type="password" name="new_password" minlength="8" placeholder="New password (8+)" required autocomplete="new-password">
                <button class="btn" type="submit">Save password</button>
            </form>
        </details>
        <?php if ((int)$user['id'] !== $currentUserId): ?>
        <form method="post" style="margin-top:8px"><input type="hidden" name="action" value="toggle_active"><input type="hidden" name="id" value="<?= (int)$user['id'] ?>"><button class="btn" type="submit"><?= (int)$user['is_active']===1 ? 'Deactivate user' : 'Activate user' ?></button></form>
        <form method="post" onsubmit="return confirm('Delete this user and their order history?')" style="margin-top:8px">
            <input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$user['id'] ?>">
            <button class="btn" type="submit">Delete</button>
        </form>
        <?php endif; ?>
    </td>
</tr>
<?php endforeach; ?>
<?php if (!$users): ?><tr><td colspan="7">No users found.</td></tr><?php endif; ?>
</tbody></table></div>
</div>
<?php include __DIR__ . '/../includes/footer.php'; ?>
