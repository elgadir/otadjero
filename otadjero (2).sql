-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2024 at 11:02 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otadjero`
--

-- --------------------------------------------------------

--
-- Table structure for table `kxm_accounts`
--

CREATE TABLE `kxm_accounts` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT '0.0000',
  `bank_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_accounts`
--

INSERT INTO `kxm_accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Cash', '1', 'DZD', 0.0000, 'Cash', NULL, NULL, 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-08-07 09:14:55', NULL),
(2, 1, 'real', '12', 'DZD', 0.0000, NULL, NULL, NULL, 1, 'core::ui', 1, '2022-07-17 12:46:59', '2022-08-07 09:15:10', NULL),
(3, 2, 'Espèce', '1', 'USD', 0.0000, 'Espèce', NULL, NULL, 1, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(4, 3, 'Espèce', '1', 'USD', 0.0000, 'Espèce', NULL, NULL, 1, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(5, 4, 'Espèce', '1', 'USD', 0.0000, 'Espèce', NULL, NULL, 1, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(7, 6, 'Espèce', '1', 'USD', 0.0000, 'Espèce', NULL, NULL, 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(8, 7, 'Espèce', '1', 'USD', 0.0000, 'Espèce', NULL, NULL, 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_bills`
--

CREATE TABLE `kxm_bills` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `bill_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int NOT NULL DEFAULT '1',
  `contact_id` int NOT NULL,
  `contact_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_bill_histories`
--

CREATE TABLE `kxm_bill_histories` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_bill_items`
--

CREATE TABLE `kxm_bill_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_rate` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_bill_item_taxes`
--

CREATE TABLE `kxm_bill_item_taxes` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `bill_item_id` int NOT NULL,
  `tax_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_bill_totals`
--

CREATE TABLE `kxm_bill_totals` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_categories`
--

CREATE TABLE `kxm_categories` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_categories`
--

INSERT INTO `kxm_categories` (`id`, `company_id`, `name`, `type`, `color`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Transfer', 'other', '#3c3f72', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(2, 1, 'Deposit', 'income', '#efad32', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(3, 1, 'Sales', 'income', '#6da252', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(4, 1, 'Other', 'expense', '#e5e5e5', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(5, 1, 'General', 'item', '#328aef', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(6, 1, 'sac a dos', 'item', '#55588b', 1, 'core::ui', 1, '2022-08-01 12:30:24', '2022-08-01 12:30:24', NULL),
(7, 2, 'Transfert', 'other', '#3c3f72', 1, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(8, 2, 'Déposer', 'income', '#efad32', 1, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(9, 2, 'Ventes', 'income', '#6da252', 1, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(10, 2, 'Autre', 'expense', '#e5e5e5', 1, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(11, 2, 'Général', 'item', '#328aef', 1, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(12, 3, 'Transfert', 'other', '#3c3f72', 1, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(13, 3, 'Déposer', 'income', '#efad32', 1, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(14, 3, 'Ventes', 'income', '#6da252', 1, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(15, 3, 'Autre', 'expense', '#e5e5e5', 1, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(16, 3, 'Général', 'item', '#328aef', 1, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(17, 4, 'Transfert', 'other', '#3c3f72', 1, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(18, 4, 'Déposer', 'income', '#efad32', 1, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(19, 4, 'Ventes', 'income', '#6da252', 1, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(20, 4, 'Autre', 'expense', '#e5e5e5', 1, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(21, 4, 'Général', 'item', '#328aef', 1, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(27, 6, 'Transfert', 'other', '#3c3f72', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(28, 6, 'Déposer', 'income', '#efad32', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(29, 6, 'Ventes', 'income', '#6da252', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(30, 6, 'Autre', 'expense', '#e5e5e5', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(31, 6, 'Général', 'item', '#328aef', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(32, 7, 'Transfert', 'other', '#3c3f72', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(33, 7, 'Déposer', 'income', '#efad32', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(34, 7, 'Ventes', 'income', '#6da252', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(35, 7, 'Autre', 'expense', '#e5e5e5', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(36, 7, 'Général', 'item', '#328aef', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(73, 1, 'FILTRES ET PILES', 'item', '#5a5cbb', 1, 'inventory::import', 1, '2023-02-23 11:53:14', '2023-02-23 11:53:14', NULL),
(74, 1, 'ARIES PRO  FILAIRE a 8 canaux', 'item', '#dbd383', 1, 'inventory::import', 1, '2023-02-23 11:53:14', '2023-02-23 11:53:14', NULL),
(75, 1, 'LIVIO', 'item', '#4d857f', 1, 'inventory::import', 1, '2023-02-23 11:53:14', '2023-02-23 11:53:14', NULL),
(76, 1, 'MUSE 1200  WIRELESS a 12 canaux', 'item', '#ecf2e3', 1, 'inventory::import', 1, '2023-02-23 11:53:14', '2023-02-23 11:53:14', NULL),
(77, 1, 'muse 2400 wireless 24 canaux', 'item', '#601617', 1, 'inventory::import', 1, '2023-02-23 11:53:14', '2023-02-23 11:53:14', NULL),
(78, 1, 'MUSE 1000 WIRELESS 10 CANAUX', 'item', '#4616c1', 1, 'inventory::import', 1, '2023-02-23 11:53:14', '2023-02-23 11:53:14', NULL),
(79, 1, 'MUSE IQ 1600 WIRELESS 16 CANAUX', 'item', '#8bb957', 1, 'inventory::import', 1, '2023-02-23 11:53:14', '2023-02-23 11:53:14', NULL),
(80, 1, 'ECOUTEURS', 'item', '#a6152e', 1, 'inventory::import', 1, '2023-02-23 11:53:15', '2023-02-23 11:53:15', NULL),
(81, 1, 'PATTE ET AUTRES', 'item', '#a4af11', 1, 'inventory::import', 1, '2023-02-23 11:53:15', '2023-02-23 11:53:15', NULL),
(82, 1, 'ACCESSOIRES', 'item', '#cc11cb', 1, 'inventory::import', 1, '2023-02-23 11:53:15', '2023-02-23 11:53:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_companies`
--

CREATE TABLE `kxm_companies` (
  `id` int UNSIGNED NOT NULL,
  `domain` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_companies`
--

INSERT INTO `kxm_companies` (`id`, `domain`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, 'core::ui', NULL, '2022-07-07 08:14:38', '2022-07-07 08:14:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_composite_items_composite_items`
--

CREATE TABLE `kxm_composite_items_composite_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_id` int NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `barcode` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `unit` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT '0',
  `track_inventory` tinyint(1) DEFAULT '0',
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_composite_items_items`
--

CREATE TABLE `kxm_composite_items_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_id` int NOT NULL,
  `composite_item_id` int NOT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `warehouse_id` int DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_contacts`
--

CREATE TABLE `kxm_contacts` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `tax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `city` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `reference` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_contacts`
--

INSERT INTO `kxm_contacts` (`id`, `company_id`, `type`, `name`, `email`, `user_id`, `tax_number`, `phone`, `address`, `city`, `zip_code`, `state`, `country`, `website`, `currency_code`, `enabled`, `reference`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `date_of_birth`) VALUES
(1, 1, 'customer', 'Amine Client1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DZD', 1, NULL, 'core::ui', 1, '2022-07-07 14:53:47', '2022-10-09 15:30:45', '2022-10-09 15:30:45', NULL),
(2, 1, 'customer', 'Mohamed Elgadir', 'elgadir.m@gmail.com', NULL, NULL, '+213550713235', 'Rue kaouach', NULL, NULL, NULL, NULL, NULL, 'DZD', 1, NULL, 'core::ui', 1, '2022-07-12 13:16:02', '2022-10-09 15:30:45', '2022-10-09 15:30:45', NULL),
(3, 1, 'customer', 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DZD', 1, NULL, 'core::ui', 1, '2022-07-17 12:41:18', '2022-10-09 15:30:45', '2022-10-09 15:30:45', NULL),
(4, 1, 'customer', 'salim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DZD', 1, NULL, 'core::ui', 1, '2022-08-01 12:41:03', '2022-10-09 15:30:45', '2022-10-09 15:30:45', NULL),
(5, 1, 'customer', 'caisse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DZD', 1, NULL, 'core::ui', 1, '2022-09-24 10:39:10', '2022-10-09 15:30:45', '2022-10-09 15:30:45', NULL),
(6, 1, 'customer', 'Amine', 'elgadir.me@gmail.com', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DZD', 1, NULL, 'core::ui', 1, '2022-10-10 16:31:55', '2022-10-25 05:43:41', NULL, '2016-10-13'),
(7, 1, 'vendor', 'cosumer1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DZD', 1, NULL, 'core::ui', 1, '2022-11-27 10:14:45', '2022-11-27 10:14:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credits_transactions`
--

CREATE TABLE `kxm_credits_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `document_id` int NOT NULL,
  `contact_id` int NOT NULL,
  `category_id` int NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credit_debit_notes_credits_transactions`
--

CREATE TABLE `kxm_credit_debit_notes_credits_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `document_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int UNSIGNED NOT NULL DEFAULT '1',
  `contact_id` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credit_debit_notes_credit_note_details`
--

CREATE TABLE `kxm_credit_debit_notes_credit_note_details` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `document_id` int UNSIGNED NOT NULL,
  `invoice_id` int UNSIGNED DEFAULT NULL,
  `credit_customer_account` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credit_debit_notes_debit_note_details`
--

CREATE TABLE `kxm_credit_debit_notes_debit_note_details` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `document_id` int UNSIGNED NOT NULL,
  `bill_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credit_notes`
--

CREATE TABLE `kxm_credit_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `credit_note_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `issued_at` datetime NOT NULL,
  `invoice_id` int DEFAULT NULL,
  `amount` double(15,4) NOT NULL,
  `credit_customer_account` tinyint(1) NOT NULL DEFAULT '0',
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int NOT NULL DEFAULT '1',
  `contact_id` int NOT NULL,
  `contact_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `footer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credit_note_histories`
--

CREATE TABLE `kxm_credit_note_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `credit_note_id` bigint NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credit_note_items`
--

CREATE TABLE `kxm_credit_note_items` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `credit_note_id` bigint NOT NULL,
  `item_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_rate` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credit_note_item_taxes`
--

CREATE TABLE `kxm_credit_note_item_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `credit_note_id` bigint NOT NULL,
  `credit_note_item_id` bigint NOT NULL,
  `tax_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_credit_note_totals`
--

CREATE TABLE `kxm_credit_note_totals` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `credit_note_id` bigint NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_companies`
--

CREATE TABLE `kxm_crm_companies` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `created_by` int NOT NULL,
  `stage` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `source` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `note` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `contact_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_company_contacts`
--

CREATE TABLE `kxm_crm_company_contacts` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `crm_company_id` int NOT NULL,
  `crm_contact_id` int NOT NULL,
  `created_by` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_contacts`
--

CREATE TABLE `kxm_crm_contacts` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `created_by` int NOT NULL,
  `stage` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `born_at` date DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `source` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `note` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `contact_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deals`
--

CREATE TABLE `kxm_crm_deals` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `crm_contact_id` int DEFAULT NULL,
  `crm_company_id` int DEFAULT NULL,
  `pipeline_id` int NOT NULL,
  `stage_id` int NOT NULL DEFAULT '0',
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double DEFAULT NULL,
  `owner_id` int NOT NULL,
  `closed_at` datetime DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'open',
  `created_by` int NOT NULL DEFAULT '1',
  `color` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '#6da252',
  `currency_code` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deal_activities`
--

CREATE TABLE `kxm_crm_deal_activities` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `deal_id` int NOT NULL,
  `created_by` int NOT NULL,
  `activity_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `assigned` int NOT NULL,
  `note` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `done` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deal_activity_types`
--

CREATE TABLE `kxm_crm_deal_activity_types` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rank` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deal_agents`
--

CREATE TABLE `kxm_crm_deal_agents` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `deal_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_by` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deal_competitors`
--

CREATE TABLE `kxm_crm_deal_competitors` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `deal_id` int NOT NULL,
  `created_by` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `web_site` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `strengths` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `weaknesses` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deal_emails`
--

CREATE TABLE `kxm_crm_deal_emails` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `deal_id` int NOT NULL,
  `registered_user` int NOT NULL,
  `to` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deal_notes`
--

CREATE TABLE `kxm_crm_deal_notes` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `deal_id` int NOT NULL,
  `registered_user` int NOT NULL,
  `note` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deal_pipelines`
--

CREATE TABLE `kxm_crm_deal_pipelines` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_crm_deal_pipelines`
--

INSERT INTO `kxm_crm_deal_pipelines` (`id`, `company_id`, `name`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Pipeline', 0, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(2, 4, 'Pipeline', 0, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_deal_pipeline_stages`
--

CREATE TABLE `kxm_crm_deal_pipeline_stages` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `pipeline_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `life_stage` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rank` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_crm_deal_pipeline_stages`
--

INSERT INTO `kxm_crm_deal_pipeline_stages` (`id`, `company_id`, `pipeline_id`, `name`, `life_stage`, `rank`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Proposal Made', 'not_change', 1, 0, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(2, 1, 1, 'Lead In', 'not_change', 2, 0, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(3, 1, 1, 'Contact Made', 'not_change', 3, 0, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(4, 1, 1, 'Demo Scheduled', 'not_change', 4, 0, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(5, 1, 1, 'Negotiations Started', 'not_change', 5, 0, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(6, 4, 2, 'Proposal Made', 'not_change', 1, 0, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(7, 4, 2, 'Lead In', 'not_change', 2, 0, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(8, 4, 2, 'Contact Made', 'not_change', 3, 0, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(9, 4, 2, 'Demo Scheduled', 'not_change', 4, 0, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(10, 4, 2, 'Negotiations Started', 'not_change', 5, 0, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_emails`
--

CREATE TABLE `kxm_crm_emails` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `created_by` int NOT NULL,
  `emailable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `emailable_id` bigint UNSIGNED NOT NULL,
  `from` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `to` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `send` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_logs`
--

CREATE TABLE `kxm_crm_logs` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `logable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `logable_id` bigint UNSIGNED NOT NULL,
  `log_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_notes`
--

CREATE TABLE `kxm_crm_notes` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `created_by` int NOT NULL,
  `noteable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `noteable_id` bigint UNSIGNED NOT NULL,
  `message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_schedules`
--

CREATE TABLE `kxm_crm_schedules` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `created_by` int NOT NULL,
  `scheduleable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `scheduleable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `started_time_at` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ended_at` date NOT NULL,
  `ended_time_at` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `schedule_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_crm_tasks`
--

CREATE TABLE `kxm_crm_tasks` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `taskable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `taskable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `started_time_at` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_currencies`
--

CREATE TABLE `kxm_currencies` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `precision` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `symbol_first` int NOT NULL DEFAULT '1',
  `decimal_mark` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_currencies`
--

INSERT INTO `kxm_currencies` (`id`, `company_id`, `name`, `code`, `rate`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'US Dollar', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-10-09 13:19:33', '2022-10-09 13:19:33'),
(2, 1, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-17 13:53:33', '2022-07-17 13:53:33'),
(3, 1, 'British Pound', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-17 13:53:33', '2022-07-17 13:53:33'),
(4, 1, 'Turkish Lira', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 1, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-17 13:53:33', '2022-07-17 13:53:33'),
(5, 1, 'DZD', 'DZD', 1.00000000, '2', 'D.A', 0, '.', ',', 1, 'core::ui', 1, '2022-07-17 13:53:59', '2022-12-28 08:39:02', NULL),
(6, 1, 'CAD', 'CAD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::ui', 1, '2022-08-01 12:25:43', '2022-10-09 13:05:49', '2022-10-09 13:05:49'),
(7, 2, 'Dollar US', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(8, 2, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 0, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:38', NULL),
(9, 2, 'Livre sterling', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 0, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:37', NULL),
(10, 2, 'Livre turque', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 0, 'core::seed', 1, '2022-09-10 12:38:13', '2022-09-10 12:38:37', NULL),
(11, 2, 'DZD', 'DZD', 1.00000000, NULL, NULL, 1, NULL, NULL, 1, 'core::ui', 1, '2022-09-10 12:38:54', '2022-09-10 12:38:54', NULL),
(12, 3, 'Dollar US', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(13, 3, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 0, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:03:32', NULL),
(14, 3, 'Livre sterling', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 0, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:03:32', NULL),
(15, 3, 'Livre turque', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 0, 'core::seed', 1, '2022-09-12 10:02:13', '2022-09-12 10:03:32', NULL),
(16, 4, 'Dollar US', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(17, 4, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 0, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:28:30', NULL),
(18, 4, 'Livre sterling', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 0, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:28:31', NULL),
(19, 4, 'Livre turque', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 0, 'core::seed', 1, '2022-09-12 10:27:59', '2022-09-12 10:28:31', NULL),
(20, 4, 'DZD', 'DZD', 1.00000000, '2', 'D.A', 0, '.', ',', 1, 'core::ui', 1, '2022-09-12 12:46:54', '2022-09-12 12:46:54', NULL),
(25, 6, 'Dollar US', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(26, 6, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(27, 6, 'Livre sterling', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(28, 6, 'Livre turque', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(29, 7, 'Dollar US', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(30, 7, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(31, 7, 'Livre sterling', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(32, 7, 'Livre turque', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 1, 'core::seed', 1, '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(33, 1, 'USD', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, 'core::ui', 1, '2022-10-09 15:31:40', '2022-10-09 15:32:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_custom_fields_fields`
--

CREATE TABLE `kxm_custom_fields_fields` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `class` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `rule` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `locations` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `show` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'always'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_custom_fields_field_locations`
--

CREATE TABLE `kxm_custom_fields_field_locations` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `field_id` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `location_id` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort_order` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_custom_fields_field_type_options`
--

CREATE TABLE `kxm_custom_fields_field_type_options` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `field_id` int NOT NULL,
  `type_id` int NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_custom_fields_field_values`
--

CREATE TABLE `kxm_custom_fields_field_values` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `field_id` int NOT NULL,
  `type_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `location_id` int NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_custom_fields_locations`
--

CREATE TABLE `kxm_custom_fields_locations` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_custom_fields_locations`
--

INSERT INTO `kxm_custom_fields_locations` (`id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CRM Contacts', 'crm.contacts', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(2, 'CRM Companies', 'crm.companies', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(3, 'general.companies', 'common.companies', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(4, 'general.items', 'common.items', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(5, 'general.invoices', 'sales.invoices', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(6, 'general.revenues', 'sales.revenues', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(7, 'general.customers', 'sales.customers', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(8, 'general.bills', 'purchases.bills', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(9, 'general.payments', 'purchases.payments', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(10, 'general.vendors', 'purchases.vendors', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(11, 'general.accounts', 'banking.accounts', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(12, 'general.transfers', 'banking.transfers', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(13, 'employees::general.employees', 'employees.employees', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(14, 'employees::general.positions', 'employees.positions', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(15, 'assets::general.assets', 'assets.assets', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(16, 'expenses::general.expense_claims', 'expenses.expense-claims', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(17, 'Estimates', 'estimates::estimates', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_custom_fields_types`
--

CREATE TABLE `kxm_custom_fields_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_custom_fields_types`
--

INSERT INTO `kxm_custom_fields_types` (`id`, `name`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'custom-fields::general.type.select', 'select', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(2, 'custom-fields::general.type.enabled', 'radio', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(3, 'custom-fields::general.type.checkbox', 'checkbox', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(4, 'custom-fields::general.type.text', 'text', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(5, 'custom-fields::general.type.textarea', 'textarea', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(6, 'custom-fields::general.type.date', 'date', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(7, 'custom-fields::general.type.time', 'time', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL),
(8, 'custom-fields::general.type.date&time', 'dateTime', '2022-07-07 09:17:14', '2022-07-07 09:17:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_dashboards`
--

CREATE TABLE `kxm_dashboards` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_dashboards`
--

INSERT INTO `kxm_dashboards` (`id`, `company_id`, `name`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Dashboard', 1, 'core::seed', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(2, 1, 'Inventory', 1, 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(3, 1, 'CRM', 1, 'core::console', NULL, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(4, 1, 'Dashboard', 1, 'core::seed', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(5, 1, 'Dashboard', 1, 'core::seed', 1, '2022-07-08 09:01:58', '2022-07-08 09:01:58', NULL),
(6, 2, 'Dashboard', 1, 'core::seed', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(7, 3, 'Dashboard', 1, 'core::seed', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(8, 4, 'Dashboard', 1, 'core::seed', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(9, 4, 'CRM', 1, 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(10, 6, 'Dashboard', 1, 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(11, 7, 'Dashboard', 1, 'core::seed', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_debit_notes`
--

CREATE TABLE `kxm_debit_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `debit_note_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `issued_at` datetime NOT NULL,
  `bill_id` int DEFAULT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int NOT NULL DEFAULT '1',
  `contact_id` int NOT NULL,
  `contact_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_debit_note_histories`
--

CREATE TABLE `kxm_debit_note_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `debit_note_id` bigint NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_debit_note_items`
--

CREATE TABLE `kxm_debit_note_items` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `debit_note_id` bigint NOT NULL,
  `item_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_rate` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_debit_note_item_taxes`
--

CREATE TABLE `kxm_debit_note_item_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `debit_note_id` bigint NOT NULL,
  `debit_note_item_id` bigint NOT NULL,
  `tax_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_debit_note_totals`
--

CREATE TABLE `kxm_debit_note_totals` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `debit_note_id` bigint NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ready_to_be_pruned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_documents`
--

CREATE TABLE `kxm_documents` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `w_id` varchar(123) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'warehouse_id',
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `document_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `barcode_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `issued_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int UNSIGNED NOT NULL DEFAULT '1',
  `contact_id` int UNSIGNED NOT NULL,
  `contact_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `contact_city` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_zip_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_state` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_country` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `footer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL COMMENT 'timber'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_documents`
--

INSERT INTO `kxm_documents` (`id`, `company_id`, `w_id`, `type`, `document_number`, `barcode_number`, `order_number`, `status`, `issued_at`, `due_at`, `amount`, `currency_code`, `currency_rate`, `category_id`, `contact_id`, `contact_name`, `contact_email`, `contact_tax_number`, `contact_phone`, `contact_address`, `contact_city`, `contact_zip_code`, `contact_state`, `contact_country`, `notes`, `footer`, `parent_id`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `enabled`) VALUES
(3, 1, NULL, 'invoice', 'INV-00062', NULL, 'NULL', 'draft', '2021-11-12 14:38:40', '2021-11-12 14:38:40', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2023-04-02 12:38:41', '2023-04-02 12:38:41', NULL, NULL),
(8, 1, NULL, 'invoice', 'INV-00063', NULL, NULL, 'draft', '2022-05-22 16:00:21', '2022-05-22 16:00:21', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2023-06-04 14:00:22', '2023-06-04 14:00:22', NULL, NULL),
(9, 1, NULL, 'invoice', 'INV-00064', NULL, NULL, 'draft', '2022-05-22 18:19:29', '2022-05-22 18:19:29', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2023-06-04 16:19:30', '2023-06-04 16:19:30', NULL, NULL),
(10, 1, NULL, 'invoice', 'INV-00065', NULL, NULL, 'draft', '2022-05-22 18:19:56', '2022-05-22 18:19:56', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2023-06-04 16:19:56', '2023-06-04 16:19:56', NULL, NULL),
(11, 1, NULL, 'invoice', 'INV-00066', NULL, NULL, 'draft', '2022-05-22 18:21:07', '2022-05-22 18:21:07', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2023-06-04 16:21:07', '2023-06-04 16:21:07', NULL, NULL),
(12, 1, NULL, 'invoice', 'INV-00067', NULL, NULL, 'draft', '2022-05-22 20:22:23', '2022-05-22 20:22:23', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2023-06-04 18:22:23', '2023-06-04 18:22:23', NULL, NULL),
(13, 1, NULL, 'invoice', 'INV-00068', NULL, NULL, 'draft', '2022-05-22 20:22:45', '2022-05-22 20:22:45', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2023-06-04 18:22:46', '2023-06-04 18:22:46', NULL, NULL),
(14, 1, NULL, 'invoice', 'INV-00069', NULL, NULL, 'draft', '2022-05-22 20:29:34', '2022-05-22 20:29:34', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2023-06-04 18:29:34', '2023-06-04 18:29:34', NULL, NULL),
(15, 1, NULL, 'invoice', 'INV-00070', NULL, NULL, 'draft', '2022-05-22 20:30:55', '2022-05-22 20:30:55', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2023-06-04 18:30:55', '2023-06-04 18:30:55', NULL, NULL),
(16, 1, NULL, 'invoice', 'INV-00071', NULL, NULL, 'draft', '2022-05-22 20:33:40', '2022-05-22 20:33:40', 123.0000, 'DZD', 1.00000000, 2, 29, 'amine smail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2023-06-04 18:33:40', '2023-06-04 18:33:40', NULL, NULL),
(18, 1, NULL, 'invoice', 'INV-00072', '22323232', 'NULL', 'draft', '2021-11-12 14:00:35', '2021-11-12 14:00:35', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2023-10-04 13:00:35', '2023-10-04 13:00:36', NULL, NULL),
(19, 1, NULL, 'invoice', 'INV-00073', '2232323245354', 'NULL', 'draft', '2021-11-12 13:18:47', '2021-11-12 13:18:47', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2023-10-12 12:18:47', '2023-10-12 12:18:48', NULL, NULL),
(20, 1, NULL, 'invoice', 'INV-00074', NULL, NULL, 'draft', '2021-11-12 16:17:41', '2021-11-12 16:17:41', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2023-11-15 15:17:41', '2023-11-15 15:17:42', NULL, NULL),
(21, 1, NULL, 'invoice', 'INV-00075', NULL, NULL, 'draft', '2021-11-12 16:48:21', '2021-11-12 16:48:21', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2023-11-15 15:48:21', '2023-11-15 15:48:22', NULL, NULL),
(22, 1, NULL, 'invoice', 'INV-00076', NULL, NULL, 'draft', '2023-11-15 16:48:50', '2023-11-15 16:48:50', 23.3000, 'DZD', 1.00000000, 2, 6, 'Amine', 'elgadir.me@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::ui', 3, '2023-11-15 15:48:50', '2023-11-15 15:48:50', NULL, NULL),
(23, 1, NULL, 'invoice', 'INV-00077', NULL, NULL, 'draft', '2021-11-12 11:59:55', '2021-11-12 11:59:55', 10.0000, 'DZD', 1.00000000, 2, 6, 'Amine', 'elgadir.me@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::ui', 1, '2023-11-16 09:30:07', '2023-11-16 10:59:56', NULL, NULL),
(24, 1, NULL, 'invoice', 'INV-00078', NULL, NULL, 'draft', '2021-11-12 13:01:22', '2021-11-12 13:01:22', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-09 12:01:23', '2024-02-09 12:01:24', NULL, NULL),
(25, 1, NULL, 'invoice', 'INV-00079', NULL, NULL, 'draft', '2021-11-12 13:02:11', '2021-11-12 13:02:11', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-09 12:02:12', '2024-02-09 12:02:12', NULL, NULL),
(26, 1, NULL, 'invoice', 'INV-00080', NULL, NULL, 'draft', '2021-11-12 13:02:17', '2021-11-12 13:02:17', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-09 12:02:17', '2024-02-09 12:02:17', NULL, NULL),
(27, 1, NULL, 'invoice', 'INV-00079d', NULL, NULL, 'draft', '2024-02-09 13:02:51', '2024-02-09 13:02:51', 1053.3000, 'DZD', 1.00000000, 2, 6, 'Amine', 'elgadir.me@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::ui', 3, '2024-02-09 12:02:51', '2024-02-09 12:02:54', NULL, NULL),
(28, 1, NULL, 'invoice', 'INV-00082', NULL, NULL, 'draft', '2021-11-12 09:18:07', '2021-11-12 09:18:07', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-10 08:18:07', '2024-02-10 08:18:09', NULL, NULL),
(29, 1, NULL, 'invoice', 'INV-00083', NULL, NULL, 'draft', '2021-11-12 09:18:25', '2021-11-12 09:18:25', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-10 08:18:25', '2024-02-10 08:18:26', NULL, NULL),
(30, 1, NULL, 'invoice', 'INV-00084', NULL, NULL, 'draft', '2021-11-12 16:06:07', '2021-11-12 16:06:07', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-12 15:06:07', '2024-02-12 15:06:08', NULL, NULL),
(31, 1, NULL, 'invoice', 'INV-00085', NULL, NULL, 'draft', '2021-11-12 16:07:03', '2021-11-12 16:07:03', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-12 15:07:03', '2024-02-12 15:07:04', NULL, NULL),
(32, 1, NULL, 'invoice', 'INV-00086', NULL, NULL, 'draft', '2021-11-12 16:07:11', '2021-11-12 16:07:11', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-12 15:07:11', '2024-02-12 15:07:12', NULL, NULL),
(33, 1, NULL, 'invoice', 'INV-00087', NULL, NULL, 'draft', '2021-11-12 16:07:51', '2021-11-12 16:07:51', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-12 15:07:51', '2024-02-12 15:07:51', NULL, NULL),
(34, 1, NULL, 'invoice', 'INV-00088', NULL, NULL, 'draft', '2021-11-12 16:09:37', '2021-11-12 16:09:37', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-02-12 15:09:37', '2024-02-12 15:09:38', NULL, NULL),
(35, 1, NULL, 'invoice', 'INV-00089', NULL, NULL, 'draft', '2021-11-12 16:10:23', '2021-11-12 16:10:23', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-02-12 15:10:24', '2024-02-12 15:10:24', NULL, NULL),
(36, 1, NULL, 'invoice', 'INV-00090', NULL, NULL, 'draft', '2021-11-12 16:10:30', '2021-11-12 16:10:30', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-02-12 15:10:30', '2024-02-12 15:10:31', NULL, NULL),
(37, 1, NULL, 'invoice', 'INV-00091', NULL, NULL, 'draft', '2021-11-12 16:10:37', '2021-11-12 16:10:37', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-02-12 15:10:37', '2024-02-12 15:10:37', NULL, NULL),
(38, 1, NULL, 'invoice', 'INV-00092', NULL, NULL, 'draft', '2021-11-12 16:10:43', '2021-11-12 16:10:43', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-02-12 15:10:43', '2024-02-12 15:10:44', NULL, NULL),
(39, 1, NULL, 'invoice', 'INV-00093', NULL, NULL, 'draft', '2021-11-12 16:16:18', '2021-11-12 16:16:18', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-02-12 15:16:18', '2024-02-12 15:16:18', NULL, NULL),
(40, 1, NULL, 'invoice', 'INV-00094', NULL, NULL, 'draft', '2021-11-12 16:16:26', '2021-11-12 16:16:26', 117.6000, 'DZD', 1.00000000, 2, 64, 'demo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-02-12 15:16:26', '2024-02-12 15:16:26', NULL, NULL),
(41, 1, NULL, 'invoice', 'INV-00095', NULL, NULL, 'draft', '2021-11-12 16:16:32', '2021-11-12 16:16:32', 117.6000, 'DZD', 1.00000000, 2, 64, 'demo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-02-12 15:16:32', '2024-02-12 15:16:33', NULL, NULL),
(42, 1, NULL, 'invoice', 'INV-00096', NULL, NULL, 'draft', '2021-11-12 11:23:15', '2021-11-12 11:23:15', 22.0000, 'DZD', 1.00000000, 2, 6, 'Amine', 'elgadir.me@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::ui', 1, '2024-02-12 15:17:14', '2024-02-29 10:23:16', NULL, NULL),
(43, 1, NULL, 'sales-order', 'SO-00003', NULL, NULL, 'invoiced', '2024-02-29 22:09:22', '2024-02-29 22:09:22', 22.0000, 'DZD', 1.00000000, 2, 6, 'Amine', 'elgadir.me@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::ui', 1, '2024-02-29 21:09:22', '2024-03-01 10:00:40', NULL, NULL),
(44, 1, NULL, 'invoice', 'INV-00097', NULL, 'SO-00003', 'draft', '2024-03-01 11:00:39', '2024-03-01 11:00:39', 22.0000, 'DZD', 1.00000000, 2, 6, 'Amine', 'elgadir.me@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::ui', 1, '2024-03-01 10:00:39', '2024-03-01 10:00:40', NULL, NULL),
(45, 1, NULL, 'estimate', 'DV-00006', NULL, NULL, 'invoiced', '2024-03-03 10:21:07', '2024-03-03 10:21:07', 22.0000, 'DZD', 1.00000000, 2, 6, 'Amine', 'elgadir.me@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::ui', 1, '2024-03-03 09:21:07', '2024-03-03 09:24:31', NULL, NULL),
(46, 1, NULL, 'invoice', 'INV-00098', NULL, NULL, 'draft', '2024-03-03 10:24:31', '2024-03-03 10:24:31', 22.0000, 'DZD', 1.00000000, 2, 6, 'Amine', 'elgadir.me@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::ui', 1, '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL, NULL),
(47, 1, NULL, 'invoice', 'INV-00099', NULL, NULL, 'draft', '2021-11-12 11:00:44', '2021-11-12 11:00:44', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-03-10 11:00:44', '2024-03-10 11:00:45', NULL, NULL),
(48, 1, NULL, 'invoice', 'INV-00100', NULL, NULL, 'draft', '2021-11-12 11:00:55', '2021-11-12 11:00:55', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-03-10 11:00:55', '2024-03-10 11:00:56', NULL, NULL),
(49, 1, NULL, 'invoice', 'INV-00101', NULL, NULL, 'draft', '2021-11-12 11:01:04', '2021-11-12 11:01:04', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-03-10 11:01:04', '2024-03-10 11:01:05', NULL, NULL),
(50, 1, NULL, 'invoice', 'INV-00102', NULL, NULL, 'draft', '2021-11-12 11:01:47', '2021-11-12 11:01:47', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-03-10 11:01:48', '2024-03-10 11:01:48', NULL, NULL),
(51, 1, NULL, 'invoice', 'INV-00103', NULL, NULL, 'draft', '2021-11-12 11:01:54', '2021-11-12 11:01:54', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-03-10 11:01:54', '2024-03-10 11:01:55', NULL, NULL),
(52, 1, NULL, 'invoice', 'INV-00104', NULL, NULL, 'draft', '2021-11-12 11:02:03', '2021-11-12 11:02:03', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-03-10 11:02:03', '2024-03-10 11:02:03', NULL, NULL),
(53, 1, NULL, 'invoice', 'INV-00105', NULL, NULL, 'draft', '2021-11-12 11:21:37', '2021-11-12 11:21:37', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-03-10 11:21:37', '2024-03-10 11:21:37', NULL, NULL),
(54, 1, NULL, 'invoice', 'INV-00106', NULL, NULL, 'draft', '2021-11-12 11:21:46', '2021-11-12 11:21:46', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-03-10 11:21:46', '2024-03-10 11:21:46', NULL, NULL),
(55, 1, NULL, 'invoice', 'INV-00107', NULL, NULL, 'draft', '2021-11-12 21:04:48', '2021-11-12 21:04:48', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-05-28 20:04:49', '2024-05-28 20:04:49', NULL, NULL),
(56, 1, NULL, 'invoice', 'INV-00108', NULL, NULL, 'draft', '2021-11-12 21:05:04', '2021-11-12 21:05:04', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 3, '2024-05-28 20:05:04', '2024-05-28 20:05:05', NULL, NULL),
(57, 1, NULL, 'invoice', 'INV-00109', NULL, NULL, 'draft', '2021-11-12 21:05:50', '2021-11-12 21:05:50', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-05-28 20:05:50', '2024-05-28 20:05:50', NULL, NULL),
(58, 1, NULL, 'invoice', 'INV-00110', NULL, NULL, 'draft', '2021-11-12 21:06:01', '2021-11-12 21:06:01', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-05-28 20:06:02', '2024-05-28 20:06:02', NULL, NULL),
(59, 1, NULL, 'invoice', 'INV-00111', NULL, NULL, 'draft', '2021-11-12 21:14:27', '2021-11-12 21:14:27', 117.6000, 'DZD', 1.00000000, 2, 1, 'demo', 'testi2@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'core::api', 1, '2024-05-28 20:14:27', '2024-05-28 20:14:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_document_histories`
--

CREATE TABLE `kxm_document_histories` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `document_id` int UNSIGNED NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_document_histories`
--

INSERT INTO `kxm_document_histories` (`id`, `company_id`, `type`, `document_id`, `status`, `notify`, `description`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice', 3, 'draft', 0, 'INV-00062 added!', 'core::api', '1', '2023-04-02 12:38:41', '2023-04-02 12:38:41', NULL),
(2, 1, 'invoice', 8, 'draft', 0, 'INV-00063 added!', 'core::api', '3', '2023-06-04 14:00:22', '2023-06-04 14:00:22', NULL),
(3, 1, 'invoice', 9, 'draft', 0, 'INV-00064 added!', 'core::api', '3', '2023-06-04 16:19:30', '2023-06-04 16:19:30', NULL),
(4, 1, 'invoice', 10, 'draft', 0, 'INV-00065 added!', 'core::api', '3', '2023-06-04 16:19:56', '2023-06-04 16:19:56', NULL),
(5, 1, 'invoice', 11, 'draft', 0, 'INV-00066 added!', 'core::api', '1', '2023-06-04 16:21:07', '2023-06-04 16:21:07', NULL),
(6, 1, 'invoice', 12, 'draft', 0, 'INV-00067 added!', 'core::api', '1', '2023-06-04 18:22:23', '2023-06-04 18:22:23', NULL),
(7, 1, 'invoice', 13, 'draft', 0, 'INV-00068 added!', 'core::api', '1', '2023-06-04 18:22:46', '2023-06-04 18:22:46', NULL),
(8, 1, 'invoice', 14, 'draft', 0, 'INV-00069 added!', 'core::api', '1', '2023-06-04 18:29:34', '2023-06-04 18:29:34', NULL),
(9, 1, 'invoice', 15, 'draft', 0, 'INV-00070 added!', 'core::api', '1', '2023-06-04 18:30:55', '2023-06-04 18:30:55', NULL),
(10, 1, 'invoice', 16, 'draft', 0, 'INV-00071 added!', 'core::api', '1', '2023-06-04 18:33:40', '2023-06-04 18:33:40', NULL),
(11, 1, 'invoice', 18, 'draft', 0, 'INV-00072 added!', 'core::api', '3', '2023-10-04 13:00:36', '2023-10-04 13:00:36', NULL),
(12, 1, 'invoice', 19, 'draft', 0, 'INV-00073 added!', 'core::api', '3', '2023-10-12 12:18:48', '2023-10-12 12:18:48', NULL),
(13, 1, 'invoice', 20, 'draft', 0, 'INV-00074 added!', 'core::api', '3', '2023-11-15 15:17:42', '2023-11-15 15:17:42', NULL),
(14, 1, 'invoice', 21, 'draft', 0, 'INV-00075 added!', 'core::api', '3', '2023-11-15 15:48:22', '2023-11-15 15:48:22', NULL),
(15, 1, 'invoice', 22, 'draft', 0, 'INV-00076 added!', 'core::ui', '3', '2023-11-15 15:48:50', '2023-11-15 15:48:50', NULL),
(16, 1, 'invoice', 23, 'draft', 0, 'INV-00077 added!', 'core::api', '3', '2023-11-16 09:30:08', '2023-11-16 09:30:08', NULL),
(17, 1, 'invoice', 24, 'draft', 0, 'INV-00078 added!', 'core::api', '3', '2024-02-09 12:01:24', '2024-02-09 12:01:24', NULL),
(18, 1, 'invoice', 25, 'draft', 0, 'INV-00079 added!', 'core::api', '3', '2024-02-09 12:02:12', '2024-02-09 12:02:12', NULL),
(19, 1, 'invoice', 26, 'draft', 0, 'INV-00080 added!', 'core::api', '3', '2024-02-09 12:02:18', '2024-02-09 12:02:18', NULL),
(20, 1, 'invoice', 27, 'draft', 0, 'INV-00079d added!', 'core::ui', '3', '2024-02-09 12:02:54', '2024-02-09 12:02:54', NULL),
(21, 1, 'invoice', 28, 'draft', 0, 'INV-00082 added!', 'core::api', '3', '2024-02-10 08:18:09', '2024-02-10 08:18:09', NULL),
(22, 1, 'invoice', 29, 'draft', 0, 'INV-00083 added!', 'core::api', '3', '2024-02-10 08:18:26', '2024-02-10 08:18:26', NULL),
(23, 1, 'invoice', 30, 'draft', 0, 'INV-00084 added!', 'core::api', '3', '2024-02-12 15:06:08', '2024-02-12 15:06:08', NULL),
(24, 1, 'invoice', 31, 'draft', 0, 'INV-00085 added!', 'core::api', '3', '2024-02-12 15:07:04', '2024-02-12 15:07:04', NULL),
(25, 1, 'invoice', 32, 'draft', 0, 'INV-00086 added!', 'core::api', '3', '2024-02-12 15:07:12', '2024-02-12 15:07:12', NULL),
(26, 1, 'invoice', 33, 'draft', 0, 'INV-00087 added!', 'core::api', '3', '2024-02-12 15:07:51', '2024-02-12 15:07:51', NULL),
(27, 1, 'invoice', 34, 'draft', 0, 'INV-00088 added!', 'core::api', '3', '2024-02-12 15:09:38', '2024-02-12 15:09:38', NULL),
(28, 1, 'invoice', 35, 'draft', 0, 'INV-00089 added!', 'core::api', '1', '2024-02-12 15:10:24', '2024-02-12 15:10:24', NULL),
(29, 1, 'invoice', 36, 'draft', 0, 'INV-00090 added!', 'core::api', '1', '2024-02-12 15:10:31', '2024-02-12 15:10:31', NULL),
(30, 1, 'invoice', 37, 'draft', 0, 'INV-00091 added!', 'core::api', '1', '2024-02-12 15:10:37', '2024-02-12 15:10:37', NULL),
(31, 1, 'invoice', 38, 'draft', 0, 'INV-00092 added!', 'core::api', '1', '2024-02-12 15:10:44', '2024-02-12 15:10:44', NULL),
(32, 1, 'invoice', 39, 'draft', 0, 'INV-00093 added!', 'core::api', '1', '2024-02-12 15:16:18', '2024-02-12 15:16:18', NULL),
(33, 1, 'invoice', 40, 'draft', 0, 'INV-00094 added!', 'core::api', '1', '2024-02-12 15:16:27', '2024-02-12 15:16:27', NULL),
(34, 1, 'invoice', 41, 'draft', 0, 'INV-00095 added!', 'core::api', '1', '2024-02-12 15:16:33', '2024-02-12 15:16:33', NULL),
(35, 1, 'invoice', 42, 'draft', 0, 'INV-00096 added!', 'core::api', '1', '2024-02-12 15:17:14', '2024-02-12 15:17:14', NULL),
(36, 1, 'sales-order', 43, 'draft', 0, 'SO-00003 added!', 'core::ui', '1', '2024-02-29 21:09:22', '2024-02-29 21:09:22', NULL),
(37, 1, 'invoice', 44, 'draft', 0, 'INV-00097 added!', 'core::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(38, 1, 'sales-order', 43, 'invoiced', 0, 'Converted to invoice INV-00097', 'core::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(39, 1, 'invoice', 44, 'draft', 0, 'Created from Devis SO-00003', 'core::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(40, 1, 'sales-order', 43, 'invoiced', 0, 'Converted to Invoice INV-00097', 'core::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(41, 1, 'invoice', 44, 'draft', 0, 'Created from Sales Order SO-00003', 'core::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(42, 1, 'estimate', 45, 'draft', 0, 'DV-00006 added!', 'core::ui', '1', '2024-03-03 09:21:07', '2024-03-03 09:21:07', NULL),
(43, 1, 'invoice', 46, 'draft', 0, 'INV-00098 added!', 'core::ui', '1', '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL),
(44, 1, 'estimate', 45, 'invoiced', 0, 'Converted to invoice INV-00098', 'core::ui', '1', '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL),
(45, 1, 'invoice', 46, 'draft', 0, 'Created from Devis DV-00006', 'core::ui', '1', '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL),
(46, 1, 'invoice', 47, 'draft', 0, 'INV-00099 added!', 'core::api', '3', '2024-03-10 11:00:45', '2024-03-10 11:00:45', NULL),
(47, 1, 'invoice', 48, 'draft', 0, 'INV-00100 added!', 'core::api', '3', '2024-03-10 11:00:56', '2024-03-10 11:00:56', NULL),
(48, 1, 'invoice', 49, 'draft', 0, 'INV-00101 added!', 'core::api', '3', '2024-03-10 11:01:05', '2024-03-10 11:01:05', NULL),
(49, 1, 'invoice', 50, 'draft', 0, 'INV-00102 ajouté !', 'core::api', '1', '2024-03-10 11:01:48', '2024-03-10 11:01:48', NULL),
(50, 1, 'invoice', 51, 'draft', 0, 'INV-00103 ajouté !', 'core::api', '1', '2024-03-10 11:01:55', '2024-03-10 11:01:55', NULL),
(51, 1, 'invoice', 52, 'draft', 0, 'INV-00104 ajouté !', 'core::api', '1', '2024-03-10 11:02:03', '2024-03-10 11:02:03', NULL),
(52, 1, 'invoice', 53, 'draft', 0, 'INV-00105 ajouté !', 'core::api', '1', '2024-03-10 11:21:37', '2024-03-10 11:21:37', NULL),
(53, 1, 'invoice', 54, 'draft', 0, 'INV-00106 ajouté !', 'core::api', '1', '2024-03-10 11:21:46', '2024-03-10 11:21:46', NULL),
(54, 1, 'invoice', 55, 'draft', 0, 'INV-00107 added!', 'core::api', '3', '2024-05-28 20:04:49', '2024-05-28 20:04:49', NULL),
(55, 1, 'invoice', 56, 'draft', 0, 'INV-00108 added!', 'core::api', '3', '2024-05-28 20:05:05', '2024-05-28 20:05:05', NULL),
(56, 1, 'invoice', 57, 'draft', 0, 'INV-00109 ajouté !', 'core::api', '1', '2024-05-28 20:05:50', '2024-05-28 20:05:50', NULL),
(57, 1, 'invoice', 58, 'draft', 0, 'INV-00110 ajouté !', 'core::api', '1', '2024-05-28 20:06:02', '2024-05-28 20:06:02', NULL),
(58, 1, 'invoice', 59, 'draft', 0, 'INV-00111 ajouté !', 'core::api', '1', '2024-05-28 20:14:27', '2024-05-28 20:14:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_document_items`
--

CREATE TABLE `kxm_document_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `document_id` int UNSIGNED NOT NULL,
  `item_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `reference_number` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `designation` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'normal',
  `discount_rate` double(15,4) NOT NULL DEFAULT '0.0000',
  `total` double(15,4) NOT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_document_items`
--

INSERT INTO `kxm_document_items` (`id`, `company_id`, `type`, `document_id`, `item_id`, `name`, `description`, `reference_number`, `designation`, `sku`, `quantity`, `price`, `tax`, `discount_type`, `discount_rate`, `total`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice', 3, 112, 'testing 0786', 'testing 0786', '', '', NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2023-04-02 12:38:41', '2023-04-02 12:38:41', NULL),
(2, 1, 'invoice', 18, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2023-10-04 13:00:35', '2023-10-04 13:00:35', NULL),
(3, 1, 'invoice', 19, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2023-10-12 12:18:47', '2023-10-12 12:18:47', NULL),
(4, 1, 'invoice', 20, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2023-11-15 15:17:41', '2023-11-15 15:17:41', NULL),
(5, 1, 'invoice', 21, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2023-11-15 15:48:22', '2023-11-15 15:48:22', NULL),
(6, 1, 'invoice', 22, 42, 'Demo', 'Demo description', NULL, NULL, NULL, 1.00, 23.3000, 0.0000, 'undefined', 0.0000, 23.3000, 'core::ui', '3', '2023-11-15 15:48:50', '2023-11-15 15:48:50', NULL),
(8, 1, 'invoice', 23, 35, 'pencil', 'description', NULL, NULL, NULL, 1.00, 10.0000, 0.0000, 'undefined', 0.0000, 10.0000, 'core::ui', '1', '2023-11-16 10:59:55', '2023-11-16 10:59:55', NULL),
(9, 1, 'invoice', 24, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-09 12:01:23', '2024-02-09 12:01:23', NULL),
(10, 1, 'invoice', 25, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-09 12:02:12', '2024-02-09 12:02:12', NULL),
(11, 1, 'invoice', 26, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-09 12:02:17', '2024-02-09 12:02:17', NULL),
(12, 1, 'invoice', 27, 43, 'Demo', 'Demo description', NULL, NULL, NULL, 1.00, 23.3000, 0.0000, 'undefined', 0.0000, 23.3000, 'core::ui', '3', '2024-02-09 12:02:51', '2024-02-09 12:02:51', NULL),
(13, 1, 'invoice', 27, 40, 'New one', '', NULL, NULL, NULL, 1.00, 1000.0000, 0.0000, 'undefined', 0.0000, 1000.0000, 'core::ui', '3', '2024-02-09 12:02:52', '2024-02-09 12:02:52', NULL),
(14, 1, 'invoice', 27, 35, 'pencil', 'description', NULL, NULL, NULL, 1.00, 10.0000, 0.0000, 'undefined', 0.0000, 10.0000, 'core::ui', '3', '2024-02-09 12:02:52', '2024-02-09 12:02:52', NULL),
(15, 1, 'invoice', 27, 37, 'pencil', 'description', NULL, NULL, NULL, 1.00, 10.0000, 0.0000, 'undefined', 0.0000, 10.0000, 'core::ui', '3', '2024-02-09 12:02:53', '2024-02-09 12:02:53', NULL),
(16, 1, 'invoice', 27, 37, 'pencil', 'description', NULL, NULL, NULL, 1.00, 10.0000, 0.0000, 'undefined', 0.0000, 10.0000, 'core::ui', '3', '2024-02-09 12:02:53', '2024-02-09 12:02:53', NULL),
(17, 1, 'invoice', 28, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-10 08:18:08', '2024-02-10 08:18:08', NULL),
(18, 1, 'invoice', 29, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-10 08:18:25', '2024-02-10 08:18:25', NULL),
(19, 1, 'invoice', 30, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-12 15:06:07', '2024-02-12 15:06:07', NULL),
(20, 1, 'invoice', 31, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-12 15:07:03', '2024-02-12 15:07:03', NULL),
(21, 1, 'invoice', 32, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-12 15:07:11', '2024-02-12 15:07:11', NULL),
(22, 1, 'invoice', 33, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-12 15:07:51', '2024-02-12 15:07:51', NULL),
(23, 1, 'invoice', 34, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-02-12 15:09:37', '2024-02-12 15:09:37', NULL),
(24, 1, 'invoice', 35, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-02-12 15:10:24', '2024-02-12 15:10:24', NULL),
(25, 1, 'invoice', 36, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-02-12 15:10:30', '2024-02-12 15:10:30', NULL),
(26, 1, 'invoice', 37, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-02-12 15:10:37', '2024-02-12 15:10:37', NULL),
(27, 1, 'invoice', 38, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-02-12 15:10:44', '2024-02-12 15:10:44', NULL),
(28, 1, 'invoice', 39, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-02-12 15:16:18', '2024-02-12 15:16:18', NULL),
(29, 1, 'invoice', 40, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-02-12 15:16:26', '2024-02-12 15:16:26', NULL),
(30, 1, 'invoice', 41, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-02-12 15:16:33', '2024-02-12 15:16:33', NULL),
(33, 1, 'invoice', 42, 36, 'item1', '', NULL, NULL, NULL, 1.00, 22.0000, 0.0000, 'undefined', 0.0000, 22.0000, 'core::ui', '1', '2024-02-29 10:23:15', '2024-02-29 10:23:15', NULL),
(34, 1, 'sales-order', 43, 36, 'item1', '', NULL, NULL, NULL, 1.00, 22.0000, 0.0000, 'undefined', 0.0000, 22.0000, 'core::ui', '1', '2024-02-29 21:09:22', '2024-02-29 21:09:22', NULL),
(35, 1, 'invoice', 44, 36, 'item1', '', NULL, NULL, NULL, 1.00, 22.0000, 0.0000, 'undefined', 0.0000, 22.0000, 'core::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(36, 1, 'estimate', 45, 36, 'item1', '', NULL, NULL, NULL, 1.00, 22.0000, 0.0000, 'undefined', 0.0000, 22.0000, 'core::ui', '1', '2024-03-03 09:21:07', '2024-03-03 09:21:07', NULL),
(37, 1, 'invoice', 46, 36, 'item1', '', NULL, NULL, NULL, 1.00, 22.0000, 0.0000, 'undefined', 0.0000, 22.0000, 'core::ui', '1', '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL),
(38, 1, 'invoice', 47, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-03-10 11:00:44', '2024-03-10 11:00:44', NULL),
(39, 1, 'invoice', 48, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-03-10 11:00:55', '2024-03-10 11:00:55', NULL),
(40, 1, 'invoice', 49, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-03-10 11:01:04', '2024-03-10 11:01:04', NULL),
(41, 1, 'invoice', 50, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-03-10 11:01:48', '2024-03-10 11:01:48', NULL),
(42, 1, 'invoice', 51, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-03-10 11:01:55', '2024-03-10 11:01:55', NULL),
(43, 1, 'invoice', 52, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-03-10 11:02:03', '2024-03-10 11:02:03', NULL),
(44, 1, 'invoice', 53, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-03-10 11:21:37', '2024-03-10 11:21:37', NULL),
(45, 1, 'invoice', 54, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-03-10 11:21:46', '2024-03-10 11:21:46', NULL),
(46, 1, 'invoice', 55, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-05-28 20:04:49', '2024-05-28 20:04:49', NULL),
(47, 1, 'invoice', 56, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '3', '2024-05-28 20:05:04', '2024-05-28 20:05:04', NULL),
(48, 1, 'invoice', 57, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-05-28 20:05:50', '2024-05-28 20:05:50', NULL),
(49, 1, 'invoice', 58, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-05-28 20:06:02', '2024-05-28 20:06:02', NULL),
(50, 1, 'invoice', 59, 112, 'testing 0786', 'testing 0786', NULL, NULL, NULL, 10.00, 10.7600, 0.0000, 'percentage', 0.0000, 107.6000, 'core::api', '1', '2024-05-28 20:14:27', '2024-05-28 20:14:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_document_item_taxes`
--

CREATE TABLE `kxm_document_item_taxes` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `document_id` int UNSIGNED NOT NULL,
  `document_item_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT '0.0000',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_document_totals`
--

CREATE TABLE `kxm_document_totals` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `document_id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `total_timber` int DEFAULT NULL COMMENT 'custom total',
  `sort_order` int NOT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_document_totals`
--

INSERT INTO `kxm_document_totals` (`id`, `company_id`, `type`, `document_id`, `code`, `name`, `amount`, `total_timber`, `sort_order`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice', 3, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2023-04-02 12:38:41', '2023-04-02 12:38:41', NULL),
(2, 1, 'invoice', 3, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2023-04-02 12:38:41', '2023-04-02 12:38:41', NULL),
(3, 1, 'invoice', 8, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '3', '2023-06-04 14:00:22', '2023-06-04 14:00:22', NULL),
(4, 1, 'invoice', 8, 'total', 'invoices.total', 123.0000, 0, 2, 'core::api', '3', '2023-06-04 14:00:22', '2023-06-04 14:00:22', NULL),
(5, 1, 'invoice', 9, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '3', '2023-06-04 16:19:30', '2023-06-04 16:19:30', NULL),
(6, 1, 'invoice', 9, 'discount', 'invoices.discount', 10.0000, NULL, 2, 'core::api', '3', '2023-06-04 16:19:30', '2023-06-04 16:19:30', NULL),
(7, 1, 'invoice', 9, 'total', 'invoices.total', 123.0000, 0, 3, 'core::api', '3', '2023-06-04 16:19:30', '2023-06-04 16:19:30', NULL),
(8, 1, 'invoice', 10, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '3', '2023-06-04 16:19:56', '2023-06-04 16:19:56', NULL),
(9, 1, 'invoice', 10, 'discount', 'invoices.discount', 10.0000, NULL, 2, 'core::api', '3', '2023-06-04 16:19:56', '2023-06-04 16:19:56', NULL),
(10, 1, 'invoice', 10, 'total', 'invoices.total', 123.0000, 0, 3, 'core::api', '3', '2023-06-04 16:19:56', '2023-06-04 16:19:56', NULL),
(11, 1, 'invoice', 11, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '1', '2023-06-04 16:21:07', '2023-06-04 16:21:07', NULL),
(12, 1, 'invoice', 11, 'discount', 'invoices.discount', 10.0000, NULL, 2, 'core::api', '1', '2023-06-04 16:21:07', '2023-06-04 16:21:07', NULL),
(13, 1, 'invoice', 11, 'total', 'invoices.total', 123.0000, 0, 3, 'core::api', '1', '2023-06-04 16:21:07', '2023-06-04 16:21:07', NULL),
(14, 1, 'invoice', 12, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '1', '2023-06-04 18:22:23', '2023-06-04 18:22:23', NULL),
(15, 1, 'invoice', 12, 'discount', 'invoices.discount', 10.0000, NULL, 2, 'core::api', '1', '2023-06-04 18:22:23', '2023-06-04 18:22:23', NULL),
(16, 1, 'invoice', 12, 'total', 'invoices.total', 123.0000, 0, 3, 'core::api', '1', '2023-06-04 18:22:23', '2023-06-04 18:22:23', NULL),
(17, 1, 'invoice', 13, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '1', '2023-06-04 18:22:46', '2023-06-04 18:22:46', NULL),
(18, 1, 'invoice', 13, 'discount', 'invoices.discount', 10.0000, NULL, 2, 'core::api', '1', '2023-06-04 18:22:46', '2023-06-04 18:22:46', NULL),
(19, 1, 'invoice', 13, 'total', 'invoices.total', 123.0000, 0, 3, 'core::api', '1', '2023-06-04 18:22:46', '2023-06-04 18:22:46', NULL),
(20, 1, 'invoice', 14, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '1', '2023-06-04 18:29:34', '2023-06-04 18:29:34', NULL),
(21, 1, 'invoice', 14, 'discount', 'invoices.discount', 10.0000, NULL, 2, 'core::api', '1', '2023-06-04 18:29:34', '2023-06-04 18:29:34', NULL),
(22, 1, 'invoice', 14, 'total', 'invoices.total', 123.0000, 0, 3, 'core::api', '1', '2023-06-04 18:29:34', '2023-06-04 18:29:34', NULL),
(23, 1, 'invoice', 15, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '1', '2023-06-04 18:30:55', '2023-06-04 18:30:55', NULL),
(24, 1, 'invoice', 15, 'discount', 'invoices.discount', 10.0000, NULL, 2, 'core::api', '1', '2023-06-04 18:30:55', '2023-06-04 18:30:55', NULL),
(25, 1, 'invoice', 15, 'total', 'invoices.total', 123.0000, 0, 3, 'core::api', '1', '2023-06-04 18:30:55', '2023-06-04 18:30:55', NULL),
(26, 1, 'invoice', 16, 'sub_total', 'invoices.sub_total', 0.0000, NULL, 1, 'core::api', '1', '2023-06-04 18:33:40', '2023-06-04 18:33:40', NULL),
(27, 1, 'invoice', 16, 'discount', 'invoices.discount', 10.0000, NULL, 2, 'core::api', '1', '2023-06-04 18:33:40', '2023-06-04 18:33:40', NULL),
(28, 1, 'invoice', 16, 'total', 'invoices.total', 123.0000, 0, 3, 'core::api', '1', '2023-06-04 18:33:40', '2023-06-04 18:33:40', NULL),
(29, 1, 'invoice', 18, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2023-10-04 13:00:36', '2023-10-04 13:00:36', NULL),
(30, 1, 'invoice', 18, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2023-10-04 13:00:36', '2023-10-04 13:00:36', NULL),
(31, 1, 'invoice', 19, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2023-10-12 12:18:48', '2023-10-12 12:18:48', NULL),
(32, 1, 'invoice', 19, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2023-10-12 12:18:48', '2023-10-12 12:18:48', NULL),
(33, 1, 'invoice', 20, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2023-11-15 15:17:42', '2023-11-15 15:17:42', NULL),
(34, 1, 'invoice', 20, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2023-11-15 15:17:42', '2023-11-15 15:17:42', NULL),
(35, 1, 'invoice', 21, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2023-11-15 15:48:22', '2023-11-15 15:48:22', NULL),
(36, 1, 'invoice', 21, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2023-11-15 15:48:22', '2023-11-15 15:48:22', NULL),
(37, 1, 'invoice', 22, 'sub_total', 'invoices.sub_total', 23.3000, NULL, 1, 'core::ui', '3', '2023-11-15 15:48:50', '2023-11-15 15:48:50', NULL),
(38, 1, 'invoice', 22, 'total', 'invoices.total', 23.3000, 0, 2, 'core::ui', '3', '2023-11-15 15:48:50', '2023-11-15 15:48:50', NULL),
(41, 1, 'invoice', 23, 'sub_total', 'invoices.sub_total', 10.0000, NULL, 1, 'core::ui', '1', '2023-11-16 10:59:56', '2023-11-16 10:59:56', NULL),
(42, 1, 'invoice', 23, 'total', 'invoices.total', 10.0000, 0, 2, 'core::ui', '1', '2023-11-16 10:59:56', '2023-11-16 10:59:56', NULL),
(43, 1, 'invoice', 24, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-09 12:01:24', '2024-02-09 12:01:24', NULL),
(44, 1, 'invoice', 24, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-09 12:01:24', '2024-02-09 12:01:24', NULL),
(45, 1, 'invoice', 25, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-09 12:02:12', '2024-02-09 12:02:12', NULL),
(46, 1, 'invoice', 25, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-09 12:02:12', '2024-02-09 12:02:12', NULL),
(47, 1, 'invoice', 26, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-09 12:02:17', '2024-02-09 12:02:17', NULL),
(48, 1, 'invoice', 26, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-09 12:02:17', '2024-02-09 12:02:17', NULL),
(49, 1, 'invoice', 27, 'sub_total', 'invoices.sub_total', 1053.3000, NULL, 1, 'core::ui', '3', '2024-02-09 12:02:54', '2024-02-09 12:02:54', NULL),
(50, 1, 'invoice', 27, 'total', 'invoices.total', 1053.3000, 0, 2, 'core::ui', '3', '2024-02-09 12:02:54', '2024-02-09 12:02:54', NULL),
(51, 1, 'invoice', 28, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-10 08:18:09', '2024-02-10 08:18:09', NULL),
(52, 1, 'invoice', 28, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-10 08:18:09', '2024-02-10 08:18:09', NULL),
(53, 1, 'invoice', 29, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-10 08:18:26', '2024-02-10 08:18:26', NULL),
(54, 1, 'invoice', 29, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-10 08:18:26', '2024-02-10 08:18:26', NULL),
(55, 1, 'invoice', 30, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-12 15:06:08', '2024-02-12 15:06:08', NULL),
(56, 1, 'invoice', 30, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-12 15:06:08', '2024-02-12 15:06:08', NULL),
(57, 1, 'invoice', 31, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-12 15:07:04', '2024-02-12 15:07:04', NULL),
(58, 1, 'invoice', 31, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-12 15:07:04', '2024-02-12 15:07:04', NULL),
(59, 1, 'invoice', 32, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-12 15:07:12', '2024-02-12 15:07:12', NULL),
(60, 1, 'invoice', 32, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-12 15:07:12', '2024-02-12 15:07:12', NULL),
(61, 1, 'invoice', 33, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-12 15:07:51', '2024-02-12 15:07:51', NULL),
(62, 1, 'invoice', 33, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-12 15:07:51', '2024-02-12 15:07:51', NULL),
(63, 1, 'invoice', 34, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-02-12 15:09:38', '2024-02-12 15:09:38', NULL),
(64, 1, 'invoice', 34, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-02-12 15:09:38', '2024-02-12 15:09:38', NULL),
(65, 1, 'invoice', 35, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-02-12 15:10:24', '2024-02-12 15:10:24', NULL),
(66, 1, 'invoice', 35, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-02-12 15:10:24', '2024-02-12 15:10:24', NULL),
(67, 1, 'invoice', 36, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-02-12 15:10:31', '2024-02-12 15:10:31', NULL),
(68, 1, 'invoice', 36, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-02-12 15:10:31', '2024-02-12 15:10:31', NULL),
(69, 1, 'invoice', 37, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-02-12 15:10:37', '2024-02-12 15:10:37', NULL),
(70, 1, 'invoice', 37, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-02-12 15:10:37', '2024-02-12 15:10:37', NULL),
(71, 1, 'invoice', 38, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-02-12 15:10:44', '2024-02-12 15:10:44', NULL),
(72, 1, 'invoice', 38, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-02-12 15:10:44', '2024-02-12 15:10:44', NULL),
(73, 1, 'invoice', 39, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-02-12 15:16:18', '2024-02-12 15:16:18', NULL),
(74, 1, 'invoice', 39, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-02-12 15:16:18', '2024-02-12 15:16:18', NULL),
(75, 1, 'invoice', 40, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-02-12 15:16:26', '2024-02-12 15:16:26', NULL),
(76, 1, 'invoice', 40, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-02-12 15:16:26', '2024-02-12 15:16:26', NULL),
(77, 1, 'invoice', 41, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-02-12 15:16:33', '2024-02-12 15:16:33', NULL),
(78, 1, 'invoice', 41, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-02-12 15:16:33', '2024-02-12 15:16:33', NULL),
(83, 1, 'invoice', 42, 'sub_total', 'invoices.sub_total', 22.0000, NULL, 1, 'core::ui', '1', '2024-02-29 10:23:16', '2024-02-29 10:23:16', NULL),
(84, 1, 'invoice', 42, 'total', 'invoices.total', 22.0000, 0, 2, 'core::ui', '1', '2024-02-29 10:23:16', '2024-02-29 10:23:16', NULL),
(85, 1, 'sales-order', 43, 'sub_total', 'invoices.sub_total', 22.0000, NULL, 1, 'core::ui', '1', '2024-02-29 21:09:22', '2024-02-29 21:09:22', NULL),
(86, 1, 'sales-order', 43, 'total', 'invoices.total', 22.0000, 0, 2, 'core::ui', '1', '2024-02-29 21:09:22', '2024-02-29 21:09:22', NULL),
(87, 1, 'invoice', 44, 'sub_total', 'invoices.sub_total', 22.0000, NULL, 1, 'core::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(88, 1, 'invoice', 44, 'total', 'invoices.total', 22.0000, 0, 2, 'core::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(89, 1, 'estimate', 45, 'sub_total', 'invoices.sub_total', 22.0000, NULL, 1, 'core::ui', '1', '2024-03-03 09:21:07', '2024-03-03 09:21:07', NULL),
(90, 1, 'estimate', 45, 'total', 'invoices.total', 22.0000, 0, 2, 'core::ui', '1', '2024-03-03 09:21:07', '2024-03-03 09:21:07', NULL),
(91, 1, 'invoice', 46, 'sub_total', 'invoices.sub_total', 22.0000, NULL, 1, 'core::ui', '1', '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL),
(92, 1, 'invoice', 46, 'total', 'invoices.total', 22.0000, 0, 2, 'core::ui', '1', '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL),
(93, 1, 'invoice', 47, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-03-10 11:00:45', '2024-03-10 11:00:45', NULL),
(94, 1, 'invoice', 47, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-03-10 11:00:45', '2024-03-10 11:00:45', NULL),
(95, 1, 'invoice', 48, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-03-10 11:00:56', '2024-03-10 11:00:56', NULL),
(96, 1, 'invoice', 48, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-03-10 11:00:56', '2024-03-10 11:00:56', NULL),
(97, 1, 'invoice', 49, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-03-10 11:01:05', '2024-03-10 11:01:05', NULL),
(98, 1, 'invoice', 49, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-03-10 11:01:05', '2024-03-10 11:01:05', NULL),
(99, 1, 'invoice', 50, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-03-10 11:01:48', '2024-03-10 11:01:48', NULL),
(100, 1, 'invoice', 50, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-03-10 11:01:48', '2024-03-10 11:01:48', NULL),
(101, 1, 'invoice', 51, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-03-10 11:01:55', '2024-03-10 11:01:55', NULL),
(102, 1, 'invoice', 51, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-03-10 11:01:55', '2024-03-10 11:01:55', NULL),
(103, 1, 'invoice', 52, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-03-10 11:02:03', '2024-03-10 11:02:03', NULL),
(104, 1, 'invoice', 52, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-03-10 11:02:03', '2024-03-10 11:02:03', NULL),
(105, 1, 'invoice', 53, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-03-10 11:21:37', '2024-03-10 11:21:37', NULL),
(106, 1, 'invoice', 53, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-03-10 11:21:37', '2024-03-10 11:21:37', NULL),
(107, 1, 'invoice', 54, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-03-10 11:21:46', '2024-03-10 11:21:46', NULL),
(108, 1, 'invoice', 54, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-03-10 11:21:46', '2024-03-10 11:21:46', NULL),
(109, 1, 'invoice', 55, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-05-28 20:04:49', '2024-05-28 20:04:49', NULL),
(110, 1, 'invoice', 55, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-05-28 20:04:49', '2024-05-28 20:04:49', NULL),
(111, 1, 'invoice', 56, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '3', '2024-05-28 20:05:05', '2024-05-28 20:05:05', NULL),
(112, 1, 'invoice', 56, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '3', '2024-05-28 20:05:05', '2024-05-28 20:05:05', NULL),
(113, 1, 'invoice', 57, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-05-28 20:05:50', '2024-05-28 20:05:50', NULL),
(114, 1, 'invoice', 57, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-05-28 20:05:50', '2024-05-28 20:05:50', NULL),
(115, 1, 'invoice', 58, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-05-28 20:06:02', '2024-05-28 20:06:02', NULL),
(116, 1, 'invoice', 58, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-05-28 20:06:02', '2024-05-28 20:06:02', NULL),
(117, 1, 'invoice', 59, 'sub_total', 'invoices.sub_total', 107.6000, NULL, 1, 'core::api', '1', '2024-05-28 20:14:27', '2024-05-28 20:14:27', NULL),
(118, 1, 'invoice', 59, 'total', 'invoices.total', 117.6000, 0, 2, 'core::api', '1', '2024-05-28 20:14:27', '2024-05-28 20:14:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_double_entry_accounts`
--

CREATE TABLE `kxm_double_entry_accounts` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `type_id` int NOT NULL,
  `account_id` int UNSIGNED DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_double_entry_accounts`
--

INSERT INTO `kxm_double_entry_accounts` (`id`, `company_id`, `type_id`, `account_id`, `code`, `name`, `description`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, '120', 'double-entry::accounts.120', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(2, 1, 3, NULL, '140', 'double-entry::accounts.140', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(3, 1, 2, NULL, '150', 'double-entry::accounts.150', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(4, 1, 2, NULL, '160', 'double-entry::accounts.160', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(5, 1, 10, NULL, '170', 'double-entry::accounts.170', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(6, 1, 7, NULL, '200', 'double-entry::accounts.200', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(7, 1, 7, NULL, '205', 'double-entry::accounts.205', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(8, 1, 7, NULL, '210', 'double-entry::accounts.210', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(9, 1, 7, NULL, '215', 'double-entry::accounts.215', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(10, 1, 7, NULL, '216', 'double-entry::accounts.216', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(11, 1, 7, NULL, '235', 'double-entry::accounts.235', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(12, 1, 7, NULL, '236', 'double-entry::accounts.236', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(13, 1, 7, NULL, '250', 'double-entry::accounts.250', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(14, 1, 7, NULL, '255', 'double-entry::accounts.255', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(15, 1, 7, NULL, '260', 'double-entry::accounts.260', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(16, 1, 7, NULL, '835', 'double-entry::accounts.835', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(17, 1, 7, NULL, '855', 'double-entry::accounts.855', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(18, 1, 9, NULL, '290', 'double-entry::accounts.290', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(19, 1, 11, NULL, '500', 'double-entry::accounts.500', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(20, 1, 12, NULL, '600', 'double-entry::accounts.600', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(21, 1, 12, NULL, '605', 'double-entry::accounts.605', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(22, 1, 12, NULL, '610', 'double-entry::accounts.610', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(23, 1, 12, NULL, '615', 'double-entry::accounts.615', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(24, 1, 12, NULL, '620', 'double-entry::accounts.620', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(25, 1, 12, NULL, '624', 'double-entry::accounts.624', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(26, 1, 12, NULL, '628', 'double-entry::accounts.628', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(27, 1, 12, NULL, '632', 'double-entry::accounts.632', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(28, 1, 12, NULL, '636', 'double-entry::accounts.636', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(29, 1, 12, NULL, '640', 'double-entry::accounts.640', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(30, 1, 12, NULL, '644', 'double-entry::accounts.644', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(31, 1, 12, NULL, '648', 'double-entry::accounts.648', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(32, 1, 12, NULL, '652', 'double-entry::accounts.652', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(33, 1, 12, NULL, '656', 'double-entry::accounts.656', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(34, 1, 12, NULL, '660', 'double-entry::accounts.660', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(35, 1, 12, NULL, '664', 'double-entry::accounts.664', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(36, 1, 12, NULL, '672', 'double-entry::accounts.672', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(37, 1, 12, NULL, '676', 'double-entry::accounts.676', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(38, 1, 12, NULL, '680', 'double-entry::accounts.680', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(39, 1, 12, NULL, '684', 'double-entry::accounts.684', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(40, 1, 12, NULL, '700', 'double-entry::accounts.700', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(41, 1, 12, NULL, '715', 'double-entry::accounts.715', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(42, 1, 12, NULL, '800', 'double-entry::accounts.800', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(43, 1, 12, NULL, '810', 'double-entry::accounts.810', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(44, 1, 12, NULL, '815', 'double-entry::accounts.815', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(45, 1, 12, NULL, '820', 'double-entry::accounts.820', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(46, 1, 12, NULL, '825', 'double-entry::accounts.825', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(47, 1, 13, NULL, '400', 'double-entry::accounts.400', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(48, 1, 13, NULL, '460', 'double-entry::accounts.460', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(49, 1, 13, NULL, '470', 'double-entry::accounts.470', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(50, 1, 13, NULL, '475', 'double-entry::accounts.475', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(51, 1, 16, NULL, '300', 'double-entry::accounts.300', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(52, 1, 16, NULL, '310', 'double-entry::accounts.310', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(53, 1, 16, NULL, '320', 'double-entry::accounts.320', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(54, 1, 16, NULL, '330', 'double-entry::accounts.330', NULL, 1, NULL, NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_double_entry_account_bank`
--

CREATE TABLE `kxm_double_entry_account_bank` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `account_id` int NOT NULL,
  `bank_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_double_entry_account_item`
--

CREATE TABLE `kxm_double_entry_account_item` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `account_id` int NOT NULL,
  `item_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_double_entry_account_tax`
--

CREATE TABLE `kxm_double_entry_account_tax` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `account_id` int NOT NULL,
  `tax_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_double_entry_classes`
--

CREATE TABLE `kxm_double_entry_classes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_double_entry_classes`
--

INSERT INTO `kxm_double_entry_classes` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'double-entry::classes.assets', '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(2, 'double-entry::classes.liabilities', '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(3, 'double-entry::classes.expenses', '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(4, 'double-entry::classes.income', '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(5, 'double-entry::classes.equity', '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_double_entry_journals`
--

CREATE TABLE `kxm_double_entry_journals` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15,4) NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `journal_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `basis` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `currency_rate` double(15,8) DEFAULT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_double_entry_ledger`
--

CREATE TABLE `kxm_double_entry_ledger` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `account_id` int NOT NULL,
  `ledgerable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ledgerable_id` bigint UNSIGNED NOT NULL,
  `issued_at` datetime NOT NULL,
  `entry_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `debit` double(15,4) DEFAULT NULL,
  `credit` double(15,4) DEFAULT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_double_entry_types`
--

CREATE TABLE `kxm_double_entry_types` (
  `id` int UNSIGNED NOT NULL,
  `class_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_double_entry_types`
--

INSERT INTO `kxm_double_entry_types` (`id`, `class_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'double-entry::types.current_asset', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(2, 1, 'double-entry::types.fixed_asset', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(3, 1, 'double-entry::types.inventory', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(4, 1, 'double-entry::types.non_current_asset', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(5, 1, 'double-entry::types.prepayment', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(6, 1, 'double-entry::types.bank_cash', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(7, 2, 'double-entry::types.current_liability', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(8, 2, 'double-entry::types.liability', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(9, 2, 'double-entry::types.non_current_liability', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(10, 1, 'double-entry::types.depreciation', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(11, 3, 'double-entry::types.direct_costs', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(12, 3, 'double-entry::types.expense', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(13, 4, 'double-entry::types.revenue', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(14, 4, 'double-entry::types.sales', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(15, 4, 'double-entry::types.other_income', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(16, 5, 'double-entry::types.equity', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL),
(17, 2, 'double-entry::types.tax', '2023-03-05 14:24:11', '2023-03-05 14:24:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_email_templates`
--

CREATE TABLE `kxm_email_templates` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `alias` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `class` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_email_templates`
--

INSERT INTO `kxm_email_templates` (`id`, `company_id`, `alias`, `class`, `name`, `subject`, `body`, `params`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} invoice created', 'Dear {customer_name},<br /><br />We have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(2, 1, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} invoice overdue notice', 'Dear {customer_name},<br /><br />This is an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(3, 1, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} invoice overdue notice', 'Hello,<br /><br />{customer_name} has received an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(4, 1, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} recurring invoice created', 'Dear {customer_name},<br /><br />Based on your recurring circle, we have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(5, 1, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{invoice_number} recurring invoice created', 'Hello,<br /><br />Based on {customer_name} recurring circle, <strong>{invoice_number}</strong> invoice has been automatically created.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(6, 1, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Payment received for {invoice_number} invoice', 'Dear {customer_name},<br /><br />Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br />Amount: <strong>{transaction_total}</strong><br />Date: <strong>{transaction_paid_date}</strong><br />Invoice Number: <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />You can always see the invoice details from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(7, 1, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Payment received for {invoice_number} invoice', 'Hello,<br /><br />{customer_name} recorded a payment for <strong>{invoice_number}</strong> invoice.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(8, 1, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} bill reminding notice', 'Hello,<br /><br />This is a reminding notice for <strong>{bill_number}</strong> bill to {vendor_name}.<br /><br />The bill total is {bill_total} and is due <strong>{bill_due_date}</strong>.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(9, 1, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} recurring bill created', 'Hello,<br /><br />Based on {vendor_name} recurring circle, <strong>{bill_number}</strong> bill has been automatically created.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(10, 1, 'revenue_new_customer', 'App\\Notifications\\Sale\\Revenue', 'settings.email.templates.revenue_new_customer', '{revenue_date} payment created', 'Dear {customer_name},<br /><br />We have prepared the following payment. <br /><br />You can see the payment details from the following link: <a href=\"{revenue_guest_link}\">{revenue_date}</a>.<br /><br />Feel free to contact us with any questions..<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', NULL, '2022-07-07 09:14:38', '2022-07-07 09:14:38', NULL),
(11, 1, 'credit_note_new_customer', 'Modules\\CreditDebitNotes\\Notifications\\CreditNote', 'credit-debit-notes::settings.email.templates.credit_note_new_customer', '{credit_note_number} credit note created', 'Dear {customer_name},<br /><br />We have prepared the following credit note for you: <strong>{credit_note_number}</strong>.<br /><br />You can see the credit note details from the following link: <a href=\"{credit_note_guest_link}\">{credit_note_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-07-07 09:17:05', '2022-07-07 09:17:05', NULL),
(12, 1, 'estimate_new_customer', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.new_customer', '{estimate_number} estimate created', 'Dear {customer_name},<br /><br />We have prepared the following estimate for you: <strong>{estimate_number}</strong>.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_guest_link}\">{estimate_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-07-07 09:17:24', '2022-07-07 09:17:24', NULL),
(13, 1, 'estimate_remind_customer', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.remind_customer', '{estimate_number} estimate reminding notice', 'Dear {customer_name},<br /><br />This is a reminding notice for <strong>{estimate_number}</strong> estimate.<br /><br />The estimate total is {estimate_total} and will be expired at <strong>{estimate_expiry_date}</strong>.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_guest_link}\">{estimate_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-07-07 09:17:24', '2022-07-07 09:17:24', NULL),
(14, 1, 'estimate_remind_admin', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.remind_admin', '{estimate_number} estimate reminding notice', 'Hello,<br /><br />This is a reminding notice for <strong>{estimate_number}</strong> estimate to {customer_name}.<br /><br />The estimate total is {estimate_total} and will be expired at <strong>{estimate_expiry_date}</strong>.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_admin_link}\">{estimate_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-07-07 09:17:24', '2022-07-07 09:17:24', NULL),
(15, 1, 'estimate_approved_admin', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.approved_admin', '{estimate_number} estimate approved', 'Hello,<br /><br />{customer_name} approved <strong>{estimate_number}</strong> estimate.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_admin_link}\">{estimate_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-07-07 09:17:24', '2022-07-07 09:17:24', NULL),
(16, 1, 'estimate_refused_admin', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.refused_admin', '{estimate_number} estimate refused', 'Hello,<br /><br />{customer_name} refused <strong>{estimate_number}</strong> estimate.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_admin_link}\">{estimate_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-07-07 09:17:24', '2022-07-07 09:17:24', NULL),
(17, 1, 'sales_order_new_customer', 'Modules\\SalesPurchaseOrders\\Notifications\\SalesOrder', 'sales-purchase-orders::settings.sales_order.new_customer', '{sales_order_number} Sales Order created', 'Dear {customer_name},<br /><br />Thanks for your interest in our services. Please find our sales order attached with this mail.<br /><br />-------------------------------------------------<br />Amount: <strong>{sales_order_total}</strong><br />Date: <strong>{sales_order_issued_at}</strong><br />Sales Order Number: <strong>{sales_order_number}</strong><br />-------------------------------------------------<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-07-07 09:17:35', '2022-07-07 09:17:35', NULL),
(18, 1, 'purchase_order_new_vendor', 'Modules\\SalesPurchaseOrders\\Notifications\\PurchaseOrder', 'sales-purchase-orders::settings.purchase_order.new_vendor', '{purchase_order_number} Purchase Order created', 'Dear {vendor_name},<br /><br />Please find our purchase order attached with this mail.<br /><br />-------------------------------------------------<br />Amount: <strong>{purchase_order_total}</strong><br />Date: <strong>{purchase_order_issued_at}</strong><br />Purchase Order Number: <strong>{purchase_order_number}</strong><br />-------------------------------------------------<br /><br />Please go through it and confirm the order. We look forward to working with you again<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-07-07 09:17:35', '2022-07-07 09:17:35', NULL),
(19, 2, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} facture créée', 'Cher {customer_name},<br /><br />Nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(20, 2, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(21, 2, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(22, 2, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} facture récurrente créée', 'Cher {customer_name},<br /><br />Selon votre plan de facturation, nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(23, 2, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Selon la facturation planifiée de  {customer_name} , <strong>{invoice_number}</strong> la facture a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(24, 2, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Paiement reçu pour la facture {invoice_number}', 'Cher {customer_name},<br /><br />Merci pour votre paiement. Vous Trouverez les détails de paiement ci-dessous :<br /><br />-------------------------------------------------<br />Montant : <strong>{transaction_total}</strong><br />Date : <strong>{transaction_paid_date}</strong><br />Numéro de facture : <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />Vous pouvez toujours consulter les détails de la facture à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(25, 2, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Paiement reçu pour la facture {invoice_number}', 'Bonjour,<br /><br />{customer_name} a enregistré un paiement pour la facture <strong>{invoice_number}</strong> .<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(26, 2, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} avis de rappel de facture', 'Bonjour,<br /><br />Ceci est un rappel pour la facture <strong>{bill_number}</strong> à {vendor_name}.<br /><br />Le total de la facture est de {bill_total} et est dû le <strong>{bill_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(27, 2, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Sur la base du plan de facturation planifié de {vendor_name} , la facture  <strong>{bill_number}</strong> a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(28, 2, 'revenue_new_customer', 'App\\Notifications\\Sale\\Revenue', 'settings.email.templates.revenue_new_customer', '{revenue_date} payment created', 'Dear {customer_name},<br /><br />We have prepared the following payment. <br /><br />You can see the payment details from the following link: <a href=\"{revenue_guest_link}\">{revenue_date}</a>.<br /><br />Feel free to contact us with any questions..<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(29, 2, 'credit_note_new_customer', 'Modules\\CreditDebitNotes\\Notifications\\CreditNote', 'credit-debit-notes::settings.email.templates.credit_note_new_customer', '{credit_note_number} credit note created', 'Dear {customer_name},<br /><br />We have prepared the following credit note for you: <strong>{credit_note_number}</strong>.<br /><br />You can see the credit note details from the following link: <a href=\"{credit_note_guest_link}\">{credit_note_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-10 12:40:13', '2022-09-10 12:40:13', NULL),
(30, 2, 'sales_order_new_customer', 'Modules\\SalesPurchaseOrders\\Notifications\\SalesOrder', 'sales-purchase-orders::settings.sales_order.new_customer', '{sales_order_number} Sales Order created', 'Dear {customer_name},<br /><br />Thanks for your interest in our services. Please find our sales order attached with this mail.<br /><br />-------------------------------------------------<br />Amount: <strong>{sales_order_total}</strong><br />Date: <strong>{sales_order_issued_at}</strong><br />Sales Order Number: <strong>{sales_order_number}</strong><br />-------------------------------------------------<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 08:39:55', '2022-09-12 08:39:55', NULL),
(31, 2, 'purchase_order_new_vendor', 'Modules\\SalesPurchaseOrders\\Notifications\\PurchaseOrder', 'sales-purchase-orders::settings.purchase_order.new_vendor', '{purchase_order_number} Purchase Order created', 'Dear {vendor_name},<br /><br />Please find our purchase order attached with this mail.<br /><br />-------------------------------------------------<br />Amount: <strong>{purchase_order_total}</strong><br />Date: <strong>{purchase_order_issued_at}</strong><br />Purchase Order Number: <strong>{purchase_order_number}</strong><br />-------------------------------------------------<br /><br />Please go through it and confirm the order. We look forward to working with you again<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 08:39:55', '2022-09-12 08:39:55', NULL),
(32, 3, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} facture créée', 'Cher {customer_name},<br /><br />Nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(33, 3, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(34, 3, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(35, 3, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} facture récurrente créée', 'Cher {customer_name},<br /><br />Selon votre plan de facturation, nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(36, 3, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Selon la facturation planifiée de  {customer_name} , <strong>{invoice_number}</strong> la facture a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(37, 3, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Paiement reçu pour la facture {invoice_number}', 'Cher {customer_name},<br /><br />Merci pour votre paiement. Vous Trouverez les détails de paiement ci-dessous :<br /><br />-------------------------------------------------<br />Montant : <strong>{transaction_total}</strong><br />Date : <strong>{transaction_paid_date}</strong><br />Numéro de facture : <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />Vous pouvez toujours consulter les détails de la facture à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(38, 3, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Paiement reçu pour la facture {invoice_number}', 'Bonjour,<br /><br />{customer_name} a enregistré un paiement pour la facture <strong>{invoice_number}</strong> .<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(39, 3, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} avis de rappel de facture', 'Bonjour,<br /><br />Ceci est un rappel pour la facture <strong>{bill_number}</strong> à {vendor_name}.<br /><br />Le total de la facture est de {bill_total} et est dû le <strong>{bill_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(40, 3, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Sur la base du plan de facturation planifié de {vendor_name} , la facture  <strong>{bill_number}</strong> a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(41, 3, 'revenue_new_customer', 'App\\Notifications\\Sale\\Revenue', 'settings.email.templates.revenue_new_customer', '{revenue_date} payment created', 'Dear {customer_name},<br /><br />We have prepared the following payment. <br /><br />You can see the payment details from the following link: <a href=\"{revenue_guest_link}\">{revenue_date}</a>.<br /><br />Feel free to contact us with any questions..<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:02:13', '2022-09-12 10:02:13', NULL),
(42, 3, 'sales_order_new_customer', 'Modules\\SalesPurchaseOrders\\Notifications\\SalesOrder', 'sales-purchase-orders::settings.sales_order.new_customer', '{sales_order_number} Sales Order created', 'Dear {customer_name},<br /><br />Thanks for your interest in our services. Please find our sales order attached with this mail.<br /><br />-------------------------------------------------<br />Amount: <strong>{sales_order_total}</strong><br />Date: <strong>{sales_order_issued_at}</strong><br />Sales Order Number: <strong>{sales_order_number}</strong><br />-------------------------------------------------<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:03:53', '2022-09-12 10:03:53', NULL),
(43, 3, 'purchase_order_new_vendor', 'Modules\\SalesPurchaseOrders\\Notifications\\PurchaseOrder', 'sales-purchase-orders::settings.purchase_order.new_vendor', '{purchase_order_number} Purchase Order created', 'Dear {vendor_name},<br /><br />Please find our purchase order attached with this mail.<br /><br />-------------------------------------------------<br />Amount: <strong>{purchase_order_total}</strong><br />Date: <strong>{purchase_order_issued_at}</strong><br />Purchase Order Number: <strong>{purchase_order_number}</strong><br />-------------------------------------------------<br /><br />Please go through it and confirm the order. We look forward to working with you again<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:03:53', '2022-09-12 10:03:53', NULL),
(44, 3, 'credit_note_new_customer', 'Modules\\CreditDebitNotes\\Notifications\\CreditNote', 'credit-debit-notes::settings.email.templates.credit_note_new_customer', '{credit_note_number} credit note created', 'Dear {customer_name},<br /><br />We have prepared the following credit note for you: <strong>{credit_note_number}</strong>.<br /><br />You can see the credit note details from the following link: <a href=\"{credit_note_guest_link}\">{credit_note_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:04:02', '2022-09-12 10:04:02', NULL),
(45, 4, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} facture créée', 'Cher {customer_name},<br /><br />Nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(46, 4, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(47, 4, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(48, 4, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} facture récurrente créée', 'Cher {customer_name},<br /><br />Selon votre plan de facturation, nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(49, 4, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Selon la facturation planifiée de  {customer_name} , <strong>{invoice_number}</strong> la facture a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(50, 4, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Paiement reçu pour la facture {invoice_number}', 'Cher {customer_name},<br /><br />Merci pour votre paiement. Vous Trouverez les détails de paiement ci-dessous :<br /><br />-------------------------------------------------<br />Montant : <strong>{transaction_total}</strong><br />Date : <strong>{transaction_paid_date}</strong><br />Numéro de facture : <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />Vous pouvez toujours consulter les détails de la facture à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(51, 4, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Paiement reçu pour la facture {invoice_number}', 'Bonjour,<br /><br />{customer_name} a enregistré un paiement pour la facture <strong>{invoice_number}</strong> .<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(52, 4, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} avis de rappel de facture', 'Bonjour,<br /><br />Ceci est un rappel pour la facture <strong>{bill_number}</strong> à {vendor_name}.<br /><br />Le total de la facture est de {bill_total} et est dû le <strong>{bill_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(53, 4, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Sur la base du plan de facturation planifié de {vendor_name} , la facture  <strong>{bill_number}</strong> a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(54, 4, 'revenue_new_customer', 'App\\Notifications\\Sale\\Revenue', 'settings.email.templates.revenue_new_customer', '{revenue_date} payment created', 'Dear {customer_name},<br /><br />We have prepared the following payment. <br /><br />You can see the payment details from the following link: <a href=\"{revenue_guest_link}\">{revenue_date}</a>.<br /><br />Feel free to contact us with any questions..<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 10:27:59', '2022-09-12 10:27:59', NULL),
(55, 4, 'sales_order_new_customer', 'Modules\\SalesPurchaseOrders\\Notifications\\SalesOrder', 'sales-purchase-orders::settings.sales_order.new_customer', '{sales_order_number} Sales Order created', 'Dear {customer_name},<br /><br />Thanks for your interest in our services. Please find our sales order attached with this mail.<br /><br />-------------------------------------------------<br />Amount: <strong>{sales_order_total}</strong><br />Date: <strong>{sales_order_issued_at}</strong><br />Sales Order Number: <strong>{sales_order_number}</strong><br />-------------------------------------------------<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:30:53', '2022-09-12 10:30:53', NULL),
(56, 4, 'purchase_order_new_vendor', 'Modules\\SalesPurchaseOrders\\Notifications\\PurchaseOrder', 'sales-purchase-orders::settings.purchase_order.new_vendor', '{purchase_order_number} Purchase Order created', 'Dear {vendor_name},<br /><br />Please find our purchase order attached with this mail.<br /><br />-------------------------------------------------<br />Amount: <strong>{purchase_order_total}</strong><br />Date: <strong>{purchase_order_issued_at}</strong><br />Purchase Order Number: <strong>{purchase_order_number}</strong><br />-------------------------------------------------<br /><br />Please go through it and confirm the order. We look forward to working with you again<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:30:53', '2022-09-12 10:30:53', NULL),
(57, 4, 'credit_note_new_customer', 'Modules\\CreditDebitNotes\\Notifications\\CreditNote', 'credit-debit-notes::settings.email.templates.credit_note_new_customer', '{credit_note_number} credit note created', 'Dear {customer_name},<br /><br />We have prepared the following credit note for you: <strong>{credit_note_number}</strong>.<br /><br />You can see the credit note details from the following link: <a href=\"{credit_note_guest_link}\">{credit_note_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:31:00', '2022-09-12 10:31:00', NULL),
(58, 4, 'estimate_new_customer', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.new_customer', '{estimate_number} estimate created', 'Dear {customer_name},<br /><br />We have prepared the following estimate for you: <strong>{estimate_number}</strong>.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_guest_link}\">{estimate_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:31:47', '2022-09-12 10:31:47', NULL),
(59, 4, 'estimate_remind_customer', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.remind_customer', '{estimate_number} estimate reminding notice', 'Dear {customer_name},<br /><br />This is a reminding notice for <strong>{estimate_number}</strong> estimate.<br /><br />The estimate total is {estimate_total} and will be expired at <strong>{estimate_expiry_date}</strong>.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_guest_link}\">{estimate_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:31:47', '2022-09-12 10:31:47', NULL),
(60, 4, 'estimate_remind_admin', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.remind_admin', '{estimate_number} estimate reminding notice', 'Hello,<br /><br />This is a reminding notice for <strong>{estimate_number}</strong> estimate to {customer_name}.<br /><br />The estimate total is {estimate_total} and will be expired at <strong>{estimate_expiry_date}</strong>.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_admin_link}\">{estimate_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:31:47', '2022-09-12 10:31:47', NULL),
(61, 4, 'estimate_approved_admin', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.approved_admin', '{estimate_number} estimate approved', 'Hello,<br /><br />{customer_name} approved <strong>{estimate_number}</strong> estimate.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_admin_link}\">{estimate_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:31:47', '2022-09-12 10:31:47', NULL),
(62, 4, 'estimate_refused_admin', 'Modules\\Estimates\\Notifications\\Estimate', 'estimates::settings.estimate.refused_admin', '{estimate_number} estimate refused', 'Hello,<br /><br />{customer_name} refused <strong>{estimate_number}</strong> estimate.<br /><br />You can see the estimate details from the following link: <a href=\"{estimate_admin_link}\">{estimate_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, NULL, NULL, '2022-09-12 10:31:47', '2022-09-12 10:31:47', NULL),
(73, 6, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} facture créée', 'Cher {customer_name},<br /><br />Nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(74, 6, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(75, 6, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(76, 6, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} facture récurrente créée', 'Cher {customer_name},<br /><br />Selon votre plan de facturation, nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(77, 6, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Selon la facturation planifiée de  {customer_name} , <strong>{invoice_number}</strong> la facture a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(78, 6, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Paiement reçu pour la facture {invoice_number}', 'Cher {customer_name},<br /><br />Merci pour votre paiement. Vous Trouverez les détails de paiement ci-dessous :<br /><br />-------------------------------------------------<br />Montant : <strong>{transaction_total}</strong><br />Date : <strong>{transaction_paid_date}</strong><br />Numéro de facture : <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />Vous pouvez toujours consulter les détails de la facture à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(79, 6, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Paiement reçu pour la facture {invoice_number}', 'Bonjour,<br /><br />{customer_name} a enregistré un paiement pour la facture <strong>{invoice_number}</strong> .<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(80, 6, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} avis de rappel de facture', 'Bonjour,<br /><br />Ceci est un rappel pour la facture <strong>{bill_number}</strong> à {vendor_name}.<br /><br />Le total de la facture est de {bill_total} et est dû le <strong>{bill_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(81, 6, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Sur la base du plan de facturation planifié de {vendor_name} , la facture  <strong>{bill_number}</strong> a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(82, 6, 'revenue_new_customer', 'App\\Notifications\\Sale\\Revenue', 'settings.email.templates.revenue_new_customer', '{revenue_date} payment created', 'Dear {customer_name},<br /><br />We have prepared the following payment. <br /><br />You can see the payment details from the following link: <a href=\"{revenue_guest_link}\">{revenue_date}</a>.<br /><br />Feel free to contact us with any questions..<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(83, 7, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} facture créée', 'Cher {customer_name},<br /><br />Nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(84, 7, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(85, 7, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} avis de retard de facture', 'Cher/chère {customer_name},<br /><br />Ceci est une notification en retard pour la facture <strong>{invoice_number}</strong> .<br /><br />Le total de la facture est de {invoice_total} et était dû le <strong>{invoice_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(86, 7, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} facture récurrente créée', 'Cher {customer_name},<br /><br />Selon votre plan de facturation, nous avons préparé la facture suivante pour vous : <strong>{invoice_number}</strong>.<br /><br />Vous pouvez consulter les détails de la facture et procéder au paiement à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:25', '2022-09-13 09:53:25', NULL),
(87, 7, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Selon la facturation planifiée de  {customer_name} , <strong>{invoice_number}</strong> la facture a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL);
INSERT INTO `kxm_email_templates` (`id`, `company_id`, `alias`, `class`, `name`, `subject`, `body`, `params`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(88, 7, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Paiement reçu pour la facture {invoice_number}', 'Cher {customer_name},<br /><br />Merci pour votre paiement. Vous Trouverez les détails de paiement ci-dessous :<br /><br />-------------------------------------------------<br />Montant : <strong>{transaction_total}</strong><br />Date : <strong>{transaction_paid_date}</strong><br />Numéro de facture : <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />Vous pouvez toujours consulter les détails de la facture à partir du lien suivant : <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />N\'hésitez pas à nous contacter pour toute question.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(89, 7, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Paiement reçu pour la facture {invoice_number}', 'Bonjour,<br /><br />{customer_name} a enregistré un paiement pour la facture <strong>{invoice_number}</strong> .<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(90, 7, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} avis de rappel de facture', 'Bonjour,<br /><br />Ceci est un rappel pour la facture <strong>{bill_number}</strong> à {vendor_name}.<br /><br />Le total de la facture est de {bill_total} et est dû le <strong>{bill_due_date}</strong>.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(91, 7, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} facture récurrente créée', 'Bonjour,<br /><br />Sur la base du plan de facturation planifié de {vendor_name} , la facture  <strong>{bill_number}</strong> a été automatiquement créée.<br /><br />Vous pouvez voir les détails de la facture à partir du lien suivant : <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Cordialement,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(92, 7, 'revenue_new_customer', 'App\\Notifications\\Sale\\Revenue', 'settings.email.templates.revenue_new_customer', '{revenue_date} payment created', 'Dear {customer_name},<br /><br />We have prepared the following payment. <br /><br />You can see the payment details from the following link: <a href=\"{revenue_guest_link}\">{revenue_date}</a>.<br /><br />Feel free to contact us with any questions..<br /><br />Best Regards,<br />{company_name}', NULL, 'core::seed', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_estimates`
--

CREATE TABLE `kxm_estimates` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `category_id` int NOT NULL DEFAULT '0',
  `estimate_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `estimated_at` datetime NOT NULL,
  `expire_at` datetime DEFAULT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `contact_id` int NOT NULL,
  `contact_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `footer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_estimates_documents`
--

CREATE TABLE `kxm_estimates_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `document_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_estimates_documents`
--

INSERT INTO `kxm_estimates_documents` (`id`, `company_id`, `document_id`, `item_id`, `item_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 43, 44, 'App\\Models\\Document\\Document', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL),
(2, 1, 45, 46, 'App\\Models\\Document\\Document', '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_estimates_extra_parameters`
--

CREATE TABLE `kxm_estimates_extra_parameters` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `document_id` int NOT NULL,
  `expire_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_estimates_extra_parameters`
--

INSERT INTO `kxm_estimates_extra_parameters` (`id`, `company_id`, `document_id`, `expire_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 45, '2024-03-03 10:21:07', '2024-03-03 09:21:07', '2024-03-03 09:21:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_estimate_histories`
--

CREATE TABLE `kxm_estimate_histories` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `estimate_id` int NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_estimate_invoice_v20`
--

CREATE TABLE `kxm_estimate_invoice_v20` (
  `id` int UNSIGNED NOT NULL,
  `estimate_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_estimate_items`
--

CREATE TABLE `kxm_estimate_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `estimate_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_estimate_item_taxes`
--

CREATE TABLE `kxm_estimate_item_taxes` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `estimate_id` int NOT NULL,
  `estimate_item_id` int NOT NULL,
  `tax_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_estimate_totals`
--

CREATE TABLE `kxm_estimate_totals` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `estimate_id` int NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_failed_jobs`
--

CREATE TABLE `kxm_failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `connection` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_firewall_ips`
--

CREATE TABLE `kxm_firewall_ips` (
  `id` int UNSIGNED NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `log_id` int DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_firewall_logs`
--

CREATE TABLE `kxm_firewall_logs` (
  `id` int UNSIGNED NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `level` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'medium',
  `middleware` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `referrer` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `request` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_firewall_logs`
--

INSERT INTO `kxm_firewall_logs` (`id`, `ip`, `level`, `middleware`, `user_id`, `url`, `referrer`, `request`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=jxg8XC7JkqCXcKjI4XaBjKCK563keU9zBAkqhr7w&email=admin@email.com&password=******', '2023-02-23 09:00:25', '2023-02-23 09:00:25', NULL),
(2, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=jxg8XC7JkqCXcKjI4XaBjKCK563keU9zBAkqhr7w&email=admin@email.com&password=******', '2023-02-23 09:01:59', '2023-02-23 09:01:59', NULL),
(3, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=9rPFpOOuG0w2x5XTuhVmvVeQ6iOpM4zXXY1tlH8R&email=admin@email.com&password=******', '2023-02-23 09:42:33', '2023-02-23 09:42:33', NULL),
(4, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=po3UkdtNMS74jMtqfssdbJlVhlcKZwJmSq7JukGg&email=admin@email.com&password=******', '2023-02-23 11:32:11', '2023-02-23 11:32:11', NULL),
(5, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=sai5vpvPgkmVJDqPjQ4DGnGAO2xRhfCOo3ArQFW9&email=admin@email.com&password=******', '2023-02-23 13:55:03', '2023-02-23 13:55:03', NULL),
(6, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=4nhcbxOrI2aDPxg1vOpH2UV3F8DLL1dQO8yA9JbQ&email=admin@email.com&password=******', '2023-02-26 08:06:44', '2023-02-26 08:06:44', NULL),
(7, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=4nhcbxOrI2aDPxg1vOpH2UV3F8DLL1dQO8yA9JbQ&email=alger@email.com&password=******', '2023-02-26 08:07:02', '2023-02-26 08:07:02', NULL),
(8, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=TIBkWOwn9VkbsQLvnCausArmThBPuyVRyNo67dfF&email=admin@email.com&password=******', '2023-03-02 17:24:57', '2023-03-02 17:24:57', NULL),
(9, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=1VNslLYYIJUY393jBbXKDvXO54PBtQwDZukJwM52&email=admin@email.com&password=******', '2023-03-05 08:39:13', '2023-03-05 08:39:13', NULL),
(10, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=M4GRHHgoE7k7sGFfEjCZuoryLmc20YgVtseROAFX&email=admin@email.com&password=******', '2023-03-05 09:30:43', '2023-03-05 09:30:43', NULL),
(11, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=dzsMJzDjOyEiryzjgi8jFudy2iI2f1RIRI2tR1Qa&email=admin@email.com&password=******', '2023-03-05 14:24:32', '2023-03-05 14:24:32', NULL),
(12, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=dzsMJzDjOyEiryzjgi8jFudy2iI2f1RIRI2tR1Qa&email=admin@email.com&password=******', '2023-03-05 14:24:42', '2023-03-05 14:24:42', NULL),
(13, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=ywvO1TB8FQMWVfoe0t978t4cDOgp6VhxdsLsPCxn&email=admin@email.com&password=******', '2023-04-02 10:52:30', '2023-04-02 10:52:30', NULL),
(14, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=Et2NMrFTLGrFBf9bKYKVoJZuLTgYMVmrcIYUvp2l&email=admin@email.com&password=******', '2023-04-07 21:01:38', '2023-04-07 21:01:38', NULL),
(15, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=Et2NMrFTLGrFBf9bKYKVoJZuLTgYMVmrcIYUvp2l&email=admin@email.com&password=******', '2023-04-07 21:02:15', '2023-04-07 21:02:15', NULL),
(16, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=Et2NMrFTLGrFBf9bKYKVoJZuLTgYMVmrcIYUvp2l&email=admin@email.com&password=******', '2023-04-07 21:03:04', '2023-04-07 21:03:04', NULL),
(17, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=Et2NMrFTLGrFBf9bKYKVoJZuLTgYMVmrcIYUvp2l&email=admin@email.com&password=******', '2023-04-07 21:04:03', '2023-04-07 21:04:03', NULL),
(18, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero2/auth/login', 'http://localhost/otadjero2/auth/login', '_token=PnI51qpCMy9h6oUKzWlXAbhX0LWvOGwxsniQO9D9&email=admin@email.com&password=******', '2023-05-22 16:04:37', '2023-05-22 16:04:37', NULL),
(19, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero2/auth/login', 'http://localhost/otadjero2/auth/login', '_token=PnI51qpCMy9h6oUKzWlXAbhX0LWvOGwxsniQO9D9&email=admin@email.com&password=******', '2023-05-22 16:04:48', '2023-05-22 16:04:48', NULL),
(20, '127.0.0.1', 'medium', 'login', 0, 'http://localhost/otadjero2/auth/login', 'http://localhost/otadjero2/auth/login', '_token=PnI51qpCMy9h6oUKzWlXAbhX0LWvOGwxsniQO9D9&email=admin@email.com&password=******', '2023-05-22 16:05:00', '2023-05-22 16:05:00', NULL),
(21, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=5cgMbVMFoTZHRYrVV66NBqAN2S3JDY0P9SXoBKa9&email=admin@email.com&password=******', '2023-10-04 09:20:25', '2023-10-04 09:20:25', NULL),
(22, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=5cgMbVMFoTZHRYrVV66NBqAN2S3JDY0P9SXoBKa9&email=admin@email.com&password=******', '2023-10-04 09:20:33', '2023-10-04 09:20:33', NULL),
(23, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=5cgMbVMFoTZHRYrVV66NBqAN2S3JDY0P9SXoBKa9&email=admin@email.com&password=******', '2023-10-04 09:20:40', '2023-10-04 09:20:40', NULL),
(24, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=5cgMbVMFoTZHRYrVV66NBqAN2S3JDY0P9SXoBKa9&email=admin@email.com&password=******', '2023-10-04 09:20:47', '2023-10-04 09:20:47', NULL),
(25, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=0hyUGEPH19uX6mslmpr688RYuEk4eDdXewjXgrWd&email=alger@audilak.com&password=******', '2023-10-05 10:47:01', '2023-10-05 10:47:01', NULL),
(26, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=6flnHiN7VDwZ154e6YGffA0UTlN8OCiFFyRqefJg&email=alger@audilak.com&password=******', '2023-10-05 11:47:11', '2023-10-05 11:47:11', NULL),
(27, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=iubFGZSzeVHDXRyVMsdd6uIZOdnViflfrOozytut&email=alger@audilak.com&password=******', '2023-11-16 10:59:12', '2023-11-16 10:59:12', NULL),
(28, '::1', 'medium', 'login', 0, 'http://localhost/sijilat2/auth/login', 'http://localhost/sijilat2/auth/login', '_token=GwKodkqT3O4hPrN0wm9kQnR5voTLn0ry85BSw08H&email=admin@email.com&password=******', '2024-03-07 09:33:31', '2024-03-07 09:33:31', NULL),
(29, '::1', 'medium', 'login', 0, 'http://localhost/sijilat2/auth/login', 'http://localhost/sijilat2/auth/login', '_token=GwKodkqT3O4hPrN0wm9kQnR5voTLn0ry85BSw08H&email=admin@email.com&password=******', '2024-03-07 09:34:55', '2024-03-07 09:34:55', NULL),
(30, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=A0vQc2ZVfrb744PoY5Ke4ExMAVSNtPUd61Vjtun7&email=admin@email.com&password=******', '2024-05-17 19:35:02', '2024-05-17 19:35:02', NULL),
(31, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=A0vQc2ZVfrb744PoY5Ke4ExMAVSNtPUd61Vjtun7&email=admin@email.com&password=******', '2024-05-17 19:35:14', '2024-05-17 19:35:14', NULL),
(32, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=A0vQc2ZVfrb744PoY5Ke4ExMAVSNtPUd61Vjtun7&email=admin@email.com&password=******', '2024-05-17 19:35:28', '2024-05-17 19:35:28', NULL),
(33, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=A0vQc2ZVfrb744PoY5Ke4ExMAVSNtPUd61Vjtun7&email=admin@email.com&password=******', '2024-05-17 19:42:57', '2024-05-17 19:42:57', NULL),
(34, '::1', 'medium', 'login', 0, 'http://localhost/otadjero/auth/login', 'http://localhost/otadjero/auth/login', '_token=A0vQc2ZVfrb744PoY5Ke4ExMAVSNtPUd61Vjtun7&email=admin@email.com&password=******', '2024-05-17 19:43:15', '2024-05-17 19:43:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_adjustments`
--

CREATE TABLE `kxm_inventory_adjustments` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `adjustment_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `reason` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_adjustment_items`
--

CREATE TABLE `kxm_inventory_adjustment_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `adjustment_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_quantity` int NOT NULL,
  `adjusted_quantity` int NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_appointment`
--

CREATE TABLE `kxm_inventory_appointment` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` int DEFAULT NULL,
  `description` text,
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_bill_items`
--

CREATE TABLE `kxm_inventory_bill_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `item_id` int NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `quantity` double(7,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_document_items`
--

CREATE TABLE `kxm_inventory_document_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `document_id` int NOT NULL,
  `item_id` int NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `quantity` double(7,2) DEFAULT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `document_item_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_inventory_document_items`
--

INSERT INTO `kxm_inventory_document_items` (`id`, `company_id`, `type`, `document_id`, `item_id`, `warehouse_id`, `quantity`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `document_item_id`) VALUES
(1, 1, 'invoice', 42, 36, 3, 1.00, 'inventory::ui', '1', '2024-02-29 10:23:16', '2024-02-29 10:23:16', NULL, 33),
(2, 1, 'invoice', 44, 36, 3, 1.00, 'inventory::ui', '1', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL, 35),
(3, 1, 'invoice', 46, 36, 3, 1.00, 'inventory::ui', '1', '2024-03-03 09:24:31', '2024-03-03 09:24:31', NULL, 37);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_histories`
--

CREATE TABLE `kxm_inventory_histories` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `type_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` bigint UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_inventory_histories`
--

INSERT INTO `kxm_inventory_histories` (`id`, `company_id`, `user_id`, `item_id`, `warehouse_id`, `type_type`, `type_id`, `quantity`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 15, 3, 'App\\Models\\Common\\Item', 15, 22, 'inventory::ui', '1', '2023-08-03 14:48:49', '2023-08-06 14:23:15', '2023-08-06 14:23:15'),
(2, 1, 1, 16, 7, 'App\\Models\\Common\\Item', 16, 22, 'inventory::ui', '1', '2023-08-06 14:26:09', '2023-09-25 16:25:32', '2023-09-25 16:25:32'),
(3, 1, 1, 36, 3, 'App\\Models\\Common\\Item', 36, 22, 'inventory::ui', '1', '2023-09-25 16:29:40', '2023-09-25 16:29:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_invoice_items`
--

CREATE TABLE `kxm_inventory_invoice_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `item_id` int NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `quantity` double(7,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_items`
--

CREATE TABLE `kxm_inventory_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_id` int NOT NULL,
  `opening_stock` double DEFAULT NULL,
  `opening_stock_value` double DEFAULT NULL,
  `reorder_level` double DEFAULT NULL,
  `barcode` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `default_warehouse` tinyint(1) NOT NULL DEFAULT '0',
  `unit` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_inventory_items`
--

INSERT INTO `kxm_inventory_items` (`id`, `company_id`, `item_id`, `opening_stock`, `opening_stock_value`, `reorder_level`, `barcode`, `vendor_id`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `sku`, `warehouse_id`, `default_warehouse`, `unit`, `returnable`) VALUES
(1, 1, 15, 22, 22, 0, NULL, NULL, 'inventory::ui', '1', '2023-08-03 14:48:49', '2023-08-06 14:23:15', '2023-08-06 14:23:15', 'sdqdsdq', 3, 1, 'Dozen', NULL),
(2, 1, 16, 22, 22, 2, 'sdssds', NULL, 'inventory::ui', '1', '2023-08-06 14:26:09', '2023-09-25 16:25:32', '2023-09-25 16:25:32', 'ds', 7, 1, 'Dozen', NULL),
(3, 1, 36, 22, 22, 0, NULL, NULL, 'inventory::ui', '1', '2023-09-25 16:29:40', '2023-09-25 16:29:40', NULL, '44', 3, 1, 'Kilograms', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_item_groups`
--

CREATE TABLE `kxm_inventory_item_groups` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `category_id` int DEFAULT NULL,
  `tax_id` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_item_group_items`
--

CREATE TABLE `kxm_inventory_item_group_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_group_id` int NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_item_group_variants`
--

CREATE TABLE `kxm_inventory_item_group_variants` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_group_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_item_group_variant_items`
--

CREATE TABLE `kxm_inventory_item_group_variant_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `variant_value_id` int NOT NULL,
  `item_group_id` int NOT NULL,
  `item_group_variant_id` int NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_item_group_variant_values`
--

CREATE TABLE `kxm_inventory_item_group_variant_values` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_group_id` int NOT NULL,
  `item_group_variant_id` int DEFAULT NULL,
  `variant_id` int NOT NULL,
  `variant_value_id` int NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `item_group_item_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_manufacturers`
--

CREATE TABLE `kxm_inventory_manufacturers` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_manufacturer_items`
--

CREATE TABLE `kxm_inventory_manufacturer_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  `item_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_manufacturer_vendors`
--

CREATE TABLE `kxm_inventory_manufacturer_vendors` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_price_type`
--

CREATE TABLE `kxm_inventory_price_type` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `transcation_type` enum('sales','purchase') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'sales',
  `price_type` tinyint NOT NULL,
  `pricing_scheme` tinyint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `markup` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `discount` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `percentage` int DEFAULT NULL,
  `price_discount` tinyint DEFAULT NULL,
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_transfer_orders`
--

CREATE TABLE `kxm_inventory_transfer_orders` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `transfer_order` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reason` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transfer_quantity` int DEFAULT NULL,
  `source_warehouse_id` int NOT NULL,
  `destination_warehouse_id` int NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `transfer_order_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'TO-00001',
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_transfer_order_histories`
--

CREATE TABLE `kxm_inventory_transfer_order_histories` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `created_by` int NOT NULL,
  `transfer_order_id` int NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_transfer_order_items`
--

CREATE TABLE `kxm_inventory_transfer_order_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `transfer_order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_quantity` int NOT NULL,
  `transfer_quantity` int NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_user_warehouses`
--

CREATE TABLE `kxm_inventory_user_warehouses` (
  `user_id` int UNSIGNED NOT NULL,
  `warehouse_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_inventory_user_warehouses`
--

INSERT INTO `kxm_inventory_user_warehouses` (`user_id`, `warehouse_id`) VALUES
(3, 2),
(17, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_variants`
--

CREATE TABLE `kxm_inventory_variants` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_variant_values`
--

CREATE TABLE `kxm_inventory_variant_values` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_warehouses`
--

CREATE TABLE `kxm_inventory_warehouses` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_from` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `country` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number_prefix` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number_digit` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number_next` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_inventory_warehouses`
--

INSERT INTO `kxm_inventory_warehouses` (`id`, `company_id`, `name`, `email`, `phone`, `address`, `enabled`, `zip_code`, `state`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `description`, `country`, `city`, `number_prefix`, `number_digit`, `number_next`) VALUES
(1, 1, 'Audilak - Centrale', 'alger@audilak.com', NULL, 'alger@audilak.com', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(2, 1, 'Audilak - Alger', 'alger@audilak.com', NULL, 'Docteur: Dr. Allouane Salim\n97 Mohamed 5 Blvd Alger\nNo Article: 16016441219\nId. Fiscal: 166190102846181\nalger@audilak.com\n0558 33 47 77/0561 70 41 00', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Audilak - Setif', 'setif@audilak.com', NULL, 'Docteur: Dr Ghimouz Khalida\nCITE AMOR DEGGOU LOCAL 471 ET 471 BIS SETIF\nNRC: 25100-367951A911\nRC Sétif 11A0367951-01/19\nId. Fiscal 296325010542144\nRIB: CPA FILALI 00400331400000477160\nsetif@audilak.com\n05 41 35 00 27', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'Audilak - Constantine', 'constantine@audilak.com', NULL, 'Docteur:  Dr Ghimouz Khalida\n25AVENNUE AQUATI MOSTFA CONSTANTINE\nN° RC:25100-367951A911\nId. Fiscal: 296325010542144\nRIB: CPA FILALI 00400331400000477160\nconstantine@audilak.com\n0560 02 15 79', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Annaba', 'annaba@audilak.com', NULL, 'Docteur: Dr Guellali Faiza\n76,rue colonel Amirouche ANNABA\nA.M. 608MSPRH/2009\nDDS, Agrément 404/2012\nRC. 0367951A11-23/02\nID.FISC. 296325010542144\nRIB. CPA FILALI 00400331400000477160\nannaba@audilak.com\n0553 91 42 57', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'Audilak Biskra', 'biskra@audilak.com', NULL, 'Docteur:  Dr.Benidir Salah Eddine\nHAKIM SAADANE RUE HAI ZEMMAME BISKRA\nNIF: 187070100685187 \nNIS: 198707010068527\nbiskra@audila.com\n0559 03 58 82', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, 'Audilak - M\'sila', 'msila@audilak.com', NULL, 'Docteur: Dr.Saadi Abdelhalim\nEnface L’Hôpital Ezzahraoui M’sila\nN° RC: 052/2021\nId. Fiscal: 18528010414615600000\nmsila@audilak.com\n0561 70 41 93\n035334144', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, 'Audilak - Bordj Bou Arreridj', 'bba@audilak.com', NULL, 'Docteur: Dr.Toumi Noureddine\nCoop Tayeb Ali 105 lots avenue Arihi Lakhder BBA\nM Fiscal: 18819010807919400000\nbba@audilak.com\n0561 70 40 07', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, 'Audilak - Batna', 'batna@audilak.com', NULL, 'Docteur: Dr Ghimouz Khalida\nCité Lombarkia Batna\nAM 608MSPRH/2009\nAG DDS404/2012\nRC 25100 367952A911  BATNA 05/03 0367951A11\nID_FISCAL 296325010542144\nRIB CPA FILALI 00400331400000477160\nbatna@audilak.com\n0560 14 76 46', 1, NULL, NULL, 'inventory::import', '1', '2023-02-23 13:55:50', '2023-02-23 13:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_inventory_warehouse_items`
--

CREATE TABLE `kxm_inventory_warehouse_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `item_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_invoices`
--

CREATE TABLE `kxm_invoices` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int NOT NULL DEFAULT '1',
  `contact_id` int NOT NULL,
  `contact_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `footer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_invoice_histories`
--

CREATE TABLE `kxm_invoice_histories` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_invoice_items`
--

CREATE TABLE `kxm_invoice_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_rate` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_invoice_item_taxes`
--

CREATE TABLE `kxm_invoice_item_taxes` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `invoice_item_id` int NOT NULL,
  `tax_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_invoice_totals`
--

CREATE TABLE `kxm_invoice_totals` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_items`
--

CREATE TABLE `kxm_items` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `category_id` int DEFAULT NULL,
  `tax_id` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reference` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reference_number` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `designation` varchar(123) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_items`
--

INSERT INTO `kxm_items` (`id`, `company_id`, `name`, `sku`, `description`, `sale_price`, `purchase_price`, `quantity`, `category_id`, `tax_id`, `enabled`, `created_from`, `reference`, `reference_number`, `designation`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'demoddd', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-02-26 14:08:17', '2023-08-06 14:23:13', '2023-08-06 14:23:13'),
(2, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-02-26 14:09:11', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(3, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-02-27 09:26:05', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(4, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-02-27 09:26:09', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(5, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-02-27 13:40:41', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(6, 1, 'Demo32', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-02-27 13:40:58', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(7, 1, 'Demo32', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-03-02 17:24:47', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(8, 1, 'Demo324', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-03-02 17:24:56', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(9, 1, 'demodddd', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-03 13:46:05', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(10, 1, 'demodddd', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-03 14:11:18', '2023-08-06 14:23:14', '2023-08-06 14:23:14'),
(11, 1, 'demodddd', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-03 14:13:21', '2023-08-06 14:23:15', '2023-08-06 14:23:15'),
(12, 1, 'demodddd', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-03 14:30:39', '2023-08-06 14:23:15', '2023-08-06 14:23:15'),
(13, 1, 'demodddd', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-03 14:37:14', '2023-08-06 14:23:15', '2023-08-06 14:23:15'),
(14, 1, 'demodddd', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-03 14:37:32', '2023-08-06 14:23:15', '2023-08-06 14:23:15'),
(15, 1, 'tiem', NULL, NULL, '234.00', 123.0000, 1, 77, NULL, 1, 'inventory::ui', NULL, 'sd', 'sds', 1, '2023-08-03 14:48:48', '2023-08-06 14:23:15', '2023-08-06 14:23:15'),
(16, 1, 'demodddd', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 14:25:14', '2023-09-25 16:25:32', '2023-09-25 16:25:32'),
(17, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 14:41:09', '2023-08-06 15:22:45', '2023-08-06 15:22:45'),
(18, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 14:47:17', '2023-08-06 15:22:45', '2023-08-06 15:22:45'),
(19, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 14:54:23', '2023-08-06 15:22:45', '2023-08-06 15:22:45'),
(20, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 14:58:55', '2023-08-06 15:22:46', '2023-08-06 15:22:46'),
(21, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 14:59:59', '2023-08-06 15:22:46', '2023-08-06 15:22:46'),
(22, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 15:00:47', '2023-08-06 15:22:46', '2023-08-06 15:22:46'),
(23, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 15:02:13', '2023-08-06 15:22:46', '2023-08-06 15:22:46'),
(24, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 15:02:34', '2023-08-06 15:22:46', '2023-08-06 15:22:46'),
(25, 1, 'demo', NULL, 'description demo', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 15:03:23', '2023-08-06 15:22:46', '2023-08-06 15:22:46'),
(26, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-06 15:31:01', '2023-08-07 10:09:13', '2023-08-07 10:09:13'),
(27, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-07 10:06:46', '2023-08-07 10:09:13', '2023-08-07 10:09:13'),
(28, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-07 10:27:39', '2023-09-25 16:25:32', '2023-09-25 16:25:32'),
(29, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-07 14:00:32', '2023-09-25 16:25:32', '2023-09-25 16:25:32'),
(30, 1, 'Demosdsds', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-07 14:03:30', '2023-09-25 16:25:32', '2023-09-25 16:25:32'),
(31, 1, 'Dem23', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-07 20:03:50', '2023-09-25 16:25:32', '2023-09-25 16:25:32'),
(32, 1, 'DemoZAEAEA', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-08-20 07:09:11', '2023-09-25 16:25:32', '2023-09-25 16:25:32'),
(33, 1, 'EE', NULL, NULL, '0.00', 22.0000, 1, NULL, NULL, 1, 'inventory::ui', NULL, 'EE', 'EE', 1, '2023-09-14 12:52:58', '2023-09-25 16:25:32', '2023-09-25 16:25:32'),
(34, 1, 'pencil', NULL, 'description', '10.00', 22.0000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-09-21 13:59:27', '2023-09-25 16:25:33', '2023-09-25 16:25:33'),
(35, 1, 'pencil', NULL, 'description', '10.00', 22.0000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-09-25 16:26:51', '2023-09-25 16:26:51', NULL),
(36, 1, 'item1', NULL, NULL, '22.00', 11.0000, 1, NULL, NULL, 1, 'inventory::ui', NULL, 'H', 'H', 1, '2023-09-25 16:29:40', '2023-09-25 16:29:40', NULL),
(37, 1, 'pencil', NULL, 'description', '10.00', 22.0000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-09-25 16:31:12', '2023-09-25 16:31:12', NULL),
(38, 1, 'New one', NULL, NULL, '1000.00', 1234.0000, 1, 5, NULL, 1, 'core::api', NULL, 'ref1234', 'test', 1, '2023-09-26 15:19:20', '2023-09-26 15:19:20', NULL),
(39, 1, 'New one', NULL, NULL, '1000.00', 1234.0000, 1, 5, NULL, 1, 'core::api', NULL, 'ref1234', 'test', 1, '2023-09-26 15:24:11', '2023-09-26 15:24:11', NULL),
(40, 1, 'New one', NULL, NULL, '1000.00', 1234.0000, 1, 5, NULL, 1, 'core::api', NULL, 'ref1234', 'test', 1, '2023-09-27 08:16:03', '2023-09-27 08:16:03', NULL),
(41, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-10-05 17:04:16', '2023-10-05 17:04:16', NULL),
(42, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-10-05 17:07:14', '2023-10-05 17:07:14', NULL),
(43, 1, 'Demo', NULL, 'Demo description', '23.30', 21.1000, 1, 1, NULL, 1, 'core::api', NULL, NULL, NULL, 1, '2023-10-05 17:08:05', '2023-10-05 17:08:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_item_serial_numbers`
--

CREATE TABLE `kxm_item_serial_numbers` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `document_id` int NOT NULL DEFAULT '0',
  `warehouse_id` int NOT NULL DEFAULT '0',
  `number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_item_taxes`
--

CREATE TABLE `kxm_item_taxes` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `item_id` int NOT NULL,
  `tax_id` int DEFAULT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_jobs`
--

CREATE TABLE `kxm_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_media`
--

CREATE TABLE `kxm_media` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL DEFAULT '0',
  `disk` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `directory` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `filename` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `extension` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mime_type` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `size` int UNSIGNED NOT NULL,
  `variant_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `original_media_id` int UNSIGNED DEFAULT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_media`
--

INSERT INTO `kxm_media` (`id`, `company_id`, `disk`, `directory`, `filename`, `extension`, `mime_type`, `aggregate_type`, `size`, `variant_name`, `original_media_id`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'uploads', '2023/08/06/1/items', 'demodddd', 'png', 'image/png', 'image', 137, NULL, NULL, 'core::ui', '1', '2023-08-06 14:26:09', '2023-08-06 14:26:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_mediables`
--

CREATE TABLE `kxm_mediables` (
  `media_id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL DEFAULT '0',
  `mediable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mediable_id` int UNSIGNED NOT NULL,
  `tag` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `order` int UNSIGNED NOT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_mediables`
--

INSERT INTO `kxm_mediables` (`media_id`, `company_id`, `mediable_type`, `mediable_id`, `tag`, `order`, `created_from`, `created_by`) VALUES
(1, 1, 'App\\Models\\Common\\Item', 16, 'inventory.barcode', 1, 'core::ui', '1');

-- --------------------------------------------------------

--
-- Table structure for table `kxm_migrations`
--

CREATE TABLE `kxm_migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_migrations`
--

INSERT INTO `kxm_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_27_000000_create_mediable_tables', 1),
(2, '2017_09_14_000000_core_v1', 1),
(3, '2020_01_08_000000_core_v200', 1),
(4, '2020_03_20_183732_core_v208', 1),
(5, '2020_06_09_000000_core_v2014', 1),
(6, '2020_07_20_000000_core_v2017', 1),
(7, '2020_10_12_000000_add_variants_to_media', 1),
(8, '2020_10_13_000000_core_v210', 1),
(9, '2021_04_01_000000_core_v219', 1),
(10, '2021_05_17_000000_core_v2114', 1),
(11, '2021_06_17_000000_core_v2117', 1),
(12, '2021_09_01_000000_core_v2124', 1),
(13, '2021_09_10_000000_core_v2125', 1),
(14, '2021_09_10_000000_core_v2126', 1),
(15, '2021_09_10_000000_core_v2127', 1),
(16, '2022_03_02_000000_core_v2133', 1),
(17, '2022_03_23_000000_core_v2134', 1),
(18, '2019_03_20_000000_inventory_v1', 2),
(19, '2020_01_01_000000_inventory_v200', 2),
(20, '2020_01_01_000000_inventory_v201', 2),
(21, '2020_01_01_000000_inventory_v202', 2),
(22, '2020_09_24_000000_inventory_v2020', 2),
(23, '2021_01_28_000000_inventory_v212', 2),
(24, '2021_05_27_000000_inventory_v220', 2),
(25, '2021_06_28_000000_inventory_v3', 2),
(26, '2021_08_16_000000_inventory_v301', 2),
(27, '2021_08_23_000000_inventory_v304', 2),
(28, '2021_09_08_000000_inventory_v306', 2),
(29, '2021_10_28_000000_inventory_v3011', 2),
(30, '2021_11_22_000000_inventory_v3014', 2),
(31, '2018_10_02_000000_crm_v1', 3),
(32, '2020_01_10_000000_crm_v200', 3),
(33, '2020_03_04_000000_crm_v201', 3),
(34, '2021_03_10_000000_crm_v211', 3),
(35, '2021_04_19_000000_crm_v227', 3),
(36, '2021_06_23_000000_crm_v2213', 3),
(37, '2020_06_22_021809_credit_debit_notes_v1', 4),
(38, '2020_09_22_050842_credit_debit_notes_v105', 4),
(39, '2020_12_30_042502_credit_debit_notes_v110', 4),
(40, '2021_12_03_055519_credit_debit_notes_v150', 4),
(41, '2018_11_13_000000_custom_fields_v1', 5),
(42, '2021_02_15_000000_custom_fields_v214', 5),
(43, '2018_10_02_000000_estimates_v1', 6),
(44, '2020_01_10_000000_estimates_v200', 6),
(45, '2021_01_14_000000_estimates_v210', 6),
(46, '2021_01_21_000000_estimates_v211', 6),
(47, '2021_01_06_000000_sales_purchase_orders_v1', 7),
(48, '2021_07_13_233425_composite-items', 8),
(49, '2021_12_29_233425_composite-items_v110', 8),
(50, '2022_04_08_000000_warehouse_role_management_v1', 9),
(51, '2018_05_09_000000_double_entry_v1', 10),
(52, '2021_01_13_000000_double_entry_v2019', 10),
(53, '2021_08_24_000000_double_entry_v300', 10),
(54, '2022_08_1_000000_double_entry_v406', 10),
(55, '2022_10_27_000000_double_entry_v4013', 10),
(56, '2023_09_04_000000_modify_items_table', 11),
(57, '2018_08_08_100000_create_telescope_entries_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_modules`
--

CREATE TABLE `kxm_modules` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `alias` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` int NOT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_modules`
--

INSERT INTO `kxm_modules` (`id`, `company_id`, `alias`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'offline-payments', 1, 'core::ui', NULL, '2022-07-07 09:14:39', '2022-07-07 09:14:39', NULL),
(2, 1, 'paypal-standard', 1, 'core::ui', NULL, '2022-07-07 09:14:40', '2022-07-07 09:14:40', NULL),
(3, 1, 'inventory', 1, 'core::console', NULL, '2022-07-07 09:16:37', '2022-07-07 09:16:37', NULL),
(4, 1, 'crm', 1, 'core::console', NULL, '2022-07-07 09:16:51', '2022-07-07 09:16:51', NULL),
(5, 1, 'credit-debit-notes', 1, 'core::console', NULL, '2022-07-07 09:17:02', '2022-07-07 09:17:02', NULL),
(6, 1, 'custom-fields', 1, 'core::console', NULL, '2022-07-07 09:17:13', '2022-07-07 09:17:13', NULL),
(7, 1, 'estimates', 1, 'core::console', NULL, '2022-07-07 09:17:23', '2022-07-07 09:17:23', NULL),
(8, 1, 'sales-purchase-orders', 1, 'core::console', NULL, '2022-07-07 09:17:34', '2022-07-07 09:17:34', NULL),
(9, 1, 'composite-items', 1, 'core::console', NULL, '2022-07-07 09:17:49', '2022-07-07 09:17:49', NULL),
(10, 1, 'warehouse-role-management', 1, 'core::console', NULL, '2022-07-07 09:18:33', '2022-07-07 09:18:33', NULL),
(11, 2, 'offline-payments', 1, 'core::ui', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(12, 2, 'paypal-standard', 1, 'core::ui', '1', '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(13, 2, 'credit-debit-notes', 1, 'core::console', NULL, '2022-09-10 12:40:13', '2022-09-10 12:40:13', NULL),
(14, 2, 'inventory', 1, 'core::console', '1', '2022-09-10 12:40:25', '2022-09-10 12:40:25', NULL),
(15, 2, 'warehouse-role-management', 1, 'core::console', NULL, '2022-09-10 19:47:49', '2022-09-10 19:47:49', NULL),
(16, 2, 'sales-purchase-orders', 1, 'core::console', NULL, '2022-09-12 08:39:55', '2022-09-12 08:39:55', NULL),
(17, 3, 'offline-payments', 1, 'core::ui', '1', '2022-09-12 10:02:14', '2022-09-12 10:02:14', NULL),
(18, 3, 'paypal-standard', 1, 'core::ui', '1', '2022-09-12 10:02:14', '2022-09-12 10:02:14', NULL),
(19, 3, 'sales-purchase-orders', 1, 'core::console', NULL, '2022-09-12 10:03:53', '2022-09-12 10:03:53', NULL),
(20, 3, 'credit-debit-notes', 1, 'core::console', NULL, '2022-09-12 10:04:02', '2022-09-12 10:04:02', NULL),
(21, 3, 'inventory', 1, 'core::console', '1', '2022-09-12 10:04:12', '2022-09-12 10:04:12', NULL),
(22, 3, 'warehouse-role-management', 1, 'core::console', NULL, '2022-09-12 10:04:29', '2022-09-12 10:04:29', NULL),
(23, 4, 'offline-payments', 1, 'core::ui', '1', '2022-09-12 10:28:00', '2022-09-12 10:28:00', NULL),
(24, 4, 'paypal-standard', 1, 'core::ui', '1', '2022-09-12 10:28:00', '2022-09-12 10:28:00', NULL),
(25, 4, 'warehouse-role-management', 1, 'core::console', NULL, '2022-09-12 10:28:54', '2022-09-12 10:28:54', NULL),
(26, 4, 'inventory', 1, 'core::console', '1', '2022-09-12 10:29:00', '2022-09-12 10:29:00', NULL),
(27, 4, 'sales-purchase-orders', 1, 'core::console', NULL, '2022-09-12 10:30:52', '2022-09-12 10:30:52', NULL),
(28, 4, 'credit-debit-notes', 1, 'core::console', NULL, '2022-09-12 10:31:00', '2022-09-12 10:31:00', NULL),
(29, 4, 'composite-items', 1, 'core::console', NULL, '2022-09-12 10:31:18', '2022-09-12 10:31:18', NULL),
(30, 4, 'estimates', 1, 'core::console', NULL, '2022-09-12 10:31:47', '2022-09-12 10:31:47', NULL),
(31, 4, 'crm', 1, 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(32, 6, 'offline-payments', 1, 'core::ui', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(33, 6, 'paypal-standard', 1, 'core::ui', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(34, 6, 'inventory', 1, 'core::console', '1', NULL, NULL, NULL),
(35, 7, 'offline-payments', 1, 'core::ui', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(36, 7, 'paypal-standard', 1, 'core::ui', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(37, 7, 'inventory', 1, 'core::console', '1', NULL, NULL, NULL),
(38, 1, 'amount-in-words', 1, 'core::console', NULL, '2022-10-05 10:36:38', '2022-10-09 14:23:45', '2022-10-09 14:23:45'),
(39, 1, 'amount-in-words', 1, 'core::console', NULL, '2022-10-09 14:24:03', '2022-10-09 14:24:03', NULL),
(40, 1, 'double-entry', 1, 'core::console', NULL, '2023-03-05 14:23:57', '2023-03-05 14:23:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_module_histories`
--

CREATE TABLE `kxm_module_histories` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `module_id` int NOT NULL,
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_module_histories`
--

INSERT INTO `kxm_module_histories` (`id`, `company_id`, `module_id`, `version`, `description`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2.0.3', 'offline-payments installed', 'core::ui', NULL, '2022-07-07 09:14:39', '2022-07-07 09:14:39', NULL),
(2, 1, 2, '2.0.0', 'paypal-standard installed', 'core::ui', NULL, '2022-07-07 09:14:40', '2022-07-07 09:14:40', NULL),
(3, 1, 3, '3.1.13', 'inventory installed', 'core::console', NULL, '2022-07-07 09:16:37', '2022-07-07 09:16:37', NULL),
(4, 1, 4, '2.2.20', 'crm installed', 'core::console', NULL, '2022-07-07 09:16:51', '2022-07-07 09:16:51', NULL),
(5, 1, 5, '1.6.0', 'credit-debit-notes installed', 'core::console', NULL, '2022-07-07 09:17:02', '2022-07-07 09:17:02', NULL),
(6, 1, 6, '2.1.20', 'custom-fields installed', 'core::console', NULL, '2022-07-07 09:17:13', '2022-07-07 09:17:13', NULL),
(7, 1, 7, '2.1.8', 'estimates installed', 'core::console', NULL, '2022-07-07 09:17:23', '2022-07-07 09:17:23', NULL),
(8, 1, 8, '1.0.8', 'sales-purchase-orders installed', 'core::console', NULL, '2022-07-07 09:17:34', '2022-07-07 09:17:34', NULL),
(9, 1, 9, '1.1.8', 'composite-items installed', 'core::console', NULL, '2022-07-07 09:17:49', '2022-07-07 09:17:49', NULL),
(10, 1, 10, '1.0.0', 'warehouse-role-management installed', 'core::console', NULL, '2022-07-07 09:18:33', '2022-07-07 09:18:33', NULL),
(11, 2, 11, '2.0.3', 'offline-payments installed', 'core::ui', '1', '2022-09-10 12:38:13', '2022-09-10 12:38:13', NULL),
(12, 2, 12, '2.0.0', 'paypal-standard installed', 'core::ui', '1', '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(13, 2, 13, '1.6.0', 'credit-debit-notes installed', 'core::console', NULL, '2022-09-10 12:40:13', '2022-09-10 12:40:13', NULL),
(14, 2, 14, '3.1.13', 'inventory installed', 'core::console', NULL, '2022-09-10 12:40:25', '2022-09-10 12:40:25', NULL),
(15, 2, 15, '1.0.0', 'warehouse-role-management installed', 'core::console', NULL, '2022-09-10 19:47:49', '2022-09-10 19:47:49', NULL),
(16, 2, 16, '1.0.8', 'sales-purchase-orders installed', 'core::console', NULL, '2022-09-12 08:39:55', '2022-09-12 08:39:55', NULL),
(17, 3, 17, '2.0.3', 'offline-payments installed', 'core::ui', '1', '2022-09-12 10:02:14', '2022-09-12 10:02:14', NULL),
(18, 3, 18, '2.0.0', 'paypal-standard installed', 'core::ui', '1', '2022-09-12 10:02:14', '2022-09-12 10:02:14', NULL),
(19, 3, 19, '1.0.8', 'sales-purchase-orders installed', 'core::console', NULL, '2022-09-12 10:03:53', '2022-09-12 10:03:53', NULL),
(20, 3, 20, '1.6.0', 'credit-debit-notes installed', 'core::console', NULL, '2022-09-12 10:04:02', '2022-09-12 10:04:02', NULL),
(21, 3, 21, '3.1.13', 'inventory installed', 'core::console', NULL, '2022-09-12 10:04:12', '2022-09-12 10:04:12', NULL),
(22, 3, 22, '1.0.0', 'warehouse-role-management installed', 'core::console', NULL, '2022-09-12 10:04:29', '2022-09-12 10:04:29', NULL),
(23, 4, 23, '2.0.3', 'offline-payments installed', 'core::ui', '1', '2022-09-12 10:28:00', '2022-09-12 10:28:00', NULL),
(24, 4, 24, '2.0.0', 'paypal-standard installed', 'core::ui', '1', '2022-09-12 10:28:00', '2022-09-12 10:28:00', NULL),
(25, 4, 25, '1.0.0', 'warehouse-role-management installed', 'core::console', NULL, '2022-09-12 10:28:54', '2022-09-12 10:28:54', NULL),
(26, 4, 26, '3.1.13', 'inventory installed', 'core::console', NULL, '2022-09-12 10:29:00', '2022-09-12 10:29:00', NULL),
(27, 4, 27, '1.0.8', 'sales-purchase-orders installed', 'core::console', NULL, '2022-09-12 10:30:52', '2022-09-12 10:30:52', NULL),
(28, 4, 28, '1.6.0', 'credit-debit-notes installed', 'core::console', NULL, '2022-09-12 10:31:00', '2022-09-12 10:31:00', NULL),
(29, 4, 29, '1.1.8', 'composite-items installed', 'core::console', NULL, '2022-09-12 10:31:18', '2022-09-12 10:31:18', NULL),
(30, 4, 30, '2.1.8', 'estimates installed', 'core::console', NULL, '2022-09-12 10:31:47', '2022-09-12 10:31:47', NULL),
(31, 4, 31, '2.2.20', 'crm installed', 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(32, 6, 32, '2.0.3', 'offline-payments installed', 'core::ui', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(33, 6, 33, '2.0.0', 'paypal-standard installed', 'core::ui', '1', '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(34, 7, 35, '2.0.3', 'offline-payments installed', 'core::ui', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(35, 7, 36, '2.0.0', 'paypal-standard installed', 'core::ui', '1', '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(36, 1, 38, '2.0.1', 'amount-in-words installed', 'core::console', NULL, '2022-10-05 10:36:38', '2022-10-05 10:36:38', NULL),
(37, 1, 38, '1.0.2', 'amount-in-words uninstalled', 'core::console', NULL, '2022-10-09 14:23:45', '2022-10-09 14:23:45', NULL),
(38, 1, 40, '4.0.23', 'double-entry installed', 'core::console', NULL, '2023-03-05 14:23:57', '2023-03-05 14:23:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_notifications`
--

CREATE TABLE `kxm_notifications` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_password_resets`
--

CREATE TABLE `kxm_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_permissions`
--

CREATE TABLE `kxm_permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_permissions`
--

INSERT INTO `kxm_permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(2, 'read-api', 'Read Api', 'Read Api', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(3, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(4, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(5, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(6, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(7, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(8, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(9, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(10, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(11, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(12, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(13, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(14, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(15, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(16, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(17, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(18, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(19, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(20, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(21, 'create-banking-reconciliations', 'Create Banking Reconciliations', 'Create Banking Reconciliations', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(22, 'read-banking-reconciliations', 'Read Banking Reconciliations', 'Read Banking Reconciliations', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(23, 'update-banking-reconciliations', 'Update Banking Reconciliations', 'Update Banking Reconciliations', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(24, 'delete-banking-reconciliations', 'Delete Banking Reconciliations', 'Delete Banking Reconciliations', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(25, 'create-banking-transactions', 'Create Banking Transactions', 'Create Banking Transactions', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(26, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(27, 'update-banking-transactions', 'Update Banking Transactions', 'Update Banking Transactions', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(28, 'delete-banking-transactions', 'Delete Banking Transactions', 'Delete Banking Transactions', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(29, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(30, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(31, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(32, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(33, 'create-common-companies', 'Create Common Companies', 'Create Common Companies', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(34, 'read-common-companies', 'Read Common Companies', 'Read Common Companies', '2022-07-07 08:14:01', '2022-07-07 08:14:01'),
(35, 'update-common-companies', 'Update Common Companies', 'Update Common Companies', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(36, 'delete-common-companies', 'Delete Common Companies', 'Delete Common Companies', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(37, 'create-common-dashboards', 'Create Common Dashboards', 'Create Common Dashboards', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(38, 'read-common-dashboards', 'Read Common Dashboards', 'Read Common Dashboards', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(39, 'update-common-dashboards', 'Update Common Dashboards', 'Update Common Dashboards', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(40, 'delete-common-dashboards', 'Delete Common Dashboards', 'Delete Common Dashboards', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(41, 'create-common-import', 'Create Common Import', 'Create Common Import', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(42, 'create-common-items', 'Create Common Items', 'Create Common Items', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(43, 'read-common-items', 'Read Common Items', 'Read Common Items', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(44, 'update-common-items', 'Update Common Items', 'Update Common Items', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(45, 'delete-common-items', 'Delete Common Items', 'Delete Common Items', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(46, 'create-common-notifications', 'Create Common Notifications', 'Create Common Notifications', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(47, 'read-common-notifications', 'Read Common Notifications', 'Read Common Notifications', '2022-07-07 08:14:02', '2022-07-07 08:14:02'),
(48, 'update-common-notifications', 'Update Common Notifications', 'Update Common Notifications', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(49, 'delete-common-notifications', 'Delete Common Notifications', 'Delete Common Notifications', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(50, 'create-common-reports', 'Create Common Reports', 'Create Common Reports', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(51, 'read-common-reports', 'Read Common Reports', 'Read Common Reports', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(52, 'update-common-reports', 'Update Common Reports', 'Update Common Reports', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(53, 'delete-common-reports', 'Delete Common Reports', 'Delete Common Reports', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(54, 'read-common-search', 'Read Common Search', 'Read Common Search', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(55, 'read-common-uploads', 'Read Common Uploads', 'Read Common Uploads', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(56, 'delete-common-uploads', 'Delete Common Uploads', 'Delete Common Uploads', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(57, 'create-common-widgets', 'Create Common Widgets', 'Create Common Widgets', '2022-07-07 08:14:03', '2022-07-07 08:14:03'),
(58, 'read-common-widgets', 'Read Common Widgets', 'Read Common Widgets', '2022-07-07 08:14:04', '2022-07-07 08:14:04'),
(59, 'update-common-widgets', 'Update Common Widgets', 'Update Common Widgets', '2022-07-07 08:14:04', '2022-07-07 08:14:04'),
(60, 'delete-common-widgets', 'Delete Common Widgets', 'Delete Common Widgets', '2022-07-07 08:14:04', '2022-07-07 08:14:04'),
(61, 'create-purchases-bills', 'Create Purchases Bills', 'Create Purchases Bills', '2022-07-07 08:14:04', '2022-07-07 08:14:04'),
(62, 'read-purchases-bills', 'Read Purchases Bills', 'Read Purchases Bills', '2022-07-07 08:14:04', '2022-07-07 08:14:04'),
(63, 'update-purchases-bills', 'Update Purchases Bills', 'Update Purchases Bills', '2022-07-07 08:14:04', '2022-07-07 08:14:04'),
(64, 'delete-purchases-bills', 'Delete Purchases Bills', 'Delete Purchases Bills', '2022-07-07 08:14:04', '2022-07-07 08:14:04'),
(65, 'create-purchases-payments', 'Create Purchases Payments', 'Create Purchases Payments', '2022-07-07 08:14:04', '2022-07-07 08:14:04'),
(66, 'read-purchases-payments', 'Read Purchases Payments', 'Read Purchases Payments', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(67, 'update-purchases-payments', 'Update Purchases Payments', 'Update Purchases Payments', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(68, 'delete-purchases-payments', 'Delete Purchases Payments', 'Delete Purchases Payments', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(69, 'create-purchases-vendors', 'Create Purchases Vendors', 'Create Purchases Vendors', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(70, 'read-purchases-vendors', 'Read Purchases Vendors', 'Read Purchases Vendors', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(71, 'update-purchases-vendors', 'Update Purchases Vendors', 'Update Purchases Vendors', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(72, 'delete-purchases-vendors', 'Delete Purchases Vendors', 'Delete Purchases Vendors', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(73, 'create-sales-customers', 'Create Sales Customers', 'Create Sales Customers', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(74, 'read-sales-customers', 'Read Sales Customers', 'Read Sales Customers', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(75, 'update-sales-customers', 'Update Sales Customers', 'Update Sales Customers', '2022-07-07 08:14:05', '2022-07-07 08:14:05'),
(76, 'delete-sales-customers', 'Delete Sales Customers', 'Delete Sales Customers', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(77, 'create-sales-invoices', 'Create Sales Invoices', 'Create Sales Invoices', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(78, 'read-sales-invoices', 'Read Sales Invoices', 'Read Sales Invoices', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(79, 'update-sales-invoices', 'Update Sales Invoices', 'Update Sales Invoices', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(80, 'delete-sales-invoices', 'Delete Sales Invoices', 'Delete Sales Invoices', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(81, 'create-sales-revenues', 'Create Sales Revenues', 'Create Sales Revenues', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(82, 'read-sales-revenues', 'Read Sales Revenues', 'Read Sales Revenues', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(83, 'update-sales-revenues', 'Update Sales Revenues', 'Update Sales Revenues', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(84, 'delete-sales-revenues', 'Delete Sales Revenues', 'Delete Sales Revenues', '2022-07-07 08:14:06', '2022-07-07 08:14:06'),
(85, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(86, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(87, 'create-modules-api-key', 'Create Modules Api Key', 'Create Modules Api Key', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(88, 'update-modules-api-key', 'Update Modules Api Key', 'Update Modules Api Key', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(89, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(90, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(91, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(92, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(93, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2022-07-07 08:14:07', '2022-07-07 08:14:07'),
(94, 'read-modules-my', 'Read Modules My', 'Read Modules My', '2022-07-07 08:14:08', '2022-07-07 08:14:08'),
(95, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2022-07-07 08:14:08', '2022-07-07 08:14:08'),
(96, 'read-notifications', 'Read Notifications', 'Read Notifications', '2022-07-07 08:14:08', '2022-07-07 08:14:08'),
(97, 'update-notifications', 'Update Notifications', 'Update Notifications', '2022-07-07 08:14:08', '2022-07-07 08:14:08'),
(98, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2022-07-07 08:14:08', '2022-07-07 08:14:08'),
(99, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2022-07-07 08:14:08', '2022-07-07 08:14:08'),
(100, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2022-07-07 08:14:08', '2022-07-07 08:14:08'),
(101, 'read-reports-profit-loss', 'Read Reports Profit Loss', 'Read Reports Profit Loss', '2022-07-07 08:14:08', '2022-07-07 08:14:08'),
(102, 'read-reports-tax-summary', 'Read Reports Tax Summary', 'Read Reports Tax Summary', '2022-07-07 08:14:09', '2022-07-07 08:14:09'),
(103, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2022-07-07 08:14:09', '2022-07-07 08:14:09'),
(104, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2022-07-07 08:14:09', '2022-07-07 08:14:09'),
(105, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2022-07-07 08:14:09', '2022-07-07 08:14:09'),
(106, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2022-07-07 08:14:09', '2022-07-07 08:14:09'),
(107, 'read-settings-company', 'Read Settings Company', 'Read Settings Company', '2022-07-07 08:14:09', '2022-07-07 08:14:09'),
(108, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2022-07-07 08:14:09', '2022-07-07 08:14:09'),
(109, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2022-07-07 08:14:10', '2022-07-07 08:14:10'),
(110, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2022-07-07 08:14:10', '2022-07-07 08:14:10'),
(111, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2022-07-07 08:14:10', '2022-07-07 08:14:10'),
(112, 'read-settings-defaults', 'Read Settings Defaults', 'Read Settings Defaults', '2022-07-07 08:14:10', '2022-07-07 08:14:10'),
(113, 'read-settings-email', 'Read Settings Email', 'Read Settings Email', '2022-07-07 08:14:10', '2022-07-07 08:14:10'),
(114, 'read-settings-invoice', 'Read Settings Invoice', 'Read Settings Invoice', '2022-07-07 08:14:10', '2022-07-07 08:14:10'),
(115, 'read-settings-localisation', 'Read Settings Localisation', 'Read Settings Localisation', '2022-07-07 08:14:10', '2022-07-07 08:14:10'),
(116, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2022-07-07 08:14:11', '2022-07-07 08:14:11'),
(117, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2022-07-07 08:14:11', '2022-07-07 08:14:11'),
(118, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2022-07-07 08:14:11', '2022-07-07 08:14:11'),
(119, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2022-07-07 08:14:11', '2022-07-07 08:14:11'),
(120, 'read-settings-schedule', 'Read Settings Schedule', 'Read Settings Schedule', '2022-07-07 08:14:11', '2022-07-07 08:14:11'),
(121, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2022-07-07 08:14:11', '2022-07-07 08:14:11'),
(122, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2022-07-07 08:14:12', '2022-07-07 08:14:12'),
(123, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2022-07-07 08:14:12', '2022-07-07 08:14:12'),
(124, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2022-07-07 08:14:12', '2022-07-07 08:14:12'),
(125, 'read-widgets-account-balance', 'Read Widgets Account Balance', 'Read Widgets Account Balance', '2022-07-07 08:14:12', '2022-07-07 08:14:12'),
(126, 'read-widgets-cash-flow', 'Read Widgets Cash Flow', 'Read Widgets Cash Flow', '2022-07-07 08:14:12', '2022-07-07 08:14:12'),
(127, 'read-widgets-expenses-by-category', 'Read Widgets Expenses By Category', 'Read Widgets Expenses By Category', '2022-07-07 08:14:12', '2022-07-07 08:14:12'),
(128, 'read-widgets-income-by-category', 'Read Widgets Income By Category', 'Read Widgets Income By Category', '2022-07-07 08:14:12', '2022-07-07 08:14:12'),
(129, 'read-widgets-latest-expenses', 'Read Widgets Latest Expenses', 'Read Widgets Latest Expenses', '2022-07-07 08:14:13', '2022-07-07 08:14:13'),
(130, 'read-widgets-latest-income', 'Read Widgets Latest Income', 'Read Widgets Latest Income', '2022-07-07 08:14:13', '2022-07-07 08:14:13'),
(131, 'read-widgets-total-expenses', 'Read Widgets Total Expenses', 'Read Widgets Total Expenses', '2022-07-07 08:14:13', '2022-07-07 08:14:13'),
(132, 'read-widgets-total-income', 'Read Widgets Total Income', 'Read Widgets Total Income', '2022-07-07 08:14:13', '2022-07-07 08:14:13'),
(133, 'read-widgets-total-profit', 'Read Widgets Total Profit', 'Read Widgets Total Profit', '2022-07-07 08:14:13', '2022-07-07 08:14:13'),
(134, 'read-widgets-currencies', 'Read Widgets Currencies', 'Read Widgets Currencies', '2022-07-07 08:14:14', '2022-07-07 08:14:14'),
(135, 'read-client-portal', 'Read Client Portal', 'Read Client Portal', '2022-07-07 08:14:24', '2022-07-07 08:14:24'),
(136, 'read-portal-invoices', 'Read Portal Invoices', 'Read Portal Invoices', '2022-07-07 08:14:24', '2022-07-07 08:14:24'),
(137, 'update-portal-invoices', 'Update Portal Invoices', 'Update Portal Invoices', '2022-07-07 08:14:24', '2022-07-07 08:14:24'),
(138, 'read-portal-payments', 'Read Portal Payments', 'Read Portal Payments', '2022-07-07 08:14:24', '2022-07-07 08:14:24'),
(139, 'update-portal-payments', 'Update Portal Payments', 'Update Portal Payments', '2022-07-07 08:14:24', '2022-07-07 08:14:24'),
(140, 'read-portal-profile', 'Read Portal Profile', 'Read Portal Profile', '2022-07-07 08:14:24', '2022-07-07 08:14:24'),
(141, 'update-portal-profile', 'Update Portal Profile', 'Update Portal Profile', '2022-07-07 08:14:24', '2022-07-07 08:14:24'),
(142, 'read-offline-payments-settings', 'Read Offline Payments Settings', 'Read Offline Payments Settings', '2022-07-07 09:14:39', '2022-07-07 09:14:39'),
(143, 'update-offline-payments-settings', 'Update Offline Payments Settings', 'Update Offline Payments Settings', '2022-07-07 09:14:39', '2022-07-07 09:14:39'),
(144, 'delete-offline-payments-settings', 'Delete Offline Payments Settings', 'Delete Offline Payments Settings', '2022-07-07 09:14:39', '2022-07-07 09:14:39'),
(145, 'read-paypal-standard-settings', 'Read PayPal Standard Settings', 'Read PayPal Standard Settings', '2022-07-07 09:14:40', '2022-07-07 09:14:40'),
(146, 'update-paypal-standard-settings', 'Update PayPal Standard Settings', 'Update PayPal Standard Settings', '2022-07-07 09:14:40', '2022-07-07 09:14:40'),
(147, 'read-inventory-reports-item', 'Read Inventory Reports Stock Status', 'Read Inventory Reports Stock Status', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(148, 'read-inventory-reports-item-summary', 'Read Inventory Reports Item Summary', 'Read Inventory Reports Item Summary', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(149, 'read-inventory-reports-sale-item', 'Read Inventory Reports Sale Summary', 'Read Inventory Reports Sale Summary', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(150, 'read-inventory-reports-purchase-item', 'Read Inventory Reports Purchase Summary', 'Read Inventory Reports Purchase Summary', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(151, 'read-inventory-widgets-total-item', 'Read Inventory Widgets Total Item', 'Read Inventory Widgets Total Item', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(152, 'read-inventory-widgets-total-item-income', 'Read Inventory Widgets Total Item Income', 'Read Inventory Widgets Total Item Income', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(153, 'read-inventory-widgets-total-item-expense', 'Read Inventory Widgets Total Item Expense', 'Read Inventory Widgets Total Item Expense', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(154, 'read-inventory-widgets-total-stock-line-chart', 'Read Inventory Widgets Tracked Items Cash Flow', 'Read Inventory Widgets Tracked Items Cash Flow', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(155, 'read-inventory-widgets-warehouse-list', 'Read Inventory Widgets Warehouse List', 'Read Inventory Widgets Warehouse List', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(156, 'read-inventory-widgets-top-seller-items', 'Read Inventory Widgets Top Seller Items', 'Read Inventory Widgets Top Seller Items', '2022-07-07 09:16:39', '2022-07-07 09:16:39'),
(157, 'create-inventory-item-groups', 'Create Inventory Item Groups', 'Create Inventory Item Groups', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(158, 'read-inventory-item-groups', 'Read Inventory Item Groups', 'Read Inventory Item Groups', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(159, 'update-inventory-item-groups', 'Update Inventory Item Groups', 'Update Inventory Item Groups', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(160, 'delete-inventory-item-groups', 'Delete Inventory Item Groups', 'Delete Inventory Item Groups', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(161, 'create-inventory-items', 'Create Inventory Items', 'Create Inventory Items', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(162, 'read-inventory-items', 'Read Inventory Items', 'Read Inventory Items', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(163, 'update-inventory-items', 'Update Inventory Items', 'Update Inventory Items', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(164, 'delete-inventory-items', 'Delete Inventory Items', 'Delete Inventory Items', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(165, 'create-inventory-variants', 'Create Inventory Variants', 'Create Inventory Variants', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(166, 'read-inventory-variants', 'Read Inventory Variants', 'Read Inventory Variants', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(167, 'update-inventory-variants', 'Update Inventory Variants', 'Update Inventory Variants', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(168, 'delete-inventory-variants', 'Delete Inventory Variants', 'Delete Inventory Variants', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(169, 'create-inventory-manufacturers', 'Create Inventory Manufacturers', 'Create Inventory Manufacturers', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(170, 'read-inventory-manufacturers', 'Read Inventory Manufacturers', 'Read Inventory Manufacturers', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(171, 'update-inventory-manufacturers', 'Update Inventory Manufacturers', 'Update Inventory Manufacturers', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(172, 'delete-inventory-manufacturers', 'Delete Inventory Manufacturers', 'Delete Inventory Manufacturers', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(173, 'create-inventory-transfer-orders', 'Create Inventory Transfer Orders', 'Create Inventory Transfer Orders', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(174, 'read-inventory-transfer-orders', 'Read Inventory Transfer Orders', 'Read Inventory Transfer Orders', '2022-07-07 09:16:40', '2022-07-07 09:16:40'),
(175, 'update-inventory-transfer-orders', 'Update Inventory Transfer Orders', 'Update Inventory Transfer Orders', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(176, 'delete-inventory-transfer-orders', 'Delete Inventory Transfer Orders', 'Delete Inventory Transfer Orders', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(177, 'create-inventory-adjustments', 'Create Inventory Adjustments', 'Create Inventory Adjustments', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(178, 'read-inventory-adjustments', 'Read Inventory Adjustments', 'Read Inventory Adjustments', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(179, 'update-inventory-adjustments', 'Update Inventory Adjustments', 'Update Inventory Adjustments', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(180, 'delete-inventory-adjustments', 'Delete Inventory Adjustments', 'Delete Inventory Adjustments', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(181, 'create-inventory-warehouses', 'Create Inventory Warehouses', 'Create Inventory Warehouses', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(182, 'read-inventory-warehouses', 'Read Inventory Warehouses', 'Read Inventory Warehouses', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(183, 'update-inventory-warehouses', 'Update Inventory Warehouses', 'Update Inventory Warehouses', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(184, 'delete-inventory-warehouses', 'Delete Inventory Warehouses', 'Delete Inventory Warehouses', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(185, 'create-inventory-histories', 'Create Inventory Histories', 'Create Inventory Histories', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(186, 'read-inventory-histories', 'Read Inventory Histories', 'Read Inventory Histories', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(187, 'update-inventory-histories', 'Update Inventory Histories', 'Update Inventory Histories', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(188, 'delete-inventory-histories', 'Delete Inventory Histories', 'Delete Inventory Histories', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(189, 'create-inventory-reports', 'Create Inventory Reports', 'Create Inventory Reports', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(190, 'read-inventory-reports', 'Read Inventory Reports', 'Read Inventory Reports', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(191, 'update-inventory-reports', 'Update Inventory Reports', 'Update Inventory Reports', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(192, 'delete-inventory-reports', 'Delete Inventory Reports', 'Delete Inventory Reports', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(193, 'read-inventory-settings', 'Read Inventory Settings', 'Read Inventory Settings', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(194, 'update-inventory-settings', 'Update Inventory Settings', 'Update Inventory Settings', '2022-07-07 09:16:41', '2022-07-07 09:16:41'),
(195, 'read-crm-reports-activity', 'Read CRM Reports Activity', 'Read CRM Reports Activity', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(196, 'read-crm-reports-growth', 'Read CRM Reports Growth', 'Read CRM Reports Growth', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(197, 'read-crm-widgets-total-deals', 'Read CRM Widgets Total Deals', 'Read CRM Widgets Total Deals', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(198, 'read-crm-widgets-total-companies', 'Read CRM Widgets Total Companies', 'Read CRM Widgets Total Companies', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(199, 'read-crm-widgets-total-contacts', 'Read CRM Widgets Total Contacts', 'Read CRM Widgets Total Contacts', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(200, 'read-crm-widgets-deal-flow', 'Read CRM Widgets Deal Flow', 'Read CRM Widgets Deal Flow', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(201, 'read-crm-widgets-today-schedule', 'Read CRM Widgets Today\'s Schedule', 'Read CRM Widgets Today\'s Schedule', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(202, 'read-crm-widgets-upcoming-schedule', 'Read CRM Widgets Upcoming Schedule', 'Read CRM Widgets Upcoming Schedule', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(203, 'read-crm-widgets-latest-deals', 'Read CRM Widgets Latest Deals', 'Read CRM Widgets Latest Deals', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(204, 'read-crm-activities', 'Read CRM Activities', 'Read CRM Activities', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(205, 'create-crm-companies', 'Create CRM Companies', 'Create CRM Companies', '2022-07-07 09:16:53', '2022-07-07 09:16:53'),
(206, 'read-crm-companies', 'Read CRM Companies', 'Read CRM Companies', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(207, 'update-crm-companies', 'Update CRM Companies', 'Update CRM Companies', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(208, 'delete-crm-companies', 'Delete CRM Companies', 'Delete CRM Companies', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(209, 'create-crm-contacts', 'Create CRM Contacts', 'Create CRM Contacts', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(210, 'read-crm-contacts', 'Read CRM Contacts', 'Read CRM Contacts', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(211, 'update-crm-contacts', 'Update CRM Contacts', 'Update CRM Contacts', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(212, 'delete-crm-contacts', 'Delete CRM Contacts', 'Delete CRM Contacts', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(213, 'create-crm-deals', 'Create CRM Deals', 'Create CRM Deals', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(214, 'read-crm-deals', 'Read CRM Deals', 'Read CRM Deals', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(215, 'update-crm-deals', 'Update CRM Deals', 'Update CRM Deals', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(216, 'delete-crm-deals', 'Delete CRM Deals', 'Delete CRM Deals', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(217, 'read-crm-schedules', 'Read CRM Schedules', 'Read CRM Schedules', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(218, 'create-crm-positions', 'Create CRM Positions', 'Create CRM Positions', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(219, 'read-crm-positions', 'Read CRM Positions', 'Read CRM Positions', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(220, 'update-crm-positions', 'Update CRM Positions', 'Update CRM Positions', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(221, 'delete-crm-positions', 'Delete CRM Positions', 'Delete CRM Positions', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(222, 'read-crm-settings', 'Read CRM Settings', 'Read CRM Settings', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(223, 'update-crm-settings', 'Update CRM Settings', 'Update CRM Settings', '2022-07-07 09:16:54', '2022-07-07 09:16:54'),
(224, 'create-credit-debit-notes-credit-notes', 'Create Credit/Debit Notes Credit Notes', 'Create Credit/Debit Notes Credit Notes', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(225, 'read-credit-debit-notes-credit-notes', 'Read Credit/Debit Notes Credit Notes', 'Read Credit/Debit Notes Credit Notes', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(226, 'update-credit-debit-notes-credit-notes', 'Update Credit/Debit Notes Credit Notes', 'Update Credit/Debit Notes Credit Notes', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(227, 'delete-credit-debit-notes-credit-notes', 'Delete Credit/Debit Notes Credit Notes', 'Delete Credit/Debit Notes Credit Notes', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(228, 'create-credit-debit-notes-debit-notes', 'Create Credit/Debit Notes Debit Notes', 'Create Credit/Debit Notes Debit Notes', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(229, 'read-credit-debit-notes-debit-notes', 'Read Credit/Debit Notes Debit Notes', 'Read Credit/Debit Notes Debit Notes', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(230, 'update-credit-debit-notes-debit-notes', 'Update Credit/Debit Notes Debit Notes', 'Update Credit/Debit Notes Debit Notes', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(231, 'delete-credit-debit-notes-debit-notes', 'Delete Credit/Debit Notes Debit Notes', 'Delete Credit/Debit Notes Debit Notes', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(232, 'delete-credit-debit-notes-credits-transactions', 'Delete Credit/Debit Notes Credits Transactions', 'Delete Credit/Debit Notes Credits Transactions', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(233, 'read-credit-debit-notes-settings-credit-note', 'Read Credit/Debit Notes Settings Credit Note', 'Read Credit/Debit Notes Settings Credit Note', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(234, 'update-credit-debit-notes-settings-credit-note', 'Update Credit/Debit Notes Settings Credit Note', 'Update Credit/Debit Notes Settings Credit Note', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(235, 'read-credit-debit-notes-settings-debit-note', 'Read Credit/Debit Notes Settings Debit Note', 'Read Credit/Debit Notes Settings Debit Note', '2022-07-07 09:17:03', '2022-07-07 09:17:03'),
(236, 'update-credit-debit-notes-settings-debit-note', 'Update Credit/Debit Notes Settings Debit Note', 'Update Credit/Debit Notes Settings Debit Note', '2022-07-07 09:17:04', '2022-07-07 09:17:04'),
(237, 'read-credit-debit-notes-portal-credit-notes', 'Read Credit/Debit Notes Portal Credit Notes', 'Read Credit/Debit Notes Portal Credit Notes', '2022-07-07 09:17:04', '2022-07-07 09:17:04'),
(238, 'create-custom-fields-fields', 'Create Custom Fields Fields', 'Create Custom Fields Fields', '2022-07-07 09:17:14', '2022-07-07 09:17:14'),
(239, 'read-custom-fields-fields', 'Read Custom Fields Fields', 'Read Custom Fields Fields', '2022-07-07 09:17:14', '2022-07-07 09:17:14'),
(240, 'update-custom-fields-fields', 'Update Custom Fields Fields', 'Update Custom Fields Fields', '2022-07-07 09:17:14', '2022-07-07 09:17:14'),
(241, 'delete-custom-fields-fields', 'Delete Custom Fields Fields', 'Delete Custom Fields Fields', '2022-07-07 09:17:14', '2022-07-07 09:17:14'),
(242, 'read-custom-fields-settings', 'Read Custom Fields Settings', 'Read Custom Fields Settings', '2022-07-07 09:17:14', '2022-07-07 09:17:14'),
(243, 'update-custom-fields-settings', 'Update Custom Fields Settings', 'Update Custom Fields Settings', '2022-07-07 09:17:14', '2022-07-07 09:17:14'),
(244, 'read-estimates-reports-estimate-summary', 'Read Estimates Reports Estimate Summary', 'Read Estimates Reports Estimate Summary', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(245, 'read-estimates-widgets-total-estimates', 'Read Estimates Widgets Total Estimates', 'Read Estimates Widgets Total Estimates', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(246, 'read-estimates-widgets-estimates-by-category', 'Read Estimates Widgets Estimates By Category', 'Read Estimates Widgets Estimates By Category', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(247, 'read-estimates-widgets-latest-estimates', 'Read Estimates Widgets Latest Estimates', 'Read Estimates Widgets Latest Estimates', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(248, 'create-estimates-estimates', 'Create Estimates Estimates', 'Create Estimates Estimates', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(249, 'read-estimates-estimates', 'Read Estimates Estimates', 'Read Estimates Estimates', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(250, 'update-estimates-estimates', 'Update Estimates Estimates', 'Update Estimates Estimates', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(251, 'delete-estimates-estimates', 'Delete Estimates Estimates', 'Delete Estimates Estimates', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(252, 'read-estimates-settings-estimate', 'Read Estimates Settings Estimate', 'Read Estimates Settings Estimate', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(253, 'update-estimates-settings-estimate', 'Update Estimates Settings Estimate', 'Update Estimates Settings Estimate', '2022-07-07 09:17:24', '2022-07-07 09:17:24'),
(254, 'read-estimates-portal-estimates', 'Read Estimates Portal Estimates', 'Read Estimates Portal Estimates', '2022-07-07 09:17:25', '2022-07-07 09:17:25'),
(255, 'update-estimates-portal-estimates', 'Update Estimates Portal Estimates', 'Update Estimates Portal Estimates', '2022-07-07 09:17:25', '2022-07-07 09:17:25'),
(256, 'read-sales-purchase-orders-reports-sales-order-summary', 'Read Sales&Purchase Orders Reports Sales Order Summary', 'Read Sales&Purchase Orders Reports Sales Order Summary', '2022-07-07 09:17:34', '2022-07-07 09:17:34'),
(257, 'read-sales-purchase-orders-reports-purchase-order-summary', 'Read Sales&Purchase Orders Reports Purchase Order Summary', 'Read Sales&Purchase Orders Reports Purchase Order Summary', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(258, 'create-sales-purchase-orders-sales-orders', 'Create Sales Purchase Orders Sales Orders', 'Create Sales Purchase Orders Sales Orders', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(259, 'read-sales-purchase-orders-sales-orders', 'Read Sales Purchase Orders Sales Orders', 'Read Sales Purchase Orders Sales Orders', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(260, 'update-sales-purchase-orders-sales-orders', 'Update Sales Purchase Orders Sales Orders', 'Update Sales Purchase Orders Sales Orders', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(261, 'delete-sales-purchase-orders-sales-orders', 'Delete Sales Purchase Orders Sales Orders', 'Delete Sales Purchase Orders Sales Orders', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(262, 'create-sales-purchase-orders-purchase-orders', 'Create Sales Purchase Orders Purchase Orders', 'Create Sales Purchase Orders Purchase Orders', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(263, 'read-sales-purchase-orders-purchase-orders', 'Read Sales Purchase Orders Purchase Orders', 'Read Sales Purchase Orders Purchase Orders', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(264, 'update-sales-purchase-orders-purchase-orders', 'Update Sales Purchase Orders Purchase Orders', 'Update Sales Purchase Orders Purchase Orders', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(265, 'delete-sales-purchase-orders-purchase-orders', 'Delete Sales Purchase Orders Purchase Orders', 'Delete Sales Purchase Orders Purchase Orders', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(266, 'read-sales-purchase-orders-settings-sales-order', 'Read Sales Purchase Orders Settings Sales Order', 'Read Sales Purchase Orders Settings Sales Order', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(267, 'update-sales-purchase-orders-settings-sales-order', 'Update Sales Purchase Orders Settings Sales Order', 'Update Sales Purchase Orders Settings Sales Order', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(268, 'read-sales-purchase-orders-settings-purchase-order', 'Read Sales Purchase Orders Settings Purchase Order', 'Read Sales Purchase Orders Settings Purchase Order', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(269, 'update-sales-purchase-orders-settings-purchase-order', 'Update Sales Purchase Orders Settings Purchase Order', 'Update Sales Purchase Orders Settings Purchase Order', '2022-07-07 09:17:35', '2022-07-07 09:17:35'),
(270, 'read-composite-items-reports-sale-summary', 'Read Composite Items Reports Sale Summary', 'Read Composite Items Reports Sale Summary', '2022-07-07 09:17:49', '2022-07-07 09:17:49'),
(271, 'create-composite-items-composite-items', 'Create Composite Items Composite Items', 'Create Composite Items Composite Items', '2022-07-07 09:17:49', '2022-07-07 09:17:49'),
(272, 'read-composite-items-composite-items', 'Read Composite Items Composite Items', 'Read Composite Items Composite Items', '2022-07-07 09:17:49', '2022-07-07 09:17:49'),
(273, 'update-composite-items-composite-items', 'Update Composite Items Composite Items', 'Update Composite Items Composite Items', '2022-07-07 09:17:49', '2022-07-07 09:17:49'),
(274, 'delete-composite-items-composite-items', 'Delete Composite Items Composite Items', 'Delete Composite Items Composite Items', '2022-07-07 09:17:49', '2022-07-07 09:17:49'),
(275, 'create-warehouse-role-management', 'Create Inventory', 'Create Inventory', '2022-07-07 09:18:33', '2022-07-07 09:18:33'),
(276, 'read-warehouse-role-management', 'Read Inventory', 'Read Inventory', '2022-07-07 09:18:33', '2022-07-07 09:18:33'),
(277, 'update-warehouse-role-management', 'Update Inventory', 'Update Inventory', '2022-07-07 09:18:34', '2022-07-07 09:18:34'),
(278, 'delete-warehouse-role-management', 'Delete Inventory', 'Delete Inventory', '2022-07-07 09:18:34', '2022-07-07 09:18:34'),
(279, 'read-Purchasing-price', 'Read Purchasing Price(Hide/Show)', 'Read Purchasing Price(Hide/Show)', '2022-09-26 08:18:03', '2022-09-26 08:18:03'),
(280, 'read-double-entry-reports-general-ledger', 'Read Double-Entry Reports General Ledger', 'Read Double-Entry Reports General Ledger', '2023-03-05 14:24:03', '2023-03-05 14:24:03'),
(281, 'read-double-entry-reports-balance-sheet', 'Read Double-Entry Reports Balance Sheet', 'Read Double-Entry Reports Balance Sheet', '2023-03-05 14:24:03', '2023-03-05 14:24:03'),
(282, 'read-double-entry-reports-trial-balance', 'Read Double-Entry Reports Trial Balance', 'Read Double-Entry Reports Trial Balance', '2023-03-05 14:24:03', '2023-03-05 14:24:03'),
(283, 'read-double-entry-reports-journal-report', 'Read Double-Entry Reports Manual Journals', 'Read Double-Entry Reports Manual Journals', '2023-03-05 14:24:03', '2023-03-05 14:24:03'),
(284, 'read-double-entry-widgets-expenses-by-coa', 'Read Double-Entry Widgets Expenses By COA', 'Read Double-Entry Widgets Expenses By COA', '2023-03-05 14:24:05', '2023-03-05 14:24:05'),
(285, 'create-double-entry-chart-of-accounts', 'Create Double-Entry Chart Of Accounts', 'Create Double-Entry Chart Of Accounts', '2023-03-05 14:24:05', '2023-03-05 14:24:05'),
(286, 'read-double-entry-chart-of-accounts', 'Read Double-Entry Chart Of Accounts', 'Read Double-Entry Chart Of Accounts', '2023-03-05 14:24:05', '2023-03-05 14:24:05'),
(287, 'update-double-entry-chart-of-accounts', 'Update Double-Entry Chart Of Accounts', 'Update Double-Entry Chart Of Accounts', '2023-03-05 14:24:06', '2023-03-05 14:24:06'),
(288, 'delete-double-entry-chart-of-accounts', 'Delete Double-Entry Chart Of Accounts', 'Delete Double-Entry Chart Of Accounts', '2023-03-05 14:24:06', '2023-03-05 14:24:06'),
(289, 'create-double-entry-journal-entry', 'Create Double-Entry Journal Entry', 'Create Double-Entry Journal Entry', '2023-03-05 14:24:06', '2023-03-05 14:24:06'),
(290, 'read-double-entry-journal-entry', 'Read Double-Entry Journal Entry', 'Read Double-Entry Journal Entry', '2023-03-05 14:24:06', '2023-03-05 14:24:06'),
(291, 'update-double-entry-journal-entry', 'Update Double-Entry Journal Entry', 'Update Double-Entry Journal Entry', '2023-03-05 14:24:07', '2023-03-05 14:24:07'),
(292, 'delete-double-entry-journal-entry', 'Delete Double-Entry Journal Entry', 'Delete Double-Entry Journal Entry', '2023-03-05 14:24:07', '2023-03-05 14:24:07'),
(293, 'read-double-entry-settings', 'Read Double-Entry Settings', 'Read Double-Entry Settings', '2023-03-05 14:24:07', '2023-03-05 14:24:07'),
(294, 'update-double-entry-settings', 'Update Double-Entry Settings', 'Update Double-Entry Settings', '2023-03-05 14:24:07', '2023-03-05 14:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `kxm_reconciliations`
--

CREATE TABLE `kxm_reconciliations` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `account_id` int NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double(15,4) NOT NULL DEFAULT '0.0000',
  `reconciled` tinyint(1) NOT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_recurring`
--

CREATE TABLE `kxm_recurring` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `recurable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `recurable_id` bigint UNSIGNED NOT NULL,
  `frequency` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `interval` int NOT NULL DEFAULT '1',
  `started_at` datetime NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_reports`
--

CREATE TABLE `kxm_reports` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `class` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_reports`
--

INSERT INTO `kxm_reports` (`id`, `company_id`, `class`, `name`, `description`, `settings`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(2, 1, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(3, 1, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(4, 1, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(5, 1, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(6, 1, 'App\\Reports\\IncomeSummary', 'Income Summary (Inventory)', 'Monthly income summary by inventory.', '{\"group\":\"item\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(7, 1, 'App\\Reports\\ExpenseSummary', 'Expense Summary (Inventory)', 'Monthly expense summary by inventory.', '{\"group\":\"item\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(8, 1, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense (Inventory)', 'Monthly income vs expense by inventory.', '{\"group\":\"item\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(9, 1, 'App\\Reports\\ProfitLoss', 'Profit & Loss (Inventory)', 'Quarterly profit & loss by inventory.', '{\"group\":\"item\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(10, 1, 'Modules\\Inventory\\Reports\\Item', 'Stock Status', 'Stock tracking of items', '{\"period\":\"monthly\",\"chart\":\"line\"}', 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(11, 1, 'Modules\\Inventory\\Reports\\SaleItem', 'Sale Summary', 'Stock tracking of sales items', '{\"period\":\"monthly\",\"chart\":\"line\"}', 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(12, 1, 'Modules\\Inventory\\Reports\\PurchaseItem', 'Purchase Summary', 'Stock tracking of purchases items', '{\"period\":\"monthly\",\"chart\":\"line\"}', 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(13, 1, 'Modules\\Inventory\\Reports\\ItemSummary', 'Item Summary', 'The list of the Item Information', '[]', 'inventory::seed', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(14, 1, 'Modules\\Crm\\Reports\\Activity', 'Activity', 'Activity report for CRM', '{\"period\":\"monthly\",\"chart\":\"line\"}', NULL, NULL, '2022-07-07 09:16:55', '2022-07-07 09:16:55', NULL),
(15, 1, 'Modules\\Crm\\Reports\\Growth', 'Growth', 'Growth report for CRM', '{\"period\":\"monthly\",\"chart\":\"line\"}', NULL, NULL, '2022-07-07 09:16:55', '2022-07-07 09:16:55', NULL),
(16, 1, 'Modules\\Estimates\\Reports\\EstimateSummary', 'Estimates', 'Turn an approved estimate (quote) into an invoice with just one click of a button.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-07-07 09:17:25', '2022-07-07 09:17:25', NULL),
(17, 1, 'Modules\\SalesPurchaseOrders\\Reports\\SalesOrderSummary', 'Sales Orders', 'Monthly sales order summary by customers', '{\"group\":\"customer\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-07-07 09:17:36', '2022-07-07 09:17:36', NULL),
(18, 1, 'Modules\\SalesPurchaseOrders\\Reports\\PurchaseOrderSummary', 'Purchase Orders', 'Monthly purchase order summary by vendors', '{\"group\":\"vendor\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-07-07 09:17:36', '2022-07-07 09:17:36', NULL),
(19, 2, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(20, 2, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(21, 2, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(22, 2, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(23, 2, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(24, 2, 'Modules\\SalesPurchaseOrders\\Reports\\SalesOrderSummary', 'Sales Orders', 'Monthly sales order summary by customers', '{\"group\":\"customer\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 08:39:55', '2022-09-12 08:39:55', NULL),
(25, 2, 'Modules\\SalesPurchaseOrders\\Reports\\PurchaseOrderSummary', 'Purchase Orders', 'Monthly purchase order summary by vendors', '{\"group\":\"vendor\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 08:39:55', '2022-09-12 08:39:55', NULL),
(26, 3, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(27, 3, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(28, 3, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(29, 3, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(30, 3, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(31, 3, 'Modules\\SalesPurchaseOrders\\Reports\\SalesOrderSummary', 'Sales Orders', 'Monthly sales order summary by customers', '{\"group\":\"customer\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 10:03:53', '2022-09-12 10:03:53', NULL),
(32, 3, 'Modules\\SalesPurchaseOrders\\Reports\\PurchaseOrderSummary', 'Purchase Orders', 'Monthly purchase order summary by vendors', '{\"group\":\"vendor\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 10:03:53', '2022-09-12 10:03:53', NULL),
(33, 4, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(34, 4, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(35, 4, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(36, 4, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(37, 4, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(38, 4, 'Modules\\SalesPurchaseOrders\\Reports\\SalesOrderSummary', 'Sales Orders', 'Monthly sales order summary by customers', '{\"group\":\"customer\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 10:30:53', '2022-09-12 10:30:53', NULL),
(39, 4, 'Modules\\SalesPurchaseOrders\\Reports\\PurchaseOrderSummary', 'Purchase Orders', 'Monthly purchase order summary by vendors', '{\"group\":\"vendor\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 10:30:53', '2022-09-12 10:30:53', NULL),
(40, 4, 'Modules\\Estimates\\Reports\\EstimateSummary', 'Estimates', 'Turn an approved estimate (quote) into an invoice with just one click of a button.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 10:31:47', '2022-09-12 10:31:47', NULL),
(41, 4, 'Modules\\Crm\\Reports\\Activity', 'Activity', 'Activity report for CRM', '{\"period\":\"monthly\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 10:31:55', '2022-09-12 10:31:55', NULL),
(42, 4, 'Modules\\Crm\\Reports\\Growth', 'Growth', 'Growth report for CRM', '{\"period\":\"monthly\",\"chart\":\"line\"}', NULL, NULL, '2022-09-12 10:31:55', '2022-09-12 10:31:55', NULL),
(43, 6, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(44, 6, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(45, 6, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(46, 6, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(47, 6, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-12 13:28:24', '2022-09-12 13:28:24', NULL),
(48, 7, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(49, 7, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(50, 7, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'core::seed', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(51, 7, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(52, 7, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'core::seed', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(53, 1, 'Modules\\DoubleEntry\\Reports\\GeneralLedger', 'General Ledger', 'Detailed list of all transactions and their total.', '{\"basis\":\"accrual\"}', 'double-entry::seed', NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(54, 1, 'Modules\\DoubleEntry\\Reports\\JournalReport', 'Journal Entries', 'Detailed list of all journal entries.', '{\"basis\":\"accrual\"}', 'double-entry::seed', NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(55, 1, 'Modules\\DoubleEntry\\Reports\\BalanceSheet', 'Balance Sheet', 'Snapshot of your business.', '{\"basis\":\"accrual\"}', 'double-entry::seed', NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(56, 1, 'Modules\\DoubleEntry\\Reports\\TrialBalance', 'Trial Balance', 'Balance of all your chart of accounts.', '{\"basis\":\"accrual\"}', 'double-entry::seed', NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(57, 1, 'App\\Reports\\IncomeSummary', 'Income Summary (COA)', 'Monthly income summary by chart of account.', '{\"group\":\"de_account\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'double-entry::seed', NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(58, 1, 'App\\Reports\\ExpenseSummary', 'Expense Summary (COA)', 'Monthly expense summary by chart of account.', '{\"group\":\"de_account\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'double-entry::seed', NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(59, 1, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense (COA)', 'Monthly income vs expense by chart of account.', '{\"group\":\"de_account\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', 'double-entry::seed', NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL),
(60, 1, 'App\\Reports\\ProfitLoss', 'Profit & Loss (COA)', 'Quarterly profit & loss by chart of account.', '{\"group\":\"de_account\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', 'double-entry::seed', NULL, '2023-03-05 14:24:05', '2023-03-05 14:24:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_roles`
--

CREATE TABLE `kxm_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_roles`
--

INSERT INTO `kxm_roles` (`id`, `name`, `display_name`, `description`, `created_from`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', NULL, NULL, '2022-07-07 08:14:00', '2022-07-07 08:14:00'),
(2, 'manager', 'Manager', 'Manager', NULL, NULL, '2022-07-07 08:14:14', '2022-07-07 08:14:14'),
(3, 'customer', 'Customer', 'Customer', NULL, NULL, '2022-07-07 08:14:24', '2022-07-07 08:14:24');

-- --------------------------------------------------------

--
-- Table structure for table `kxm_role_permissions`
--

CREATE TABLE `kxm_role_permissions` (
  `role_id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_role_permissions`
--

INSERT INTO `kxm_role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 5),
(1, 6),
(1, 7),
(2, 7),
(1, 8),
(2, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 11),
(1, 12),
(1, 13),
(1, 14),
(2, 14),
(1, 15),
(2, 15),
(1, 16),
(1, 17),
(1, 18),
(2, 18),
(1, 19),
(2, 19),
(1, 20),
(2, 20),
(1, 21),
(2, 21),
(1, 22),
(2, 22),
(1, 23),
(2, 23),
(1, 24),
(2, 24),
(1, 25),
(2, 25),
(1, 26),
(2, 26),
(1, 27),
(2, 27),
(1, 28),
(2, 28),
(1, 29),
(2, 29),
(1, 30),
(2, 30),
(1, 31),
(2, 31),
(1, 32),
(2, 32),
(1, 33),
(2, 33),
(1, 34),
(2, 34),
(1, 35),
(2, 35),
(1, 36),
(2, 36),
(1, 37),
(2, 37),
(1, 38),
(2, 38),
(1, 39),
(2, 39),
(1, 40),
(2, 40),
(1, 41),
(2, 41),
(1, 42),
(2, 42),
(1, 43),
(2, 43),
(3, 43),
(1, 44),
(2, 44),
(1, 45),
(2, 45),
(1, 46),
(2, 46),
(1, 47),
(2, 47),
(1, 48),
(2, 48),
(1, 49),
(2, 49),
(1, 50),
(2, 50),
(1, 51),
(2, 51),
(1, 52),
(2, 52),
(1, 53),
(2, 53),
(1, 54),
(2, 54),
(1, 55),
(2, 55),
(1, 56),
(1, 57),
(2, 57),
(1, 58),
(1, 59),
(2, 59),
(1, 60),
(2, 60),
(1, 61),
(2, 61),
(1, 62),
(2, 62),
(1, 63),
(2, 63),
(1, 64),
(2, 64),
(1, 65),
(2, 65),
(1, 66),
(2, 66),
(1, 67),
(2, 67),
(1, 68),
(2, 68),
(1, 69),
(2, 69),
(1, 70),
(2, 70),
(1, 71),
(2, 71),
(1, 72),
(2, 72),
(1, 73),
(2, 73),
(1, 74),
(2, 74),
(1, 75),
(2, 75),
(1, 76),
(2, 76),
(1, 77),
(2, 77),
(1, 78),
(2, 78),
(1, 79),
(2, 79),
(1, 80),
(2, 80),
(1, 81),
(2, 81),
(1, 82),
(2, 82),
(1, 83),
(2, 83),
(1, 84),
(2, 84),
(1, 85),
(2, 85),
(1, 86),
(2, 86),
(1, 87),
(1, 88),
(2, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(2, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(2, 96),
(1, 97),
(2, 97),
(1, 98),
(2, 98),
(1, 99),
(2, 99),
(1, 100),
(2, 100),
(1, 101),
(2, 101),
(1, 102),
(2, 102),
(1, 103),
(2, 103),
(1, 104),
(2, 104),
(1, 105),
(2, 105),
(1, 106),
(2, 106),
(1, 107),
(2, 107),
(1, 108),
(2, 108),
(1, 109),
(2, 109),
(1, 110),
(2, 110),
(1, 111),
(2, 111),
(1, 112),
(2, 112),
(1, 113),
(2, 113),
(1, 114),
(2, 114),
(1, 115),
(2, 115),
(1, 116),
(2, 116),
(1, 117),
(2, 117),
(1, 118),
(2, 118),
(1, 119),
(2, 119),
(1, 120),
(2, 120),
(1, 121),
(2, 121),
(1, 122),
(2, 122),
(1, 123),
(2, 123),
(1, 124),
(2, 124),
(1, 125),
(1, 126),
(2, 126),
(1, 127),
(1, 128),
(2, 128),
(1, 129),
(1, 130),
(1, 131),
(2, 131),
(1, 132),
(1, 133),
(1, 134),
(3, 135),
(3, 136),
(2, 137),
(3, 137),
(3, 138),
(2, 139),
(3, 139),
(3, 140),
(2, 141),
(3, 141),
(1, 142),
(2, 142),
(1, 143),
(2, 143),
(1, 144),
(2, 144),
(1, 145),
(2, 145),
(1, 146),
(2, 146),
(1, 147),
(2, 147),
(1, 148),
(2, 148),
(1, 149),
(2, 149),
(1, 150),
(2, 150),
(1, 151),
(2, 151),
(1, 152),
(2, 152),
(1, 153),
(2, 153),
(1, 154),
(2, 154),
(1, 155),
(2, 155),
(1, 156),
(2, 156),
(1, 157),
(2, 157),
(1, 158),
(2, 158),
(1, 159),
(2, 159),
(1, 160),
(2, 160),
(1, 161),
(1, 162),
(2, 162),
(3, 162),
(1, 163),
(2, 163),
(1, 164),
(2, 164),
(1, 165),
(2, 165),
(1, 166),
(2, 166),
(1, 167),
(2, 167),
(1, 168),
(2, 168),
(1, 169),
(2, 169),
(1, 170),
(2, 170),
(1, 171),
(2, 171),
(1, 172),
(2, 172),
(1, 173),
(2, 173),
(1, 174),
(2, 174),
(1, 175),
(2, 175),
(1, 176),
(2, 176),
(1, 177),
(1, 178),
(2, 178),
(1, 179),
(2, 179),
(1, 180),
(2, 180),
(1, 181),
(2, 181),
(1, 182),
(2, 182),
(1, 183),
(2, 183),
(1, 184),
(2, 184),
(1, 185),
(2, 185),
(1, 186),
(2, 186),
(1, 187),
(2, 187),
(1, 188),
(2, 188),
(1, 189),
(2, 189),
(1, 190),
(2, 190),
(1, 191),
(2, 191),
(1, 192),
(2, 192),
(1, 193),
(2, 193),
(1, 194),
(2, 194),
(1, 195),
(2, 195),
(1, 196),
(2, 196),
(1, 197),
(2, 197),
(1, 198),
(2, 198),
(1, 199),
(2, 199),
(1, 200),
(2, 200),
(1, 201),
(2, 201),
(1, 202),
(2, 202),
(1, 203),
(2, 203),
(1, 204),
(2, 204),
(1, 205),
(2, 205),
(1, 206),
(2, 206),
(1, 207),
(2, 207),
(1, 208),
(2, 208),
(1, 209),
(2, 209),
(1, 210),
(2, 210),
(1, 211),
(2, 211),
(1, 212),
(2, 212),
(1, 213),
(2, 213),
(1, 214),
(2, 214),
(1, 215),
(2, 215),
(1, 216),
(2, 216),
(1, 217),
(2, 217),
(1, 218),
(2, 218),
(1, 219),
(2, 219),
(1, 220),
(2, 220),
(1, 221),
(2, 221),
(1, 222),
(2, 222),
(1, 223),
(2, 223),
(1, 224),
(2, 224),
(1, 225),
(2, 225),
(1, 226),
(2, 226),
(1, 227),
(2, 227),
(1, 228),
(2, 228),
(1, 229),
(2, 229),
(1, 230),
(2, 230),
(1, 231),
(2, 231),
(1, 232),
(2, 232),
(1, 233),
(2, 233),
(1, 234),
(2, 234),
(1, 235),
(2, 235),
(1, 236),
(2, 236),
(3, 237),
(1, 238),
(2, 238),
(1, 239),
(2, 239),
(1, 240),
(2, 240),
(1, 241),
(2, 241),
(1, 242),
(2, 242),
(1, 243),
(2, 243),
(1, 244),
(2, 244),
(1, 245),
(2, 245),
(1, 246),
(2, 246),
(1, 247),
(2, 247),
(1, 248),
(2, 248),
(1, 249),
(2, 249),
(1, 250),
(2, 250),
(1, 251),
(2, 251),
(1, 252),
(1, 253),
(2, 253),
(3, 254),
(2, 255),
(3, 255),
(1, 256),
(2, 256),
(1, 257),
(2, 257),
(1, 258),
(2, 258),
(1, 259),
(2, 259),
(3, 259),
(1, 260),
(2, 260),
(3, 260),
(1, 261),
(2, 261),
(1, 262),
(2, 262),
(1, 263),
(2, 263),
(3, 263),
(1, 264),
(2, 264),
(3, 264),
(1, 265),
(2, 265),
(1, 266),
(1, 267),
(2, 267),
(1, 268),
(1, 269),
(2, 269),
(1, 270),
(2, 270),
(1, 271),
(2, 271),
(1, 272),
(2, 272),
(1, 273),
(2, 273),
(1, 274),
(2, 274),
(1, 275),
(1, 276),
(1, 277),
(2, 277),
(1, 278),
(1, 279),
(1, 280),
(2, 280),
(1, 281),
(2, 281),
(1, 282),
(2, 282),
(1, 283),
(2, 283),
(1, 284),
(2, 284),
(1, 285),
(2, 285),
(1, 286),
(2, 286),
(1, 287),
(2, 287),
(1, 288),
(2, 288),
(1, 289),
(2, 289),
(1, 290),
(2, 290),
(1, 291),
(2, 291),
(1, 292),
(2, 292),
(1, 293),
(2, 293),
(1, 294),
(2, 294);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_sales_purchase_orders_documents`
--

CREATE TABLE `kxm_sales_purchase_orders_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `document_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_sales_purchase_orders_documents`
--

INSERT INTO `kxm_sales_purchase_orders_documents` (`id`, `company_id`, `document_id`, `item_id`, `item_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 43, 44, 'App\\Models\\Document\\Document', '2024-03-01 10:00:40', '2024-03-01 10:00:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_sales_purchase_orders_purchase_extra_parameters`
--

CREATE TABLE `kxm_sales_purchase_orders_purchase_extra_parameters` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `document_id` int NOT NULL,
  `expected_delivery_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_sales_purchase_orders_sales_extra_parameters`
--

CREATE TABLE `kxm_sales_purchase_orders_sales_extra_parameters` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `document_id` int NOT NULL,
  `expected_shipment_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_sales_purchase_orders_sales_extra_parameters`
--

INSERT INTO `kxm_sales_purchase_orders_sales_extra_parameters` (`id`, `company_id`, `document_id`, `expected_shipment_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 43, '2024-02-29 00:00:00', '2024-02-29 21:09:23', '2024-02-29 21:09:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_sessions`
--

CREATE TABLE `kxm_sessions` (
  `id` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `payload` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_settings`
--

CREATE TABLE `kxm_settings` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_settings`
--

INSERT INTO `kxm_settings` (`id`, `company_id`, `key`, `value`, `deleted_at`) VALUES
(1, 1, 'invoice.title', 'Invoice', NULL),
(2, 1, 'default.account', '1', NULL),
(3, 1, 'default.income_category', '2', NULL),
(4, 1, 'default.expense_category', '4', NULL),
(5, 1, 'wizard.completed', '1', NULL),
(6, 1, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]', NULL),
(7, 1, 'company.name', 'innobyte', NULL),
(8, 1, 'company.email', 'elgadir.m@gmail.com', NULL),
(9, 1, 'inventory.default_warehouse', '3', NULL),
(10, 1, 'inventory.units', '{\"0\":\"Box\",\"1\":\"Dozen\",\"2\":\"Grams\",\"3\":\"Kilograms\",\"4\":\"Meters\",\"5\":\"Units\",\"6\":\"Pairs\",\"7\":\"Pieces\",\"8\":\"Tablets\",\"9\":\"Liters\",\"10\":\"units\"}', NULL),
(11, 1, 'inventory.reasons', '{\"0\":\"Stock on fire\",\"1\":\"Stolen Items\",\"2\":\"Damaged Items\",\"3\":\"Other\"}', NULL),
(12, 1, 'inventory.barcode_type', '0', NULL),
(13, 1, 'inventory.barcode_print_template', 'single', NULL),
(14, 1, 'inventory.sku_transferred', '1', NULL),
(15, 1, 'contact.type.customer', 'customer,crm_contact,crm_company', NULL),
(16, 1, 'credit-debit-notes.credit_note.title', 'Credit Note', NULL),
(17, 1, 'transaction.type.expense', 'expense,credit_note_refund', NULL),
(18, 1, 'transaction.type.income', 'income,debit_note_refund', NULL),
(19, 1, 'estimates.estimate.name', 'Devis', NULL),
(20, 1, 'estimates.estimate.title', 'Devis', NULL),
(21, 1, 'sales-purchase-orders.sales_order.title', 'Sales Order', NULL),
(22, 1, 'sales-purchase-orders.purchase_order.title', 'Purchase Order', NULL),
(25, 1, 'default.use_gravatar', '0', NULL),
(26, 1, 'estimates.estimate.number_prefix', 'DV-', NULL),
(27, 1, 'estimates.estimate.item_name', 'settings.invoice.item', NULL),
(28, 1, 'estimates.estimate.price_name', 'settings.invoice.price', NULL),
(29, 1, 'estimates.estimate.quantity_name', 'settings.invoice.quantity', NULL),
(30, 1, 'estimates.estimate.hide_item_name', '0', NULL),
(31, 1, 'estimates.estimate.hide_item_description', '0', NULL),
(32, 1, 'estimates.estimate.hide_quantity', '0', NULL),
(33, 1, 'estimates.estimate.hide_price', '0', NULL),
(34, 1, 'estimates.estimate.hide_amount', '0', NULL),
(35, 1, 'inventory.transfer_order_next', '3', NULL),
(36, 1, 'estimates.estimate.number_next', '7', NULL),
(37, 1, 'sales-purchase-orders.sales_order.number_next', '4', NULL),
(40, 1, 'credit-debit-notes.credit_note.number_next', '3', NULL),
(41, 1, 'invoice.hide_item_name', '0', NULL),
(42, 1, 'invoice.hide_item_description', '0', NULL),
(43, 1, 'invoice.hide_quantity', '0', NULL),
(44, 1, 'invoice.hide_price', '0', NULL),
(45, 1, 'invoice.hide_amount', '0', NULL),
(46, 2, 'invoice.title', 'Invoice', NULL),
(47, 2, 'default.currency', 'DZD', NULL),
(48, 2, 'default.locale', 'fr-FR', NULL),
(49, 2, 'default.account', '3', NULL),
(50, 2, 'default.income_category', '8', NULL),
(51, 2, 'default.expense_category', '10', NULL),
(52, 2, 'wizard.completed', '1', NULL),
(53, 2, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]', NULL),
(54, 2, 'company.name', 'innbo', NULL),
(55, 2, 'company.email', 'elgadir.m@gmail.com', NULL),
(56, 2, 'credit-debit-notes.credit_note.title', 'Credit Note', NULL),
(57, 2, 'transaction.type.expense', 'expense,credit_note_refund', NULL),
(58, 2, 'transaction.type.income', 'income,debit_note_refund', NULL),
(59, 2, 'contact.type.customer', 'customer,crm_contact,crm_company', NULL),
(60, 2, 'credit-debit-notes.credit_note.number_next', '2', NULL),
(61, 2, 'default.use_gravatar', '0', NULL),
(62, 2, 'estimates.estimate.hide_amount', '0', NULL),
(63, 2, 'estimates.estimate.hide_item_description', '0', NULL),
(64, 2, 'estimates.estimate.hide_item_name', '0', NULL),
(65, 2, 'estimates.estimate.hide_price', '0', NULL),
(66, 2, 'estimates.estimate.hide_quantity', '0', NULL),
(67, 2, 'estimates.estimate.item_name', 'settings.invoice.item', NULL),
(68, 2, 'estimates.estimate.name', 'Devis', NULL),
(69, 2, 'estimates.estimate.number_next', '4', NULL),
(70, 2, 'estimates.estimate.number_prefix', 'DV-', NULL),
(71, 2, 'estimates.estimate.price_name', 'settings.invoice.price', NULL),
(72, 2, 'estimates.estimate.quantity_name', 'settings.invoice.quantity', NULL),
(73, 2, 'estimates.estimate.title', 'Devis', NULL),
(74, 2, 'inventory.barcode_print_template', 'single', NULL),
(75, 2, 'inventory.barcode_type', '0', NULL),
(76, 2, 'inventory.default_warehouse', '1', NULL),
(77, 2, 'inventory.reasons', '{\"0\":\"Stock on fire\",\"1\":\"Stolen Items\",\"2\":\"Damaged Items\",\"3\":\"Other\"}', NULL),
(78, 2, 'inventory.sku_transferred', '1', NULL),
(79, 2, 'inventory.transfer_order_next', '3', NULL),
(80, 2, 'inventory.units', '{\"0\":\"Box\",\"1\":\"Dozen\",\"2\":\"Grams\",\"3\":\"Kilograms\",\"4\":\"Meters\",\"5\":\"Units\",\"6\":\"Pairs\",\"7\":\"Pieces\",\"8\":\"Tablets\",\"9\":\"Liters\"}', NULL),
(81, 2, 'invoice.hide_amount', '0', NULL),
(82, 2, 'invoice.hide_item_description', '0', NULL),
(83, 2, 'invoice.hide_item_name', '0', NULL),
(84, 2, 'invoice.hide_price', '0', NULL),
(85, 2, 'invoice.hide_quantity', '0', NULL),
(86, 2, 'invoice.number_next', '10', NULL),
(87, 2, 'sales-purchase-orders.purchase_order.title', 'Purchase Order', NULL),
(88, 2, 'sales-purchase-orders.sales_order.number_next', '3', NULL),
(89, 2, 'sales-purchase-orders.sales_order.title', 'Sales Order', NULL),
(90, 3, 'invoice.title', 'Invoice', NULL),
(92, 3, 'default.locale', 'fr-FR', NULL),
(93, 3, 'default.account', '4', NULL),
(94, 3, 'default.income_category', '13', NULL),
(95, 3, 'default.expense_category', '15', NULL),
(96, 3, 'wizard.completed', '1', NULL),
(97, 3, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]', NULL),
(98, 3, 'company.name', 'company3', NULL),
(99, 3, 'company.email', 'mohamed.elgadir@icosnet.com', NULL),
(100, 3, 'sales-purchase-orders.sales_order.title', 'Sales Order', NULL),
(101, 3, 'sales-purchase-orders.purchase_order.title', 'Purchase Order', NULL),
(102, 3, 'credit-debit-notes.credit_note.title', 'Credit Note', NULL),
(103, 3, 'transaction.type.expense', 'expense,credit_note_refund', NULL),
(104, 3, 'transaction.type.income', 'income,debit_note_refund', NULL),
(105, 3, 'contact.type.customer', 'customer,crm_contact,crm_company', NULL),
(106, 3, 'credit-debit-notes.credit_note.number_next', '2', NULL),
(108, 3, 'default.use_gravatar', '0', NULL),
(109, 3, 'estimates.estimate.hide_amount', '0', NULL),
(110, 3, 'estimates.estimate.hide_item_description', '0', NULL),
(111, 3, 'estimates.estimate.hide_item_name', '0', NULL),
(112, 3, 'estimates.estimate.hide_price', '0', NULL),
(113, 3, 'estimates.estimate.hide_quantity', '0', NULL),
(114, 3, 'estimates.estimate.item_name', 'settings.invoice.item', NULL),
(115, 3, 'estimates.estimate.name', 'Devis', NULL),
(116, 3, 'estimates.estimate.number_next', '4', NULL),
(117, 3, 'estimates.estimate.number_prefix', 'DV-', NULL),
(118, 3, 'estimates.estimate.price_name', 'settings.invoice.price', NULL),
(119, 3, 'estimates.estimate.quantity_name', 'settings.invoice.quantity', NULL),
(120, 3, 'estimates.estimate.title', 'Devis', NULL),
(121, 3, 'inventory.barcode_print_template', 'single', NULL),
(122, 3, 'inventory.barcode_type', '0', NULL),
(123, 3, 'inventory.default_warehouse', '1', NULL),
(124, 3, 'inventory.reasons', '{\"0\":\"Stock on fire\",\"1\":\"Stolen Items\",\"2\":\"Damaged Items\",\"3\":\"Other\"}', NULL),
(125, 3, 'inventory.sku_transferred', '1', NULL),
(126, 3, 'inventory.transfer_order_next', '3', NULL),
(127, 3, 'inventory.units', '{\"0\":\"Box\",\"1\":\"Dozen\",\"2\":\"Grams\",\"3\":\"Kilograms\",\"4\":\"Meters\",\"5\":\"Units\",\"6\":\"Pairs\",\"7\":\"Pieces\",\"8\":\"Tablets\",\"9\":\"Liters\"}', NULL),
(128, 3, 'invoice.hide_amount', '0', NULL),
(129, 3, 'invoice.hide_item_description', '0', NULL),
(130, 3, 'invoice.hide_item_name', '0', NULL),
(131, 3, 'invoice.hide_price', '0', NULL),
(132, 3, 'invoice.hide_quantity', '0', NULL),
(133, 3, 'invoice.number_next', '10', NULL),
(134, 3, 'sales-purchase-orders.sales_order.number_next', '3', NULL),
(135, 4, 'invoice.title', 'Invoice', NULL),
(136, 4, 'default.locale', 'fr-FR', NULL),
(137, 4, 'default.account', '5', NULL),
(138, 4, 'default.income_category', '18', NULL),
(139, 4, 'default.expense_category', '20', NULL),
(140, 4, 'wizard.completed', '1', NULL),
(141, 4, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]', NULL),
(142, 4, 'company.name', 'company4', NULL),
(143, 4, 'company.email', 'mohaeemed.elgadir@icosnet.com', NULL),
(144, 4, 'sales-purchase-orders.sales_order.title', 'Sales Order', NULL),
(145, 4, 'sales-purchase-orders.purchase_order.title', 'Purchase Order', NULL),
(146, 4, 'credit-debit-notes.credit_note.title', 'Credit Note', NULL),
(147, 4, 'transaction.type.expense', 'expense,credit_note_refund', NULL),
(148, 4, 'transaction.type.income', 'income,debit_note_refund', NULL),
(149, 4, 'estimates.estimate.name', 'Estimates', NULL),
(150, 4, 'estimates.estimate.title', 'Estimate', NULL),
(151, 4, 'contact.type.customer', 'customer,crm_contact,crm_company', NULL),
(153, 4, 'default.use_gravatar', '0', NULL),
(154, 4, 'credit-debit-notes.credit_note.number_next', '2', NULL),
(155, 4, 'estimates.estimate.hide_amount', '0', NULL),
(156, 4, 'estimates.estimate.hide_item_description', '0', NULL),
(157, 4, 'estimates.estimate.hide_item_name', '0', NULL),
(158, 4, 'estimates.estimate.hide_price', '0', NULL),
(159, 4, 'estimates.estimate.hide_quantity', '0', NULL),
(160, 4, 'estimates.estimate.item_name', 'settings.invoice.item', NULL),
(161, 4, 'estimates.estimate.number_next', '4', NULL),
(162, 4, 'estimates.estimate.number_prefix', 'DV-', NULL),
(163, 4, 'estimates.estimate.price_name', 'settings.invoice.price', NULL),
(164, 4, 'estimates.estimate.quantity_name', 'settings.invoice.quantity', NULL),
(165, 4, 'inventory.barcode_print_template', 'single', NULL),
(166, 4, 'inventory.barcode_type', '0', NULL),
(167, 4, 'inventory.default_warehouse', '1', NULL),
(168, 4, 'inventory.reasons', '{\"0\":\"Stock on fire\",\"1\":\"Stolen Items\",\"2\":\"Damaged Items\",\"3\":\"Other\"}', NULL),
(169, 4, 'inventory.sku_transferred', '1', NULL),
(170, 4, 'inventory.transfer_order_next', '3', NULL),
(171, 4, 'inventory.units', '{\"0\":\"Box\",\"1\":\"Dozen\",\"2\":\"Grams\",\"3\":\"Kilograms\",\"4\":\"Meters\",\"5\":\"Units\",\"6\":\"Pairs\",\"7\":\"Pieces\",\"8\":\"Tablets\",\"9\":\"Liters\"}', NULL),
(172, 4, 'invoice.hide_amount', '0', NULL),
(173, 4, 'invoice.hide_item_description', '0', NULL),
(174, 4, 'invoice.hide_item_name', '0', NULL),
(175, 4, 'invoice.hide_price', '0', NULL),
(176, 4, 'invoice.hide_quantity', '0', NULL),
(177, 4, 'invoice.number_next', '10', NULL),
(178, 4, 'sales-purchase-orders.sales_order.number_next', '3', NULL),
(179, 6, 'invoice.title', 'Invoice', NULL),
(180, 6, 'default.locale', 'fr-FR', NULL),
(181, 6, 'default.account', '7', NULL),
(182, 6, 'default.income_category', '28', NULL),
(183, 6, 'default.expense_category', '30', NULL),
(184, 6, 'wizard.completed', '0', NULL),
(185, 6, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]', NULL),
(186, 6, 'company.name', 'compan5', NULL),
(187, 6, 'company.email', 'mohamded.elgadir@icosnet.com', NULL),
(188, 6, 'contact.type.customer', 'customer,crm_contact,crm_company', NULL),
(189, 6, 'credit-debit-notes.credit_note.number_next', '2', NULL),
(190, 6, 'credit-debit-notes.credit_note.title', 'Credit Note', NULL),
(192, 6, 'default.use_gravatar', '0', NULL),
(193, 6, 'estimates.estimate.hide_amount', '0', NULL),
(194, 6, 'estimates.estimate.hide_item_description', '0', NULL),
(195, 6, 'estimates.estimate.hide_item_name', '0', NULL),
(196, 6, 'estimates.estimate.hide_price', '0', NULL),
(197, 6, 'estimates.estimate.hide_quantity', '0', NULL),
(198, 6, 'estimates.estimate.item_name', 'settings.invoice.item', NULL),
(199, 6, 'estimates.estimate.name', 'Devis', NULL),
(200, 6, 'estimates.estimate.number_next', '4', NULL),
(201, 6, 'estimates.estimate.number_prefix', 'DV-', NULL),
(202, 6, 'estimates.estimate.price_name', 'settings.invoice.price', NULL),
(203, 6, 'estimates.estimate.quantity_name', 'settings.invoice.quantity', NULL),
(204, 6, 'estimates.estimate.title', 'Devis', NULL),
(205, 6, 'inventory.barcode_print_template', 'single', NULL),
(206, 6, 'inventory.barcode_type', '0', NULL),
(207, 6, 'inventory.default_warehouse', '1', NULL),
(208, 6, 'inventory.reasons', '{\"0\":\"Stock on fire\",\"1\":\"Stolen Items\",\"2\":\"Damaged Items\",\"3\":\"Other\"}', NULL),
(209, 6, 'inventory.sku_transferred', '1', NULL),
(210, 6, 'inventory.transfer_order_next', '3', NULL),
(211, 6, 'inventory.units', '{\"0\":\"Box\",\"1\":\"Dozen\",\"2\":\"Grams\",\"3\":\"Kilograms\",\"4\":\"Meters\",\"5\":\"Units\",\"6\":\"Pairs\",\"7\":\"Pieces\",\"8\":\"Tablets\",\"9\":\"Liters\"}', NULL),
(212, 6, 'invoice.hide_amount', '0', NULL),
(213, 6, 'invoice.hide_item_description', '0', NULL),
(214, 6, 'invoice.hide_item_name', '0', NULL),
(215, 6, 'invoice.hide_price', '0', NULL),
(216, 6, 'invoice.hide_quantity', '0', NULL),
(217, 6, 'invoice.number_next', '10', NULL),
(218, 6, 'sales-purchase-orders.purchase_order.title', 'Purchase Order', NULL),
(219, 6, 'sales-purchase-orders.sales_order.number_next', '3', NULL),
(220, 6, 'sales-purchase-orders.sales_order.title', 'Sales Order', NULL),
(221, 6, 'transaction.type.expense', 'expense,credit_note_refund', NULL),
(222, 6, 'transaction.type.income', 'income,debit_note_refund', NULL),
(224, 6, 'default.currency', 'DZD', NULL),
(225, 7, 'invoice.title', 'Invoice', NULL),
(226, 7, 'default.locale', 'fr-FR', NULL),
(227, 7, 'default.account', '8', NULL),
(228, 7, 'default.income_category', '33', NULL),
(229, 7, 'default.expense_category', '35', NULL),
(230, 7, 'wizard.completed', '0', NULL),
(231, 7, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]', NULL),
(232, 7, 'company.name', 'company6', NULL),
(233, 7, 'company.email', 'elgadir.mdd@gmail.com', NULL),
(234, 7, 'contact.type.customer', 'customer,crm_contact,crm_company', NULL),
(235, 7, 'credit-debit-notes.credit_note.number_next', '2', NULL),
(236, 7, 'credit-debit-notes.credit_note.title', 'Credit Note', NULL),
(237, 7, 'default.currency', 'DZD', NULL),
(238, 7, 'default.use_gravatar', '0', NULL),
(239, 7, 'estimates.estimate.hide_amount', '0', NULL),
(240, 7, 'estimates.estimate.hide_item_description', '0', NULL),
(241, 7, 'estimates.estimate.hide_item_name', '0', NULL),
(242, 7, 'estimates.estimate.hide_price', '0', NULL),
(243, 7, 'estimates.estimate.hide_quantity', '0', NULL),
(244, 7, 'estimates.estimate.item_name', 'settings.invoice.item', NULL),
(245, 7, 'estimates.estimate.name', 'Devis', NULL),
(246, 7, 'estimates.estimate.number_next', '4', NULL),
(247, 7, 'estimates.estimate.number_prefix', 'DV-', NULL),
(248, 7, 'estimates.estimate.price_name', 'settings.invoice.price', NULL),
(249, 7, 'estimates.estimate.quantity_name', 'settings.invoice.quantity', NULL),
(250, 7, 'estimates.estimate.title', 'Devis', NULL),
(251, 7, 'inventory.barcode_print_template', 'single', NULL),
(252, 7, 'inventory.barcode_type', '0', NULL),
(253, 7, 'inventory.default_warehouse', '1', NULL),
(254, 7, 'inventory.reasons', '{\"0\":\"Stock on fire\",\"1\":\"Stolen Items\",\"2\":\"Damaged Items\",\"3\":\"Other\"}', NULL),
(255, 7, 'inventory.sku_transferred', '1', NULL),
(256, 7, 'inventory.transfer_order_next', '3', NULL),
(257, 7, 'inventory.units', '{\"0\":\"Box\",\"1\":\"Dozen\",\"2\":\"Grams\",\"3\":\"Kilograms\",\"4\":\"Meters\",\"5\":\"Units\",\"6\":\"Pairs\",\"7\":\"Pieces\",\"8\":\"Tablets\",\"9\":\"Liters\"}', NULL),
(258, 7, 'invoice.hide_amount', '0', NULL),
(259, 7, 'invoice.hide_item_description', '0', NULL),
(260, 7, 'invoice.hide_item_name', '0', NULL),
(261, 7, 'invoice.hide_price', '0', NULL),
(262, 7, 'invoice.hide_quantity', '0', NULL),
(263, 7, 'invoice.number_next', '10', NULL),
(264, 7, 'sales-purchase-orders.purchase_order.title', 'Purchase Order', NULL),
(265, 7, 'sales-purchase-orders.sales_order.number_next', '3', NULL),
(266, 7, 'sales-purchase-orders.sales_order.title', 'Sales Order', NULL),
(267, 7, 'transaction.type.expense', 'expense,credit_note_refund', NULL),
(268, 7, 'transaction.type.income', 'income,debit_note_refund', NULL),
(269, 3, 'default.currency', 'DZD', NULL),
(270, 4, 'default.currency', 'DZD', NULL),
(272, 1, 'invoice.number_next', '112', NULL),
(273, 1, 'inventory.negatif_stock', '1', NULL),
(274, 1, 'inventory.reorder_level_notification', '0', NULL),
(275, 1, 'inventory.track_inventory', '1', NULL),
(277, 1, 'default.currency', 'DZD', NULL),
(278, 1, 'bill.number_next', '2', NULL),
(279, 1, 'default.locale', 'fr-FR', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_taxes`
--

CREATE TABLE `kxm_taxes` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'normal',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_taxes`
--

INSERT INTO `kxm_taxes` (`id`, `company_id`, `name`, `rate`, `type`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'TVA', 19.0000, 'normal', 1, 'core::ui', 1, '2022-07-17 12:43:33', '2022-07-17 12:43:33', NULL),
(2, 1, 'TP', 7.1000, 'fixed', 1, 'core::ui', 1, '2022-08-01 12:26:18', '2022-08-01 12:26:18', NULL),
(3, 1, 'TF', 5.1000, 'normal', 1, 'core::ui', 1, '2022-08-01 12:26:42', '2022-08-01 12:26:42', NULL),
(4, 1, '10', 10.0000, 'normal', 1, 'inventory::import', 1, '2023-02-23 11:33:03', '2023-02-23 11:33:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_transactions`
--

CREATE TABLE `kxm_transactions` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `account_id` int NOT NULL,
  `document_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `category_id` int NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `payment_method` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_transfers`
--

CREATE TABLE `kxm_transfers` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `expense_transaction_id` int NOT NULL,
  `income_transaction_id` int NOT NULL,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_users`
--

CREATE TABLE `kxm_users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'en-GB',
  `landing_page` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'dashboard',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_users`
--

INSERT INTO `kxm_users` (`id`, `name`, `email`, `password`, `remember_token`, `last_logged_in_at`, `locale`, `landing_page`, `enabled`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Audilak admin', 'admin@email.com', '$2y$10$hHL9cD8D/DgKfaOOXBGcD.hRuYRhYPK8U99NsaTMbs2oRcauCr/Kq', 'sVMqjH2clj38sehLdgLuIWDCjOQUx5pTZOoK14WKDLBpvHP0Ubv3Uyup1Fcu', '2024-08-18 15:22:54', 'fr-FR', 'dashboard', 1, 'core::ui', NULL, '2022-06-23 10:19:17', '2024-08-18 15:22:54', NULL),
(2, 'Amine', 'amine@audilak.com', '$2y$10$eOhPv1N15HwYIBEb4zwqGexvd16u1yryf8VBstwh/n3ZFYRt0XJgq', NULL, '2023-01-16 15:22:45', 'en-GB', 'dashboard', 1, 'core::ui', '1', '2022-06-23 11:05:56', '2023-01-16 15:22:45', NULL),
(3, 'Audilak - Alger', 'alger@audilak.com', '$2y$10$BvjT6b4NzG96A4FVvWPSH.uj3OCC1RZvxxboA9HZCJxmpkfgfArN2', NULL, '2024-05-29 08:57:09', 'en-AU', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:25:53', '2024-05-29 08:57:09', NULL),
(4, '16-Alger_sec', 'sec_alger@audilak.com', '$2y$10$S99CcCSz8VD2UEpaw.Sv5uYW2u6XDYDZ3GUUPR1Kht4jnp0mdg.s.', NULL, '2022-12-27 18:59:01', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:27:11', '2022-12-27 18:59:01', NULL),
(5, 'Setif@audilak.com', 'setif@audilak.com', '$2y$10$1ZPHMdANFxVcG5G3TOp/Z.Rh4xs3optD3BWDstwwFkZATkh66w8Lq', NULL, '2023-01-16 14:08:22', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:27:41', '2023-01-16 14:08:22', NULL),
(6, '19-setif_sec@audilak.com', 'sec_setif@audilak.com', '$2y$10$MvJi0mgmnxwSQXXWil4Vkeie3hMqVs/7BylK4Zm3Ac6lfaURc6yTW', NULL, NULL, 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:28:18', '2022-09-15 18:09:50', NULL),
(7, 'Constantine@audilak.com', 'constantine@audilak.com', '$2y$10$qWem6CRPTXsr58TTgCr96OiOr/5/4Pi8wD.marrUcwLSRPuLXfvwm', NULL, '2022-12-18 19:33:59', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:28:59', '2022-12-18 19:33:59', NULL),
(8, '25-Sec_constantine', 'sec_constantine@audilak.com', '$2y$10$lZMZe5JzsC4jCNqJWuIdxedE8Z5fy52x50/coCUxihiIYqO..Qyvi', NULL, NULL, 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:29:36', '2022-09-18 10:37:45', NULL),
(9, 'Annaba@audilak.com', 'annaba@audilak.com', '$2y$10$tzjKTm3vpqJSmxhjyWDoAOzBsENyQNW6DG3p/F9JJwKTDENC.m5Mu', NULL, '2022-11-07 14:20:26', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:30:20', '2022-11-07 14:20:26', NULL),
(10, '23-annaba_sec', 'sec_annaba@audilak.com', '$2y$10$PbOZb8A4MKS1MlfyJSOD4.9g84cUZCI5U0fKeX3XeKF0u2KtMbBSO', NULL, NULL, 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:30:43', '2022-09-15 18:05:56', NULL),
(11, 'Biskra@audilak.com', 'biskra@audilak.com', '$2y$10$uXSQkHkgrQjbXzIjxyx/RuiXoAmVSVvPEvvu0R2BN1OHWD.TQv586', NULL, '2022-11-07 14:31:52', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:31:10', '2022-11-07 14:31:52', NULL),
(12, '07-Sec_biskra', 'sec_biskra@audilak.com', '$2y$10$u.nRcgT5qM1qtVeS2ZoBA.s2JuVqI69jC2sXSi570mFxg7fhOi7ii', NULL, NULL, 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:32:14', '2022-09-18 10:37:18', NULL),
(13, 'Msila@audilak.com', 'msila@audilak.com', '$2y$10$4BC6igrfGV9bop2AuwF/V.HrcTC23b/NG.W/UPFACTE/uunZdiVQi', 'F6JmY73aZ1aVmGvpcemF9NjVodNnPW2hpqN3gRawI17Mo3x09SDOUvFra7fz', '2023-02-22 08:33:16', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:32:55', '2023-02-22 08:33:16', NULL),
(14, '28-Sec_msila', 'sec_msila@audilak.com', '$2y$10$zdtUshyoJhBsIFaCtwzw7u0l5Z7MWQ.AlZYJf.wYnpvJ/UIN.4g5W', NULL, '2023-02-20 07:43:27', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:33:54', '2023-02-20 07:43:27', NULL),
(15, 'Bba@audilak.com', 'bba@audilak.com', '$2y$10$g2fsPwr0ui0KPCKDi3xFTOz1d1yqwRsWI/CEWPJU9uZszLG12acL.', NULL, '2023-02-23 09:01:46', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:34:55', '2023-02-23 09:01:46', NULL),
(16, '34-Sec_bba', 'sec_bba@audilak.com', '$2y$10$U5EYboLGaWbCXZG0zCEjauMkz8iRUf0P15lRDcMYnSp9wD9tGFQhi', NULL, NULL, 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:35:22', '2022-09-18 10:38:13', NULL),
(17, 'Batna@audilak.com', 'batna@audilak.com', '$2y$10$kN.SeilWOroNzsQiW3J.sOVF63RENJpHM5/1dStko83U1t6pFfjku', NULL, '2023-02-02 12:00:47', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:35:40', '2023-02-02 12:00:47', NULL),
(18, '05-Sec_batna', 'sec_batna@audilak.com', '$2y$10$p11xbegFVNKNQ3sHiGTDOe.9BHSgTO.uEIVBp.oNiy/AljI55y1Xm', NULL, '2022-10-10 09:32:30', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-12 16:36:10', '2022-10-10 09:32:30', NULL),
(19, 'Amir Bounah', 'amir.bounah@univ-constantine2.dz', '$2y$10$S22hsbTIxBepntnehnJ6revq4AX8VH7t8E1W.YuKv5kB229igAhlu', NULL, '2023-02-22 11:01:58', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-09-13 14:08:39', '2023-02-22 11:01:58', NULL),
(20, 'Younes', 'Medical_est@yahoo.com', '$2y$10$RuJnFXN/pJShwlOkoUbb2Oc/0vwOOaSWx6x0CrIJGoKP1xkk9LjXK', NULL, '2022-10-24 13:31:06', 'fr-FR', 'dashboard', 1, 'core::ui', '1', '2022-10-16 15:31:17', '2022-10-24 13:31:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_user_companies`
--

CREATE TABLE `kxm_user_companies` (
  `user_id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_user_companies`
--

INSERT INTO `kxm_user_companies` (`user_id`, `company_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(2, 1),
(3, 1),
(4, 1),
(17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_user_dashboards`
--

CREATE TABLE `kxm_user_dashboards` (
  `user_id` int UNSIGNED NOT NULL,
  `dashboard_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_user_dashboards`
--

INSERT INTO `kxm_user_dashboards` (`user_id`, `dashboard_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kxm_user_permissions`
--

CREATE TABLE `kxm_user_permissions` (
  `user_id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_user_roles`
--

CREATE TABLE `kxm_user_roles` (
  `user_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_user_roles`
--

INSERT INTO `kxm_user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users'),
(2, 2, 'users'),
(3, 2, 'users'),
(17, 2, 'users'),
(4, 3, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `kxm_user_warehouses`
--

CREATE TABLE `kxm_user_warehouses` (
  `user_id` int UNSIGNED NOT NULL,
  `warehouse_id` int UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kxm_widgets`
--

CREATE TABLE `kxm_widgets` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int NOT NULL,
  `dashboard_id` int NOT NULL,
  `class` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `settings` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kxm_widgets`
--

INSERT INTO `kxm_widgets` (`id`, `company_id`, `dashboard_id`, `class`, `name`, `sort`, `settings`, `created_from`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(2, 1, 1, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(3, 1, 1, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(4, 1, 1, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(5, 1, 1, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(6, 1, 1, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(7, 1, 1, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(8, 1, 1, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(9, 1, 1, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', 'core::ui', NULL, '2022-07-07 09:14:41', '2022-07-07 09:14:41', NULL),
(10, 1, 2, 'Modules\\Inventory\\Widgets\\TotalItem', 'Total Item', 1, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(11, 1, 2, 'Modules\\Inventory\\Widgets\\TotalItemIncome', 'Total Item Income', 2, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(12, 1, 2, 'Modules\\Inventory\\Widgets\\TotalItemExpense', 'Total Item Expense', 3, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(13, 1, 2, 'Modules\\Inventory\\Widgets\\TotalStockLineChart', 'Tracked Items Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::console', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(14, 1, 2, 'Modules\\Inventory\\Widgets\\WarehouseList', 'Warehouse List', 5, '{\"width\":\"col-md-6\"}', 'core::console', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(15, 1, 2, 'Modules\\Inventory\\Widgets\\TopSellerItems', 'Top Seller Items', 6, '{\"width\":\"col-md-6\"}', 'core::console', NULL, '2022-07-07 09:16:43', '2022-07-07 09:16:43', NULL),
(16, 1, 3, 'Modules\\Crm\\Widgets\\TotalDeals', 'Total Deals', 1, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(17, 1, 3, 'Modules\\Crm\\Widgets\\TotalCompanies', 'Total Companies', 2, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(18, 1, 3, 'Modules\\Crm\\Widgets\\TotalContacts', 'Total Contacts', 3, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(19, 1, 3, 'Modules\\Crm\\Widgets\\DealFlow', 'Deal Flow', 4, '{\"width\":\"col-md-12\"}', 'core::console', NULL, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(20, 1, 3, 'Modules\\Crm\\Widgets\\TodaySchedule', 'Today\'s Schedule', 5, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(21, 1, 3, 'Modules\\Crm\\Widgets\\UpcomingSchedule', 'Upcoming Schedule', 6, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(22, 1, 3, 'Modules\\Crm\\Widgets\\LatestDeals', 'Latest Deals', 7, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-07-07 09:16:53', '2022-07-07 09:16:53', NULL),
(23, 1, 4, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(24, 1, 4, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(25, 1, 4, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(26, 1, 4, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(27, 1, 4, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(28, 1, 4, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(29, 1, 4, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(30, 1, 4, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(31, 1, 4, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-07 09:21:36', '2022-07-07 09:21:36', NULL),
(32, 1, 5, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-08 09:01:58', '2022-07-08 09:01:58', NULL),
(33, 1, 5, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-08 09:01:58', '2022-07-08 09:01:58', NULL),
(34, 1, 5, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-08 09:01:58', '2022-07-08 09:01:58', NULL),
(35, 1, 5, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2022-07-08 09:01:58', '2022-07-08 09:01:58', NULL),
(36, 1, 5, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-07-08 09:01:58', '2022-07-08 09:01:58', NULL),
(37, 1, 5, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-07-08 09:01:58', '2022-07-08 09:01:58', NULL),
(38, 1, 5, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-08 09:01:58', '2022-07-08 09:01:58', NULL),
(39, 1, 5, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-08 09:01:59', '2022-07-08 09:01:59', NULL),
(40, 1, 5, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-07-08 09:01:59', '2022-07-08 09:01:59', NULL),
(41, 2, 6, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(42, 2, 6, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(43, 2, 6, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(44, 2, 6, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(45, 2, 6, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(46, 2, 6, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(47, 2, 6, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(48, 2, 6, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(49, 2, 6, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-10 12:38:14', '2022-09-10 12:38:14', NULL),
(50, 3, 7, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(51, 3, 7, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(52, 3, 7, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(53, 3, 7, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(54, 3, 7, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(55, 3, 7, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(56, 3, 7, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(57, 3, 7, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(58, 3, 7, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:02:15', '2022-09-12 10:02:15', NULL),
(59, 4, 8, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(60, 4, 8, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(61, 4, 8, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(62, 4, 8, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(63, 4, 8, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(64, 4, 8, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(65, 4, 8, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(66, 4, 8, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(67, 4, 8, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 10:28:01', '2022-09-12 10:28:01', NULL),
(68, 4, 9, 'Modules\\Crm\\Widgets\\TotalDeals', 'Total Deals', 1, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(69, 4, 9, 'Modules\\Crm\\Widgets\\TotalCompanies', 'Total Companies', 2, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(70, 4, 9, 'Modules\\Crm\\Widgets\\TotalContacts', 'Total Contacts', 3, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(71, 4, 9, 'Modules\\Crm\\Widgets\\DealFlow', 'Deal Flow', 4, '{\"width\":\"col-md-12\"}', 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(72, 4, 9, 'Modules\\Crm\\Widgets\\TodaySchedule', 'Today\'s Schedule', 5, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(73, 4, 9, 'Modules\\Crm\\Widgets\\UpcomingSchedule', 'Upcoming Schedule', 6, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(74, 4, 9, 'Modules\\Crm\\Widgets\\LatestDeals', 'Latest Deals', 7, '{\"width\":\"col-md-4\"}', 'core::console', NULL, '2022-09-12 10:31:54', '2022-09-12 10:31:54', NULL),
(75, 6, 10, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(76, 6, 10, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(77, 6, 10, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(78, 6, 10, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(79, 6, 10, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(80, 6, 10, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(81, 6, 10, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(82, 6, 10, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(83, 6, 10, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-12 13:28:25', '2022-09-12 13:28:25', NULL),
(84, 7, 11, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(85, 7, 11, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(86, 7, 11, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(87, 7, 11, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', 'core::ui', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(88, 7, 11, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(89, 7, 11, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', 'core::ui', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(90, 7, 11, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-13 09:53:26', '2022-09-13 09:53:26', NULL),
(91, 7, 11, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-13 09:53:27', '2022-09-13 09:53:27', NULL),
(92, 7, 11, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', 'core::ui', 1, '2022-09-13 09:53:27', '2022-09-13 09:53:27', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kxm_accounts`
--
ALTER TABLE `kxm_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_accounts_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_bills`
--
ALTER TABLE `kxm_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `kxm_bills_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_bill_histories`
--
ALTER TABLE `kxm_bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_bill_histories_company_id_index` (`company_id`),
  ADD KEY `kxm_bill_histories_bill_id_index` (`bill_id`);

--
-- Indexes for table `kxm_bill_items`
--
ALTER TABLE `kxm_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_bill_items_company_id_index` (`company_id`),
  ADD KEY `kxm_bill_items_bill_id_index` (`bill_id`);

--
-- Indexes for table `kxm_bill_item_taxes`
--
ALTER TABLE `kxm_bill_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_bill_item_taxes_company_id_index` (`company_id`),
  ADD KEY `kxm_bill_item_taxes_bill_id_index` (`bill_id`);

--
-- Indexes for table `kxm_bill_totals`
--
ALTER TABLE `kxm_bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_bill_totals_company_id_index` (`company_id`),
  ADD KEY `kxm_bill_totals_bill_id_index` (`bill_id`);

--
-- Indexes for table `kxm_categories`
--
ALTER TABLE `kxm_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_categories_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_companies`
--
ALTER TABLE `kxm_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_composite_items_composite_items`
--
ALTER TABLE `kxm_composite_items_composite_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_composite_items_composite_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_composite_items_items`
--
ALTER TABLE `kxm_composite_items_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_composite_items_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_contacts`
--
ALTER TABLE `kxm_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_contacts_company_id_type_email_deleted_at_unique` (`company_id`,`type`,`email`,`deleted_at`),
  ADD KEY `kxm_contacts_company_id_type_index` (`company_id`,`type`);

--
-- Indexes for table `kxm_credits_transactions`
--
ALTER TABLE `kxm_credits_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_credits_transactions_company_id_type_index` (`company_id`,`type`),
  ADD KEY `kxm_credits_transactions_contact_id_index` (`contact_id`),
  ADD KEY `kxm_credits_transactions_document_id_index` (`document_id`),
  ADD KEY `kxm_credits_transactions_category_id_index` (`category_id`);

--
-- Indexes for table `kxm_credit_debit_notes_credits_transactions`
--
ALTER TABLE `kxm_credit_debit_notes_credits_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_cdn_credits_transactions_company_id_type_index` (`company_id`,`type`),
  ADD KEY `kxm_credit_debit_notes_credits_transactions_contact_id_index` (`contact_id`),
  ADD KEY `kxm_credit_debit_notes_credits_transactions_document_id_index` (`document_id`),
  ADD KEY `kxm_credit_debit_notes_credits_transactions_category_id_index` (`category_id`);

--
-- Indexes for table `kxm_credit_debit_notes_credit_note_details`
--
ALTER TABLE `kxm_credit_debit_notes_credit_note_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_cdn_credit_note_details_unique` (`company_id`,`document_id`,`invoice_id`,`deleted_at`),
  ADD KEY `kxm_credit_debit_notes_credit_note_details_company_id_index` (`company_id`),
  ADD KEY `kxm_credit_debit_notes_credit_note_details_document_id_index` (`document_id`),
  ADD KEY `kxm_credit_debit_notes_credit_note_details_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `kxm_credit_debit_notes_debit_note_details`
--
ALTER TABLE `kxm_credit_debit_notes_debit_note_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_cdn_debit_note_details_unique` (`company_id`,`document_id`,`bill_id`,`deleted_at`),
  ADD KEY `kxm_credit_debit_notes_debit_note_details_company_id_index` (`company_id`),
  ADD KEY `kxm_credit_debit_notes_debit_note_details_document_id_index` (`document_id`),
  ADD KEY `kxm_credit_debit_notes_debit_note_details_bill_id_index` (`bill_id`);

--
-- Indexes for table `kxm_credit_notes`
--
ALTER TABLE `kxm_credit_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `credit_notes_company_number_deleted_unique` (`company_id`,`credit_note_number`,`deleted_at`),
  ADD KEY `kxm_credit_notes_company_id_index` (`company_id`),
  ADD KEY `kxm_credit_notes_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `kxm_credit_note_histories`
--
ALTER TABLE `kxm_credit_note_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_credit_note_histories_company_id_index` (`company_id`),
  ADD KEY `kxm_credit_note_histories_credit_note_id_index` (`credit_note_id`);

--
-- Indexes for table `kxm_credit_note_items`
--
ALTER TABLE `kxm_credit_note_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_credit_note_items_company_id_index` (`company_id`),
  ADD KEY `kxm_credit_note_items_credit_note_id_index` (`credit_note_id`);

--
-- Indexes for table `kxm_credit_note_item_taxes`
--
ALTER TABLE `kxm_credit_note_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_credit_note_item_taxes_company_id_index` (`company_id`),
  ADD KEY `kxm_credit_note_item_taxes_credit_note_id_index` (`credit_note_id`);

--
-- Indexes for table `kxm_credit_note_totals`
--
ALTER TABLE `kxm_credit_note_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_credit_note_totals_company_id_index` (`company_id`),
  ADD KEY `kxm_credit_note_totals_credit_note_id_index` (`credit_note_id`);

--
-- Indexes for table `kxm_crm_companies`
--
ALTER TABLE `kxm_crm_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_companies_company_id_contact_id_created_by_index` (`company_id`,`contact_id`,`created_by`);

--
-- Indexes for table `kxm_crm_company_contacts`
--
ALTER TABLE `kxm_crm_company_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_company_contacts_company_id_created_by_index` (`company_id`,`created_by`);

--
-- Indexes for table `kxm_crm_contacts`
--
ALTER TABLE `kxm_crm_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_contacts_company_id_contact_id_created_by_index` (`company_id`,`contact_id`,`created_by`);

--
-- Indexes for table `kxm_crm_deals`
--
ALTER TABLE `kxm_crm_deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_deals_company_id_created_by_name_amount_index` (`company_id`,`created_by`,`name`,`amount`);

--
-- Indexes for table `kxm_crm_deal_activities`
--
ALTER TABLE `kxm_crm_deal_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_crm_deal_activity_types`
--
ALTER TABLE `kxm_crm_deal_activity_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_deal_activity_types_company_id_created_by_index` (`company_id`,`created_by`);

--
-- Indexes for table `kxm_crm_deal_agents`
--
ALTER TABLE `kxm_crm_deal_agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_deal_agents_company_id_deal_id_index` (`company_id`,`deal_id`);

--
-- Indexes for table `kxm_crm_deal_competitors`
--
ALTER TABLE `kxm_crm_deal_competitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_crm_deal_emails`
--
ALTER TABLE `kxm_crm_deal_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_crm_deal_notes`
--
ALTER TABLE `kxm_crm_deal_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_crm_deal_pipelines`
--
ALTER TABLE `kxm_crm_deal_pipelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_deal_pipelines_company_id_created_by_name_index` (`company_id`,`created_by`,`name`);

--
-- Indexes for table `kxm_crm_deal_pipeline_stages`
--
ALTER TABLE `kxm_crm_deal_pipeline_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_crm_emails`
--
ALTER TABLE `kxm_crm_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_emails_emailable_type_emailable_id_index` (`emailable_type`,`emailable_id`),
  ADD KEY `kxm_crm_emails_company_id_created_by_from_to_index` (`company_id`,`created_by`,`from`,`to`);

--
-- Indexes for table `kxm_crm_logs`
--
ALTER TABLE `kxm_crm_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_logs_logable_type_logable_id_index` (`logable_type`,`logable_id`),
  ADD KEY `kxm_crm_logs_company_id_created_by_date_type_index` (`company_id`,`created_by`,`date`,`log_type`);

--
-- Indexes for table `kxm_crm_notes`
--
ALTER TABLE `kxm_crm_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_notes_noteable_type_noteable_id_index` (`noteable_type`,`noteable_id`),
  ADD KEY `kxm_crm_notes_company_id_created_by_index` (`company_id`,`created_by`);

--
-- Indexes for table `kxm_crm_schedules`
--
ALTER TABLE `kxm_crm_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_schedules_scheduleable_type_scheduleable_id_index` (`scheduleable_type`,`scheduleable_id`),
  ADD KEY `kxm_crm_schedules_company_id_created_by_type_name_index` (`company_id`,`created_by`,`schedule_type`,`name`);

--
-- Indexes for table `kxm_crm_tasks`
--
ALTER TABLE `kxm_crm_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_crm_tasks_taskable_type_taskable_id_index` (`taskable_type`,`taskable_id`),
  ADD KEY `kxm_crm_tasks_company_id_created_by_started_at_name_index` (`company_id`,`created_by`,`started_at`,`name`);

--
-- Indexes for table `kxm_currencies`
--
ALTER TABLE `kxm_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `kxm_currencies_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_custom_fields_fields`
--
ALTER TABLE `kxm_custom_fields_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_custom_fields_fields_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_custom_fields_field_locations`
--
ALTER TABLE `kxm_custom_fields_field_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_custom_fields_field_locations_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_custom_fields_field_type_options`
--
ALTER TABLE `kxm_custom_fields_field_type_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_custom_fields_field_type_options_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_custom_fields_field_values`
--
ALTER TABLE `kxm_custom_fields_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_custom_fields_field_values_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `kxm_custom_fields_field_values_company_id_index` (`company_id`),
  ADD KEY `kxm_custom_fields_field_values_field_id_index` (`field_id`);

--
-- Indexes for table `kxm_custom_fields_locations`
--
ALTER TABLE `kxm_custom_fields_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_custom_fields_locations_name_index` (`name`);

--
-- Indexes for table `kxm_custom_fields_types`
--
ALTER TABLE `kxm_custom_fields_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_custom_fields_types_name_index` (`name`);

--
-- Indexes for table `kxm_dashboards`
--
ALTER TABLE `kxm_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_dashboards_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_debit_notes`
--
ALTER TABLE `kxm_debit_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `debit_notes_company_number_deleted_unique` (`company_id`,`debit_note_number`,`deleted_at`),
  ADD KEY `kxm_debit_notes_company_id_index` (`company_id`),
  ADD KEY `kxm_debit_notes_bill_id_index` (`bill_id`);

--
-- Indexes for table `kxm_debit_note_histories`
--
ALTER TABLE `kxm_debit_note_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_debit_note_histories_company_id_index` (`company_id`),
  ADD KEY `kxm_debit_note_histories_debit_note_id_index` (`debit_note_id`);

--
-- Indexes for table `kxm_debit_note_items`
--
ALTER TABLE `kxm_debit_note_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_debit_note_items_company_id_index` (`company_id`),
  ADD KEY `kxm_debit_note_items_debit_note_id_index` (`debit_note_id`);

--
-- Indexes for table `kxm_debit_note_item_taxes`
--
ALTER TABLE `kxm_debit_note_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_debit_note_item_taxes_company_id_index` (`company_id`),
  ADD KEY `kxm_debit_note_item_taxes_debit_note_id_index` (`debit_note_id`);

--
-- Indexes for table `kxm_debit_note_totals`
--
ALTER TABLE `kxm_debit_note_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_debit_note_totals_company_id_index` (`company_id`),
  ADD KEY `kxm_debit_note_totals_debit_note_id_index` (`debit_note_id`);

--
-- Indexes for table `kxm_documents`
--
ALTER TABLE `kxm_documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_documents_document_number_deleted_at_company_id_type_unique` (`document_number`,`deleted_at`,`company_id`,`type`),
  ADD KEY `kxm_documents_company_id_index` (`company_id`),
  ADD KEY `kxm_documents_type_index` (`type`);

--
-- Indexes for table `kxm_document_histories`
--
ALTER TABLE `kxm_document_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_document_histories_company_id_index` (`company_id`),
  ADD KEY `kxm_document_histories_type_index` (`type`),
  ADD KEY `kxm_document_histories_document_id_index` (`document_id`);

--
-- Indexes for table `kxm_document_items`
--
ALTER TABLE `kxm_document_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_document_items_company_id_index` (`company_id`),
  ADD KEY `kxm_document_items_type_index` (`type`),
  ADD KEY `kxm_document_items_document_id_index` (`document_id`);

--
-- Indexes for table `kxm_document_item_taxes`
--
ALTER TABLE `kxm_document_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_document_item_taxes_company_id_index` (`company_id`),
  ADD KEY `kxm_document_item_taxes_type_index` (`type`),
  ADD KEY `kxm_document_item_taxes_document_id_index` (`document_id`);

--
-- Indexes for table `kxm_document_totals`
--
ALTER TABLE `kxm_document_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_document_totals_company_id_index` (`company_id`),
  ADD KEY `kxm_document_totals_type_index` (`type`),
  ADD KEY `kxm_document_totals_document_id_index` (`document_id`);

--
-- Indexes for table `kxm_double_entry_accounts`
--
ALTER TABLE `kxm_double_entry_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_double_entry_accounts_company_id_index` (`company_id`),
  ADD KEY `kxm_double_entry_accounts_type_id_index` (`type_id`),
  ADD KEY `kxm_double_entry_accounts_account_id_foreign` (`account_id`);

--
-- Indexes for table `kxm_double_entry_account_bank`
--
ALTER TABLE `kxm_double_entry_account_bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_double_entry_account_bank_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_double_entry_account_item`
--
ALTER TABLE `kxm_double_entry_account_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_double_entry_account_item_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_double_entry_account_tax`
--
ALTER TABLE `kxm_double_entry_account_tax`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_double_entry_account_tax_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_double_entry_classes`
--
ALTER TABLE `kxm_double_entry_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_double_entry_journals`
--
ALTER TABLE `kxm_double_entry_journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_double_entry_journals_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_double_entry_ledger`
--
ALTER TABLE `kxm_double_entry_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_double_entry_ledger_ledgerable_type_ledgerable_id_index` (`ledgerable_type`,`ledgerable_id`),
  ADD KEY `kxm_double_entry_ledger_company_id_index` (`company_id`),
  ADD KEY `kxm_double_entry_ledger_account_id_index` (`account_id`);

--
-- Indexes for table `kxm_double_entry_types`
--
ALTER TABLE `kxm_double_entry_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_double_entry_types_class_id_index` (`class_id`);

--
-- Indexes for table `kxm_email_templates`
--
ALTER TABLE `kxm_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_email_templates_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `kxm_email_templates_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_estimates`
--
ALTER TABLE `kxm_estimates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_estimates_company_id_estimate_number_deleted_at_unique` (`company_id`,`estimate_number`,`deleted_at`),
  ADD KEY `kxm_estimates_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_estimates_documents`
--
ALTER TABLE `kxm_estimates_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_estimates_documents_company_id_item_id_item_type_index` (`company_id`,`item_id`,`item_type`),
  ADD KEY `kxm_estimates_documents_company_id_document_id_item_type_index` (`company_id`,`document_id`,`item_type`);

--
-- Indexes for table `kxm_estimates_extra_parameters`
--
ALTER TABLE `kxm_estimates_extra_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_estimate_extra_parameters_document_id_index` (`document_id`);

--
-- Indexes for table `kxm_estimate_histories`
--
ALTER TABLE `kxm_estimate_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_estimate_histories_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_estimate_invoice_v20`
--
ALTER TABLE `kxm_estimate_invoice_v20`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_estimate_invoice_estimate_id_invoice_id_deleted_at_unique` (`estimate_id`,`invoice_id`,`deleted_at`),
  ADD KEY `kxm_estimate_invoice_estimate_id_index` (`estimate_id`);

--
-- Indexes for table `kxm_estimate_items`
--
ALTER TABLE `kxm_estimate_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_estimate_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_estimate_item_taxes`
--
ALTER TABLE `kxm_estimate_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_estimate_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_estimate_totals`
--
ALTER TABLE `kxm_estimate_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_estimate_totals_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_failed_jobs`
--
ALTER TABLE `kxm_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kxm_firewall_ips`
--
ALTER TABLE `kxm_firewall_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_firewall_ips_ip_deleted_at_unique` (`ip`,`deleted_at`),
  ADD KEY `kxm_firewall_ips_ip_index` (`ip`);

--
-- Indexes for table `kxm_firewall_logs`
--
ALTER TABLE `kxm_firewall_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_firewall_logs_ip_index` (`ip`);

--
-- Indexes for table `kxm_inventory_adjustments`
--
ALTER TABLE `kxm_inventory_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_adjustments_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_adjustment_items`
--
ALTER TABLE `kxm_inventory_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_adjustment_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_appointment`
--
ALTER TABLE `kxm_inventory_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_inventory_bill_items`
--
ALTER TABLE `kxm_inventory_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_bill_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_document_items`
--
ALTER TABLE `kxm_inventory_document_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_document_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_histories`
--
ALTER TABLE `kxm_inventory_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_histories_type_type_type_id_index` (`type_type`,`type_id`),
  ADD KEY `kxm_inventory_histories_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_invoice_items`
--
ALTER TABLE `kxm_inventory_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_invoice_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_items`
--
ALTER TABLE `kxm_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_item_groups`
--
ALTER TABLE `kxm_inventory_item_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_item_groups_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_item_group_items`
--
ALTER TABLE `kxm_inventory_item_group_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_item_group_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_item_group_variants`
--
ALTER TABLE `kxm_inventory_item_group_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_item_group_options_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_item_group_variant_items`
--
ALTER TABLE `kxm_inventory_item_group_variant_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_item_group_option_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_item_group_variant_values`
--
ALTER TABLE `kxm_inventory_item_group_variant_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_item_group_option_values_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_manufacturers`
--
ALTER TABLE `kxm_inventory_manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_manufacturers_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_manufacturer_items`
--
ALTER TABLE `kxm_inventory_manufacturer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_manufacturer_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_manufacturer_vendors`
--
ALTER TABLE `kxm_inventory_manufacturer_vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_manufacturer_vendors_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_price_type`
--
ALTER TABLE `kxm_inventory_price_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_inventory_transfer_orders`
--
ALTER TABLE `kxm_inventory_transfer_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_transfer_orders_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_transfer_order_histories`
--
ALTER TABLE `kxm_inventory_transfer_order_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_transfer_order_histories_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_transfer_order_items`
--
ALTER TABLE `kxm_inventory_transfer_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_transfer_order_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_user_warehouses`
--
ALTER TABLE `kxm_inventory_user_warehouses`
  ADD PRIMARY KEY (`user_id`,`warehouse_id`);

--
-- Indexes for table `kxm_inventory_variants`
--
ALTER TABLE `kxm_inventory_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_options_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_variant_values`
--
ALTER TABLE `kxm_inventory_variant_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_option_values_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_warehouses`
--
ALTER TABLE `kxm_inventory_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_inventory_warehouses_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `kxm_inventory_warehouses_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_inventory_warehouse_items`
--
ALTER TABLE `kxm_inventory_warehouse_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_inventory_warehouse_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_invoices`
--
ALTER TABLE `kxm_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `kxm_invoices_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_invoice_histories`
--
ALTER TABLE `kxm_invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_invoice_histories_company_id_index` (`company_id`),
  ADD KEY `kxm_invoice_histories_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `kxm_invoice_items`
--
ALTER TABLE `kxm_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_invoice_items_company_id_index` (`company_id`),
  ADD KEY `kxm_invoice_items_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `kxm_invoice_item_taxes`
--
ALTER TABLE `kxm_invoice_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_invoice_item_taxes_company_id_index` (`company_id`),
  ADD KEY `kxm_invoice_item_taxes_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `kxm_invoice_totals`
--
ALTER TABLE `kxm_invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_invoice_totals_company_id_index` (`company_id`),
  ADD KEY `kxm_invoice_totals_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `kxm_items`
--
ALTER TABLE `kxm_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_items_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_item_serial_numbers`
--
ALTER TABLE `kxm_item_serial_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_item_taxes`
--
ALTER TABLE `kxm_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_item_taxes_company_id_item_id_index` (`company_id`,`item_id`);

--
-- Indexes for table `kxm_jobs`
--
ALTER TABLE `kxm_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `kxm_media`
--
ALTER TABLE `kxm_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_media_disk_directory_filename_extension_unique` (`disk`,`directory`,`filename`,`extension`),
  ADD UNIQUE KEY `kxm_media_disk_directory_filename_extension_deleted_at_unique` (`disk`,`directory`,`filename`,`extension`,`deleted_at`),
  ADD KEY `kxm_media_aggregate_type_index` (`aggregate_type`),
  ADD KEY `kxm_media_disk_directory_index` (`disk`,`directory`),
  ADD KEY `original_media_id` (`original_media_id`),
  ADD KEY `kxm_media_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_mediables`
--
ALTER TABLE `kxm_mediables`
  ADD PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  ADD KEY `kxm_mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  ADD KEY `kxm_mediables_tag_index` (`tag`),
  ADD KEY `kxm_mediables_order_index` (`order`),
  ADD KEY `kxm_mediables_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_migrations`
--
ALTER TABLE `kxm_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kxm_modules`
--
ALTER TABLE `kxm_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `kxm_modules_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_module_histories`
--
ALTER TABLE `kxm_module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `kxm_notifications`
--
ALTER TABLE `kxm_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `kxm_password_resets`
--
ALTER TABLE `kxm_password_resets`
  ADD KEY `kxm_password_resets_email_index` (`email`);

--
-- Indexes for table `kxm_permissions`
--
ALTER TABLE `kxm_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_permissions_name_unique` (`name`);

--
-- Indexes for table `kxm_reconciliations`
--
ALTER TABLE `kxm_reconciliations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_reconciliations_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_recurring`
--
ALTER TABLE `kxm_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_recurring_recurable_type_recurable_id_index` (`recurable_type`,`recurable_id`),
  ADD KEY `kxm_recurring_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_reports`
--
ALTER TABLE `kxm_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_reports_company_id_index` (`company_id`),
  ADD KEY `kxm_reports_class_index` (`class`);

--
-- Indexes for table `kxm_roles`
--
ALTER TABLE `kxm_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_roles_name_unique` (`name`);

--
-- Indexes for table `kxm_role_permissions`
--
ALTER TABLE `kxm_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `kxm_role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `kxm_sales_purchase_orders_documents`
--
ALTER TABLE `kxm_sales_purchase_orders_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_sales_purchase_orders_documents_item_id_item_type_index` (`item_id`,`item_type`),
  ADD KEY `kxm_sales_purchase_orders_documents_document_id_item_type_index` (`document_id`,`item_type`);

--
-- Indexes for table `kxm_sales_purchase_orders_purchase_extra_parameters`
--
ALTER TABLE `kxm_sales_purchase_orders_purchase_extra_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spo_pep_document_id_index` (`document_id`);

--
-- Indexes for table `kxm_sales_purchase_orders_sales_extra_parameters`
--
ALTER TABLE `kxm_sales_purchase_orders_sales_extra_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spo_sep_document_id_index` (`document_id`);

--
-- Indexes for table `kxm_sessions`
--
ALTER TABLE `kxm_sessions`
  ADD UNIQUE KEY `kxm_sessions_id_unique` (`id`);

--
-- Indexes for table `kxm_settings`
--
ALTER TABLE `kxm_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `kxm_settings_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_taxes`
--
ALTER TABLE `kxm_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_transactions`
--
ALTER TABLE `kxm_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_transactions_company_id_type_index` (`company_id`,`type`),
  ADD KEY `kxm_transactions_account_id_index` (`account_id`),
  ADD KEY `kxm_transactions_category_id_index` (`category_id`),
  ADD KEY `kxm_transactions_contact_id_index` (`contact_id`),
  ADD KEY `kxm_transactions_document_id_index` (`document_id`);

--
-- Indexes for table `kxm_transfers`
--
ALTER TABLE `kxm_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_transfers_company_id_index` (`company_id`);

--
-- Indexes for table `kxm_users`
--
ALTER TABLE `kxm_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kxm_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `kxm_user_companies`
--
ALTER TABLE `kxm_user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`);

--
-- Indexes for table `kxm_user_dashboards`
--
ALTER TABLE `kxm_user_dashboards`
  ADD PRIMARY KEY (`user_id`,`dashboard_id`);

--
-- Indexes for table `kxm_user_permissions`
--
ALTER TABLE `kxm_user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `kxm_user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `kxm_user_roles`
--
ALTER TABLE `kxm_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `kxm_user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `kxm_widgets`
--
ALTER TABLE `kxm_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kxm_widgets_company_id_dashboard_id_index` (`company_id`,`dashboard_id`),
  ADD KEY `kxm_widgets_class_index` (`class`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kxm_accounts`
--
ALTER TABLE `kxm_accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kxm_bills`
--
ALTER TABLE `kxm_bills`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_bill_histories`
--
ALTER TABLE `kxm_bill_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_bill_items`
--
ALTER TABLE `kxm_bill_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_bill_item_taxes`
--
ALTER TABLE `kxm_bill_item_taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_bill_totals`
--
ALTER TABLE `kxm_bill_totals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_categories`
--
ALTER TABLE `kxm_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `kxm_companies`
--
ALTER TABLE `kxm_companies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kxm_composite_items_composite_items`
--
ALTER TABLE `kxm_composite_items_composite_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_composite_items_items`
--
ALTER TABLE `kxm_composite_items_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_contacts`
--
ALTER TABLE `kxm_contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kxm_credits_transactions`
--
ALTER TABLE `kxm_credits_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_credit_debit_notes_credits_transactions`
--
ALTER TABLE `kxm_credit_debit_notes_credits_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_credit_debit_notes_credit_note_details`
--
ALTER TABLE `kxm_credit_debit_notes_credit_note_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_credit_debit_notes_debit_note_details`
--
ALTER TABLE `kxm_credit_debit_notes_debit_note_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_credit_notes`
--
ALTER TABLE `kxm_credit_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_credit_note_histories`
--
ALTER TABLE `kxm_credit_note_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_credit_note_items`
--
ALTER TABLE `kxm_credit_note_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_credit_note_item_taxes`
--
ALTER TABLE `kxm_credit_note_item_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_credit_note_totals`
--
ALTER TABLE `kxm_credit_note_totals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_companies`
--
ALTER TABLE `kxm_crm_companies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_company_contacts`
--
ALTER TABLE `kxm_crm_company_contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_contacts`
--
ALTER TABLE `kxm_crm_contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_deals`
--
ALTER TABLE `kxm_crm_deals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_deal_activities`
--
ALTER TABLE `kxm_crm_deal_activities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_deal_activity_types`
--
ALTER TABLE `kxm_crm_deal_activity_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_deal_agents`
--
ALTER TABLE `kxm_crm_deal_agents`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_deal_competitors`
--
ALTER TABLE `kxm_crm_deal_competitors`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_deal_emails`
--
ALTER TABLE `kxm_crm_deal_emails`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_deal_notes`
--
ALTER TABLE `kxm_crm_deal_notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_deal_pipelines`
--
ALTER TABLE `kxm_crm_deal_pipelines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kxm_crm_deal_pipeline_stages`
--
ALTER TABLE `kxm_crm_deal_pipeline_stages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kxm_crm_emails`
--
ALTER TABLE `kxm_crm_emails`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_logs`
--
ALTER TABLE `kxm_crm_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_notes`
--
ALTER TABLE `kxm_crm_notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_schedules`
--
ALTER TABLE `kxm_crm_schedules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_crm_tasks`
--
ALTER TABLE `kxm_crm_tasks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_currencies`
--
ALTER TABLE `kxm_currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `kxm_custom_fields_fields`
--
ALTER TABLE `kxm_custom_fields_fields`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_custom_fields_field_locations`
--
ALTER TABLE `kxm_custom_fields_field_locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_custom_fields_field_type_options`
--
ALTER TABLE `kxm_custom_fields_field_type_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_custom_fields_field_values`
--
ALTER TABLE `kxm_custom_fields_field_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_custom_fields_locations`
--
ALTER TABLE `kxm_custom_fields_locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kxm_custom_fields_types`
--
ALTER TABLE `kxm_custom_fields_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kxm_dashboards`
--
ALTER TABLE `kxm_dashboards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kxm_debit_notes`
--
ALTER TABLE `kxm_debit_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_debit_note_histories`
--
ALTER TABLE `kxm_debit_note_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_debit_note_items`
--
ALTER TABLE `kxm_debit_note_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_debit_note_item_taxes`
--
ALTER TABLE `kxm_debit_note_item_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_debit_note_totals`
--
ALTER TABLE `kxm_debit_note_totals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_documents`
--
ALTER TABLE `kxm_documents`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `kxm_document_histories`
--
ALTER TABLE `kxm_document_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `kxm_document_items`
--
ALTER TABLE `kxm_document_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `kxm_document_item_taxes`
--
ALTER TABLE `kxm_document_item_taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_document_totals`
--
ALTER TABLE `kxm_document_totals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `kxm_double_entry_accounts`
--
ALTER TABLE `kxm_double_entry_accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `kxm_double_entry_account_bank`
--
ALTER TABLE `kxm_double_entry_account_bank`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_double_entry_account_item`
--
ALTER TABLE `kxm_double_entry_account_item`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_double_entry_account_tax`
--
ALTER TABLE `kxm_double_entry_account_tax`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_double_entry_classes`
--
ALTER TABLE `kxm_double_entry_classes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kxm_double_entry_journals`
--
ALTER TABLE `kxm_double_entry_journals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_double_entry_ledger`
--
ALTER TABLE `kxm_double_entry_ledger`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_double_entry_types`
--
ALTER TABLE `kxm_double_entry_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kxm_email_templates`
--
ALTER TABLE `kxm_email_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `kxm_estimates`
--
ALTER TABLE `kxm_estimates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_estimates_documents`
--
ALTER TABLE `kxm_estimates_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kxm_estimates_extra_parameters`
--
ALTER TABLE `kxm_estimates_extra_parameters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kxm_estimate_histories`
--
ALTER TABLE `kxm_estimate_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_estimate_invoice_v20`
--
ALTER TABLE `kxm_estimate_invoice_v20`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_estimate_items`
--
ALTER TABLE `kxm_estimate_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_estimate_item_taxes`
--
ALTER TABLE `kxm_estimate_item_taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_estimate_totals`
--
ALTER TABLE `kxm_estimate_totals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_failed_jobs`
--
ALTER TABLE `kxm_failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_firewall_ips`
--
ALTER TABLE `kxm_firewall_ips`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_firewall_logs`
--
ALTER TABLE `kxm_firewall_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `kxm_inventory_adjustments`
--
ALTER TABLE `kxm_inventory_adjustments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_adjustment_items`
--
ALTER TABLE `kxm_inventory_adjustment_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_appointment`
--
ALTER TABLE `kxm_inventory_appointment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_bill_items`
--
ALTER TABLE `kxm_inventory_bill_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_document_items`
--
ALTER TABLE `kxm_inventory_document_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kxm_inventory_histories`
--
ALTER TABLE `kxm_inventory_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kxm_inventory_invoice_items`
--
ALTER TABLE `kxm_inventory_invoice_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_items`
--
ALTER TABLE `kxm_inventory_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kxm_inventory_item_groups`
--
ALTER TABLE `kxm_inventory_item_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_item_group_items`
--
ALTER TABLE `kxm_inventory_item_group_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_item_group_variants`
--
ALTER TABLE `kxm_inventory_item_group_variants`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_item_group_variant_items`
--
ALTER TABLE `kxm_inventory_item_group_variant_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_item_group_variant_values`
--
ALTER TABLE `kxm_inventory_item_group_variant_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_manufacturers`
--
ALTER TABLE `kxm_inventory_manufacturers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_manufacturer_items`
--
ALTER TABLE `kxm_inventory_manufacturer_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_manufacturer_vendors`
--
ALTER TABLE `kxm_inventory_manufacturer_vendors`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_price_type`
--
ALTER TABLE `kxm_inventory_price_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_transfer_orders`
--
ALTER TABLE `kxm_inventory_transfer_orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_transfer_order_histories`
--
ALTER TABLE `kxm_inventory_transfer_order_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_transfer_order_items`
--
ALTER TABLE `kxm_inventory_transfer_order_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_variants`
--
ALTER TABLE `kxm_inventory_variants`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_variant_values`
--
ALTER TABLE `kxm_inventory_variant_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_inventory_warehouses`
--
ALTER TABLE `kxm_inventory_warehouses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kxm_inventory_warehouse_items`
--
ALTER TABLE `kxm_inventory_warehouse_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_invoices`
--
ALTER TABLE `kxm_invoices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_invoice_histories`
--
ALTER TABLE `kxm_invoice_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_invoice_items`
--
ALTER TABLE `kxm_invoice_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_invoice_item_taxes`
--
ALTER TABLE `kxm_invoice_item_taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_invoice_totals`
--
ALTER TABLE `kxm_invoice_totals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_items`
--
ALTER TABLE `kxm_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `kxm_item_serial_numbers`
--
ALTER TABLE `kxm_item_serial_numbers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_item_taxes`
--
ALTER TABLE `kxm_item_taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_jobs`
--
ALTER TABLE `kxm_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_media`
--
ALTER TABLE `kxm_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kxm_migrations`
--
ALTER TABLE `kxm_migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `kxm_modules`
--
ALTER TABLE `kxm_modules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `kxm_module_histories`
--
ALTER TABLE `kxm_module_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `kxm_permissions`
--
ALTER TABLE `kxm_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `kxm_reconciliations`
--
ALTER TABLE `kxm_reconciliations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_recurring`
--
ALTER TABLE `kxm_recurring`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_reports`
--
ALTER TABLE `kxm_reports`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `kxm_roles`
--
ALTER TABLE `kxm_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kxm_sales_purchase_orders_documents`
--
ALTER TABLE `kxm_sales_purchase_orders_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kxm_sales_purchase_orders_purchase_extra_parameters`
--
ALTER TABLE `kxm_sales_purchase_orders_purchase_extra_parameters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_sales_purchase_orders_sales_extra_parameters`
--
ALTER TABLE `kxm_sales_purchase_orders_sales_extra_parameters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kxm_settings`
--
ALTER TABLE `kxm_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `kxm_taxes`
--
ALTER TABLE `kxm_taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kxm_transactions`
--
ALTER TABLE `kxm_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_transfers`
--
ALTER TABLE `kxm_transfers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kxm_users`
--
ALTER TABLE `kxm_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kxm_widgets`
--
ALTER TABLE `kxm_widgets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kxm_double_entry_accounts`
--
ALTER TABLE `kxm_double_entry_accounts`
  ADD CONSTRAINT `kxm_double_entry_accounts_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `kxm_double_entry_accounts` (`id`);

--
-- Constraints for table `kxm_media`
--
ALTER TABLE `kxm_media`
  ADD CONSTRAINT `original_media_id` FOREIGN KEY (`original_media_id`) REFERENCES `kxm_media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kxm_mediables`
--
ALTER TABLE `kxm_mediables`
  ADD CONSTRAINT `kxm_mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `kxm_media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kxm_role_permissions`
--
ALTER TABLE `kxm_role_permissions`
  ADD CONSTRAINT `kxm_role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `kxm_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kxm_role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `kxm_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kxm_user_permissions`
--
ALTER TABLE `kxm_user_permissions`
  ADD CONSTRAINT `kxm_user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `kxm_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kxm_user_roles`
--
ALTER TABLE `kxm_user_roles`
  ADD CONSTRAINT `kxm_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `kxm_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
