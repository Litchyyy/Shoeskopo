<?php
require_once __DIR__ . '/../config/db.php'; require_once __DIR__ . '/../includes/functions.php'; require_role(['admin']); $error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
  if(($_POST['action']??'')==='delete'){ $st=$pdo->prepare('DELETE 
FROM categories 
WHERE id=?');$st->execute([(int)$_POST['id']]);$_SESSION['swal_flash'] = 'Changes saved successfully.'; $_SESSION['swal_flash'] = 'Changes saved successfully.';
            header('Location: categories.php');
            exit; }
  $id=(int)($_POST['id']??0);$name=trim($_POST['name']??'');$audience=$_POST['audience']??'all';$slug=strtolower(trim(preg_replace('/[^a-z0-9]+/i','-',$name),'-'));
  if($name==='')$error='Category name is required.';
  else try {if($id){$st=$pdo->prepare('UPDATE categories 
SET name=?,audience=?,slug=? 
WHERE id=?');$st->execute([$name,$audience,$slug,$id]);}else{$st=$pdo->prepare('INSERT INTO categories(name,audience,slug) 
VALUES(?,?,?)');$st->execute([$name,$audience,$slug]);}$_SESSION['swal_flash'] = 'Changes saved successfully.'; $_SESSION['swal_flash'] = 'Changes saved successfully.';
            header('Location: categories.php');
            exit;}catch(PDOException $e){$error='Category name/slug already exists.';}
}
$edit=null;if(isset($_GET['edit'])){$st=$pdo->prepare('SELECT * 
FROM categories 
WHERE id=?');$st->execute([(int)$_GET['edit']]);$edit=$st->fetch();}
$categories=$pdo->query('SELECT c.*,COUNT(p.id) AS product_count 
FROM categories c 
    LEFT 
    JOIN products p ON p.category_id=c.id 
GROUP BY c.id 
ORDER BY c.name')->fetchAll();$pageTitle='Manage Categories';include __DIR__.'/../includes/header.php';
?>
<div class="admin-shell"><h1>CATEGORY CRUD</h1><?= admin_navigation('categories.php') ?><?php if($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<section class="form-wrap" style="margin:20px 0;max-width:600px"><h2><?= $edit?'Edit category':'Add category' ?></h2><form method="post"><input type="hidden" name="id" value="<?= (int)($edit['id']??0) ?>"><div class="field"><label>Category name</label><input name="name" required value="<?= e($edit['name']??'') ?>"></div><div class="field"><label>Audience</label><select name="audience"><?php foreach(['all','men','women','kids'] as $a): ?><option value="<?= $a ?>" <?= ($edit['audience']??'all')===$a?'selected':'' ?>><?= ucfirst($a) ?></option><?php endforeach; ?></select></div><button class="btn btn-blue">SAVE CATEGORY</button></form></section>
<div class="table-wrap"><table class="data-table"><thead><tr><th>Name</th><th>Audience</th><th>Products</th><th>Actions</th></tr></thead><tbody><?php foreach($categories as $c): ?><tr><td><?= e($c['name']) ?></td><td><?= e($c['audience']) ?></td><td><?= (int)$c['product_count'] ?></td><td><a href="categories.php?edit=<?= (int)$c['id'] ?>" class="icon-button" aria-label="Edit" title="Edit">✎</a> <form method="post" style="display:inline" data-confirm='Delete this category? Products will remain uncategorized.'><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$c['id'] ?>"><button class="btn" style="padding:6px 9px">🗑</button></form></td></tr><?php endforeach; ?></tbody></table></div></div>
<?php include __DIR__.'/../includes/footer.php'; ?>
