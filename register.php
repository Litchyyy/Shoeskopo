<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
if (current_user()) { header('Location: index.php'); exit; }
$pageTitle='Register'; $error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $username=trim($_POST['username'] ?? ''); $email=strtolower(trim($_POST['email'] ?? '')); $password=$_POST['password'] ?? ''; $confirm=$_POST['confirm_password'] ?? ''; $avatar=null;
  // Reject malformed email addresses before processing uploads or writing anything to the database.
  if ($username === '' || $email === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $error = 'Enter a valid email address (for example, name@example.com). Your account was not created.';
  }
  if ($error === '' && !empty($_FILES['registration_photo']['name'])) { $tmp=$_FILES['registration_photo']['tmp_name'] ?? ''; $mime=is_uploaded_file($tmp)?(new finfo(FILEINFO_MIME_TYPE))->file($tmp):''; $exts=['image/jpeg'=>'jpg','image/png'=>'png','image/webp'=>'webp']; if (($_FILES['registration_photo']['error']??UPLOAD_ERR_NO_FILE)!==UPLOAD_ERR_OK || !isset($exts[$mime]) || ($_FILES['registration_photo']['size']??0)>3*1024*1024) $error='Registration photo must be JPG, PNG, or WEBP and no larger than 3 MB.'; else { $dir=__DIR__.'/assets/images/profiles'; if(!is_dir($dir)) mkdir($dir,0755,true); $fn='register_'.bin2hex(random_bytes(10)).'.'.$exts[$mime]; if(move_uploaded_file($tmp,$dir.'/'.$fn)) $avatar='assets/images/profiles/'.$fn; else $error='Could not save registration photo.'; } }
  if ($error === '') {
    if (strlen($password) < 8) $error = 'Password must be at least 8 characters.';
    elseif ($password !== $confirm) $error = 'Passwords do not match.';
    else {
    try {
      $stmt=$pdo->prepare("INSERT INTO users(username,email,password_hash,role,avatar_path) 
VALUES(?,?,?,'customer',?)");
      $stmt->execute([$username,$email,password_hash($password,PASSWORD_DEFAULT),$avatar]);
      header('Location: login.php?registered=1'); exit;
    } catch (PDOException $e) { $error='That email may already be registered.'; }
  } }
}
include __DIR__ . '/includes/header.php';
?>
<div class="auth-background"><section class="form-wrap"><h1>CREATE ACCOUNT</h1><p class="muted" style="text-align:center">Join shoeskopo</p>
<?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<form method="post" enctype="multipart/form-data">
<div class="field"><label for="registration_photo">Profile photo (optional, JPG/PNG/WEBP, max 3 MB)</label><input id="registration_photo" name="registration_photo" type="file" accept="image/jpeg,image/png,image/webp"></div><div class="field"><label for="username">Username</label><input id="username" name="username" maxlength="80" required></div>
<div class="field"><label for="email">Email</label><input id="email" name="email" type="email" required autocomplete="email" maxlength="254" value="<?= e($_POST['email'] ?? '') ?>"></div>
<div class="field"><label for="password">Password (8+ characters)</label><input id="password" name="password" type="password" minlength="8" required></div>
<div class="field"><label for="confirm_password">Confirm Password</label><input id="confirm_password" name="confirm_password" type="password" required></div>
<label><input type="checkbox" id="showPassword"> Show Passwords</label>
<button class="btn btn-blue" type="submit" style="margin-top:20px">REGISTER</button>
</form><p class="form-note">Already have an account? <a href="login.php"><strong>Sign in</strong></a></p></section></div>
<script>document.getElementById('showPassword').addEventListener('change',e=>{document.getElementById('password').type=e.target.checked?'text':'password';document.getElementById('confirm_password').type=e.target.checked?'text':'password';});</script>
<?php include __DIR__ . '/includes/footer.php'; ?>
