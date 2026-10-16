-- Shoeskopo database normalization and transaction view migration.
-- Product sizes are stored one value per row to avoid comma-separated multi-values.
CREATE TABLE IF NOT EXISTS product_sizes (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  size_label VARCHAR(20) NOT NULL,
  UNIQUE KEY uq_product_size (product_id, size_label),
  CONSTRAINT fk_product_sizes_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Backfill existing comma-separated sizes (supports up to 20 sizes per product).
INSERT IGNORE INTO product_sizes (product_id, size_label)
SELECT p.id, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(p.sizes, ',', seq.n), ',', -1)) AS size_label
FROM products p
JOIN (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
      UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
      UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
      UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20) seq
  ON seq.n <= 1 + LENGTH(COALESCE(p.sizes, '')) - LENGTH(REPLACE(COALESCE(p.sizes, ''), ',', ''))
WHERE TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(p.sizes, ',', seq.n), ',', -1)) <> '';

-- Shoeskopo order transaction details view (safe to re-run on MySQL/MariaDB)
CREATE OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY INVOKER VIEW order_transaction_details AS
SELECT
  o.id AS order_id,
  o.created_at AS order_date,
  o.status AS order_status,
  o.full_name,
  o.phone,
  o.address,
  u.email AS customer_email,
  oi.product_id,
  oi.product_name,
  oi.size,
  oi.quantity,
  oi.unit_price,
  (oi.quantity * oi.unit_price) AS line_subtotal,
  o.total AS grand_total,
  p.payment_method,
  p.payment_status
FROM orders AS o
JOIN users AS u ON u.id = o.user_id
JOIN order_items AS oi ON oi.order_id = o.id
LEFT JOIN payments AS p ON p.order_id = o.id;

-- Normalization note: users, products, categories, orders, order_items, payments,
-- product_images, product_sizes and product_reviews use single-column primary keys.
-- Non-key fields depend on their table's key, not a partial composite key. Order line
-- price/name are intentional purchase-time snapshots for historical receipt accuracy.
