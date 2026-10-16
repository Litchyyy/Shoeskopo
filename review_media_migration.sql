-- Run this once in phpMyAdmin after selecting the shoeskopo database.
-- Stores photos and videos attached to customer product reviews.
CREATE TABLE IF NOT EXISTS `product_review_media` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `review_id` INT NOT NULL,
  `media_path` VARCHAR(500) NOT NULL,
  `media_type` ENUM('image','video') NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_review_media_review_id` (`review_id`),
  CONSTRAINT `fk_review_media_review` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
