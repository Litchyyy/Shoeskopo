-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2026 at 04:13 PM
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
-- Table structure for table `customer_cart_items`
--

CREATE TABLE `customer_cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image_url` varchar(500) DEFAULT NULL,
  `size` varchar(50) NOT NULL DEFAULT '',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_cart_items`
--

INSERT INTO `customer_cart_items` (`id`, `user_id`, `product_id`, `product_name`, `price`, `image_url`, `size`, `quantity`, `updated_at`) VALUES
(41, 12, 1, 'Air Runner One', 3499.00, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=900', '8', 1, '2026-10-21 06:00:53');

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
(14, 5, -1, 'Customer order', 'order', 6, '2026-10-15 15:26:26'),
(15, 4, -1, 'Customer order', 'order', 7, '2026-10-16 14:19:08'),
(16, 4, -1, 'Customer order', 'order', 8, '2026-10-16 14:34:47'),
(17, 4, -1, 'Customer order', 'order', 9, '2026-10-16 14:37:13'),
(18, 5, -1, 'Customer order', 'order', 10, '2026-10-16 15:00:54'),
(19, 1, -2, 'Customer order', 'order', 11, '2026-10-17 09:03:58'),
(20, 3, -1, 'Customer order', 'order', 12, '2026-10-17 09:07:34'),
(21, 4, -1, 'Customer order', 'order', 13, '2026-10-17 09:25:05'),
(22, 2, -1, 'Customer order', 'order', 14, '2026-10-17 09:34:22'),
(23, 2, -1, 'Customer order', 'order', 15, '2026-10-17 09:37:00'),
(24, 3, -1, 'Customer order', 'order', 16, '2026-10-17 09:43:01'),
(25, 2, -1, 'Customer order', 'order', 17, '2026-10-17 16:06:46'),
(26, 4, -1, 'Customer order', 'order', 18, '2026-10-17 16:21:03'),
(27, 1, -1, 'Customer order', 'order', 19, '2026-10-17 16:33:39'),
(28, 4, -1, 'Customer order', 'order', 20, '2026-10-17 16:57:30'),
(29, 4, -1, 'Customer order', 'order', 21, '2026-10-17 17:01:20'),
(30, 1, -1, 'Customer order', 'order', 22, '2026-10-17 17:07:11'),
(31, 3, -1, 'Customer order', 'order', 23, '2026-10-17 17:24:12'),
(32, 3, -1, 'Customer order', 'order', 24, '2026-10-17 17:30:18'),
(33, 2, -1, 'Customer order', 'order', 25, '2026-10-17 17:52:32'),
(34, 4, -1, 'Customer order', 'order', 26, '2026-10-17 17:53:29'),
(35, 4, -1, 'Customer order', 'order', 27, '2026-10-18 15:39:08'),
(36, 1, -1, 'Customer order', 'order', 28, '2026-10-18 15:40:36'),
(37, 4, -2, 'Customer order', 'order', 29, '2026-10-18 15:51:00'),
(38, 4, -1, 'Customer order', 'order', 30, '2026-10-18 15:57:34'),
(39, 2, -1, 'Customer order', 'order', 31, '2026-10-18 16:04:43'),
(40, 2, -1, 'Customer order', 'order', 32, '2026-10-18 16:14:28'),
(41, 4, -1, 'Customer order', 'order', 33, '2026-10-18 16:19:26'),
(42, 4, -1, 'Customer order', 'order', 34, '2026-10-18 16:24:23'),
(43, 3, -1, 'Customer order', 'order', 35, '2026-10-19 16:24:19'),
(44, 4, -1, 'Customer order', 'order', 36, '2026-10-19 16:28:03'),
(45, 4, -1, 'Customer order', 'order', 37, '2026-10-19 16:33:23'),
(46, 4, -1, 'Customer order', 'order', 38, '2026-10-19 16:40:17'),
(47, 4, -2, 'Customer order', 'order', 39, '2026-10-19 17:06:02'),
(48, 1, -1, 'Customer order', 'order', 39, '2026-10-19 17:06:02'),
(49, 1, -1, 'Customer order', 'order', 40, '2026-10-19 17:14:51'),
(50, 2, -1, 'Customer order', 'order', 41, '2026-10-21 05:11:44'),
(51, 3, -1, 'Customer order', 'order', 41, '2026-10-21 05:11:44'),
(52, 3, -5, 'Customer order', 'order', 42, '2026-10-21 05:49:40'),
(53, 1, -1, 'Customer order', 'order', 43, '2026-10-22 14:43:34');

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
(6, 6, 150.00, 'Completed', 'Jesh Agustin', '0987654321', 'BCDA HOMEOWNERS', '2026-10-15 15:26:26'),
(7, 8, 500.00, 'Completed', 'Johnmichael Sabulao', '0956473821', 'BCDA', '2026-10-16 14:19:08'),
(8, 2, 500.00, 'Completed', 'Tsuya Posa', '0987654321', 'BCDAAAAAAAAA', '2026-10-16 14:34:47'),
(9, 6, 500.00, 'Completed', 'iyabebels', '0987654321', 'dadadada', '2026-10-16 14:37:13'),
(10, 6, 150.00, 'Completed', 'JESH', '12321421412', 'BCDA', '2026-10-16 15:00:54'),
(11, 2, 6998.00, 'Completed', 'Tsuya Posa', '0987654321', 'BCDA', '2026-10-17 09:03:58'),
(12, 5, 1899.00, 'Completed', 'Shawn mendes', '0987654321', 'KATIPUNERO', '2026-10-17 09:07:34'),
(13, 2, 500.00, 'Completed', 'Tsuya Posa', '0987654321', 'BCDA', '2026-10-17 09:25:05'),
(14, 6, 2999.00, 'Completed', 'iyabebels', '12321421412', 'BCDA', '2026-10-17 09:34:22'),
(15, 2, 2999.00, 'Completed', 'Tsuya Posa', '0987654321', 'BCDA', '2026-10-17 09:37:00'),
(16, 6, 1899.00, 'Completed', 'iyabebels', '12321421412', 'BCDA', '2026-10-17 09:43:01'),
(17, 6, 2999.00, 'Completed', 'Iya agustin', '0987654321', 'BCDA', '2026-10-17 16:06:46'),
(18, 6, 500.00, 'Completed', 'iyabebels', '0956473821', 'BCDA', '2026-10-17 16:21:03'),
(19, 6, 3499.00, 'Completed', 'iyabebels', '0987654321', 'BCDAAAAAA', '2026-10-17 16:33:39'),
(20, 6, 500.00, 'Completed', 'Iya agustin', '0987654321', 'BCDA', '2026-10-17 16:57:30'),
(21, 6, 500.00, 'Completed', 'Iya agustin', '12321421412', 'BCDA', '2026-10-17 17:01:20'),
(22, 6, 3499.00, 'Completed', 'IYAAAA', '123455667787', '123', '2026-10-17 17:07:11'),
(23, 6, 1899.00, 'Completed', 'iyabels', '0987654321', 'BCDA', '2026-10-17 17:24:12'),
(24, 6, 1899.00, 'Completed', 'Iya agustin', '0987654321', 'BCDA HOMEOWNERS', '2026-10-17 17:30:18'),
(25, 6, 2999.00, 'Completed', 'Iyabels', '12321421412', 'BCDA', '2026-10-17 17:52:32'),
(26, 6, 500.00, 'Completed', 'iyabels', '0987654321', 'BCDA', '2026-10-17 17:53:29'),
(27, 10, 500.00, 'Completed', 'Jesh Agustin', '0987654321', 'BCDA', '2026-10-18 15:39:08'),
(28, 6, 3499.00, 'Completed', 'Jesh Agustin', '12321421412', 'BCDA', '2026-10-18 15:40:36'),
(29, 6, 1000.00, 'Completed', 'Jesh Agustin', '0987654321', 'BCDA HOMEOWNERS', '2026-10-18 15:51:00'),
(30, 6, 500.00, 'Completed', 'Jesh Agustin', '12321421412', 'BCDA1', '2026-10-18 15:57:34'),
(31, 6, 2999.00, 'Completed', 'Jesh Agustin', '0987654321', 'BCDA', '2026-10-18 16:04:43'),
(32, 6, 2999.00, 'Completed', 'Jesh Agustin', '0987654321', 'BCDA', '2026-10-18 16:14:28'),
(33, 6, 500.00, 'Completed', 'jes', '0987654321', 'DADSWS', '2026-10-18 16:19:26'),
(34, 6, 500.00, 'Completed', 'Jesh Agustin', '12321421412', 'bcda', '2026-10-18 16:24:23'),
(35, 5, 1899.00, 'Processing', 'Shawn mendes', '0987654321', 'KATIPUNAN', '2026-10-19 16:24:19'),
(36, 5, 500.00, 'Completed', 'Shawn mendes', '0956473821', 'KATIPUNAN', '2026-10-19 16:28:03'),
(37, 6, 500.00, 'Completed', 'iyabebels', '0987654321', 'BCDA', '2026-10-19 16:33:23'),
(38, 6, 500.00, 'Completed', 'Iya agustin', '0987654321', 'BCDA', '2026-10-19 16:40:17'),
(39, 6, 4499.00, 'Completed', 'Iya agustin', '0987654321', 'BCDA', '2026-10-19 17:06:02'),
(40, 6, 3499.00, 'Completed', 'Iya agustin', '12321421412', 'BCDA', '2026-10-19 17:14:51'),
(41, 6, 3918.40, 'Completed', 'Johnmichael Sabulao', '12321421412', 'BCDA', '2026-10-21 05:11:44'),
(42, 12, 9495.00, 'Completed', 'iya', 'iya', '12', '2026-10-21 05:49:40'),
(43, 6, 2799.20, 'Completed', 'Iyabels', '12321421412', 'BCDA HOMEOWNERS', '2026-10-22 14:43:34');

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
(6, 6, 5, '2x2 ng mga gods', '7', 1, 150.00),
(7, 7, 4, 'Stone Age Shoes', '9', 1, 500.00),
(8, 8, 4, 'Stone Age Shoes', '9', 1, 500.00),
(9, 9, 4, 'Stone Age Shoes', '10', 1, 500.00),
(10, 10, 5, '2x2 ng mga gods', '7', 1, 150.00),
(11, 11, 1, 'Air Runner One', '10', 2, 3499.00),
(12, 12, 3, 'Street Low Kids', '1', 1, 1899.00),
(13, 13, 4, 'Stone Age Shoes', '9', 1, 500.00),
(14, 14, 2, 'Court Classic', '5', 1, 2999.00),
(15, 15, 2, 'Court Classic', '7', 1, 2999.00),
(16, 16, 3, 'Street Low Kids', '1', 1, 1899.00),
(17, 17, 2, 'Court Classic', '6', 1, 2999.00),
(18, 18, 4, 'Stone Age Shoes', '8', 1, 500.00),
(19, 19, 1, 'Air Runner One', '8', 1, 3499.00),
(20, 20, 4, 'Stone Age Shoes', '8', 1, 500.00),
(21, 21, 4, 'Stone Age Shoes', '9', 1, 500.00),
(22, 22, 1, 'Air Runner One', '10', 1, 3499.00),
(23, 23, 3, 'Street Low Kids', '3', 1, 1899.00),
(24, 24, 3, 'Street Low Kids', '2', 1, 1899.00),
(25, 25, 2, 'Court Classic', '6', 1, 2999.00),
(26, 26, 4, 'Stone Age Shoes', '7', 1, 500.00),
(27, 27, 4, 'Stone Age Shoes', '10', 1, 500.00),
(28, 28, 1, 'Air Runner One', '8', 1, 3499.00),
(29, 29, 4, 'Stone Age Shoes', '10', 2, 500.00),
(30, 30, 4, 'Stone Age Shoes', '10', 1, 500.00),
(31, 31, 2, 'Court Classic', '5', 1, 2999.00),
(32, 32, 2, 'Court Classic', '6', 1, 2999.00),
(33, 33, 4, 'Stone Age Shoes', '8', 1, 500.00),
(34, 34, 4, 'Stone Age Shoes', '8', 1, 500.00),
(35, 35, 3, 'Street Low Kids', '3', 1, 1899.00),
(36, 36, 4, 'Stone Age Shoes', '8', 1, 500.00),
(37, 37, 4, 'Stone Age Shoes', '9', 1, 500.00),
(38, 38, 4, 'Stone Age Shoes', '7', 1, 500.00),
(39, 39, 4, 'Stone Age Shoes', '7', 2, 500.00),
(40, 39, 1, 'Air Runner One', '7', 1, 3499.00),
(41, 40, 1, 'Air Runner One', '8', 1, 3499.00),
(42, 41, 2, 'Court Classic', '5', 1, 2999.00),
(43, 41, 3, 'Street Low Kids', '2', 1, 1899.00),
(44, 42, 3, 'Street Low Kids', '4', 5, 1899.00),
(45, 43, 1, 'Air Runner One', '7', 1, 3499.00);

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
(10, 6, 'Cash', 'Paid', 500.00, 350.00, '2026-10-15 23:26:58', '2026-10-15 15:26:26'),
(12, 7, 'Cash', 'Paid', 1000.00, 500.00, '2026-10-16 22:19:34', '2026-10-16 14:19:08'),
(14, 8, 'Cash', 'Paid', 1000.00, 500.00, '2026-10-16 22:35:30', '2026-10-16 14:34:47'),
(17, 9, 'Cash', 'Paid', 1000.00, 500.00, '2026-10-16 22:37:26', '2026-10-16 14:37:13'),
(19, 10, 'Cash', 'Paid', 1999.00, 1849.00, '2026-10-16 23:01:07', '2026-10-16 15:00:54'),
(21, 11, 'Cash', 'Paid', 7000.00, 2.00, '2026-10-17 17:03:58', '2026-10-17 09:03:58'),
(22, 12, 'Cash', 'Paid', 1899.00, 0.00, '2026-10-17 17:07:34', '2026-10-17 09:07:34'),
(23, 13, 'Cash', 'Paid', 1000.00, 500.00, '2026-10-17 17:25:05', '2026-10-17 09:25:05'),
(24, 14, 'Cash', 'Paid', 2999.00, 0.00, '2026-10-17 17:34:22', '2026-10-17 09:34:22'),
(25, 15, 'Cash', 'Paid', 2999.00, 0.00, '2026-10-17 17:37:00', '2026-10-17 09:37:00'),
(26, 16, 'Cash', 'Paid', 1899.00, 0.00, '2026-10-17 17:43:01', '2026-10-17 09:43:01'),
(27, 17, 'Cash', 'Paid', 2999.00, 0.00, '2026-10-18 00:06:46', '2026-10-17 16:06:46'),
(28, 18, 'Cash', 'Paid', 500.00, 0.00, '2026-10-18 00:21:03', '2026-10-17 16:21:03'),
(29, 19, 'Cash', 'Paid', 3499.00, 0.00, '2026-10-18 00:33:39', '2026-10-17 16:33:39'),
(30, 20, 'Cash', 'Paid', 500.00, 0.00, '2026-10-18 00:57:30', '2026-10-17 16:57:30'),
(31, 21, 'Cash', 'Paid', 500.00, 0.00, '2026-10-18 01:01:20', '2026-10-17 17:01:20'),
(32, 22, 'Cash', 'Paid', 3499.00, 0.00, '2026-10-18 01:07:11', '2026-10-17 17:07:11'),
(33, 23, 'Cash', 'Paid', 1899.00, 0.00, '2026-10-18 01:24:12', '2026-10-17 17:24:12'),
(34, 24, 'Cash', 'Paid', 1899.00, 0.00, '2026-10-18 01:30:18', '2026-10-17 17:30:18'),
(35, 25, 'Cash', 'Paid', 2999.00, 0.00, '2026-10-18 01:52:32', '2026-10-17 17:52:32'),
(36, 26, 'Cash', 'Paid', 500.00, 0.00, '2026-10-18 01:53:29', '2026-10-17 17:53:29'),
(37, 27, 'Cash', 'Paid', 500.00, 0.00, '2026-10-18 23:39:08', '2026-10-18 15:39:08'),
(38, 28, 'Cash', 'Paid', 3499.00, 0.00, '2026-10-18 23:40:36', '2026-10-18 15:40:36'),
(39, 29, 'Cash', 'Paid', 1000.00, 0.00, '2026-10-18 23:51:00', '2026-10-18 15:51:00'),
(40, 30, 'Cash', 'Paid', 500.00, 0.00, '2026-10-18 23:57:34', '2026-10-18 15:57:34'),
(41, 31, 'Cash', 'Paid', 2999.00, 0.00, '2026-10-19 00:04:43', '2026-10-18 16:04:43'),
(42, 32, 'Cash', 'Paid', 2999.00, 0.00, '2026-10-19 00:14:28', '2026-10-18 16:14:28'),
(43, 33, 'Cash', 'Paid', 500.00, 0.00, '2026-10-19 00:19:26', '2026-10-18 16:19:26'),
(44, 34, 'Cash', 'Paid', 500.00, 0.00, '2026-10-19 00:24:23', '2026-10-18 16:24:23'),
(45, 35, 'Cash', 'Paid', 1899.00, 0.00, '2026-10-20 00:24:19', '2026-10-19 16:24:19'),
(46, 36, 'Cash', 'Paid', 500.00, 0.00, '2026-10-20 00:28:03', '2026-10-19 16:28:03'),
(47, 37, 'Cash', 'Paid', 500.00, 0.00, '2026-10-20 00:33:23', '2026-10-19 16:33:23'),
(48, 38, 'Cash', 'Paid', 500.00, 0.00, '2026-10-20 00:40:17', '2026-10-19 16:40:17'),
(49, 39, 'Cash', 'Paid', 5000.00, 501.00, '2026-10-20 01:06:02', '2026-10-19 17:06:02'),
(50, 40, 'Cash', 'Paid', 3499.00, 0.00, '2026-10-20 01:14:51', '2026-10-19 17:14:51'),
(51, 41, 'Cash', 'Paid', 3918.40, 0.00, '2026-10-21 13:11:44', '2026-10-21 05:11:44'),
(52, 42, 'Cash', 'Paid', 9495.00, 0.00, '2026-10-21 13:49:40', '2026-10-21 05:49:40'),
(53, 43, 'Cash', 'Paid', 2799.20, 0.00, '2026-10-22 22:43:34', '2026-10-22 14:43:34');

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
  `stock` int(11) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `image_url`, `audience`, `stock`, `is_featured`, `created_at`, `discount_percent`) VALUES
(1, 3, 'Air Runner One', 'Everyday running shoe with a lightweight feel.', 3499.00, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=900', 'men', 4, 0, '2026-10-12 10:47:28', 0.00),
(2, 1, 'Court Classic', 'Classic court-inspired sneaker for everyday wear.', 2999.00, 'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=900', 'women', 12, 1, '2026-10-12 10:47:28', 0.00),
(3, 1, 'Street Low Kids', 'Comfortable casual shoe for active days.', 1899.00, 'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=900', 'kids', 9, 1, '2026-10-12 10:47:28', 0.00),
(4, 3, 'Stone Age Shoes', 'Bahay ng bato', 500.00, 'assets/images/products/product_29c37859bc9459885fbc6df3.jpg', 'men', 0, 1, '2026-10-13 00:36:31', 0.00),
(5, 3, '2x2 ng mga gods', '2x2', 150.00, 'assets/images/products/product_d1a0332d22fdc27e90138003.png', 'men', 0, 0, '2026-10-15 15:08:38', 0.00);

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
(2, 4, 2, 5, 1, '**** this product bro', '2026-10-15 15:23:24', '2026-10-15 15:23:24'),
(3, 5, 6, 10, 1, 'SCAMMER!!!!', '2026-10-16 16:14:21', '2026-10-16 16:14:45'),
(6, 3, 12, 42, 3, 'panget di tama sa size eh **** you', '2026-10-21 06:45:22', '2026-10-21 06:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `product_review_media`
--

CREATE TABLE `product_review_media` (
  `id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `media_path` varchar(500) NOT NULL,
  `media_type` enum('image','video') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_review_media`
--

INSERT INTO `product_review_media` (`id`, `review_id`, `media_path`, `media_type`, `created_at`) VALUES
(1, 2, 'assets/images/reviews/review_43114e1f446b91aef4c0.mp4', 'video', '2026-10-16 16:18:26'),
(2, 6, 'assets/images/reviews/review_b6ea4f0d672811e12e78.jpg', 'image', '2026-10-21 06:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_label` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size_label`) VALUES
(16, 1, '10'),
(21, 1, '11'),
(1, 1, '7'),
(6, 1, '8'),
(11, 1, '9'),
(2, 2, '5'),
(7, 2, '6'),
(12, 2, '7'),
(17, 2, '8'),
(22, 2, '9'),
(3, 3, '1'),
(8, 3, '2'),
(13, 3, '3'),
(18, 3, '4'),
(23, 3, '5'),
(19, 4, '10'),
(4, 4, '7'),
(9, 4, '8'),
(14, 4, '9'),
(20, 5, '10'),
(24, 5, '11'),
(5, 5, '7'),
(10, 5, '8'),
(15, 5, '9');

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
(6, 'IyaMALOPIT', 'agustin.jeshaiah@gmail.com', '$2y$10$Std7YZOSlAGmcG.5bAROk.kF10HssOikYomZAiweDAethQRPlsGPW', 'customer', '2026-10-15 15:25:48', 'Iyabels', '12321421412', 'BCDA HOMEOWNERS', 'assets/images/profiles/register_5bf725fd1cf0e319f644.png', 1),
(8, 'SABS', 'johnmichaelsabulao2006@gmail.com', '$2y$10$ny96wtdcEswvN3FE2Zvv6.J3dwgBcHIBpdfS6ZSRUEwcgbGUn99Ii', 'admin', '2026-10-16 14:18:39', '', '', '', 'assets/images/profiles/register_8da0feff9a48f9ea6f8a.jpg', 1),
(10, 'jeshaiah', 'jeshaiahagustin4707@gmail.com', '$2y$10$bS2Ik8xq/rpbuy6/RPZjoe0ua3KZf.RtqkMGxM7v5Gz/1tLt.a99K', 'customer', '2026-10-18 15:10:20', NULL, NULL, NULL, 'assets/images/profiles/register_1d58b00ffa7d3167a24d.jpg', 1),
(11, 'Joomla', 'joomla@joomla.com', '$2y$10$gfIqPCTXJG5XXiRQdtcl3.hWOoYzbMKpisQ0vMrEbuO2xggFn46ya', 'customer', '2026-10-18 15:10:56', NULL, NULL, NULL, NULL, 1),
(12, 'yaki', 'takoyaki@joomla.com', '$2y$10$wvVaxpETdH3L5lf2Zsvt1OtMyoOwWOTw4PFoKm64RNwU7xc1IBAD6', 'customer', '2026-10-21 05:47:07', 'Jeshaiah', '0956473821', 'BCDA', 'assets/images/profiles/register_8df025c19a6b24890c3c.jpg', 1);

-- --------------------------------------------------------

--
-- Structure for view `order_transaction_details`
--
DROP TABLE IF EXISTS `order_transaction_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `order_transaction_details`  AS SELECT `o`.`id` AS `order_id`, `o`.`created_at` AS `order_date`, `o`.`status` AS `order_status`, `o`.`full_name` AS `full_name`, `o`.`phone` AS `phone`, `o`.`address` AS `address`, `u`.`email` AS `customer_email`, `oi`.`product_id` AS `product_id`, `oi`.`product_name` AS `product_name`, `oi`.`size` AS `size`, `oi`.`quantity` AS `quantity`, `oi`.`unit_price` AS `unit_price`, `oi`.`quantity`* `oi`.`unit_price` AS `line_subtotal`, `o`.`total` AS `grand_total`, `p`.`payment_method` AS `payment_method`, `p`.`payment_status` AS `payment_status` FROM (((`orders` `o` join `users` `u` on(`u`.`id` = `o`.`user_id`)) join `order_items` `oi` on(`oi`.`order_id` = `o`.`id`)) left join `payments` `p` on(`p`.`order_id` = `o`.`id`)) ;

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
-- Indexes for table `customer_cart_items`
--
ALTER TABLE `customer_cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_product_size` (`user_id`,`product_id`,`size`),
  ADD KEY `idx_customer_cart_user` (`user_id`);

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
-- Indexes for table `product_review_media`
--
ALTER TABLE `product_review_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_review_media_review_id` (`review_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_product_size` (`product_id`,`size_label`);

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
-- AUTO_INCREMENT for table `customer_cart_items`
--
ALTER TABLE `customer_cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_review_media`
--
ALTER TABLE `product_review_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Constraints for table `product_review_media`
--
ALTER TABLE `product_review_media`
  ADD CONSTRAINT `fk_review_media_review` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `fk_product_sizes_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

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
