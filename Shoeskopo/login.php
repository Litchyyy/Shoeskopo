<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
if (current_user()) { header('Location: index.php'); exit; }
$pageTitle='Sign In'; $error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $email=strtolower(trim($_POST['email'] ?? '')); $password=$_POST['password'] ?? '';
  $stmt=$pdo->prepare('SELECT id,username,email,password_hash,role FROM users WHERE email=? LIMIT 1'); $stmt->execute([$email]); $user=$stmt->fetch();
  if ($user && password_verify($password,$user['password_hash'])) {
    session_regenerate_id(true);
    $_SESSION['user']=['id'=>(int)$user['id'],'username'=>$user['username'],'email'=>$user['email'],'role'=>$user['role']];
    if ($user['role']==='admin') header('Location: admin/index.php');
    elseif ($user['role']==='employee') header('Location: employee/index.php');
    else header('Location: index.php');
    exit;
  } else $error='Incorrect email or password.';
}
include __DIR__ . '/includes/header.php';
?>
<div class="auth-background"><section class="form-wrap"><h1>SHOESKOPO</h1><p class="muted" style="text-align:center">Sign in to your account</p>
<?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<form method="post">
<div class="field"><label for="email">Email</label><input id="email" name="email" type="email" autocomplete="username" required></div>
<div class="field"><label for="password">Password</label><input id="password" name="password" type="password" autocomplete="current-password" required></div>
<label><input type="checkbox" id="showPassword"> Show Password</label>
<button class="btn btn-blue" type="submit" style="margin-top:20px">LOG IN</button>
</form><p class="form-note">Don't have an account? <a href="register.php"><strong>Register here</strong></a></p></section></div>
<script>document.getElementById('showPassword').addEventListener('change',e=>document.getElementById('password').type=e.target.checked?'text':'password');</script>
<?php include __DIR__ . '/includes/footer.php'; ?>
