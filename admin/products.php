<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/functions.php';
require_role(['admin']);
shoeskopo_ensure_discount_column($pdo);
$error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  $action=$_POST['action'] ?? '';
  if ($action==='delete') { $pid=(int)($_POST['id']??0); $sold=$pdo->prepare('SELECT COUNT(*) 
FROM order_items 
WHERE product_id=?'); $sold->execute([$pid]); if((int)$sold->fetchColumn()>0) $error='This product has order history and cannot be deleted. Set stock to 0 or edit it instead.'; else { $stmt=$pdo->prepare('DELETE 
FROM products 
WHERE id=?'); $stmt->execute([$pid]); $_SESSION['swal_flash'] = 'Changes saved successfully.';
            header('Location: products.php');
            exit; } }
  if ($action==='save') {
    $id=(int)($_POST['id'] ?? 0); $name=trim($_POST['name'] ?? ''); $category=(int)($_POST['category_id'] ?? 0) ?: null;
    $priceRaw=trim((string)($_POST['price'] ?? '')); $price=is_numeric($priceRaw)?(float)$priceRaw:-1; $stockRaw=trim((string)($_POST['stock'] ?? '0')); $stock=(filter_var($stockRaw,FILTER_VALIDATE_INT)!==false && (int)$stockRaw>=0)?(int)$stockRaw:-1; $image=trim($_POST['existing_image'] ?? '');
    if (!empty($_FILES['product_image']['name'])) {
      $uploadError = $_FILES['product_image']['error'] ?? UPLOAD_ERR_NO_FILE;
      if ($uploadError !== UPLOAD_ERR_OK) { $error='Image upload failed. Please choose the image again.'; }
      else {
        $tmp=$_FILES['product_image']['tmp_name'];
        $mime=(new finfo(FILEINFO_MIME_TYPE))->file($tmp);
        $extensions=['image/jpeg'=>'jpg','image/png'=>'png','image/webp'=>'webp','image/gif'=>'gif'];
        if (!isset($extensions[$mime])) { $error='Please upload a JPG, PNG, WEBP, or GIF image.'; }
        elseif (($_FILES['product_image']['size'] ?? 0) > 5*1024*1024) { $error='Product images must be 5 MB or smaller.'; }
        else {
          $uploadDir=__DIR__.'/../assets/images/products';
          if (!is_dir($uploadDir)) mkdir($uploadDir, 0755, true);
          $fileName='product_'.bin2hex(random_bytes(12)).'.'.$extensions[$mime];
          if (move_uploaded_file($tmp,$uploadDir.'/'.$fileName)) $image='assets/images/products/'.$fileName;
          else $error='Could not save the uploaded image. Check folder permissions.';
        }
      }
    }
    $galleryUploads = [];
    if (isset($_FILES['product_images']['name']) && is_array($_FILES['product_images']['name'])) {
      $uploadDir=__DIR__.'/../assets/images/products'; if(!is_dir($uploadDir)) mkdir($uploadDir,0755,true);
      $exts=['image/jpeg'=>'jpg','image/png'=>'png','image/webp'=>'webp','image/gif'=>'gif'];
      foreach($_FILES['product_images']['name'] as $i=>$original) {
        if ($original==='') continue;
        if (($_FILES['product_images']['error'][$i]??UPLOAD_ERR_NO_FILE)!==UPLOAD_ERR_OK) { $error='One of the gallery images failed to upload.'; break; }
        $tmp=$_FILES['product_images']['tmp_name'][$i]; $mime=(new finfo(FILEINFO_MIME_TYPE))->file($tmp);
        if(!isset($exts[$mime]) || ($_FILES['product_images']['size'][$i]??0)>5*1024*1024) { $error='Gallery images must be JPG, PNG, WEBP, or GIF and no larger than 5 MB each.'; break; }
        $fn='product_gallery_'.bin2hex(random_bytes(10)).'.'.$exts[$mime];
        if(move_uploaded_file($tmp,$uploadDir.'/'.$fn)) $galleryUploads[]='assets/images/products/'.$fn; else { $error='Could not save a gallery image.'; break; }
      }
    }
    $audience=$_POST['audience'] ?? 'all'; if(!in_array($audience,['men','women','kids','all'],true)) $audience='all';
    $sizes=trim($_POST['sizes'] ?? ''); $description=trim($_POST['description'] ?? ''); $featured=isset($_POST['is_featured'])?1:0;
    if($name==='' || $priceRaw==='' || !is_numeric($priceRaw) || $price<0 || !is_finite($price) || $stock<0) $error='Enter a product name, a valid non-negative price, and a non-negative whole-number stock quantity.';
    elseif($error==='') {
      if($id){
        $oldPriceStmt=$pdo->prepare('SELECT price 
FROM products 
WHERE id=?');$oldPriceStmt->execute([$id]);$oldPrice=$oldPriceStmt->fetchColumn();
        $stmt=$pdo->prepare('UPDATE products 
SET category_id=?,name=?,description=?,price=?,image_url=?,audience=?,stock=?,is_featured=?
WHERE id=?');$stmt->execute([$category,$name,$description,$price,$image,$audience,$stock,$featured,$id]);
        if($oldPrice!==false && (float)$oldPrice !== $price){$logPrice=$pdo->prepare('INSERT INTO price_logs(product_id,old_price,new_price,changed_by) 
VALUES(?,?,?,?)');$logPrice->execute([$id,$oldPrice,$price,current_user()['id']]);}
      }
      else {$stmt=$pdo->prepare('INSERT INTO products(category_id,name,description,price,image_url,audience,stock,is_featured)
VALUES(?,?,?,?,?,?,?,?)');$stmt->execute([$category,$name,$description,$price,$image,$audience,$stock,$featured]);}
      $savedId=$id ?: (int)$pdo->lastInsertId();
      // Store each available size as a separate row (1NF/2NF-friendly design).
      $sizeValues=array_values(array_unique(array_filter(array_map('trim', explode(',', $sizes)), static fn($v)=>$v!=='')));
      $pdo->beginTransaction();
      $clearSizes=$pdo->prepare('DELETE 
FROM product_sizes 
WHERE product_id=?'); $clearSizes->execute([$savedId]);
      $saveSize=$pdo->prepare('INSERT INTO product_sizes(product_id,size_label) 
VALUES(?,?)');
      foreach($sizeValues as $sizeValue) $saveSize->execute([$savedId,$sizeValue]);
      $pdo->commit();
      if ($galleryUploads) { $galleryStmt=$pdo->prepare('INSERT INTO product_images(product_id,image_path,sort_order) 
VALUES(?,?,?)'); foreach($galleryUploads as $idx=>$path) $galleryStmt->execute([$savedId,$path,$idx]); }
      $_SESSION['swal_flash'] = 'Changes saved successfully.';
            header('Location: products.php');
            exit;
    }
  }
}
$edit=null;if(isset($_GET['edit'])){$st=$pdo->prepare('SELECT * 
FROM products 
WHERE id=?');$st->execute([(int)$_GET['edit']]);$edit=$st->fetch(); if($edit){try{$sz=$pdo->prepare('SELECT size_label 
FROM product_sizes 
WHERE product_id=? 
ORDER BY id');$sz->execute([(int)$edit['id']]);$normalizedSizes=$sz->fetchAll(PDO::FETCH_COLUMN);if($normalizedSizes)$edit['sizes']=implode(', ',$normalizedSizes);}catch(Throwable $ignored){}}}
$categories=$pdo->query('SELECT * 
FROM categories 
ORDER BY name')->fetchAll();
$products=$pdo->query('SELECT p.*,c.name AS category_name 
FROM products p 
    LEFT 
    JOIN categories c ON c.id=p.category_id 
ORDER BY p.created_at DESC')->fetchAll();
$pageTitle='Manage Products';include __DIR__.'/../includes/header.php';
?>
<div class="admin-shell"><h1>PRODUCT CRUD</h1><?= admin_navigation('products.php') ?>
<?php if($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
<section class="form-wrap" style="margin:20px 0;max-width:800px"><h2><?= $edit?'Edit product':'Add product' ?></h2><form method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="action" value="save"><input type="hidden" name="id" value="<?= (int)($edit['id']??0) ?>"><input type="hidden" name="existing_image" value="<?= e($edit['image_url']??'') ?>">
<div class="field"><label>Name</label><input name="name" required value="<?= e($edit['name']??'') ?>"></div><div class="field"><label>Description</label><textarea name="description" rows="3"><?= e($edit['description']??'') ?></textarea></div>
<div class="field"><label>Category</label><select name="category_id"><option value="">Uncategorized</option><?php foreach($categories as $c): ?><option value="<?= (int)$c['id'] ?>" <?= (int)($edit['category_id']??0)===(int)$c['id']?'selected':'' ?>><?= e($c['name']) ?></option><?php endforeach; ?></select></div>
<div class="field"><label>Audience</label><select name="audience"><?php foreach(['men','women','kids','all'] as $a): ?><option value="<?= $a ?>" <?= ($edit['audience']??'all')===$a?'selected':'' ?>><?= ucfirst($a) ?></option><?php endforeach; ?></select></div>
<div class="field"><label>Price (PHP)</label><input type="number" min="0" step=".01" name="price" required value="<?= e((string)($edit['price']??'0')) ?>"></div><div class="field"><label>Product image (choose from your computer)</label><input type="file" name="product_image" accept="image/jpeg,image/png,image/webp,image/gif"><small>JPG, PNG, WEBP or GIF, maximum 5 MB.</small><?php if(!empty($edit['image_url'])): ?><p><img src="<?= e(str_starts_with($edit['image_url'],'http') ? $edit['image_url'] : '../'.ltrim($edit['image_url'],'/')) ?>" alt="Current product image" style="width:100px;height:100px;object-fit:cover"></p><?php endif; ?></div><div class="field"><label>Additional product photos (select multiple)</label><input type="file" name="product_images[]" accept="image/jpeg,image/png,image/webp,image/gif" multiple><small>Optional gallery images, each maximum 5 MB. Product gallery is shown on the product details page.</small></div><div class="field"><label>Available sizes (comma separated; saved as individual size records)</label><input name="sizes" value="<?= e($edit['sizes']??'') ?>" placeholder="7,8,9,10"></div><div class="field"><label>Stock</label><input type="number" min="0" name="stock" value="<?= (int)($edit['stock']??0) ?>"></div><label><input type="checkbox" name="is_featured" <?= !empty($edit['is_featured'])?'checked':'' ?>> Featured product</label><p><button class="btn btn-blue icon-button" aria-label="Save product" title="Save product">💾</button> <?php if($edit): ?><a class="btn" href="products.php">Cancel</a><?php endif; ?></p></form></section>
<h2>Products</h2><div class="table-wrap"><table class="data-table"><thead><tr><th>Name</th><th>Category</th><th>Audience</th><th>Price</th><th>Stock</th><th>Actions</th></tr></thead><tbody><?php foreach($products as $p): ?><tr><td><?= e($p['name']) ?></td><td><?= e($p['category_name']??'—') ?></td><td><?= e($p['audience']) ?></td><td><?= money($p['price']) ?></td><td><?= (int)$p['stock'] ?></td><td><a href="products.php?edit=<?= (int)$p['id'] ?>" class="icon-button" aria-label="Edit" title="Edit">✎</a> <form method="post" style="display:inline" data-confirm='Delete this product?'><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$p['id'] ?>"><button class="btn icon-button" style="padding:6px 9px" aria-label="Delete product" title="Delete product">🗑</button></form></td></tr><?php endforeach; ?></tbody></table></div></div>
<?php include __DIR__.'/../includes/footer.php'; ?>
