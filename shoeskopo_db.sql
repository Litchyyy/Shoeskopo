-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2026 at 04:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoeskopo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `audience` enum('men','women','kids','all') NOT NULL DEFAULT 'all',
  `slug` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `audience`, `slug`, `created_at`) VALUES
(1, 'Lifestyle', 'all', 'lifestyle', '2026-10-12 10:47:28'),
(3, 'Running', 'all', 'running', '2026-10-12 10:47:28'),
(4, 'Basketball', 'all', 'basketball', '2026-10-12 10:47:28'),
(5, 'Football', 'all', 'football', '2026-10-12 10:47:28'),
(6, 'Training & Gym', 'all', 'training-gym', '2026-10-12 10:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expense_date` date NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_date`, `category`, `description`, `amount`, `created_at`) VALUES
(1, '2026-10-13', 'Supplies', 'Supplier purchase from Adidas [Purchase Order #2]', 3299.00, '2026-10-12 16:03:42'),
(2, '2026-10-13', 'Supplies', 'Supplier purchase from Nike [Purchase Order #3]', 4000.00, '2026-10-13 00:50:45'),
(3, '2026-10-13', 'Marketing', 'Market', 500.00, '2026-10-13 00:51:31'),
(4, '2026-10-13', 'Supplies', 'Supplier purchase from Nike [Purchase Order #4]', 2500.00, '2026-10-13 02:37:31'),
(5, '2026-10-13', 'Supplies', 'Supplier purchase from Nike [Purchase Order #5]', 5998.00, '2026-10-13 02:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `change_qty` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `reference_type` varchar(40) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_logs`
--

INSERT INTO `inventory_logs` (`id`, `product_id`, `change_qty`, `reason`, `reference_type`, `reference_id`, `created_at`) VALUES
(1, 3, 12, 'Stock count adjustment', 'manual', NULL, '2026-10-12 12:48:15'),
(2, 2, 5, 'Stock count adjustment', 'manual', NULL, '2026-10-12 13:01:19'),
(3, 1, -1, 'Customer order', 'order', 1, '2026-10-12 13:04:08'),
(4, 1, -1, 'Customer order', 'order', 2, '2026-10-12 15:00:32'),
(5, 1, -1, 'Customer order', 'order', 3, '2026-10-12 15:23:18'),
(6, 1, 1, 'Supplier delivery', 'purchase_order', 1, '2026-10-12 15:42:04'),
(7, 2, 1, 'Supplier delivery', 'purchase_order', 2, '2026-10-12 16:03:42'),
(8, 4, 10, 'Supplier delivery', 'purchase_order', 3, '2026-10-13 00:50:45'),
(9, 1, -1, 'Employee manual sale', 'order', 4, '2026-10-13 02:09:47'),
(10, 4, 5, 'Supplier delivery', 'purchase_order', 4, '2026-10-13 02:37:31'),
(11, 2, 2, 'Supplier delivery', 'purchase_order', 5, '2026-10-13 02:38:05'),
(12, 2, -1, 'Stock count adjustment', 'manual', NULL, '2026-10-13 02:38:31'),
(13, 4, -1, 'Customer order', 'order', 5, '2026-10-15 15:18:49'),
(14, 5, -1, 'Customer order', 'order', 6, '2026-10-15 15:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('Pending','Processing','Shipped','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `full_name` varchar(160) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `full_name`, `phone`, `address`, `created_at`) VALUES
(1, 2, 3499.00, 'Completed', 'Tsuya Posa', '0987654321', 'BCDA MEDYO HOMEOWNER', '2026-10-12 13:04:08'),
(2, 2, 3499.00, 'Completed', 'tsuya', '123455667787', 'BCDA', '2026-10-12 15:00:32'),
(3, 2, 3499.00, 'Completed', 'tsutsu', '2134214214214', 'BCDA HOME OWNERS', '2026-10-12 15:23:18'),
(4, 3, 3499.00, 'Completed', 'Walk-in Customer', '', 'In-store purchase', '2026-10-13 02:09:47'),
(5, 2, 500.00, 'Completed', 'Tsuya Posa', '0987654321', 'BCDA', '2026-10-15 15:18:49'),
(6, 6, 150.00, 'Completed', 'Jesh Agustin', '0987654321', 'BCDA HOMEOWNERS', '2026-10-15 15:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(180) NOT NULL,
  `size` varchar(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `size`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 'Air Runner One', '8', 1, 3499.00),
(2, 2, 1, 'Air Runner One', '8', 1, 3499.00),
(3, 3, 1, 'Air Runner One', '7', 1, 3499.00),
(4, 4, 1, 'Air Runner One', 'N/A', 1, 3499.00),
(5, 5, 4, 'Stone Age Shoes', '8', 1, 500.00),
(6, 6, 5, '2x2 ng mga gods', '7', 1, 150.00);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_transaction_details`
-- (See below for the actual view)
--
CREATE TABLE `order_transaction_details` (
`order_id` int(11)
,`order_date` timestamp
,`order_status` enum('Pending','Processing','Shipped','Completed','Cancelled')
,`full_name` varchar(160)
,`phone` varchar(40)
,`address` text
,`customer_email` varchar(190)
,`product_id` int(11)
,`product_name` varchar(180)
,`size` varchar(20)
,`quantity` int(11)
,`unit_price` decimal(10,2)
,`line_subtotal` decimal(20,2)
,`grand_total` decimal(10,2)
,`payment_method` varchar(30)
,`payment_status` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(30) NOT NULL DEFAULT 'Cash',
  `payment_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `cash_received` decimal(10,2) NOT NULL DEFAULT 0.00,
  `change_due` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_method`, `payment_status`, `cash_received`, `change_due`, `paid_at`, `created_at`) VALUES
(1, 1, 'Cash', 'Paid', 3499.00, 0.00, '2026-10-12 23:34:08', '2026-10-12 14:41:53'),
(2, 2, 'Cash', 'Paid', 3499.00, 0.00, '2026-10-12 23:34:13', '2026-10-12 15:00:32'),
(3, 3, 'Cash', 'Paid', 3499.00, 0.00, '2026-10-12 23:34:17', '2026-10-12 15:23:18'),
(7, 4, 'Cash', 'Paid', 15000.00, 11501.00, '2026-10-13 10:09:47', '2026-10-13 02:09:47'),
(8, 5, 'Cash', 'Paid', 2000.00, 1500.00, '2026-10-15 23:22:41', '2026-10-15 15:18:49'),
(10, 6, 'Cash', 'Paid', 500.00, 350.00, '2026-10-15 23:26:58', '2026-10-15 15:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `price_logs`
--

CREATE TABLE `price_logs` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `old_price` decimal(10,2) NOT NULL,
  `new_price` decimal(10,2) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(180) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image_url` varchar(500) DEFAULT NULL,
  `audience` enum('men','women','kids','all') NOT NULL DEFAULT 'all',
  `sizes` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `image_url`, `audience`, `sizes`, `stock`, `is_featured`, `created_at`) VALUES
(1, 3, 'Air Runner One', 'Everyday running shoe with a lightweight feel.', 3499.00, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=900', 'men', '7,8,9,10,11', 12, 0, '2026-10-12 10:47:28'),
(2, 1, 'Court Classic', 'Classic court-inspired sneaker for everyday wear.', 2999.00, 'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=900', 'women', '5,6,7,8,9', 19, 1, '2026-10-12 10:47:28'),
(3, 1, 'Street Low Kids', 'Comfortable casual shoe for active days.', 1899.00, 'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=900', 'kids', '1,2,3,4,5', 20, 1, '2026-10-12 10:47:28'),
(4, 3, 'Stone Age Shoes', 'Bahay ng bato', 500.00, 'assets/images/products/product_29c37859bc9459885fbc6df3.jpg', 'men', '7,8,9,10', 19, 1, '2026-10-13 00:36:31'),
(5, 3, '2x2 ng mga gods', '2x2', 150.00, 'assets/images/products/product_d1a0332d22fdc27e90138003.png', 'men', '7,8,9,10,11', 1, 0, '2026-10-15 15:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(500) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `sort_order`, `created_at`) VALUES
(1, 5, 'assets/images/products/product_gallery_caf630f4548e8c3093d3.jpg', 0, '2026-10-15 15:08:38'),
(2, 5, 'assets/images/products/product_gallery_2d90923881e4958610e0.png', 1, '2026-10-15 15:08:38'),
(3, 5, 'assets/images/products/product_gallery_a702e38b4c3e68954db9.jpg', 2, '2026-10-15 15:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `review_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `order_id`, `rating`, `review_text`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3, 5, 'Good products', '2026-10-15 15:20:12', '2026-10-15 15:20:21'),
(2, 4, 2, 5, 1, '**** this product bro', '2026-10-15 15:23:24', '2026-10-15 15:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` enum('Ordered','In Transit','Delivered','Cancelled') NOT NULL DEFAULT 'Ordered',
  `order_date` date NOT NULL,
  `expected_date` date DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `total_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `supplier_id`, `status`, `order_date`, `expected_date`, `delivered_at`, `total_cost`, `notes`, `created_at`) VALUES
(1, 1, 'Delivered', '2026-10-12', '2026-10-12', '2026-10-13 00:02:44', 3299.00, 'Test', '2026-10-12 15:41:57'),
(2, 1, 'Delivered', '2026-10-13', '2026-10-13', '2026-10-13 00:03:42', 3299.00, 'Test2', '2026-10-12 16:03:37'),
(3, 2, 'Delivered', '2026-10-13', '2026-10-13', '2026-10-13 08:50:45', 4000.00, '', '2026-10-13 00:49:38'),
(4, 2, 'Delivered', '2026-10-13', '2026-10-13', '2026-10-13 10:37:31', 2500.00, '', '2026-10-13 02:36:40'),
(5, 2, 'Delivered', '2026-10-13', '2026-10-13', '2026-10-13 10:38:05', 5998.00, '', '2026-10-13 02:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`) VALUES
(1, 1, 1, 1, 3299.00),
(2, 2, 2, 1, 3299.00),
(3, 3, 4, 10, 400.00),
(4, 4, 4, 5, 500.00),
(5, 5, 2, 2, 2999.00);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(180) NOT NULL,
  `contact_person` varchar(160) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `contact_person`, `email`, `phone`, `address`, `notes`, `created_at`) VALUES
(1, 'Adidas', 'Renz Eguin', 'renz@joomla.com', '0987654321', 'Phase 2 Pinagsama', 'Adidas Supplier', '2026-10-12 13:00:00'),
(2, 'Nike', 'Shawn Mendes', 'shawn@joomla.com', '1234567888', 'Nike store', '', '2026-10-13 00:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','employee','customer') NOT NULL DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `full_name` varchar(160) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `role`, `created_at`, `full_name`, `phone`, `address`, `avatar_path`, `is_active`) VALUES
(1, 'iya', 'iya@admin.com', '$2y$10$cqr4lMIVKDfwmxQqcGY0XOK2H345xeZbx2/5hxEMewcaqr8RYx3zq', 'admin', '2026-10-12 10:49:11', 'Jesh Agustin', '0956473821', 'BCDA HOME OWNERS', 'assets/images/profiles/user_1_29327590e5e4.png', 1),
(2, 'Tsuya', 'tsutsu@joomla.com', '$2y$10$OvV6Dh2iUqqjuiDRVOWhQehqc2G.MwVZTjeq8twMNqzqlSJuwFvmK', 'customer', '2026-10-12 13:03:35', '', '', '', 'assets/images/profiles/user_2_d082bdf60a22.jpg', 1),
(3, 'Strawberry', 'costelo@employee.com', '$2y$10$esb1TzDgcOfYFuQnB4EkGu5h0j.JH88IcED9c7ORr.r1LLIgmnoR6', 'customer', '2026-10-13 01:41:44', 'Paulo Costelo', '0987654321', 'TAGA JAN LANG WESTERNS', 'assets/images/profiles/user_3_155ad27035c0.png', 1),
(4, 'Litch', 'litch@admin.com', '$2y$10$rETzF5diugWYwlYq8K3XMuqilNlb9Z2NqrM23lYjFNkWKj8b3.8zq', 'admin', '2026-10-13 02:40:05', 'John Michael', '0956473821', 'BCDA HOME OWNERS', NULL, 1),
(5, 'Shawn sipper', 'shawn@admin.com', '$2y$10$BqK7RWpKKKBx/XA9nqrrgu7ZE4Kt.u/jp2TWjBss3ECrIa9rMVEFm', 'customer', '2026-10-15 15:15:41', NULL, NULL, NULL, NULL, 1),
(6, 'IyaMALOPIT', 'agustin.jeshaiah@gmail.com', '$2y$10$Std7YZOSlAGmcG.5bAROk.kF10HssOikYomZAiweDAethQRPlsGPW', 'customer', '2026-10-15 15:25:48', NULL, NULL, NULL, 'assets/images/profiles/register_5bf725fd1cf0e319f644.png', 1);

-- --------------------------------------------------------

--
-- Structure for view `order_transaction_details`
--
DROP TABLE IF EXISTS `order_transaction_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY INVOKER VIEW `order_transaction_details`  AS SELECT `o`.`id` AS `order_id`, `o`.`created_at` AS `order_date`, `o`.`status` AS `order_status`, `o`.`full_name` AS `full_name`, `o`.`phone` AS `phone`, `o`.`address` AS `address`, `u`.`email` AS `customer_email`, `oi`.`product_id` AS `product_id`, `oi`.`product_name` AS `product_name`, `oi`.`size` AS `size`, `oi`.`quantity` AS `quantity`, `oi`.`unit_price` AS `unit_price`, `oi`.`quantity`* `oi`.`unit_price` AS `line_subtotal`, `o`.`total` AS `grand_total`, `p`.`payment_method` AS `payment_method`, `p`.`payment_status` AS `payment_status` FROM (((`orders` `o` join `users` `u` on(`u`.`id` = `o`.`user_id`)) join `order_items` `oi` on(`oi`.`order_id` = `o`.`id`)) left join `payments` `p` on(`p`.`order_id` = `o`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inventory_product` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_user` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_items_order` (`order_id`),
  ADD KEY `fk_order_items_product` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `price_logs`
--
ALTER TABLE `price_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_price_logs_product` (`product_id`),
  ADD KEY `fk_price_logs_user` (`changed_by`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_category` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_review_buyer_product_order` (`user_id`,`product_id`,`order_id`),
  ADD KEY `fk_reviews_product` (`product_id`),
  ADD KEY `fk_reviews_order` (`order_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_po_supplier` (`supplier_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_poi_po` (`purchase_order_id`),
  ADD KEY `fk_poi_product` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `price_logs`
--
ALTER TABLE `price_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `fk_inventory_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `price_logs`
--
ALTER TABLE `price_logs`
  ADD CONSTRAINT `fk_price_logs_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_price_logs_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `fk_reviews_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_reviews_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_reviews_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `fk_po_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `fk_poi_po` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_poi_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Review photos and videos (added for customer review media support)
CREATE TABLE IF NOT EXISTS `product_review_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `media_path` varchar(500) NOT NULL,
  `media_type` enum('image','video') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_review_media_review_id` (`review_id`),
  CONSTRAINT `fk_review_media_review` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
