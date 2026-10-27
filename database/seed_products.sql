-- Shoeskopo demo product seed: 150 products, 3 local image paths per product.
-- Matches the uploaded schema: categories, products, product_images, product_sizes.
-- Safe to re-run: skips products by (name, audience) and skips duplicate image/size paths.
-- Import AFTER the original schema/database dump. Back up your database first.
SET NAMES utf8mb4;
START TRANSACTION;

-- Existing category IDs/slugs are resolved by slug, not hard-coded IDs.
-- This seed expects the five category rows from your current dump.

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike LeBron Witness - Men', 'Nike LeBron Witness for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4195.00, 'assets/images/products/nike-lebron-witness-men/main.jpg', 'men', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike G.T. Cut Academy - Men', 'Nike G.T. Cut Academy for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4545.00, 'assets/images/products/nike-g-t-cut-academy-men/main.jpg', 'men', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Ja 2 - Men', 'Nike Ja 2 for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4895.00, 'assets/images/products/nike-ja-2-men/main.jpg', 'men', 27, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men')
LIMIT 1;

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
SELECT c.id, 'Under Armour Curry Splash - Men', 'Under Armour Curry Splash for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4545.00, 'assets/images/products/under-armour-curry-splash-men/main.jpg', 'men', 26, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma All-Pro Nitro - Men', 'Puma All-Pro Nitro for men in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4895.00, 'assets/images/products/puma-all-pro-nitro-men/main.jpg', 'men', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men')
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
SELECT c.id, 'Nike Mercurial Vapor - Men', 'Nike Mercurial Vapor for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3195.00, 'assets/images/products/nike-mercurial-vapor-men/main.jpg', 'men', 21, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Phantom GX - Men', 'Nike Phantom GX for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3545.00, 'assets/images/products/nike-phantom-gx-men/main.jpg', 'men', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Tiempo Legend - Men', 'Nike Tiempo Legend for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3895.00, 'assets/images/products/nike-tiempo-legend-men/main.jpg', 'men', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men')
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
SELECT c.id, 'Puma Future - Men', 'Puma Future for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3545.00, 'assets/images/products/puma-future-men/main.jpg', 'men', 12, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Future - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Ultra - Men', 'Puma Ultra for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3895.00, 'assets/images/products/puma-ultra-men/main.jpg', 'men', 28, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Mizuno Morelia - Men', 'Mizuno Morelia for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4245.00, 'assets/images/products/mizuno-morelia-men/main.jpg', 'men', 15, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance Furon - Men', 'New Balance Furon for men in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4595.00, 'assets/images/products/new-balance-furon-men/main.jpg', 'men', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Air Force 1 07 - Men', 'Nike Air Force 1 07 for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2995.00, 'assets/images/products/nike-air-force-1-07-men/main.jpg', 'men', 20, 1, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Dunk Low - Men', 'Nike Dunk Low for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3345.00, 'assets/images/products/nike-dunk-low-men/main.jpg', 'men', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men')
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
SELECT c.id, 'New Balance 574 - Men', 'New Balance 574 for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3345.00, 'assets/images/products/new-balance-574-men/main.jpg', 'men', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance 550 - Men', 'New Balance 550 for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/new-balance-550-men/main.jpg', 'men', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Suede Classic - Men', 'Puma Suede Classic for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4045.00, 'assets/images/products/puma-suede-classic-men/main.jpg', 'men', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Converse Chuck Taylor All Star - Men', 'Converse Chuck Taylor All Star for men in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4395.00, 'assets/images/products/converse-chuck-taylor-all-star-men/main.jpg', 'men', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Converse Chuck Taylor All Star - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Pegasus - Men', 'Nike Pegasus for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/nike-pegasus-men/main.jpg', 'men', 13, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Vomero - Men', 'Nike Vomero for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4045.00, 'assets/images/products/nike-vomero-men/main.jpg', 'men', 12, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men')
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
SELECT c.id, 'New Balance Fresh Foam 1080 - Men', 'New Balance Fresh Foam 1080 for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4745.00, 'assets/images/products/new-balance-fresh-foam-1080-men/main.jpg', 'men', 28, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Saucony Ride - Men', 'Saucony Ride for men in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 5095.00, 'assets/images/products/saucony-ride-men/main.jpg', 'men', 13, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Metcon - Men', 'Nike Metcon for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3395.00, 'assets/images/products/nike-metcon-men/main.jpg', 'men', 12, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Free Metcon - Men', 'Nike Free Metcon for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3745.00, 'assets/images/products/nike-free-metcon-men/main.jpg', 'men', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men')
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
SELECT c.id, 'Reebok Nano - Men', 'Reebok Nano for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4795.00, 'assets/images/products/reebok-nano-men/main.jpg', 'men', 12, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Under Armour TriBase Reign - Men', 'Under Armour TriBase Reign for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3395.00, 'assets/images/products/under-armour-tribase-reign-men/main.jpg', 'men', 27, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Fuse - Men', 'Puma Fuse for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3745.00, 'assets/images/products/puma-fuse-men/main.jpg', 'men', 27, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance Minimus - Men', 'New Balance Minimus for men in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4095.00, 'assets/images/products/new-balance-minimus-men/main.jpg', 'men', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men')
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
SELECT c.id, 'Nike Sabrina 2 - Women', 'Nike Sabrina 2 for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4095.00, 'assets/images/products/nike-sabrina-2-women/main.jpg', 'women', 17, 1, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike G.T. Cut Academy - Women', 'Nike G.T. Cut Academy for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4445.00, 'assets/images/products/nike-g-t-cut-academy-women/main.jpg', 'women', 24, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike LeBron Witness - Women', 'Nike LeBron Witness for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4795.00, 'assets/images/products/nike-lebron-witness-women/main.jpg', 'women', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women')
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
SELECT c.id, 'Under Armour Curry Splash - Women', 'Under Armour Curry Splash for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4445.00, 'assets/images/products/under-armour-curry-splash-women/main.jpg', 'women', 28, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma All-Pro Nitro - Women', 'Puma All-Pro Nitro for women in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4795.00, 'assets/images/products/puma-all-pro-nitro-women/main.jpg', 'women', 21, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women')
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
SELECT c.id, 'Nike Mercurial Vapor - Women', 'Nike Mercurial Vapor for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3095.00, 'assets/images/products/nike-mercurial-vapor-women/main.jpg', 'women', 23, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Phantom GX - Women', 'Nike Phantom GX for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3445.00, 'assets/images/products/nike-phantom-gx-women/main.jpg', 'women', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Tiempo Legend - Women', 'Nike Tiempo Legend for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3795.00, 'assets/images/products/nike-tiempo-legend-women/main.jpg', 'women', 21, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women')
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
SELECT c.id, 'Puma Future - Women', 'Puma Future for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3445.00, 'assets/images/products/puma-future-women/main.jpg', 'women', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Future - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Ultra - Women', 'Puma Ultra for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3795.00, 'assets/images/products/puma-ultra-women/main.jpg', 'women', 13, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Mizuno Morelia - Women', 'Mizuno Morelia for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4145.00, 'assets/images/products/mizuno-morelia-women/main.jpg', 'women', 17, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance Furon - Women', 'New Balance Furon for women in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4495.00, 'assets/images/products/new-balance-furon-women/main.jpg', 'women', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Air Force 1 07 - Women', 'Nike Air Force 1 07 for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2895.00, 'assets/images/products/nike-air-force-1-07-women/main.jpg', 'women', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Dunk Low - Women', 'Nike Dunk Low for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3245.00, 'assets/images/products/nike-dunk-low-women/main.jpg', 'women', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women')
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
SELECT c.id, 'New Balance 327 - Women', 'New Balance 327 for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3245.00, 'assets/images/products/new-balance-327-women/main.jpg', 'women', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance 530 - Women', 'New Balance 530 for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3595.00, 'assets/images/products/new-balance-530-women/main.jpg', 'women', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Palermo - Women', 'Puma Palermo for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3945.00, 'assets/images/products/puma-palermo-women/main.jpg', 'women', 15, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Converse Chuck Taylor All Star - Women', 'Converse Chuck Taylor All Star for women in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4295.00, 'assets/images/products/converse-chuck-taylor-all-star-women/main.jpg', 'women', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Converse Chuck Taylor All Star - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Pegasus - Women', 'Nike Pegasus for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3595.00, 'assets/images/products/nike-pegasus-women/main.jpg', 'women', 15, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Vomero - Women', 'Nike Vomero for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3945.00, 'assets/images/products/nike-vomero-women/main.jpg', 'women', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women')
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
SELECT c.id, 'New Balance Fresh Foam 1080 - Women', 'New Balance Fresh Foam 1080 for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4645.00, 'assets/images/products/new-balance-fresh-foam-1080-women/main.jpg', 'women', 13, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Saucony Ride - Women', 'Saucony Ride for women in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4995.00, 'assets/images/products/saucony-ride-women/main.jpg', 'women', 15, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Metcon - Women', 'Nike Metcon for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3295.00, 'assets/images/products/nike-metcon-women/main.jpg', 'women', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Free Metcon - Women', 'Nike Free Metcon for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3645.00, 'assets/images/products/nike-free-metcon-women/main.jpg', 'women', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women')
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
SELECT c.id, 'Reebok Nano - Women', 'Reebok Nano for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4695.00, 'assets/images/products/reebok-nano-women/main.jpg', 'women', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Under Armour TriBase Reign - Women', 'Under Armour TriBase Reign for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3295.00, 'assets/images/products/under-armour-tribase-reign-women/main.jpg', 'women', 12, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Fuse - Women', 'Puma Fuse for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3645.00, 'assets/images/products/puma-fuse-women/main.jpg', 'women', 12, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance Minimus - Women', 'New Balance Minimus for women in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3995.00, 'assets/images/products/new-balance-minimus-women/main.jpg', 'women', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women')
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
SELECT c.id, 'Nike Team Hustle D - Kids', 'Nike Team Hustle D for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3495.00, 'assets/images/products/nike-team-hustle-d-kids/main.jpg', 'kids', 20, 1, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike LeBron Witness Kids - Kids', 'Nike LeBron Witness Kids for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3845.00, 'assets/images/products/nike-lebron-witness-kids-kids/main.jpg', 'kids', 26, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Giannis Immortality Kids - Kids', 'Nike Giannis Immortality Kids for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4195.00, 'assets/images/products/nike-giannis-immortality-kids-kids/main.jpg', 'kids', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Jordan One Take - Kids', 'Nike Jordan One Take for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4545.00, 'assets/images/products/nike-jordan-one-take-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids')
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
SELECT c.id, 'Under Armour Jet - Kids', 'Under Armour Jet for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4195.00, 'assets/images/products/under-armour-jet-kids/main.jpg', 'kids', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Court Rider - Kids', 'Puma Court Rider for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4545.00, 'assets/images/products/puma-court-rider-kids/main.jpg', 'kids', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance Two WXY Kids - Kids', 'New Balance Two WXY Kids for kids in the basketball collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4895.00, 'assets/images/products/new-balance-two-wxy-kids-kids/main.jpg', 'kids', 26, 0, 0.00
FROM categories c
WHERE c.slug = 'basketball'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Jr. Mercurial Vapor - Kids', 'Nike Jr. Mercurial Vapor for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2495.00, 'assets/images/products/nike-jr-mercurial-vapor-kids/main.jpg', 'kids', 26, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Jr. Phantom GX - Kids', 'Nike Jr. Phantom GX for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2845.00, 'assets/images/products/nike-jr-phantom-gx-kids/main.jpg', 'kids', 21, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Jr. Tiempo Legend - Kids', 'Nike Jr. Tiempo Legend for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3195.00, 'assets/images/products/nike-jr-tiempo-legend-kids/main.jpg', 'kids', 24, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids')
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
SELECT c.id, 'Puma Future Play Kids - Kids', 'Puma Future Play Kids for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2845.00, 'assets/images/products/puma-future-play-kids-kids/main.jpg', 'kids', 23, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Ultra Play Kids - Kids', 'Puma Ultra Play Kids for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3195.00, 'assets/images/products/puma-ultra-play-kids-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Mizuno Monarcida Junior - Kids', 'Mizuno Monarcida Junior for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3545.00, 'assets/images/products/mizuno-monarcida-junior-kids/main.jpg', 'kids', 25, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Mizuno Monarcida Junior - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance Furon Dispatch Kids - Kids', 'New Balance Furon Dispatch Kids for kids in the football collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3895.00, 'assets/images/products/new-balance-furon-dispatch-kids-kids/main.jpg', 'kids', 16, 0, 0.00
FROM categories c
WHERE c.slug = 'football'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Court Borough Low - Kids', 'Nike Court Borough Low for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2295.00, 'assets/images/products/nike-court-borough-low-kids/main.jpg', 'kids', 24, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Dunk Low Kids - Kids', 'Nike Dunk Low Kids for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2645.00, 'assets/images/products/nike-dunk-low-kids-kids/main.jpg', 'kids', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids')
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
SELECT c.id, 'New Balance 574 Kids - Kids', 'New Balance 574 Kids for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2645.00, 'assets/images/products/new-balance-574-kids-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance 530 Kids - Kids', 'New Balance 530 Kids for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2995.00, 'assets/images/products/new-balance-530-kids-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Smash - Kids', 'Puma Smash for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3345.00, 'assets/images/products/puma-smash-kids/main.jpg', 'kids', 12, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Converse Chuck Taylor Kids - Kids', 'Converse Chuck Taylor Kids for kids in the lifestyle collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/converse-chuck-taylor-kids-kids/main.jpg', 'kids', 28, 0, 0.00
FROM categories c
WHERE c.slug = 'lifestyle'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Converse Chuck Taylor Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Revolution Kids - Kids', 'Nike Revolution Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2995.00, 'assets/images/products/nike-revolution-kids-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Downshifter Kids - Kids', 'Nike Downshifter Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3345.00, 'assets/images/products/nike-downshifter-kids-kids/main.jpg', 'kids', 23, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids')
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
SELECT c.id, 'New Balance Fresh Foam Arishi Kids - Kids', 'New Balance Fresh Foam Arishi Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3345.00, 'assets/images/products/new-balance-fresh-foam-arishi-kids-kids/main.jpg', 'kids', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'New Balance 680 Kids - Kids', 'New Balance 680 Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3695.00, 'assets/images/products/new-balance-680-kids-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Flyer Runner Kids - Kids', 'Puma Flyer Runner Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4045.00, 'assets/images/products/puma-flyer-runner-kids-kids/main.jpg', 'kids', 24, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Skechers Go Run Kids - Kids', 'Skechers Go Run Kids for kids in the running collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4395.00, 'assets/images/products/skechers-go-run-kids-kids/main.jpg', 'kids', 22, 0, 0.00
FROM categories c
WHERE c.slug = 'running'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Flex Runner - Kids', 'Nike Flex Runner for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 2695.00, 'assets/images/products/nike-flex-runner-kids/main.jpg', 'kids', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Star Runner - Kids', 'Nike Star Runner for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3045.00, 'assets/images/products/nike-star-runner-kids/main.jpg', 'kids', 18, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Nike Team Hustle D - Kids', 'Nike Team Hustle D for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3395.00, 'assets/images/products/nike-team-hustle-d-kids/main.jpg', 'kids', 20, 1, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids')
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

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Under Armour Assert - Kids', 'Under Armour Assert for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3045.00, 'assets/images/products/under-armour-assert-kids/main.jpg', 'kids', 21, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Under Armour Pre-School Surge - Kids', 'Under Armour Pre-School Surge for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3395.00, 'assets/images/products/under-armour-pre-school-surge-kids/main.jpg', 'kids', 14, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Puma Flyer Runner - Kids', 'Puma Flyer Runner for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 3745.00, 'assets/images/products/puma-flyer-runner-kids/main.jpg', 'kids', 19, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids')
LIMIT 1;

INSERT INTO products (category_id, name, description, price, image_url, audience, stock, is_featured, discount_percent)
SELECT c.id, 'Skechers Microspec - Kids', 'Skechers Microspec for kids in the training & gym collection. Designed for everyday comfort and activity, with a supportive fit and versatile styling. Check available sizes and stock before ordering. This is sample catalog copy; verify product specifications before publishing.', 4095.00, 'assets/images/products/skechers-microspec-kids/main.jpg', 'kids', 20, 0, 0.00
FROM categories c
WHERE c.slug = 'training-gym'
  AND NOT EXISTS (SELECT 1 FROM products p WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids')
LIMIT 1;

-- Add three local gallery paths for each seeded product.
-- The files must exist at these paths for photos to display.
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-g-t-cut-academy-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-g-t-cut-academy-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-g-t-cut-academy-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-g-t-cut-academy-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-g-t-cut-academy-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-g-t-cut-academy-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-ja-2-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-ja-2-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-ja-2-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-ja-2-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-ja-2-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-ja-2-men/heel.jpg');

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
SELECT p.id, 'assets/images/products/under-armour-curry-splash-men/main.jpg', 0
FROM products p
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-curry-splash-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-curry-splash-men/side.jpg', 1
FROM products p
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-curry-splash-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-curry-splash-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-curry-splash-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-all-pro-nitro-men/main.jpg', 0
FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-all-pro-nitro-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-all-pro-nitro-men/side.jpg', 1
FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-all-pro-nitro-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-all-pro-nitro-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-all-pro-nitro-men/heel.jpg');

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
SELECT p.id, 'assets/images/products/nike-mercurial-vapor-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-mercurial-vapor-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-mercurial-vapor-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-mercurial-vapor-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-mercurial-vapor-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-mercurial-vapor-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-phantom-gx-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-phantom-gx-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-phantom-gx-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-phantom-gx-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-phantom-gx-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-phantom-gx-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-tiempo-legend-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-tiempo-legend-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-tiempo-legend-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-tiempo-legend-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-tiempo-legend-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-tiempo-legend-men/heel.jpg');

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
SELECT p.id, 'assets/images/products/puma-future-men/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-future-men/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-future-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-men/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-men/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-morelia-men/main.jpg', 0
FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-morelia-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-morelia-men/side.jpg', 1
FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-morelia-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-morelia-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-morelia-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-furon-men/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-furon-men/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-furon-men/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-07-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-07-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-07-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-07-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-07-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-07-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-men/heel.jpg');

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
SELECT p.id, 'assets/images/products/new-balance-574-men/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-574-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-574-men/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-574-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-574-men/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-574-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-550-men/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-550-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-550-men/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-550-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-550-men/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-550-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-suede-classic-men/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-suede-classic-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-suede-classic-men/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-suede-classic-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-suede-classic-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-suede-classic-men/heel.jpg');

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
SELECT p.id, 'assets/images/products/nike-pegasus-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-pegasus-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-pegasus-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-pegasus-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-pegasus-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-pegasus-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-vomero-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-vomero-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-vomero-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-vomero-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-vomero-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-vomero-men/heel.jpg');

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
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-1080-men/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-1080-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-1080-men/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-1080-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-1080-men/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-1080-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/saucony-ride-men/main.jpg', 0
FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/saucony-ride-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/saucony-ride-men/side.jpg', 1
FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/saucony-ride-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/saucony-ride-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/saucony-ride-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-metcon-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-metcon-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-metcon-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-metcon-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-metcon-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-metcon-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-free-metcon-men/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-free-metcon-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-free-metcon-men/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-free-metcon-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-free-metcon-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-free-metcon-men/heel.jpg');

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
SELECT p.id, 'assets/images/products/reebok-nano-men/main.jpg', 0
FROM products p
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/reebok-nano-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/reebok-nano-men/side.jpg', 1
FROM products p
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/reebok-nano-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/reebok-nano-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/reebok-nano-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-tribase-reign-men/main.jpg', 0
FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-tribase-reign-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-tribase-reign-men/side.jpg', 1
FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-tribase-reign-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-tribase-reign-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-tribase-reign-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-fuse-men/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-fuse-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-fuse-men/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-fuse-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-fuse-men/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-fuse-men/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-minimus-men/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-minimus-men/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-minimus-men/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-minimus-men/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-minimus-men/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-minimus-men/heel.jpg');

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
SELECT p.id, 'assets/images/products/nike-sabrina-2-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-sabrina-2-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-sabrina-2-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-sabrina-2-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-sabrina-2-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-sabrina-2-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-g-t-cut-academy-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-g-t-cut-academy-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-g-t-cut-academy-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-g-t-cut-academy-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-g-t-cut-academy-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-g-t-cut-academy-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-women/heel.jpg');

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
SELECT p.id, 'assets/images/products/under-armour-curry-splash-women/main.jpg', 0
FROM products p
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-curry-splash-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-curry-splash-women/side.jpg', 1
FROM products p
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-curry-splash-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-curry-splash-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-curry-splash-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-all-pro-nitro-women/main.jpg', 0
FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-all-pro-nitro-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-all-pro-nitro-women/side.jpg', 1
FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-all-pro-nitro-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-all-pro-nitro-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-all-pro-nitro-women/heel.jpg');

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
SELECT p.id, 'assets/images/products/nike-mercurial-vapor-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-mercurial-vapor-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-mercurial-vapor-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-mercurial-vapor-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-mercurial-vapor-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-mercurial-vapor-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-phantom-gx-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-phantom-gx-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-phantom-gx-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-phantom-gx-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-phantom-gx-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-phantom-gx-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-tiempo-legend-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-tiempo-legend-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-tiempo-legend-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-tiempo-legend-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-tiempo-legend-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-tiempo-legend-women/heel.jpg');

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
SELECT p.id, 'assets/images/products/puma-future-women/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-future-women/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-future-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-women/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-women/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-morelia-women/main.jpg', 0
FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-morelia-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-morelia-women/side.jpg', 1
FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-morelia-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/mizuno-morelia-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/mizuno-morelia-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-furon-women/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-furon-women/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-furon-women/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-07-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-07-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-07-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-07-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-air-force-1-07-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-air-force-1-07-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-women/heel.jpg');

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
SELECT p.id, 'assets/images/products/new-balance-327-women/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-327-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-327-women/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-327-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-327-women/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-327-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-530-women/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-530-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-530-women/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-530-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-530-women/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-530-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-palermo-women/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-palermo-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-palermo-women/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-palermo-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-palermo-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-palermo-women/heel.jpg');

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
SELECT p.id, 'assets/images/products/nike-pegasus-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-pegasus-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-pegasus-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-pegasus-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-pegasus-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-pegasus-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-vomero-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-vomero-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-vomero-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-vomero-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-vomero-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-vomero-women/heel.jpg');

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
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-1080-women/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-1080-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-1080-women/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-1080-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-1080-women/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-1080-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/saucony-ride-women/main.jpg', 0
FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/saucony-ride-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/saucony-ride-women/side.jpg', 1
FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/saucony-ride-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/saucony-ride-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/saucony-ride-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-metcon-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-metcon-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-metcon-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-metcon-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-metcon-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-metcon-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-free-metcon-women/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-free-metcon-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-free-metcon-women/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-free-metcon-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-free-metcon-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-free-metcon-women/heel.jpg');

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
SELECT p.id, 'assets/images/products/reebok-nano-women/main.jpg', 0
FROM products p
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/reebok-nano-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/reebok-nano-women/side.jpg', 1
FROM products p
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/reebok-nano-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/reebok-nano-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/reebok-nano-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-tribase-reign-women/main.jpg', 0
FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-tribase-reign-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-tribase-reign-women/side.jpg', 1
FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-tribase-reign-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-tribase-reign-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-tribase-reign-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-fuse-women/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-fuse-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-fuse-women/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-fuse-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-fuse-women/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-fuse-women/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-minimus-women/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-minimus-women/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-minimus-women/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-minimus-women/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-minimus-women/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-minimus-women/heel.jpg');

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
SELECT p.id, 'assets/images/products/nike-team-hustle-d-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-team-hustle-d-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-team-hustle-d-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-team-hustle-d-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-team-hustle-d-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-team-hustle-d-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-lebron-witness-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-lebron-witness-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-giannis-immortality-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-giannis-immortality-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-giannis-immortality-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-giannis-immortality-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-giannis-immortality-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-giannis-immortality-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jordan-one-take-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jordan-one-take-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jordan-one-take-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jordan-one-take-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jordan-one-take-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jordan-one-take-kids/heel.jpg');

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
SELECT p.id, 'assets/images/products/under-armour-jet-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-jet-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-jet-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-jet-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-jet-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-jet-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-court-rider-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-court-rider-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-court-rider-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-court-rider-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-court-rider-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-court-rider-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-two-wxy-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-two-wxy-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-two-wxy-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-two-wxy-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-two-wxy-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-two-wxy-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-mercurial-vapor-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-mercurial-vapor-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-mercurial-vapor-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-mercurial-vapor-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-mercurial-vapor-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-mercurial-vapor-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-phantom-gx-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-phantom-gx-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-phantom-gx-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-phantom-gx-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-phantom-gx-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-phantom-gx-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-tiempo-legend-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-tiempo-legend-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-tiempo-legend-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-tiempo-legend-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-jr-tiempo-legend-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-jr-tiempo-legend-kids/heel.jpg');

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
SELECT p.id, 'assets/images/products/puma-future-play-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-play-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-future-play-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-play-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-future-play-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-future-play-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-play-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-play-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-play-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-play-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-ultra-play-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-ultra-play-kids-kids/heel.jpg');

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
SELECT p.id, 'assets/images/products/new-balance-furon-dispatch-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-dispatch-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-furon-dispatch-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-dispatch-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-furon-dispatch-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-furon-dispatch-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-court-borough-low-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-court-borough-low-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-court-borough-low-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-court-borough-low-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-court-borough-low-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-court-borough-low-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-dunk-low-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-dunk-low-kids-kids/heel.jpg');

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
SELECT p.id, 'assets/images/products/new-balance-574-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-574-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-574-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-574-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-574-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-574-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-530-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-530-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-530-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-530-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-530-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-530-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-smash-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-smash-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-smash-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-smash-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-smash-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-smash-kids/heel.jpg');

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
SELECT p.id, 'assets/images/products/nike-revolution-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-revolution-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-revolution-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-revolution-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-revolution-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-revolution-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-downshifter-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-downshifter-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-downshifter-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-downshifter-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-downshifter-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-downshifter-kids-kids/heel.jpg');

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
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-arishi-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-arishi-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-arishi-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-arishi-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-fresh-foam-arishi-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-fresh-foam-arishi-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-680-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-680-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-680-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-680-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/new-balance-680-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/new-balance-680-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-flyer-runner-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-flyer-runner-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-flyer-runner-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-flyer-runner-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-flyer-runner-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-flyer-runner-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/skechers-go-run-kids-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/skechers-go-run-kids-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/skechers-go-run-kids-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/skechers-go-run-kids-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/skechers-go-run-kids-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/skechers-go-run-kids-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-flex-runner-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-flex-runner-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-flex-runner-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-flex-runner-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-flex-runner-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-flex-runner-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-star-runner-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-star-runner-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-star-runner-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-star-runner-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-star-runner-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-star-runner-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-team-hustle-d-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-team-hustle-d-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-team-hustle-d-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-team-hustle-d-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/nike-team-hustle-d-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/nike-team-hustle-d-kids/heel.jpg');

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

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-assert-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-assert-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-assert-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-assert-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-assert-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-assert-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-pre-school-surge-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-pre-school-surge-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-pre-school-surge-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-pre-school-surge-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/under-armour-pre-school-surge-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/under-armour-pre-school-surge-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-flyer-runner-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-flyer-runner-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-flyer-runner-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-flyer-runner-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/puma-flyer-runner-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/puma-flyer-runner-kids/heel.jpg');

INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/skechers-microspec-kids/main.jpg', 0
FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/skechers-microspec-kids/main.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/skechers-microspec-kids/side.jpg', 1
FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/skechers-microspec-kids/side.jpg');
INSERT INTO product_images (product_id, image_path, sort_order)
SELECT p.id, 'assets/images/products/skechers-microspec-kids/heel.jpg', 2
FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_images pi WHERE pi.product_id = p.id AND pi.image_path = 'assets/images/products/skechers-microspec-kids/heel.jpg');

-- Add demo sizes. Kids use smaller sample sizes; adult sizes use common US labels.
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike LeBron Witness - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Ja 2 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

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
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Men' AND p.audience = 'men'
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
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Phantom GX - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Men' AND p.audience = 'men'
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
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Puma Future - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Puma Ultra - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Mizuno Morelia - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'New Balance Furon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Dunk Low - Men' AND p.audience = 'men'
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
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'New Balance 574 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'New Balance 550 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Puma Suede Classic - Men' AND p.audience = 'men'
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
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Pegasus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Vomero - Men' AND p.audience = 'men'
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
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Saucony Ride - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Nike Free Metcon - Men' AND p.audience = 'men'
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
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Reebok Nano - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'Puma Fuse - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '12');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '11' FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '11');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '12' FROM products p
WHERE p.name = 'New Balance Minimus - Men' AND p.audience = 'men'
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
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Sabrina 2 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike G.T. Cut Academy - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike LeBron Witness - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

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
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Under Armour Curry Splash - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma All-Pro Nitro - Women' AND p.audience = 'women'
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
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Mercurial Vapor - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Phantom GX - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Tiempo Legend - Women' AND p.audience = 'women'
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
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma Future - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma Ultra - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Mizuno Morelia - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance Furon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Air Force 1 07 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Dunk Low - Women' AND p.audience = 'women'
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
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance 327 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance 530 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma Palermo - Women' AND p.audience = 'women'
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
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Pegasus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Vomero - Women' AND p.audience = 'women'
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
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance Fresh Foam 1080 - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Saucony Ride - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Nike Free Metcon - Women' AND p.audience = 'women'
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
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Reebok Nano - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Under Armour TriBase Reign - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'Puma Fuse - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '10');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '7' FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '7');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '8' FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '8');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '9' FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '9');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '10' FROM products p
WHERE p.name = 'New Balance Minimus - Women' AND p.audience = 'women'
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
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike LeBron Witness Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Giannis Immortality Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Jordan One Take - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

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
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Under Armour Jet - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Court Rider - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance Two WXY Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Jr. Mercurial Vapor - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Jr. Phantom GX - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Jr. Tiempo Legend - Kids' AND p.audience = 'kids'
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
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Future Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Ultra Play Kids - Kids' AND p.audience = 'kids'
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
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance Furon Dispatch Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Court Borough Low - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Dunk Low Kids - Kids' AND p.audience = 'kids'
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
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance 574 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance 530 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Smash - Kids' AND p.audience = 'kids'
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
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Revolution Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Downshifter Kids - Kids' AND p.audience = 'kids'
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
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance Fresh Foam Arishi Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'New Balance 680 Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Flyer Runner Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Skechers Go Run Kids - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Flex Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Star Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Nike Team Hustle D - Kids' AND p.audience = 'kids'
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

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Under Armour Assert - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Under Armour Pre-School Surge - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Puma Flyer Runner - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '1' FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '1');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '2' FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '2');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '3' FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '3');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '4' FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '4');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '5' FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '5');
INSERT INTO product_sizes (product_id, size_label)
SELECT p.id, '6' FROM products p
WHERE p.name = 'Skechers Microspec - Kids' AND p.audience = 'kids'
  AND NOT EXISTS (SELECT 1 FROM product_sizes ps WHERE ps.product_id = p.id AND ps.size_label = '6');

COMMIT;

-- Verify expected catalog count:
-- SELECT audience, COUNT(*) AS product_count FROM products WHERE audience IN ('men','women','kids') GROUP BY audience;