<?php
require_once __DIR__.'/../config/db.php'; require_once __DIR__.'/../includes/functions.php'; require_role(['admin']); $error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
 $action=$_POST['action']??'save';
 if($action==='status'){
  $id=(int)($_POST['id']??0); $status=$_POST['status']??'Ordered';
  if(in_array($status,['Ordered','In Transit','Delivered','Cancelled'],true)){
   $pdo->beginTransaction(); try { $q=$pdo->prepare('SELECT * FROM purchase_orders WHERE id=? FOR UPDATE');$q->execute([$id]);$po=$q->fetch();
    if($po && $po['status']!=='Delivered' && $status==='Delivered'){
     $items=$pdo->prepare('SELECT poi.product_id,poi.quantity,p.name AS product_name FROM purchase_order_items poi JOIN products p ON p.id=poi.product_id WHERE poi.purchase_order_id=?');
     $items->execute([$id]);
     $up=$pdo->prepare('UPDATE products SET stock=stock+? WHERE id=?');
     $log=$pdo->prepare("INSERT INTO inventory_logs(product_id,change_qty,reason,reference_type,reference_id) VALUES(?,?,'Supplier delivery','purchase_order',?)");
     $expenseCheck=$pdo->prepare("SELECT COUNT(*) FROM expenses WHERE description LIKE ?");
     $expenseCheck->execute(['%[Purchase Order #'.$id.']%']);
     foreach($items as $it){$up->execute([$it['quantity'],$it['product_id']]);$log->execute([$it['product_id'],$it['quantity'],$id]);}
     if((int)$expenseCheck->fetchColumn()===0){
      $supplierNameStmt=$pdo->prepare('SELECT supplier_name FROM suppliers WHERE id=?');
      $supplierNameStmt->execute([$po['supplier_id']]);
      $supplierName=(string)$supplierNameStmt->fetchColumn();
      $description='Supplier purchase from '.$supplierName.' [Purchase Order #'.$id.']';
      $expense=$pdo->prepare("INSERT INTO expenses(expense_date,category,description,amount) VALUES(CURDATE(),'Supplies',?,?)");
      $expense->execute([$description,(float)$po['total_cost']]);
     }
    }
    $delivered=$status==='Delivered'?', delivered_at=NOW()':'';$st=$pdo->prepare("UPDATE purchase_orders SET status=? $delivered WHERE id=?");$st->execute([$status,$id]);$pdo->commit();
   } catch(Throwable $e){$pdo->rollBack();$error='Could not update purchase order.';}
  }
 } elseif($action==='po'){
  $supplier=(int)($_POST['supplier_id']??0);$product=(int)($_POST['product_id']??0);$qty=max(1,(int)($_POST['quantity']??1));$priceStmt=$pdo->prepare('SELECT price FROM products WHERE id = ?'); $priceStmt->execute([$product]); $productPrice=$priceStmt->fetchColumn(); $cost=$productPrice===false ? -1 : (float)$productPrice;$expected=$_POST['expected_date']?:null;
  if(!$supplier||!$product||$cost<0)$error='Choose a valid supplier and product.';else{try{$pdo->beginTransaction();$st=$pdo->prepare("INSERT INTO purchase_orders(supplier_id,status,order_date,expected_date,total_cost,notes) VALUES(?,'Ordered',CURDATE(),?,?,?)");$st->execute([$supplier,$expected,$qty*$cost,trim($_POST['po_notes']??'')]);$poid=(int)$pdo->lastInsertId();$it=$pdo->prepare('INSERT INTO purchase_order_items(purchase_order_id,product_id,quantity,unit_cost) VALUES(?,?,?,?)');$it->execute([$poid,$product,$qty,$cost]);$pdo->commit();header('Location: suppliers.php');exit;}catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();$error='Could not create purchase order.';}}
 } else {
  $id=(int)($_POST['id']??0);$name=trim($_POST['supplier_name']??'');$contact=trim($_POST['contact_person']??'');$email=trim($_POST['email']??'');$phone=trim($_POST['phone']??'');$address=trim($_POST['address']??'');$notes=trim($_POST['notes']??'');
  if($name==='')$error='Supplier name is required.';else{if($id){$st=$pdo->prepare('UPDATE suppliers SET supplier_name=?,contact_person=?,email=?,phone=?,address=?,notes=? WHERE id=?');$st->execute([$name,$contact,$email,$phone,$address,$notes,$id]);}else{$st=$pdo->prepare('INSERT INTO suppliers(supplier_name,contact_person,email,phone,address,notes) VALUES(?,?,?,?,?,?)');$st->execute([$name,$contact,$email,$phone,$address,$notes]);}header('Location: suppliers.php');exit;}
 }
}
$edit=null;if(isset($_GET['edit'])){$st=$pdo->prepare('SELECT * FROM suppliers WHERE id=?');$st->execute([(int)$_GET['edit']]);$edit=$st->fetch();}
$suppliers=$pdo->query('SELECT * FROM suppliers ORDER BY supplier_name')->fetchAll();$products = $pdo->query("\n    SELECT id, name, stock, price\n    FROM products\n    ORDER BY name\n")->fetchAll();
$pos = $pdo->query('
    SELECT po.*, s.supplier_name, p.name AS product_name
    FROM purchase_orders po
    JOIN suppliers s ON s.id = po.supplier_id
    JOIN purchase_order_items poi ON poi.purchase_order_id = po.id
    JOIN products p ON p.id = poi.product_id
    ORDER BY po.created_at DESC
')->fetchAll();$pageTitle='Suppliers';include __DIR__.'/../includes/header.php'; ?>
<div class="admin-shell"><h1>SUPPLIERS & PURCHASE ORDERS</h1><?= admin_navigation('suppliers.php') ?><?php if($error):?><div class="form-error"><?=e($error)?></div><?php endif;?>
<section class="form-wrap" style="margin:20px 0;max-width:760px"><h2><?= $edit?'Edit Supplier':'Add Supplier' ?></h2><form method="post"><input type="hidden" name="id" value="<?= (int)($edit['id']??0) ?>"><div class="field"><label>Supplier name *</label><input name="supplier_name" required value="<?=e($edit['supplier_name']??'')?>"></div><div class="field"><label>Contact person</label><input name="contact_person" value="<?=e($edit['contact_person']??'')?>"></div><div class="field"><label>Email</label><input type="email" name="email" value="<?=e($edit['email']??'')?>"></div><div class="field"><label>Phone</label><input name="phone" value="<?=e($edit['phone']??'')?>"></div><div class="field"><label>Address</label><textarea name="address"><?=e($edit['address']??'')?></textarea></div><div class="field"><label>Notes</label><textarea name="notes"><?=e($edit['notes']??'')?></textarea></div><button class="btn btn-blue">SAVE SUPPLIER</button></form></section>
<h2>Create purchase order</h2><section class="form-wrap" style="margin:20px 0;max-width:760px"><form method="post"><input type="hidden" name="action" value="po"><div class="field"><label>Supplier</label><select name="supplier_id" required><option value="">Select supplier</option><?php foreach($suppliers as $s):?><option value="<?=$s['id']?>"><?=e($s['supplier_name'])?></option><?php endforeach;?></select></div><div class="field"><label>Product</label><select name="product_id" required><option value="">Select product</option><?php foreach($products as $pr):?><option value="<?=$pr['id']?>" data-price="<?=e((string)$pr['price'])?>"><?=e($pr['name'])?> (stock <?=$pr['stock']?>)</option><?php endforeach;?></select></div><div class="field"><label>Quantity</label><input type="number" min="1" name="quantity" value="1" required></div><div class="field"><label>Unit price (PHP, assigned from product price)</label><input id="unit_price_display" type="text" value="Select a product" readonly><p class="muted">Unit price is assigned automatically and cannot be edited in the purchase order.</p></div><div class="field"><label>Expected delivery</label><input type="date" name="expected_date"></div><div class="field"><label>Notes</label><input name="po_notes"></div><button class="btn btn-blue">CREATE PURCHASE ORDER</button></form></section>
<script>
(function(){const product=document.querySelector('select[name="product_id"]');const price=document.getElementById('unit_price_display');function update(){const option=product.options[product.selectedIndex];price.value=option&&option.dataset.price!==undefined?'₱'+Number(option.dataset.price).toFixed(2):'Select a product';}product.addEventListener('change',update);update();})();
</script>
<h2>Supplier records</h2><div class="table-wrap"><table class="data-table"><thead><tr><th>Supplier</th><th>Contact</th><th>Email / Phone</th><th>Address</th><th>Action</th></tr></thead><tbody><?php foreach($suppliers as $s):?><tr><td><?=e($s['supplier_name'])?></td><td><?=e($s['contact_person']??'')?></td><td><?=e($s['email']??'')?> <br><?=e($s['phone']??'')?></td><td><?=e($s['address']??'')?></td><td><a href="?edit=<?=$s['id']?>">Edit</a></td></tr><?php endforeach;?></tbody></table></div>
<h2>Purchase order delivery tracking</h2><div class="table-wrap"><table class="data-table"><thead><tr><th>PO #</th><th>Supplier</th><th>Product</th><th>Qty</th><th>Cost</th><th>Expected</th><th>Status</th><th>Update</th></tr></thead><tbody><?php foreach($pos as $po):?><tr><td>#<?=$po['id']?></td><td><?=e($po['supplier_name'])?></td><td><?=e($po['product_name'])?></td><td><?php $q=$pdo->prepare('SELECT quantity FROM purchase_order_items WHERE purchase_order_id=?');$q->execute([$po['id']]);echo (int)$q->fetchColumn();?></td><td><?=money($po['total_cost'])?></td><td><?=e($po['expected_date']??'—')?></td><td><?=e($po['status'])?></td><td><form method="post" class="inline-form"><input type="hidden" name="action" value="status"><input type="hidden" name="id" value="<?=$po['id']?>"><select name="status"><?php foreach(['Ordered','In Transit','Delivered','Cancelled'] as $st):?><option <?=$po['status']===$st?'selected':''?>><?=$st?></option><?php endforeach;?></select><button class="btn">Save</button></form></td></tr><?php endforeach;?></tbody></table></div></div><?php include __DIR__.'/../includes/footer.php'; ?>