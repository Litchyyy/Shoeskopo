<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
if (current_user()) { header('Location: index.php'); exit; }
$pageTitle='Register'; $error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $username=trim($_POST['username'] ?? ''); $email=strtolower(trim($_POST['email'] ?? '')); $password=$_POST['password'] ?? ''; $confirm=$_POST['confirm_password'] ?? '';
  if ($username==='' || !filter_var($email,FILTER_VALIDATE_EMAIL)) $error='Enter a valid username and email.';
  elseif (strlen($password)<8) $error='Password must be at least 8 characters.';
  elseif ($password!==$confirm) $error='Passwords do not match.';
  else {
    try {
      $stmt=$pdo->prepare("INSERT INTO users(username,email,password_hash,role) VALUES(?,?,?,'customer')");
      $stmt->execute([$username,$email,password_hash($password,PASSWORD_DEFAULT)]);
      header('Location: login.php?registered=1'); exit;
    } catch (PDOException $e) { $error='That email may already be registered.'; }
  }
}
include __DIR__ . '/includes/header.php';
?>
<div class="auth-background"><section class="form-wrap"><h1>CREATE ACCOUNT</h1><p class="muted" style="text-align:center">Join shoeskopo</p>
<?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<form method="post">
<div class="field"><label for="username">Username</label><input id="username" name="username" maxlength="80" required></div>
<div class="field"><label for="email">Email</label><input id="email" name="email" type="email" required></div>
<div class="field"><label for="password">Password (8+ characters)</label><input id="password" name="password" type="password" minlength="8" required></div>
<div class="field"><label for="confirm_password">Confirm Password</label><input id="confirm_password" name="confirm_password" type="password" minlength="8" required></div>
<label><input type="checkbox" id="showPassword"> Show Passwords</label>
<button class="btn btn-blue" type="submit" style="margin-top:20px">REGISTER</button>
</form><p class="form-note">Already have an account? <a href="login.php"><strong>Sign in</strong></a></p></section></div>
<script>document.getElementById('showPassword').addEventListener('change',e=>{document.getElementById('password').type=e.target.checked?'text':'password';document.getElementById('confirm_password').type=e.target.checked?'text':'password';});</script>
<?php include __DIR__ . '/includes/footer.php'; ?>
