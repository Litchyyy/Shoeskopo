-- Shoeskopo updated product seed: only products NOT in the requested removal list.
-- Import AFTER shoeskopo_db.sql on a fresh database. Safe to re-run.
SET NAMES utf8mb4;
START TRANSACTION;
-- Existing category IDs/slugs are resolved by slug, not hard-coded IDs.
-- This seed expects the five category rows from your current dump.







INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Dame Certified - Men', 'Adidas Dame Certified for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5245.00, 'assets/images/products/adidas-dame-certified-men/main.jpg', 'men', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Harden Stepback - Men', 'Adidas Harden Stepback for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5595.00, 'assets/images/products/adidas-harden-stepback-men/main.jpg', 'men', 23, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas D.O.N. Issue - Men', 'Adidas D.O.N. Issue for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4195.00, 'assets/images/products/adidas-d-o-n-issue-men/main.jpg', 'men', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men')
LIMIT 1;





INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Anta Shock Wave - Men', 'Anta Shock Wave for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5245.00, 'assets/images/products/anta-shock-wave-men/main.jpg', 'men', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Li-Ning Wade All City - Men', 'Li-Ning Wade All City for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5595.00, 'assets/images/products/li-ning-wade-all-city-men/main.jpg', 'men', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men')
LIMIT 1;







INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Predator - Men', 'Adidas Predator for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4245.00, 'assets/images/products/adidas-predator-men/main.jpg', 'men', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas F50 - Men', 'Adidas F50 for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4595.00, 'assets/images/products/adidas-f50-men/main.jpg', 'men', 28, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Copa Pure - Men', 'Adidas Copa Pure for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3195.00, 'assets/images/products/adidas-copa-pure-men/main.jpg', 'men', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men')
LIMIT 1;













INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Air Max 90 - Men', 'Nike Air Max 90 for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/nike-air-max-90-men/main.jpg', 'men', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Samba OG - Men', 'Adidas Samba OG for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4045.00, 'assets/images/products/adidas-samba-og-men/main.jpg', 'men', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Superstar - Men', 'Adidas Superstar for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4395.00, 'assets/images/products/adidas-superstar-men/main.jpg', 'men', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Campus 00s - Men', 'Adidas Campus 00s for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2995.00, 'assets/images/products/adidas-campus-00s-men/main.jpg', 'men', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men')
LIMIT 1;







INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Converse Chuck Taylor All Star - Men', 'Converse Chuck Taylor All Star for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4395.00, 'assets/images/products/converse-chuck-taylor-all-star-men/main.jpg', 'men', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men')
LIMIT 1;





INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Ultraboost - Men', 'Adidas Ultraboost for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4395.00, 'assets/images/products/adidas-ultraboost-men/main.jpg', 'men', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Adizero SL - Men', 'Adidas Adizero SL for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4745.00, 'assets/images/products/adidas-adizero-sl-men/main.jpg', 'men', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'ASICS Gel-Nimbus - Men', 'ASICS Gel-Nimbus for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5095.00, 'assets/images/products/asics-gel-nimbus-men/main.jpg', 'men', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'ASICS Gel-Kayano - Men', 'ASICS Gel-Kayano for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/asics-gel-kayano-men/main.jpg', 'men', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Brooks Ghost - Men', 'Brooks Ghost for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4045.00, 'assets/images/products/brooks-ghost-men/main.jpg', 'men', 13, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Hoka Clifton - Men', 'Hoka Clifton for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4395.00, 'assets/images/products/hoka-clifton-men/main.jpg', 'men', 13, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men')
LIMIT 1;









INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Dropset - Men', 'Adidas Dropset for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4095.00, 'assets/images/products/adidas-dropset-men/main.jpg', 'men', 15, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Rapidmove - Men', 'Adidas Rapidmove for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4445.00, 'assets/images/products/adidas-rapidmove-men/main.jpg', 'men', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men')
LIMIT 1;









INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Inov-8 F-Lite - Men', 'Inov-8 F-Lite for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4445.00, 'assets/images/products/inov-8-f-lite-men/main.jpg', 'men', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'ASICS Gel-Quantum Trainer - Men', 'ASICS Gel-Quantum Trainer for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4795.00, 'assets/images/products/asics-gel-quantum-trainer-men/main.jpg', 'men', 26, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men')
LIMIT 1;







INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Dame Certified - Women', 'Adidas Dame Certified for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5145.00, 'assets/images/products/adidas-dame-certified-women/main.jpg', 'women', 24, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Harden Stepback - Women', 'Adidas Harden Stepback for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5495.00, 'assets/images/products/adidas-harden-stepback-women/main.jpg', 'women', 25, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas D.O.N. Issue - Women', 'Adidas D.O.N. Issue for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4095.00, 'assets/images/products/adidas-d-o-n-issue-women/main.jpg', 'women', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women')
LIMIT 1;





INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Anta Shock Wave - Women', 'Anta Shock Wave for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5145.00, 'assets/images/products/anta-shock-wave-women/main.jpg', 'women', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Li-Ning Wade All City - Women', 'Li-Ning Wade All City for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5495.00, 'assets/images/products/li-ning-wade-all-city-women/main.jpg', 'women', 24, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women')
LIMIT 1;







INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Predator - Women', 'Adidas Predator for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4145.00, 'assets/images/products/adidas-predator-women/main.jpg', 'women', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas F50 - Women', 'Adidas F50 for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4495.00, 'assets/images/products/adidas-f50-women/main.jpg', 'women', 13, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Copa Pure - Women', 'Adidas Copa Pure for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3095.00, 'assets/images/products/adidas-copa-pure-women/main.jpg', 'women', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women')
LIMIT 1;













INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Air Max 90 - Women', 'Nike Air Max 90 for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3595.00, 'assets/images/products/nike-air-max-90-women/main.jpg', 'women', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Samba OG - Women', 'Adidas Samba OG for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3945.00, 'assets/images/products/adidas-samba-og-women/main.jpg', 'women', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Gazelle - Women', 'Adidas Gazelle for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4295.00, 'assets/images/products/adidas-gazelle-women/main.jpg', 'women', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Campus 00s - Women', 'Adidas Campus 00s for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2895.00, 'assets/images/products/adidas-campus-00s-women/main.jpg', 'women', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women')
LIMIT 1;







INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Converse Chuck Taylor All Star - Women', 'Converse Chuck Taylor All Star for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4295.00, 'assets/images/products/converse-chuck-taylor-all-star-women/main.jpg', 'women', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women')
LIMIT 1;





INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Ultraboost - Women', 'Adidas Ultraboost for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4295.00, 'assets/images/products/adidas-ultraboost-women/main.jpg', 'women', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Adizero SL - Women', 'Adidas Adizero SL for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4645.00, 'assets/images/products/adidas-adizero-sl-women/main.jpg', 'women', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'ASICS Gel-Nimbus - Women', 'ASICS Gel-Nimbus for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4995.00, 'assets/images/products/asics-gel-nimbus-women/main.jpg', 'women', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'ASICS Gel-Kayano - Women', 'ASICS Gel-Kayano for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3595.00, 'assets/images/products/asics-gel-kayano-women/main.jpg', 'women', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Brooks Ghost - Women', 'Brooks Ghost for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3945.00, 'assets/images/products/brooks-ghost-women/main.jpg', 'women', 15, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Hoka Clifton - Women', 'Hoka Clifton for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4295.00, 'assets/images/products/hoka-clifton-women/main.jpg', 'women', 15, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women')
LIMIT 1;









INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Dropset - Women', 'Adidas Dropset for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3995.00, 'assets/images/products/adidas-dropset-women/main.jpg', 'women', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Rapidmove - Women', 'Adidas Rapidmove for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4345.00, 'assets/images/products/adidas-rapidmove-women/main.jpg', 'women', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women')
LIMIT 1;









INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Inov-8 F-Lite - Women', 'Inov-8 F-Lite for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4345.00, 'assets/images/products/inov-8-f-lite-women/main.jpg', 'women', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'ASICS Gel-Quantum Trainer - Women', 'ASICS Gel-Quantum Trainer for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4695.00, 'assets/images/products/asics-gel-quantum-trainer-women/main.jpg', 'women', 28, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women')
LIMIT 1;









INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Own The Game - Kids', 'Adidas Own The Game for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4895.00, 'assets/images/products/adidas-own-the-game-kids/main.jpg', 'kids', 21, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Cross Em Up - Kids', 'Adidas Cross Em Up for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3495.00, 'assets/images/products/adidas-cross-em-up-kids/main.jpg', 'kids', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Dame Certified Kids - Kids', 'Adidas Dame Certified Kids for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3845.00, 'assets/images/products/adidas-dame-certified-kids-kids/main.jpg', 'kids', 28, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids')
LIMIT 1;













INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Predator Club Kids - Kids', 'Adidas Predator Club Kids for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3545.00, 'assets/images/products/adidas-predator-club-kids-kids/main.jpg', 'kids', 27, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas F50 Club Kids - Kids', 'Adidas F50 Club Kids for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3895.00, 'assets/images/products/adidas-f50-club-kids-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Copa Pure Kids - Kids', 'Adidas Copa Pure Kids for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2495.00, 'assets/images/products/adidas-copa-pure-kids-kids/main.jpg', 'kids', 23, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids')
LIMIT 1;





INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Mizuno Monarcida Junior - Kids', 'Mizuno Monarcida Junior for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3545.00, 'assets/images/products/mizuno-monarcida-junior-kids/main.jpg', 'kids', 25, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids')
LIMIT 1;







INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Air Force 1 Kids - Kids', 'Nike Air Force 1 Kids for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2995.00, 'assets/images/products/nike-air-force-1-kids-kids/main.jpg', 'kids', 23, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Grand Court - Kids', 'Adidas Grand Court for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3345.00, 'assets/images/products/adidas-grand-court-kids/main.jpg', 'kids', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Superstar Kids - Kids', 'Adidas Superstar Kids for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/adidas-superstar-kids-kids/main.jpg', 'kids', 23, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Run 70s - Kids', 'Adidas Run 70s for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2295.00, 'assets/images/products/adidas-run-70s-kids/main.jpg', 'kids', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids')
LIMIT 1;







INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Converse Chuck Taylor Kids - Kids', 'Converse Chuck Taylor Kids for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/converse-chuck-taylor-kids-kids/main.jpg', 'kids', 28, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids')
LIMIT 1;





INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Runfalcon Kids - Kids', 'Adidas Runfalcon Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/adidas-runfalcon-kids-kids/main.jpg', 'kids', 23, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Duramo Kids - Kids', 'Adidas Duramo Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4045.00, 'assets/images/products/adidas-duramo-kids-kids/main.jpg', 'kids', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'ASICS Contend Kids - Kids', 'ASICS Contend Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4395.00, 'assets/images/products/asics-contend-kids-kids/main.jpg', 'kids', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'ASICS GT-1000 Kids - Kids', 'ASICS GT-1000 Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2995.00, 'assets/images/products/asics-gt-1000-kids-kids/main.jpg', 'kids', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids')
LIMIT 1;















INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Tensaur Sport - Kids', 'Adidas Tensaur Sport for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3745.00, 'assets/images/products/adidas-tensaur-sport-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas FortaRun - Kids', 'Adidas FortaRun for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4095.00, 'assets/images/products/adidas-fortarun-kids/main.jpg', 'kids', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Adidas Rapid Court - Kids', 'Adidas Rapid Court for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2695.00, 'assets/images/products/adidas-rapid-court-kids/main.jpg', 'kids', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids')
LIMIT 1;









-- Add three local gallery paths for each seeded product.
-- The files must exist at these paths for photos to display.












INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-harden-stepback-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-harden-stepback-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-harden-stepback-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-harden-stepback-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-harden-stepback-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-harden-stepback-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-d-o-n-issue-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-d-o-n-issue-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-d-o-n-issue-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-d-o-n-issue-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-d-o-n-issue-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-d-o-n-issue-men/heel.jpg');









INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/anta-shock-wave-men/main.jpg', 0
FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/anta-shock-wave-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/anta-shock-wave-men/side.jpg', 1
FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/anta-shock-wave-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/anta-shock-wave-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/anta-shock-wave-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/li-ning-wade-all-city-men/main.jpg', 0
FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/li-ning-wade-all-city-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/li-ning-wade-all-city-men/side.jpg', 1
FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/li-ning-wade-all-city-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/li-ning-wade-all-city-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/li-ning-wade-all-city-men/heel.jpg');













INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-men/heel.jpg');

























INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-max-90-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-max-90-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-max-90-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-max-90-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-max-90-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-max-90-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-samba-og-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-samba-og-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-samba-og-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-samba-og-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-samba-og-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-samba-og-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-superstar-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-superstar-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-superstar-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-superstar-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-superstar-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-superstar-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-campus-00s-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-campus-00s-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-campus-00s-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-campus-00s-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-campus-00s-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-campus-00s-men/heel.jpg');













INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-all-star-men/main.jpg', 0
FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-all-star-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-all-star-men/side.jpg', 1
FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-all-star-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-all-star-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-all-star-men/heel.jpg');









INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-ultraboost-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-ultraboost-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-ultraboost-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-ultraboost-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-ultraboost-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-ultraboost-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-adizero-sl-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-adizero-sl-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-adizero-sl-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-adizero-sl-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-adizero-sl-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-adizero-sl-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-nimbus-men/main.jpg', 0
FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-nimbus-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-nimbus-men/side.jpg', 1
FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-nimbus-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-nimbus-men/heel.jpg', 2
FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-nimbus-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-kayano-men/main.jpg', 0
FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-kayano-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-kayano-men/side.jpg', 1
FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-kayano-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-kayano-men/heel.jpg', 2
FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-kayano-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/brooks-ghost-men/main.jpg', 0
FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/brooks-ghost-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/brooks-ghost-men/side.jpg', 1
FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/brooks-ghost-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/brooks-ghost-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/brooks-ghost-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/hoka-clifton-men/main.jpg', 0
FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/hoka-clifton-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/hoka-clifton-men/side.jpg', 1
FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/hoka-clifton-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/hoka-clifton-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/hoka-clifton-men/heel.jpg');

















INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dropset-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dropset-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dropset-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dropset-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dropset-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dropset-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapidmove-men/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapidmove-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapidmove-men/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapidmove-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapidmove-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapidmove-men/heel.jpg');

















INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/inov-8-f-lite-men/main.jpg', 0
FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/inov-8-f-lite-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/inov-8-f-lite-men/side.jpg', 1
FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/inov-8-f-lite-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/inov-8-f-lite-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/inov-8-f-lite-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-quantum-trainer-men/main.jpg', 0
FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-quantum-trainer-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-quantum-trainer-men/side.jpg', 1
FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-quantum-trainer-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-quantum-trainer-men/heel.jpg', 2
FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-quantum-trainer-men/heel.jpg');













INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-harden-stepback-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-harden-stepback-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-harden-stepback-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-harden-stepback-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-harden-stepback-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-harden-stepback-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-d-o-n-issue-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-d-o-n-issue-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-d-o-n-issue-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-d-o-n-issue-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-d-o-n-issue-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-d-o-n-issue-women/heel.jpg');









INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/anta-shock-wave-women/main.jpg', 0
FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/anta-shock-wave-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/anta-shock-wave-women/side.jpg', 1
FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/anta-shock-wave-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/anta-shock-wave-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/anta-shock-wave-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/li-ning-wade-all-city-women/main.jpg', 0
FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/li-ning-wade-all-city-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/li-ning-wade-all-city-women/side.jpg', 1
FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/li-ning-wade-all-city-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/li-ning-wade-all-city-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/li-ning-wade-all-city-women/heel.jpg');













INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-women/heel.jpg');

























INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-max-90-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-max-90-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-max-90-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-max-90-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-max-90-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-max-90-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-samba-og-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-samba-og-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-samba-og-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-samba-og-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-samba-og-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-samba-og-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-gazelle-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-gazelle-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-gazelle-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-gazelle-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-gazelle-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-gazelle-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-campus-00s-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-campus-00s-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-campus-00s-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-campus-00s-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-campus-00s-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-campus-00s-women/heel.jpg');













INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-all-star-women/main.jpg', 0
FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-all-star-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-all-star-women/side.jpg', 1
FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-all-star-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-all-star-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-all-star-women/heel.jpg');









INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-ultraboost-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-ultraboost-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-ultraboost-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-ultraboost-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-ultraboost-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-ultraboost-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-adizero-sl-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-adizero-sl-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-adizero-sl-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-adizero-sl-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-adizero-sl-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-adizero-sl-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-nimbus-women/main.jpg', 0
FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-nimbus-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-nimbus-women/side.jpg', 1
FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-nimbus-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-nimbus-women/heel.jpg', 2
FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-nimbus-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-kayano-women/main.jpg', 0
FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-kayano-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-kayano-women/side.jpg', 1
FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-kayano-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-kayano-women/heel.jpg', 2
FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-kayano-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/brooks-ghost-women/main.jpg', 0
FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/brooks-ghost-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/brooks-ghost-women/side.jpg', 1
FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/brooks-ghost-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/brooks-ghost-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/brooks-ghost-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/hoka-clifton-women/main.jpg', 0
FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/hoka-clifton-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/hoka-clifton-women/side.jpg', 1
FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/hoka-clifton-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/hoka-clifton-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/hoka-clifton-women/heel.jpg');

















INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dropset-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dropset-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dropset-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dropset-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dropset-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dropset-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapidmove-women/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapidmove-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapidmove-women/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapidmove-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapidmove-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapidmove-women/heel.jpg');

















INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/inov-8-f-lite-women/main.jpg', 0
FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/inov-8-f-lite-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/inov-8-f-lite-women/side.jpg', 1
FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/inov-8-f-lite-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/inov-8-f-lite-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/inov-8-f-lite-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-quantum-trainer-women/main.jpg', 0
FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-quantum-trainer-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-quantum-trainer-women/side.jpg', 1
FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-quantum-trainer-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gel-quantum-trainer-women/heel.jpg', 2
FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gel-quantum-trainer-women/heel.jpg');

















INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-own-the-game-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-own-the-game-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-own-the-game-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-own-the-game-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-own-the-game-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-own-the-game-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-cross-em-up-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-cross-em-up-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-cross-em-up-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-cross-em-up-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-cross-em-up-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-cross-em-up-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-dame-certified-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-dame-certified-kids-kids/heel.jpg');

























INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-club-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-club-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-club-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-club-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-predator-club-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-predator-club-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-club-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-club-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-club-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-club-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-f50-club-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-f50-club-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-copa-pure-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-copa-pure-kids-kids/heel.jpg');









INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-monarcida-junior-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-monarcida-junior-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-monarcida-junior-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-monarcida-junior-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-monarcida-junior-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-monarcida-junior-kids/heel.jpg');













INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-grand-court-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-grand-court-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-grand-court-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-grand-court-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-grand-court-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-grand-court-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-superstar-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-superstar-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-superstar-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-superstar-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-superstar-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-superstar-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-run-70s-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-run-70s-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-run-70s-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-run-70s-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-run-70s-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-run-70s-kids/heel.jpg');













INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/converse-chuck-taylor-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/converse-chuck-taylor-kids-kids/heel.jpg');









INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-runfalcon-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-runfalcon-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-runfalcon-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-runfalcon-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-runfalcon-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-runfalcon-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-duramo-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-duramo-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-duramo-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-duramo-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-duramo-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-duramo-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-contend-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-contend-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-contend-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-contend-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-contend-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-contend-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gt-1000-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gt-1000-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gt-1000-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gt-1000-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/asics-gt-1000-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/asics-gt-1000-kids-kids/heel.jpg');





























INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-tensaur-sport-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-tensaur-sport-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-tensaur-sport-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-tensaur-sport-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-tensaur-sport-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-tensaur-sport-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-fortarun-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-fortarun-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-fortarun-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-fortarun-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-fortarun-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-fortarun-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapid-court-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapid-court-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapid-court-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapid-court-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/adidas-rapid-court-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/adidas-rapid-court-kids/heel.jpg');

















-- Add demo sizes. Kids use smaller sample sizes; adult sizes use common US labels.





















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Dame Certified - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Anta Shock Wave - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');






















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Predator - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas F50 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Copa Pure - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');











































INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Air Max 90 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Samba OG - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Superstar - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Campus 00s - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');






















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Ultraboost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Adizero SL - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Brooks Ghost - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Hoka Clifton - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');





























INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Dropset - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Adidas Rapidmove - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');





























INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');






















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Dame Certified - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Harden Stepback - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas D.O.N. Issue - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Anta Shock Wave - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Li-Ning Wade All City - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');






















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Predator - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas F50 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Copa Pure - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');











































INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Air Max 90 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Samba OG - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Gazelle - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Campus 00s - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');






















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Ultraboost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Adizero SL - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'ASICS Gel-Nimbus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'ASICS Gel-Kayano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Brooks Ghost - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Hoka Clifton - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');





























INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Dropset - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Adidas Rapidmove - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');





























INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Inov-8 F-Lite - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'ASICS Gel-Quantum Trainer - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');





























INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Own The Game - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Cross Em Up - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Dame Certified Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');











































INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Predator Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas F50 Club Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Copa Pure Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');






















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Air Force 1 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Grand Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Superstar Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Run 70s - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');






















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');















INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Runfalcon Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Duramo Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'ASICS Contend Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'ASICS GT-1000 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');


















































INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Tensaur Sport - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas FortaRun - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Adidas Rapid Court - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');





























COMMIT;

-- Verify expected catalog count:
-- SELECT audience, COUNT(*) AS product_count FROM products WHERE audience IN ('men','women','kids') GROUP BY audience;
COMMIT;
