-- Shoeskopo product discount support
-- Safe to run more than once in MySQL 8.0+.
SET @has_discount_percent = (
  SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'products'
    AND COLUMN_NAME = 'discount_percent'
);
SET @discount_sql = IF(
  @has_discount_percent = 0,
  'ALTER TABLE products ADD COLUMN discount_percent DECIMAL(5,2) NOT NULL DEFAULT 0',
  'SELECT "discount_percent already exists"'
);
PREPARE discount_stmt FROM @discount_sql;
EXECUTE discount_stmt;
DEALLOCATE PREPARE discount_stmt;
