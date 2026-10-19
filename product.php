<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
$stmt = $pdo->prepare("SELECT p.*, c.name AS category_name FROM products p LEFT JOIN categories c ON c.id=p.category_id WHERE p.id=?");
$stmt->execute([$id ?: 0]); $product = $stmt->fetch();
if (!$product) { http_response_code(404); $pageTitle='Product not found'; include __DIR__.'/includes/header.php'; echo '<div class="section"><div class="empty-state"><h1>Product not found</h1><a class="btn" href="index.php">Back home</a></div></div>'; include __DIR__.'/includes/footer.php'; exit; }
$pageTitle=$product['name']; $error=''; $reviewMessage='';
$reviewFilter = in_array($_GET['review_filter'] ?? 'all', ['all','media','text'], true) ? ($_GET['review_filter'] ?? 'all') : 'all';
$normalizedSizes=[]; try { $sizeStmt=$pdo->prepare('SELECT size_label FROM product_sizes WHERE product_id=? ORDER BY id'); $sizeStmt->execute([(int)$product['id']]); $normalizedSizes=$sizeStmt->fetchAll(PDO::FETCH_COLUMN); } catch(Throwable $ignored) {}

$gallery=[]; try { $g=$pdo->prepare('SELECT image_path FROM product_images WHERE product_id=? ORDER BY sort_order,id'); $g->execute([$product['id']]); $gallery=$g->fetchAll(PDO::FETCH_COLUMN); } catch(Throwable $e) {}
$reviews=[]; $reviewEligible=false; $reviewOrderId=0;
if(current_user()) { $elig=$pdo->prepare("SELECT o.id FROM orders o JOIN order_items oi ON oi.order_id=o.id WHERE o.user_id=? AND oi.product_id=? AND o.status IN ('Completed','Shipped') ORDER BY o.created_at DESC"); $elig->execute([current_user()['id'],$product['id']]); $reviewOrderId=(int)($elig->fetchColumn()?:0); $reviewEligible=$reviewOrderId>0; }
if ($_SERVER['REQUEST_METHOD']==='POST' && ($_POST['action']??'')==='review') {
  require_login();
  if (($_POST['review_action']??'')==='delete') {
    $del=$pdo->prepare('DELETE FROM product_reviews WHERE id=? AND user_id=? AND product_id=?');
    $del->execute([(int)($_POST['review_id']??0),current_user()['id'],$product['id']]); $reviewMessage='Your review was deleted.';
  } else {
    $rating=filter_var($_POST['rating']??0,FILTER_VALIDATE_INT); $reviewText=trim($_POST['review_text']??''); $reviewId=(int)($_POST['review_id']??0);
    if(!$reviewEligible) $error='Only customers who purchased and received this product can review it.';
    elseif(!$rating || $rating<1 || $rating>5 || $reviewText==='') $error='Choose a rating from 1 to 5 and enter a review.';
    else {
      $badWords=['fuck','shit','bitch','asshole','bastard','damn']; foreach($badWords as $word) $reviewText=preg_replace('/\b'.preg_quote($word,'/').'\b/iu',str_repeat('*',strlen($word)),$reviewText);
      if($reviewId>0) { $up=$pdo->prepare('UPDATE product_reviews SET rating=?,review_text=? WHERE id=? AND user_id=? AND product_id=?'); $up->execute([$rating,$reviewText,$reviewId,current_user()['id'],$product['id']]); $savedReviewId=$reviewId; }
      else { $up=$pdo->prepare('INSERT INTO product_reviews(product_id,user_id,order_id,rating,review_text) VALUES(?,?,?,?,?) ON DUPLICATE KEY UPDATE rating=VALUES(rating),review_text=VALUES(review_text),updated_at=CURRENT_TIMESTAMP'); $up->execute([$product['id'],current_user()['id'],$reviewOrderId,$rating,$reviewText]); $find=$pdo->prepare('SELECT id FROM product_reviews WHERE product_id=? AND user_id=?'); $find->execute([$product['id'],current_user()['id']]); $savedReviewId=(int)$find->fetchColumn(); }
      if(!empty($_FILES['review_media']['name'][0])) {
        $dir=__DIR__.'/assets/images/reviews'; if(!is_dir($dir)) mkdir($dir,0755,true);
        $allowed=['image/jpeg'=>'jpg','image/png'=>'png','image/webp'=>'webp','video/mp4'=>'mp4','video/webm'=>'webm','video/quicktime'=>'mov'];
        $count=min(count($_FILES['review_media']['name']),6); $finfo=new finfo(FILEINFO_MIME_TYPE);
        for($i=0;$i<$count;$i++) {
          if($_FILES['review_media']['error'][$i]===UPLOAD_ERR_NO_FILE) continue;
          if($_FILES['review_media']['error'][$i]!==UPLOAD_ERR_OK) { $error='One of your photos/videos failed to upload.'; break; }
          $tmp=$_FILES['review_media']['tmp_name'][$i]; $mime=$finfo->file($tmp); $size=(int)$_FILES['review_media']['size'][$i];
          if(!isset($allowed[$mime]) || $size>30*1024*1024) { $error='Attach up to 6 JPG, PNG, WEBP photos or MP4, WEBM, MOV videos (30 MB each).'; break; }
          $filename='review_'.bin2hex(random_bytes(10)).'.'.$allowed[$mime];
          if(!move_uploaded_file($tmp,$dir.'/'.$filename)) { $error='Could not save one of your attachments.'; break; }
          $mediaPath='assets/images/reviews/'.$filename; $kind=str_starts_with($mime,'video/')?'video':'image';
          $mi=$pdo->prepare('INSERT INTO product_review_media(review_id,media_path,media_type) VALUES(?,?,?)'); $mi->execute([$savedReviewId,$mediaPath,$kind]);
        }
      }
      if($error==='') $reviewMessage='Your review was saved.';
    }
  }
}
if ($_SERVER['REQUEST_METHOD']==='POST' && ($_POST['action']??'')!=='review') {
  $size=trim($_POST['size'] ?? ''); $qty=filter_input(INPUT_POST,'quantity',FILTER_VALIDATE_INT) ?: 1; $qty=max(1,min(20,$qty));
  $sizes=$normalizedSizes;
  if ($sizes && !in_array($size,$sizes,true)) $error='Please choose an available size.';
  elseif ((int)$product['stock'] < $qty) $error='Not enough stock available.';
  else {
    $cart = shoeskopo_load_cart($pdo);
    $key=$product['id'].'_'.$size;
    if (!isset($cart[$key])) $cart[$key]=['product_id'=>(int)$product['id'],'name'=>$product['name'],'price'=>(float)$product['price'],'image_url'=>$product['image_url'],'size'=>$size,'quantity'=>0];
    $cart[$key]['quantity'] += $qty;
    shoeskopo_save_cart($pdo, $cart);
    header('Location: cart.php?added=1'); exit;
  }
}
include __DIR__ . '/includes/header.php';
?>
<div class="product-detail">
  <div class="product-gallery" data-gallery>
    <?php $slideImages = array_values(array_unique(array_filter(array_merge([$product['image_url'] ?? ''], $gallery)))); if (!$slideImages) $slideImages = ['https://placehold.co/900x900?text=Shoes']; ?>
    <div class="gallery-stage">
      <?php foreach ($slideImages as $index => $slideImage): ?><img class="gallery-slide<?= $index === 0 ? ' is-active' : '' ?>" src="<?= e($slideImage) ?>" alt="<?= e($product['name']) ?> photo <?= $index + 1 ?>" <?= $index === 0 ? '' : 'hidden' ?>><?php endforeach; ?>
      <?php if (count($slideImages) > 1): ?><button type="button" class="gallery-arrow gallery-prev" aria-label="Previous photo">&#10094;</button><button type="button" class="gallery-arrow gallery-next" aria-label="Next photo">&#10095;</button><?php endif; ?>
    </div>
    <?php if (count($slideImages) > 1): ?><div class="gallery-indicator" aria-live="polite"><span data-gallery-current>1</span> / <?= count($slideImages) ?></div><?php endif; ?>
  </div>
  <div><p class="muted"><?= e($product['category_name'] ?? 'Shoes') ?></p><h1><?= e($product['name']) ?></h1><h2><?= money($product['price']) ?></h2><p><?= nl2br(e($product['description'] ?? '')) ?></p><p><?= (int)$product['stock']>0 ? 'In stock: '.(int)$product['stock'] : 'Out of stock' ?></p>
  <?php if ($error): ?><div class="form-error"><?= e($error) ?></div><?php endif; ?>
  <?php if ((int)$product['stock']>0): ?><form method="post">
    <?php $sizes=$normalizedSizes; if ($sizes): ?><div class="field"><label for="size">Choose size</label><select name="size" id="size" required><option value="">Select a size</option><?php foreach($sizes as $s): ?><option value="<?= e($s) ?>"><?= e($s) ?></option><?php endforeach; ?></select></div><?php endif; ?>
    <div class="field"><label for="quantity">Quantity</label><input class="quantity" id="quantity" name="quantity" type="number" min="1" max="<?= (int)$product['stock'] ?>" value="1"></div><button class="btn" type="submit">ADD TO CART</button>
  </form><?php endif; ?></div>
</div>

<section class="section" id="reviews"><h2>CUSTOMER REVIEWS</h2>
<?php if($error && ($_POST['action']??'')==='review'): ?><div class="form-error"><?=e($error)?></div><?php endif; ?><?php if($reviewMessage): ?><div class="form-success"><?=e($reviewMessage)?></div><?php endif; ?>
<?php if(current_user() && $reviewEligible): ?>
<form method="post" enctype="multipart/form-data" class="form-wrap" style="margin:15px 0;max-width:650px" novalidate>
<input type="hidden" name="action" value="review"><div class="field"><label for="rating">Rating</label><select name="rating" id="rating" required><option value="">Choose rating</option><?php for($r=5;$r>=1;$r--): ?><option value="<?=$r?>"><?=$r?> / 5</option><?php endfor; ?></select></div>
<div class="field"><label for="review_text">Your review</label><textarea id="review_text" name="review_text" rows="4" maxlength="2000" required></textarea></div>
<div class="field"><label for="review_media">Attach photos or videos (up to 6 files, 30 MB each)</label><input id="review_media" type="file" name="review_media[]" accept="image/jpeg,image/png,image/webp,video/mp4,video/webm,video/quicktime" multiple><small class="muted">Supported: JPG, PNG, WEBP, MP4, WEBM, MOV.</small></div><button class="btn btn-blue" type="submit">SUBMIT REVIEW</button></form>
<?php elseif(current_user()): ?><p class="muted">Reviews are available after an order containing this product is shipped or completed.</p><?php else: ?><p><a href="login.php">Sign in</a> and purchase this product to leave a review.</p><?php endif; ?>
<?php
try { $rs=$pdo->prepare('SELECT r.*,u.username,u.avatar_path FROM product_reviews r JOIN users u ON u.id=r.user_id WHERE r.product_id=? ORDER BY r.created_at DESC'); $rs->execute([$product['id']]); $reviews=$rs->fetchAll(); } catch(Throwable $e) { $reviews=[]; }
$mediaByReview=[]; if($reviews) { try { $ids=array_map('intval',array_column($reviews,'id')); $ph=implode(',',array_fill(0,count($ids),'?')); $ms=$pdo->prepare("SELECT * FROM product_review_media WHERE review_id IN ($ph) ORDER BY id"); $ms->execute($ids); foreach($ms->fetchAll() as $m) $mediaByReview[$m['review_id']][]=$m; } catch(Throwable $ignored) {} }
$visibleReviews=array_values(array_filter($reviews,function($r) use($reviewFilter,$mediaByReview) { $has=!empty($mediaByReview[$r['id']]); return $reviewFilter==='all' || ($reviewFilter==='media' && $has) || ($reviewFilter==='text' && !$has); }));
?>
<div class="review-filter-buttons" style="display:flex;gap:8px;flex-wrap:wrap;margin:18px 0">
<a class="btn <?= $reviewFilter==='all'?'btn-blue':'' ?>" href="product.php?id=<?=(int)$product['id']?>#reviews">All reviews (<?=count($reviews)?>)</a>
<a class="btn <?= $reviewFilter==='media'?'btn-blue':'' ?>" href="product.php?id=<?=(int)$product['id']?>&review_filter=media#reviews">With photos/videos (<?=count(array_filter($reviews,fn($r)=>!empty($mediaByReview[$r['id']]??[])))?>)</a>
<a class="btn <?= $reviewFilter==='text'?'btn-blue':'' ?>" href="product.php?id=<?=(int)$product['id']?>&review_filter=text#reviews">Without photos/videos (<?=count($reviews)-count(array_filter($reviews,fn($r)=>!empty($mediaByReview[$r['id']]??[])))?>)</a></div>
<?php if(!$visibleReviews): ?><p class="muted">No reviews match this filter.</p><?php endif; ?>
<?php foreach($visibleReviews as $r): $avatar=!empty($r['avatar_path'])?$r['avatar_path']:'https://placehold.co/100x100?text=User'; ?>
<article class="form-wrap review-card" style="margin:12px 0;max-width:800px"><div style="display:flex;align-items:center;gap:12px;margin-bottom:8px"><a href="customer_profile.php?id=<?=(int)$r['user_id']?>" style="display:flex;align-items:center;gap:10px;text-decoration:none;color:inherit"><img src="<?=e($avatar)?>" alt="<?=e($r['username'])?> profile picture" style="width:48px;height:48px;border-radius:50%;object-fit:cover"><strong><?=e($r['username'])?></strong></a><span style="color:#f5b400"><?=str_repeat('★',(int)$r['rating']).str_repeat('☆',5-(int)$r['rating'])?></span></div>
<p><?=nl2br(e($r['review_text']))?></p>
<?php if(!empty($mediaByReview[$r['id']])): ?><div style="display:flex;flex-wrap:wrap;gap:10px;margin:12px 0"><?php foreach($mediaByReview[$r['id']] as $media): ?><?php if($media['media_type']==='video'): ?><video controls preload="metadata" style="width:min(220px,100%);max-height:260px;border-radius:10px"><source src="<?=e($media['media_path'])?>"></video><?php else: ?><a href="<?=e($media['media_path'])?>" target="_blank" rel="noopener"><img src="<?=e($media['media_path'])?>" alt="Customer review photo" style="width:160px;height:160px;object-fit:cover;border-radius:10px"></a><?php endif; ?><?php endforeach; ?></div><?php endif; ?>
<small class="muted"><?=e($r['updated_at'])?></small>
<?php if(current_user() && (int)current_user()['id']===(int)$r['user_id']): ?><form method="post" onsubmit="return confirm('Delete your review?')"><input type="hidden" name="action" value="review"><input type="hidden" name="review_action" value="delete"><input type="hidden" name="review_id" value="<?=(int)$r['id']?>"><button class="btn" type="submit">DELETE REVIEW</button></form><details><summary>Edit your review</summary><form method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="action" value="review"><input type="hidden" name="review_id" value="<?=(int)$r['id']?>"><div class="field"><label>Rating</label><select name="rating"><?php for($rr=5;$rr>=1;$rr--): ?><option value="<?=$rr?>" <?=(int)$r['rating']===$rr?'selected':''?>><?=$rr?> / 5</option><?php endfor; ?></select></div><div class="field"><label>Review</label><textarea name="review_text" rows="3" maxlength="2000"><?=e($r['review_text'])?></textarea></div><div class="field"><label>Add photos/videos</label><input type="file" name="review_media[]" accept="image/jpeg,image/png,image/webp,video/mp4,video/webm,video/quicktime" multiple></div><button class="btn" type="submit">UPDATE REVIEW</button></form></details><?php endif; ?></article><?php endforeach; ?></section>
<script>
document.querySelectorAll('[data-gallery]').forEach(function(gallery) {
  const slides = Array.from(gallery.querySelectorAll('.gallery-slide'));
  if (slides.length < 2) return;
  let current = 0;
  const counter = gallery.querySelector('[data-gallery-current]');
  function show(index) {
    current = (index + slides.length) % slides.length;
    slides.forEach((slide, i) => { slide.hidden = i !== current; slide.classList.toggle('is-active', i === current); });
    if (counter) counter.textContent = String(current + 1);
  }
  gallery.querySelector('.gallery-prev')?.addEventListener('click', () => show(current - 1));
  gallery.querySelector('.gallery-next')?.addEventListener('click', () => show(current + 1));
  gallery.addEventListener('keydown', e => { if (e.key === 'ArrowLeft') show(current - 1); if (e.key === 'ArrowRight') show(current + 1); });
});
</script>
<?php include __DIR__ . '/includes/footer.php'; ?>
