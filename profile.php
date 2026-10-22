<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
require_login();
$user=current_user(); $error=''; $success='';
$st=$pdo->prepare('SELECT id,username,email,full_name,phone,address,password_hash,role,avatar_path 
FROM users 
WHERE id=?');
$st->execute([$user['id']]); $record=$st->fetch();
if(!$record){session_destroy();header('Location: login.php');exit;}
if($_SERVER['REQUEST_METHOD']==='POST'){
  $action=$_POST['action']??'profile';
  if($action==='password'){
    $current=$_POST['current_password']??''; $new=$_POST['new_password']??''; $confirm=$_POST['confirm_password']??'';
    if(!password_verify($current,$record['password_hash'])) $error='Current password is incorrect.';
    elseif(strlen($new)<8) $error='New password must be at least 8 characters.';
    elseif($new!==$confirm) $error='New passwords do not match.';
    else {$st=$pdo->prepare('UPDATE users 
SET password_hash=? 
WHERE id=?');$st->execute([password_hash($new,PASSWORD_DEFAULT),$user['id']]);$success='Password updated successfully.';$st=$pdo->prepare('SELECT id,username,email,full_name,phone,address,password_hash,role,avatar_path 
FROM users 
WHERE id=?');$st->execute([$user['id']]);$record=$st->fetch();}
  } else {
    $username=trim($_POST['username']??'');$email=strtolower(trim($_POST['email']??''));$full=trim($_POST['full_name']??'');$phone=trim($_POST['phone']??'');$address=trim($_POST['address']??'');
    $avatar=$record['avatar_path']??null;
    if(!empty($_FILES['profile_picture']['name'])){
      if(($_FILES['profile_picture']['error']??UPLOAD_ERR_NO_FILE)!==UPLOAD_ERR_OK) $error='Profile picture upload failed.';
      else {
        $tmp=$_FILES['profile_picture']['tmp_name']; $mime=(new finfo(FILEINFO_MIME_TYPE))->file($tmp);
        $exts=['image/jpeg'=>'jpg','image/png'=>'png','image/webp'=>'webp'];
        if(!isset($exts[$mime])) $error='Profile picture must be JPG, PNG, or WEBP.';
        elseif(($_FILES['profile_picture']['size']??0)>3*1024*1024) $error='Profile picture must be 3 MB or smaller.';
        else {
          $dir=__DIR__.'/assets/images/profiles'; if(!is_dir($dir)) mkdir($dir,0755,true);
          $filename='user_'.(int)$user['id'].'_'.bin2hex(random_bytes(6)).'.'.$exts[$mime];
          if(move_uploaded_file($tmp,$dir.'/'.$filename)) $avatar='assets/images/profiles/'.$filename;
          else $error='Could not save profile picture.';
        }
      }
    }
    if($username===''||!filter_var($email,FILTER_VALIDATE_EMAIL)) $error='Enter a username and valid email.';
    if($error==='') {try{$st=$pdo->prepare('UPDATE users 
SET username=?,email=?,full_name=?,phone=?,address=?,avatar_path=? 
WHERE id=?');$st->execute([$username,$email,$full,$phone,$address,$avatar,$user['id']]);$_SESSION['user']['username']=$username;$_SESSION['user']['email']=$email;$success='Profile updated successfully.';$st=$pdo->prepare('SELECT id,username,email,full_name,phone,address,password_hash,role,avatar_path 
FROM users 
WHERE id=?');$st->execute([$user['id']]);$record=$st->fetch();}catch(PDOException $e){$error='That email may already be in use.';}}
  }
}
$pageTitle='My Profile';include __DIR__.'/includes/header.php';
?>
<section class="section"><h1>MY PROFILE</h1><?php if($error):?><div class="form-error"><?=e($error)?></div><?php endif;?><?php if($success):?><div class="form-success"><?=e($success)?></div><?php endif;?>
<div class="profile-grid"><section class="form-wrap"><h2>Edit information</h2>
<div style="display:flex;align-items:center;gap:18px;margin-bottom:20px"><img src="<?= e(!empty($record['avatar_path']) ? $record['avatar_path'] : 'https://placehold.co/160x160?text=Profile') ?>" alt="Profile picture" style="width:110px;height:110px;border-radius:50%;object-fit:cover;border:2px solid #ddd"><div><strong><?=e($record['full_name']?:$record['username'])?></strong><p class="muted">Profile picture</p></div></div>
<form method="post" enctype="multipart/form-data"><input type="hidden" name="action" value="profile"><div class="field"><label>Profile picture (JPG, PNG, WEBP; max 3 MB)</label><input type="file" name="profile_picture" accept="image/jpeg,image/png,image/webp"></div><div class="field"><label>Username</label><input name="username" required value="<?=e($record['username'])?>"></div><div class="field"><label>Email</label><input type="email" name="email" required value="<?=e($record['email'])?>"></div><div class="field"><label>Full name</label><input name="full_name" value="<?=e($record['full_name']??'')?>"></div><div class="field"><label>Phone</label><input name="phone" value="<?=e($record['phone']??'')?>"></div><div class="field"><label>Address</label><textarea name="address"><?=e($record['address']??'')?></textarea></div><button class="btn btn-blue">SAVE PROFILE</button></form></section>
<section class="form-wrap"><h2>Change password</h2><form method="post"><input type="hidden" name="action" value="password"><div class="field"><label>Current password</label><input type="password" name="current_password" required></div><div class="field"><label>New password</label><input type="password" name="new_password" minlength="8" required></div><div class="field"><label>Confirm new password</label><input type="password" name="confirm_password" minlength="8" required></div><button class="btn btn-blue">UPDATE PASSWORD</button></form></section></div></section>
<?php include __DIR__.'/includes/footer.php'; ?>
