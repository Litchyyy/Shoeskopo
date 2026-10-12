<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);
$error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $action=$_POST['action'] ?? '';
  if ($action==='delete') { $stmt=$pdo->prepare('DELETE FROM products WHERE id=?'); $stmt->execute([(int)$_POST['id']]); header('Location: products.php'); exit; }
  if ($action==='save') {
    $id=(int)($_POST['id'] ?? 0); $name=trim($_POST['name'] ?? ''); $category=(int)($_POST['category_id'] ?? 0) ?: null;
    $price=(float)($_POST['price'] ?? 0); $stock=max(0,(int)($_POST['stock'] ?? 0)); $image=trim($_POST['image_url'] ?? '');
    $audience=$_POST['audience'] ?? 'all'; if(!in_array($audience,['men','women','kids','all'],true)) $audience='all';
    $sizes=trim($_POST['sizes'] ?? ''); $description=trim($_POST['description'] ?? ''); $featured=isset($_POST['is_featured'])?1:0;
    if($name==='' || $price<0) $error='Product name and a valid price are required.';
    else {
      if($id){$stmt=$pdo->prepare('UPDATE products SET category_id=?,name=?,description=?,price=?,image_url=?,audience=?,sizes=?,stock=?,is_featured=? WHERE id=?');$stmt->execute([$category,$name,$description,$price,$image,$audience,$sizes,$stock,$featured,$id]);}
      else {$stmt=$pdo->prepare('INSERT INTO products(category_id,name,description,price,image_url,audience,sizes,stock,is_featured) VALUES(?,?,?,?,?,?,?,?,?)');$stmt->execute([$category,$name,$description,$price,$image,$audience,$sizes,$stock,$featured]);}
      header('Location: products.php'); exit;
    }
  }
}
$edit=null;if(isset($_GET['edit'])){$st=$pdo->prepare('SELECT * FROM products WHERE id=?');$st->execute([(int)$_GET['edit']]);$edit=$st->fetch();}
$categories=$pdo->query('SELECT * FROM categories ORDER BY name')->fetchAll();
$products=$pdo->query('SELECT p.*,c.name AS category_name FROM products p LEFT JOIN categories c ON c.id=p.category_id ORDER BY p.created_at DESC')->fetchAll();
$pageTitle='Manage Products';include __DIR__.'/../includes/header.php';
?>
<div class="admin-shell"><h1>PRODUCT CRUD</h1><nav class="admin-nav"><a href="index.php">Dashboard</a><a href="categories.php">Categories</a><a href="orders.php">Orders</a></nav>
<?php if($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<section class="form-wrap" style="margin:20px 0;max-width:800px"><h2><?= $edit?'Edit product':'Add product' ?></h2><form method="post"><input type="hidden" name="action" value="save"><input type="hidden" name="id" value="<?= (int)($edit['id']??0) ?>">
<div class="field"><label>Name</label><input name="name" required value="<?= e($edit['name']??'') ?>"></div><div class="field"><label>Description</label><textarea name="description" rows="3"><?= e($edit['description']??'') ?></textarea></div>
<div class="field"><label>Category</label><select name="category_id"><option value="">Uncategorized</option><?php foreach($categories as $c): ?><option value="<?= (int)$c['id'] ?>" <?= (int)($edit['category_id']??0)===(int)$c['id']?'selected':'' ?>><?= e($c['name']) ?></option><?php endforeach; ?></select></div>
<div class="field"><label>Audience</label><select name="audience"><?php foreach(['men','women','kids','all'] as $a): ?><option value="<?= $a ?>" <?= ($edit['audience']??'all')===$a?'selected':'' ?>><?= ucfirst($a) ?></option><?php endforeach; ?></select></div>
<div class="field"><label>Price (PHP)</label><input type="number" min="0" step=".01" name="price" required value="<?= e((string)($edit['price']??'0')) ?>"></div><div class="field"><label>Image URL</label><input name="image_url" value="<?= e($edit['image_url']??'') ?>" placeholder="https://... or assets/images/shoe.jpg"></div><div class="field"><label>Sizes (comma separated)</label><input name="sizes" value="<?= e($edit['sizes']??'') ?>" placeholder="7,8,9,10"></div><div class="field"><label>Stock</label><input type="number" min="0" name="stock" value="<?= (int)($edit['stock']??0) ?>"></div><label><input type="checkbox" name="is_featured" <?= !empty($edit['is_featured'])?'checked':'' ?>> Featured product</label><p><button class="btn btn-blue">SAVE PRODUCT</button> <?php if($edit): ?><a class="btn" href="products.php">Cancel</a><?php endif; ?></p></form></section>
<h2>Products</h2><div class="table-wrap"><table class="data-table"><thead><tr><th>Name</th><th>Category</th><th>Audience</th><th>Price</th><th>Stock</th><th>Actions</th></tr></thead><tbody><?php foreach($products as $p): ?><tr><td><?= e($p['name']) ?></td><td><?= e($p['category_name']??'—') ?></td><td><?= e($p['audience']) ?></td><td><?= money($p['price']) ?></td><td><?= (int)$p['stock'] ?></td><td><a href="products.php?edit=<?= (int)$p['id'] ?>">Edit</a> <form method="post" style="display:inline" onsubmit="return confirm('Delete this product?')"><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$p['id'] ?>"><button class="btn" style="padding:6px 9px">Delete</button></form></td></tr><?php endforeach; ?></tbody></table></div></div>
<?php include __DIR__.'/../includes/footer.php'; ?>
