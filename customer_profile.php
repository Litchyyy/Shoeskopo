<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/functions.php';
$customerId=filter_input(INPUT_GET,'id',FILTER_VALIDATE_INT);
$st=$pdo->prepare("SELECT id,username,full_name,avatar_path,created_at 
FROM users 
WHERE id=?
    AND is_active=1
    AND role='customer'");
$st->execute([$customerId ?: 0]); $customer=$st->fetch();
if(!$customer){http_response_code(404);$pageTitle='Customer not found';include __DIR__.'/includes/header.php';echo '<section class="section"><h1>Customer not found</h1><p>This customer profile is unavailable.</p><a class="btn" href="index.php">Back to shop</a></section>';include __DIR__.'/includes/footer.php';exit;}
$pageTitle=$customer['username'].' - Customer Profile';
$reviews=[];try{$q=$pdo->prepare('SELECT r.*,p.name AS product_name,p.image_url 
FROM product_reviews r 
    JOIN products p ON p.id=r.product_id 
WHERE r.user_id=? 
ORDER BY r.created_at DESC');$q->execute([$customer['id']]);$reviews=$q->fetchAll();}catch(Throwable $e){}
include __DIR__.'/includes/header.php';
?>
<section class="section">
<div class="form-wrap" style="max-width:850px;margin:0 auto 24px;display:flex;align-items:center;gap:20px;flex-wrap:wrap">
<img src="<?=e($customer['avatar_path']?:'https://placehold.co/160x160?text=Profile')?>" alt="<?=e($customer['username'])?> profile picture" style="width:120px;height:120px;border-radius:50%;object-fit:cover">
<div><h1 style="margin:0 0 6px"><?=e($customer['full_name']?:$customer['username'])?></h1><p class="muted">@<?=e($customer['username'])?></p><p class="muted">Member since <?=e(date('F Y',strtotime($customer['created_at'])))?></p></div>
</div>
<h2>Reviews by <?=e($customer['username'])?></h2>
<?php if(!$reviews): ?><p class="muted">This customer has not posted any reviews yet.</p><?php endif; ?>
<?php foreach($reviews as $review): ?>
<article class="form-wrap" style="max-width:850px;margin:12px auto"><a href="product.php?id=<?=(int)$review['product_id']?>" style="display:flex;align-items:center;gap:12px;color:inherit;text-decoration:none"><?php if(!empty($review['image_url'])): ?><img src="<?=e($review['image_url'])?>" alt="" style="width:70px;height:70px;object-fit:cover;border-radius:8px"><?php endif; ?><strong><?=e($review['product_name'])?></strong></a>
<p style="color:#f5b400"><?=str_repeat('★',(int)$review['rating']).str_repeat('☆',5-(int)$review['rating'])?></p><p><?=nl2br(e($review['review_text']))?></p>
<?php try{$m=$pdo->prepare('SELECT media_path,media_type 
FROM product_review_media 
WHERE review_id=? 
ORDER BY id');$m->execute([$review['id']]);$attachments=$m->fetchAll();}catch(Throwable $e){$attachments=[];} ?>
<?php if($attachments): ?><div style="display:flex;flex-wrap:wrap;gap:10px"><?php foreach($attachments as $media): ?><?php if($media['media_type']==='video'): ?><video controls preload="metadata" style="width:min(220px,100%);max-height:250px;border-radius:8px"><source src="<?=e($media['media_path'])?>"></video><?php else: ?><a href="<?=e($media['media_path'])?>" target="_blank" rel="noopener"><img src="<?=e($media['media_path'])?>" alt="Review photo" style="width:140px;height:140px;object-fit:cover;border-radius:8px"></a><?php endif; ?><?php endforeach; ?></div><?php endif; ?>
<small class="muted"><?=e($review['updated_at'])?></small><p><a href="product.php?id=<?=(int)$review['product_id']?>#reviews">View product reviews</a></p></article>
<?php endforeach; ?>
</section>
<?php include __DIR__.'/includes/footer.php'; ?>
