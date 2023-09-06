-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 11-Maio-2022 às 21:29
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `magentoteste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
CREATE TABLE IF NOT EXISTS `adminnotification_inbox` (
  `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';

--
-- Extraindo dados da tabela `adminnotification_inbox`
--

INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES
(1, 4, '2022-04-29 16:57:41', 'Deprecation Notice', 'Catalog Search is currently configured to use the MySQL engine, which has been deprecated. Consider migrating to one of\nthe Elasticsearch engines now to ensure there are no service interruptions during your next upgrade.', '', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin_passwords`
--

DROP TABLE IF EXISTS `admin_passwords`;
CREATE TABLE IF NOT EXISTS `admin_passwords` (
  `password_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Password Id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User Id',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Deprecated',
  `last_updated` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Passwords';

--
-- Extraindo dados da tabela `admin_passwords`
--

INSERT INTO `admin_passwords` (`password_id`, `user_id`, `password_hash`, `expires`, `last_updated`) VALUES
(1, 1, 'e4f1575fdc6060080889531e2f708d6cc1c4dcb1f0ae157565a54dcf96109a13:FOrW6Q6i4OYqIDchPkJinsdBZ8hkI0Wp:1', 0, 1651251472);

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin_system_messages`
--

DROP TABLE IF EXISTS `admin_system_messages`;
CREATE TABLE IF NOT EXISTS `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message id',
  `severity` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';

--
-- Extraindo dados da tabela `admin_system_messages`
--

INSERT INTO `admin_system_messages` (`identity`, `severity`, `created_at`) VALUES
('da332d712f3215b9b94bfa268c398323', 2, '2022-04-29 18:21:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE IF NOT EXISTS `admin_user` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  `refresh_token` text COMMENT 'Email connector refresh token',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';

--
-- Extraindo dados da tabela `admin_user`
--

INSERT INTO `admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`, `rp_token`, `rp_token_created_at`, `interface_locale`, `failures_num`, `first_failure`, `lock_expires`, `refresh_token`) VALUES
(1, 'danilo', 'danilo', 'danilo.s.gameiro@gmail.com', 'danilo', 'e4f1575fdc6060080889531e2f708d6cc1c4dcb1f0ae157565a54dcf96109a13:FOrW6Q6i4OYqIDchPkJinsdBZ8hkI0Wp:1', '2022-04-29 16:57:52', '2022-05-11 19:39:21', '2022-05-11 19:39:21', 14, 0, 1, NULL, NULL, NULL, 'en_US', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin_user_session`
--

DROP TABLE IF EXISTS `admin_user_session`;
CREATE TABLE IF NOT EXISTS `admin_user_session` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(128) NOT NULL COMMENT 'Session id value',
  `user_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Admin User sessions table';

--
-- Extraindo dados da tabela `admin_user_session`
--

INSERT INTO `admin_user_session` (`id`, `session_id`, `user_id`, `status`, `created_at`, `updated_at`, `ip`) VALUES
(1, '1jloc71d0c7d3argffiochpen7', 1, 2, '2022-04-29 18:20:55', '2022-04-29 18:23:09', '::1'),
(2, 'tharqtfbpl7r638gepoejdoepi', 1, 1, '2022-04-29 18:23:09', '2022-04-29 18:37:18', '::1'),
(3, 'p2qit8l9c31rnv91nvtkqtnj4f', 1, 1, '2022-04-29 20:01:33', '2022-04-29 20:08:50', '127.0.0.1'),
(4, 'p36fgj3djpiig0ihibcmjd5idb', 1, 2, '2022-05-05 18:45:09', '2022-05-05 18:46:59', '127.0.0.1'),
(5, 'fmpt1veidh7fh9gvu52gq1o24i', 1, 1, '2022-05-05 18:46:59', '2022-05-05 18:46:59', '127.0.0.1'),
(6, '37erv6ue14n5278fjl0hrlm2ql', 1, 2, '2022-05-05 19:52:30', '2022-05-05 19:54:13', '127.0.0.1'),
(7, '954gmigeeed98f8l21m8jlkclt', 1, 1, '2022-05-05 19:54:13', '2022-05-05 19:55:42', '127.0.0.1'),
(8, 'am2qnma95mlrbejc19l9mr3bgb', 1, 1, '2022-05-06 19:35:06', '2022-05-06 19:37:04', '127.0.0.1'),
(9, 't730qq5oqvnr72dmdth8lefdt4', 1, 1, '2022-05-09 14:21:14', '2022-05-09 14:24:40', '127.0.0.1'),
(10, 'brvc97p3n4csv5n0cnojb6b7o8', 1, 1, '2022-05-10 12:35:30', '2022-05-10 12:43:22', '127.0.0.1'),
(11, 'b6qds06u8h3nael05fbil13hk9', 1, 1, '2022-05-10 17:07:41', '2022-05-10 17:12:44', '127.0.0.1'),
(12, 'ddvl5pa5ihumm5a8bcbq38dujn', 1, 1, '2022-05-10 17:42:14', '2022-05-10 17:45:36', '127.0.0.1'),
(13, 'taa7ejfjg3ibn1khr07qjqab3l', 1, 1, '2022-05-11 19:11:05', '2022-05-11 19:11:33', '127.0.0.1'),
(14, 'bd3dfatj4a6vglqr62dvvun153', 1, 1, '2022-05-11 19:39:22', '2022-05-11 19:39:22', '127.0.0.1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `amazon_customer`
--

DROP TABLE IF EXISTS `amazon_customer`;
CREATE TABLE IF NOT EXISTS `amazon_customer` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer_id',
  `amazon_id` varchar(255) NOT NULL COMMENT 'Amazon_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_CUSTOMER_CUSTOMER_ID_AMAZON_ID` (`customer_id`,`amazon_id`),
  UNIQUE KEY `AMAZON_CUSTOMER_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_customer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `amazon_pending_authorization`
--

DROP TABLE IF EXISTS `amazon_pending_authorization`;
CREATE TABLE IF NOT EXISTS `amazon_pending_authorization` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order_id',
  `payment_id` int(10) UNSIGNED NOT NULL COMMENT 'Payment_id',
  `authorization_id` varchar(255) DEFAULT NULL COMMENT 'Authorization_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `updated_at` datetime DEFAULT NULL COMMENT 'Updated_at',
  `processed` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Initial authorization processed',
  `capture` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Initial authorization has capture',
  `capture_id` varchar(255) DEFAULT NULL COMMENT 'Initial authorization capture id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_E6CCA08713FB32BB136A56837009C371` (`order_id`,`payment_id`,`authorization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_authorization';

-- --------------------------------------------------------

--
-- Estrutura da tabela `amazon_pending_capture`
--

DROP TABLE IF EXISTS `amazon_pending_capture`;
CREATE TABLE IF NOT EXISTS `amazon_pending_capture` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `capture_id` varchar(255) NOT NULL COMMENT 'Capture_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'order id',
  `payment_id` int(10) UNSIGNED NOT NULL COMMENT 'payment id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_PENDING_CAPTURE_ORDER_ID_PAYMENT_ID_CAPTURE_ID` (`order_id`,`payment_id`,`capture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_capture';

-- --------------------------------------------------------

--
-- Estrutura da tabela `amazon_pending_refund`
--

DROP TABLE IF EXISTS `amazon_pending_refund`;
CREATE TABLE IF NOT EXISTS `amazon_pending_refund` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `refund_id` varchar(255) NOT NULL COMMENT 'Refund_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order_id',
  `payment_id` int(10) UNSIGNED NOT NULL COMMENT 'Payment_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_PENDING_REFUND_ORDER_ID_PAYMENT_ID_REFUND_ID` (`order_id`,`payment_id`,`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_refund';

-- --------------------------------------------------------

--
-- Estrutura da tabela `amazon_quote`
--

DROP TABLE IF EXISTS `amazon_quote`;
CREATE TABLE IF NOT EXISTS `amazon_quote` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int(10) UNSIGNED NOT NULL COMMENT 'Quote ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  `sandbox_simulation_reference` varchar(255) DEFAULT NULL COMMENT 'Sandbox simulation reference',
  `confirmed` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote confirmed with Amazon',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_QUOTE_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_quote';

-- --------------------------------------------------------

--
-- Estrutura da tabela `amazon_sales_order`
--

DROP TABLE IF EXISTS `amazon_sales_order`;
CREATE TABLE IF NOT EXISTS `amazon_sales_order` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_SALES_ORDER_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_sales_order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `authorization_role`
--

DROP TABLE IF EXISTS `authorization_role`;
CREATE TABLE IF NOT EXISTS `authorization_role` (
  `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';

--
-- Extraindo dados da tabela `authorization_role`
--

INSERT INTO `authorization_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `user_type`, `role_name`) VALUES
(1, 0, 1, 1, 'G', 0, '2', 'Administrators'),
(2, 1, 2, 0, 'U', 1, '2', 'danilo'),
(3, 0, 1, 0, 'U', 1, '1', '11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `authorization_rule`
--

DROP TABLE IF EXISTS `authorization_rule`;
CREATE TABLE IF NOT EXISTS `authorization_rule` (
  `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';

--
-- Extraindo dados da tabela `authorization_rule`
--

INSERT INTO `authorization_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `permission`) VALUES
(1, 1, 'Magento_Backend::all', NULL, 'allow'),
(2, 3, 'Magento_Backend::all', NULL, 'allow');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache_tag`
--

DROP TABLE IF EXISTS `cache_tag`;
CREATE TABLE IF NOT EXISTS `cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `captcha_log`
--

DROP TABLE IF EXISTS `captcha_log`;
CREATE TABLE IF NOT EXISTS `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';

-- --------------------------------------------------------

--
-- Estrutura da tabela `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock` (
  `stock_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';

--
-- Extraindo dados da tabela `cataloginventory_stock`
--

INSERT INTO `cataloginventory_stock` (`stock_id`, `website_id`, `stock_name`) VALUES
(1, 0, 'Default');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_item` (
  `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';

--
-- Extraindo dados da tabela `cataloginventory_stock_item`
--

INSERT INTO `cataloginventory_stock_item` (`item_id`, `product_id`, `stock_id`, `qty`, `min_qty`, `use_config_min_qty`, `is_qty_decimal`, `backorders`, `use_config_backorders`, `min_sale_qty`, `use_config_min_sale_qty`, `max_sale_qty`, `use_config_max_sale_qty`, `is_in_stock`, `low_stock_date`, `notify_stock_qty`, `use_config_notify_stock_qty`, `manage_stock`, `use_config_manage_stock`, `stock_status_changed_auto`, `use_config_qty_increments`, `qty_increments`, `use_config_enable_qty_inc`, `enable_qty_increments`, `is_decimal_divided`, `website_id`) VALUES
(1, 1, 1, '16.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '10000.0000', 1, 1, NULL, '1.0000', 1, 1, 1, 0, 1, '1.0000', 1, 0, 0, 0),
(2, 2, 1, '40.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '10000.0000', 1, 1, NULL, '1.0000', 1, 1, 1, 0, 1, '1.0000', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

--
-- Extraindo dados da tabela `cataloginventory_stock_status`
--

INSERT INTO `cataloginventory_stock_status` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(1, 0, 1, '16.0000', 1),
(2, 0, 1, '40.0000', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status_idx` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';

-- --------------------------------------------------------

--
-- Estrutura da tabela `cataloginventory_stock_status_replica`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_replica`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status_replica` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

-- --------------------------------------------------------

--
-- Estrutura da tabela `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status_tmp` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
CREATE TABLE IF NOT EXISTS `catalogrule` (
  `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  PRIMARY KEY (`rule_id`),
  KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule_customer_group`
--

DROP TABLE IF EXISTS `catalogrule_customer_group`;
CREATE TABLE IF NOT EXISTS `catalogrule_customer_group` (
  `rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
CREATE TABLE IF NOT EXISTS `catalogrule_group_website` (
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule_group_website_replica`
--

DROP TABLE IF EXISTS `catalogrule_group_website_replica`;
CREATE TABLE IF NOT EXISTS `catalogrule_group_website_replica` (
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
CREATE TABLE IF NOT EXISTS `catalogrule_product` (
  `rule_product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
CREATE TABLE IF NOT EXISTS `catalogrule_product_price` (
  `rule_product_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule_product_price_replica`
--

DROP TABLE IF EXISTS `catalogrule_product_price_replica`;
CREATE TABLE IF NOT EXISTS `catalogrule_product_price_replica` (
  `rule_product_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule_product_replica`
--

DROP TABLE IF EXISTS `catalogrule_product_replica`;
CREATE TABLE IF NOT EXISTS `catalogrule_product_replica` (
  `rule_product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogrule_website`
--

DROP TABLE IF EXISTS `catalogrule_website`;
CREATE TABLE IF NOT EXISTS `catalogrule_website` (
  `rule_id` int(10) UNSIGNED NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogsearch_fulltext_scope1`
--

DROP TABLE IF EXISTS `catalogsearch_fulltext_scope1`;
CREATE TABLE IF NOT EXISTS `catalogsearch_fulltext_scope1` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` int(10) UNSIGNED NOT NULL COMMENT 'Attribute_id',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`entity_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalogsearch_fulltext_scope1';

--
-- Extraindo dados da tabela `catalogsearch_fulltext_scope1`
--

INSERT INTO `catalogsearch_fulltext_scope1` (`entity_id`, `attribute_id`, `data_index`) VALUES
(1, 73, 'Blusa de manga curta canelada'),
(1, 74, '987654'),
(2, 73, 'Calça Cargo Sarja VZ Refletivo'),
(2, 74, '5858585');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalogsearch_recommendations`
--

DROP TABLE IF EXISTS `catalogsearch_recommendations`;
CREATE TABLE IF NOT EXISTS `catalogsearch_recommendations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `query_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Query Id',
  `relation_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Relation Id',
  PRIMARY KEY (`id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` (`query_id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Advanced Search Recommendations';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';

--
-- Extraindo dados da tabela `catalog_category_entity`
--

INSERT INTO `catalog_category_entity` (`entity_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1, 3, 0, '2022-04-29 16:57:38', '2022-04-29 18:27:30', '1', 0, 0, 3),
(2, 3, 1, '2022-04-29 16:57:38', '2022-04-29 16:57:38', '1/2', 1, 1, 0),
(3, 3, 1, '2022-04-29 18:26:57', '2022-04-29 18:27:30', '1/3', 2, 1, 1),
(4, 3, 3, '2022-04-29 18:27:30', '2022-04-29 18:27:30', '1/3/4', 1, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';

--
-- Extraindo dados da tabela `catalog_category_entity_int`
--

INSERT INTO `catalog_category_entity_int` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 69, 0, 1, 1),
(2, 46, 0, 2, 1),
(3, 69, 0, 2, 1),
(4, 46, 0, 3, 1),
(5, 54, 0, 3, 1),
(6, 69, 0, 3, 1),
(7, 70, 0, 3, 0),
(8, 71, 0, 3, 0),
(9, 46, 0, 4, 1),
(10, 54, 0, 4, 1),
(11, 69, 0, 4, 1),
(12, 70, 0, 4, 0),
(13, 71, 0, 4, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';

--
-- Extraindo dados da tabela `catalog_category_entity_varchar`
--

INSERT INTO `catalog_category_entity_varchar` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 45, 0, 1, 'Root Catalog'),
(2, 45, 0, 2, 'Default Category'),
(3, 52, 0, 2, 'PRODUCTS'),
(4, 45, 0, 3, 'Vestuários '),
(5, 52, 0, 3, 'PRODUCTS'),
(6, 119, 0, 3, 'vestuarios'),
(7, 45, 0, 4, 'Blusas'),
(8, 52, 0, 4, 'PRODUCTS'),
(9, 119, 0, 4, 'blusas'),
(10, 120, 0, 4, 'blusas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
CREATE TABLE IF NOT EXISTS `catalog_category_product` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';

--
-- Extraindo dados da tabela `catalog_category_product`
--

INSERT INTO `catalog_category_product` (`entity_id`, `category_id`, `product_id`, `position`) VALUES
(1, 3, 1, 0),
(2, 4, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
CREATE TABLE IF NOT EXISTS `catalog_category_product_index` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_product_index_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_replica`;
CREATE TABLE IF NOT EXISTS `catalog_category_product_index_replica` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_product_index_store1`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1`;
CREATE TABLE IF NOT EXISTS `catalog_category_product_index_store1` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_216E521C8AD125E066D2B0BAB4A08412` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index Store1';

--
-- Extraindo dados da tabela `catalog_category_product_index_store1`
--

INSERT INTO `catalog_category_product_index_store1` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(2, 2, 0, 0, 1, 4),
(2, 1, 0, 1, 1, 4),
(3, 1, 0, 0, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_product_index_store1_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1_replica`;
CREATE TABLE IF NOT EXISTS `catalog_category_product_index_store1_replica` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_47AB760CD6A893ACEA69A9C2E0112C60` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index Store1 Replica';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_category_product_index_tmp` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer temporary table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
CREATE TABLE IF NOT EXISTS `catalog_compare_item` (
  `catalog_compare_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
CREATE TABLE IF NOT EXISTS `catalog_eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

--
-- Extraindo dados da tabela `catalog_eav_attribute`
--

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`, `is_required_in_admin_store`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `search_weight`, `additional_data`) VALUES
(45, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(46, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(47, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 1, NULL),
(48, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(49, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(50, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(51, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(52, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(53, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(54, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(55, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(56, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(57, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(58, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(59, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(60, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(61, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(62, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(63, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(64, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(65, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(66, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(67, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(68, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(69, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(70, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(71, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(72, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(73, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 5, NULL),
(74, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 6, NULL),
(75, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, NULL),
(76, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, NULL, 1, 0, 1, 0, 0, 1, 0, 0, 1, NULL),
(77, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 'simple,virtual,configurable,downloadable,bundle', 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(78, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(79, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(80, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(81, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(82, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(83, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'simple,configurable', 1, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(84, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(85, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(86, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(87, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(88, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(89, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(90, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(91, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(92, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable,bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(93, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'simple,virtual,configurable', 1, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(94, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(95, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(96, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(97, 'Magento\\Framework\\Data\\Form\\Element\\Hidden', 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, NULL),
(98, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(99, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, NULL),
(100, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(101, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(102, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(103, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(104, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(105, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(106, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(107, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(108, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(109, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(110, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(111, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(112, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(113, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(114, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,bundle,configurable,grouped', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(115, 'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(116, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(117, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type', 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(118, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(119, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(120, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(121, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(122, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(123, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(124, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(125, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(126, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(127, 'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(128, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(129, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(130, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(131, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(132, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(133, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(134, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(135, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(136, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(137, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_option` (
  `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_option_value` (
  `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `parent_product_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Product Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_price_index` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_selection` (
  `selection_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_selection_price` (
  `selection_id` int(10) UNSIGNED NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `parent_product_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Product Id',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_stock_index` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';

--
-- Extraindo dados da tabela `catalog_product_entity`
--

INSERT INTO `catalog_product_entity` (`entity_id`, `attribute_set_id`, `type_id`, `sku`, `has_options`, `required_options`, `created_at`, `updated_at`) VALUES
(1, 4, 'simple', '987654', 0, 0, '2022-04-29 18:33:32', '2022-04-29 18:33:32'),
(2, 4, 'simple', '5858585', 0, 0, '2022-05-09 14:24:21', '2022-05-09 14:24:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';

--
-- Extraindo dados da tabela `catalog_product_entity_decimal`
--

INSERT INTO `catalog_product_entity_decimal` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 77, 0, 1, '49.9000'),
(2, 77, 0, 2, '89.9000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';

--
-- Extraindo dados da tabela `catalog_product_entity_int`
--

INSERT INTO `catalog_product_entity_int` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 97, 0, 1, 1),
(2, 99, 0, 1, 4),
(3, 129, 0, 1, 0),
(4, 97, 0, 2, 1),
(5, 99, 0, 2, 4),
(6, 129, 0, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery` (
  `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';

--
-- Extraindo dados da tabela `catalog_product_entity_media_gallery`
--

INSERT INTO `catalog_product_entity_media_gallery` (`value_id`, `attribute_id`, `value`, `media_type`, `disabled`) VALUES
(1, 90, '//b/l/blusa_1.jpg', 'image', 0),
(2, 90, '//c/a/calca.jpg', 'image', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) UNSIGNED DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record Id',
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';

--
-- Extraindo dados da tabela `catalog_product_entity_media_gallery_value`
--

INSERT INTO `catalog_product_entity_media_gallery_value` (`value_id`, `store_id`, `entity_id`, `label`, `position`, `disabled`, `record_id`) VALUES
(1, 0, 1, NULL, 1, 0, 1),
(2, 0, 2, NULL, 1, 0, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_to_entity`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int(10) UNSIGNED NOT NULL,
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`,`entity_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';

--
-- Extraindo dados da tabela `catalog_product_entity_media_gallery_value_to_entity`
--

INSERT INTO `catalog_product_entity_media_gallery_value_to_entity` (`value_id`, `entity_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_video`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID` (`value_id`,`store_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';

--
-- Extraindo dados da tabela `catalog_product_entity_text`
--

INSERT INTO `catalog_product_entity_text` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 85, 0, 1, 'Blusa de manga curta canelada'),
(2, 85, 0, 2, 'Calça Cargo Sarja VZ Refletivo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `all_groups` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';

--
-- Extraindo dados da tabela `catalog_product_entity_varchar`
--

INSERT INTO `catalog_product_entity_varchar` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 73, 0, 1, 'Blusa de manga curta canelada'),
(2, 84, 0, 1, 'Blusa de manga curta canelada'),
(3, 86, 0, 1, 'Blusa de manga curta canelada '),
(4, 87, 0, 1, '//b/l/blusa_1.jpg'),
(5, 88, 0, 1, '//b/l/blusa_1.jpg'),
(6, 89, 0, 1, '//b/l/blusa_1.jpg'),
(7, 106, 0, 1, 'container2'),
(8, 121, 0, 1, 'blusa-de-manga-curta-canelada'),
(9, 127, 0, 1, '2'),
(10, 128, 0, 1, '//b/l/blusa_1.jpg'),
(11, 73, 0, 2, 'Calça Cargo Sarja VZ Refletivo'),
(12, 84, 0, 2, 'Calça Cargo Sarja VZ Refletivo'),
(13, 86, 0, 2, 'Calça Cargo Sarja VZ Refletivo '),
(14, 87, 0, 2, '//c/a/calca.jpg'),
(15, 88, 0, 2, '//c/a/calca.jpg'),
(16, 89, 0, 2, '//c/a/calca.jpg'),
(17, 106, 0, 2, 'container2'),
(18, 121, 0, 2, 'calca-cargo-sarja-vz-refletivo'),
(19, 127, 0, 2, '2'),
(20, 128, 0, 2, '//c/a/calca.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_frontend_action`
--

DROP TABLE IF EXISTS `catalog_product_frontend_action`;
CREATE TABLE IF NOT EXISTS `catalog_product_frontend_action` (
  `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Action Id',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `added_at` bigint(20) NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  KEY `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Frontend Action Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

--
-- Extraindo dados da tabela `catalog_product_index_eav`
--

INSERT INTO `catalog_product_index_eav` (`entity_id`, `attribute_id`, `store_id`, `value`, `source_id`) VALUES
(1, 99, 1, 4, 1),
(2, 99, 1, 4, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_eav_decimal_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_replica`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal_replica` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_eav_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_replica`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_replica` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

--
-- Extraindo dados da tabela `catalog_product_index_price`
--

INSERT INTO `catalog_product_index_price` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`) VALUES
(1, 0, 1, 0, '49.9000', '49.9000', '49.9000', '49.9000', NULL),
(1, 1, 1, 0, '49.9000', '49.9000', '49.9000', '49.9000', NULL),
(1, 2, 1, 0, '49.9000', '49.9000', '49.9000', '49.9000', NULL),
(1, 3, 1, 0, '49.9000', '49.9000', '49.9000', '49.9000', NULL),
(2, 0, 1, 0, '89.9000', '89.9000', '89.9000', '89.9000', NULL),
(2, 1, 1, 0, '89.9000', '89.9000', '89.9000', '89.9000', NULL),
(2, 2, 1, 0, '89.9000', '89.9000', '89.9000', '89.9000', NULL),
(2, 3, 1, 0, '89.9000', '89.9000', '89.9000', '89.9000', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) UNSIGNED NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) UNSIGNED NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_final_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_price_replica`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_replica` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_tier_price` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_website` (
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `default_store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Default store id for website',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';

--
-- Extraindo dados da tabela `catalog_product_index_website`
--

INSERT INTO `catalog_product_index_website` (`website_id`, `default_store_id`, `website_date`, `rate`) VALUES
(1, 1, '2022-05-09', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
CREATE TABLE IF NOT EXISTS `catalog_product_link` (
  `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';

--
-- Extraindo dados da tabela `catalog_product_link_attribute`
--

INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1, 1, 'position', 'int'),
(2, 4, 'position', 'int'),
(3, 5, 'position', 'int'),
(4, 3, 'position', 'int'),
(5, 3, 'qty', 'decimal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_decimal` (
  `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_int` (
  `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_varchar` (
  `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_type` (
  `link_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';

--
-- Extraindo dados da tabela `catalog_product_link_type`
--

INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1, 'relation'),
(3, 'super'),
(4, 'up_sell'),
(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
CREATE TABLE IF NOT EXISTS `catalog_product_option` (
  `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) UNSIGNED DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_price` (
  `option_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_title` (
  `option_title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_type_price` (
  `option_type_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_type_title` (
  `option_type_title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_type_value` (
  `option_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
CREATE TABLE IF NOT EXISTS `catalog_product_relation` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute_label` (
  `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
CREATE TABLE IF NOT EXISTS `catalog_product_super_link` (
  `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
CREATE TABLE IF NOT EXISTS `catalog_product_website` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';

--
-- Extraindo dados da tabela `catalog_product_website`
--

INSERT INTO `catalog_product_website` (`product_id`, `website_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `catalog_url_rewrite_product_category`;
CREATE TABLE IF NOT EXISTS `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) UNSIGNED NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT 'category_id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'product_id',
  KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `FK_BB79E64705D7F17FE181F23144528FC8` (`url_rewrite_id`),
  KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';

-- --------------------------------------------------------

--
-- Estrutura da tabela `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
CREATE TABLE IF NOT EXISTS `checkout_agreement` (
  `agreement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';

-- --------------------------------------------------------

--
-- Estrutura da tabela `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
CREATE TABLE IF NOT EXISTS `checkout_agreement_store` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';

-- --------------------------------------------------------

--
-- Estrutura da tabela `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
CREATE TABLE IF NOT EXISTS `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
CREATE TABLE IF NOT EXISTS `cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE IF NOT EXISTS `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  PRIMARY KEY (`page_id`),
  KEY `CMS_PAGE_IDENTIFIER` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';

--
-- Extraindo dados da tabela `cms_page`
--

INSERT INTO `cms_page` (`page_id`, `title`, `page_layout`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`, `meta_title`) VALUES
(1, '404 Not Found', '2columns-right', 'Page keywords', 'Page description', 'no-route', 'Whoops, our bad...', '<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n', '2022-04-29 16:57:36', '2022-04-29 16:57:36', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Home page', '1column', NULL, NULL, 'home', 'Home Page', '<p>CMS homepage content goes here.</p>\r\n', '2022-04-29 16:57:36', '2022-04-29 16:57:43', 1, 0, '<!--\n    <referenceContainer name=\"right\">\n        <referenceBlock name=\"catalog.compare.sidebar\" remove=\"true\" />\n    </referenceContainer>-->', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Enable Cookies', '1column', NULL, NULL, 'enable-cookies', 'What are Cookies?', '<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>', '2022-04-29 16:57:36', '2022-04-29 16:57:36', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Privacy and Cookie Policy', '1column', NULL, NULL, 'privacy-policy-cookie-restriction-mode', 'Privacy and Cookie Policy', '<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>', '2022-04-29 16:57:36', '2022-04-29 16:57:36', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
CREATE TABLE IF NOT EXISTS `cms_page_store` (
  `page_id` smallint(6) NOT NULL,
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';

--
-- Extraindo dados da tabela `cms_page_store`
--

INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
CREATE TABLE IF NOT EXISTS `core_config_data` (
  `config_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Config Data';

--
-- Extraindo dados da tabela `core_config_data`
--

INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES
(1, 'default', 0, 'web/seo/use_rewrites', '1'),
(2, 'default', 0, 'web/unsecure/base_url', 'http://127.0.0.1/magentoteste/'),
(3, 'default', 0, 'web/secure/base_url', 'http://127.0.0.1/magentoteste/'),
(4, 'default', 0, 'general/locale/code', 'pt_BR'),
(5, 'default', 0, 'web/secure/use_in_frontend', NULL),
(6, 'default', 0, 'web/secure/use_in_adminhtml', NULL),
(7, 'default', 0, 'general/locale/timezone', 'America/Sao_Paulo'),
(8, 'default', 0, 'currency/options/base', 'BRL'),
(9, 'default', 0, 'currency/options/default', 'BRL'),
(10, 'default', 0, 'currency/options/allow', 'BRL'),
(11, 'default', 0, 'general/region/display_all', '1'),
(12, 'default', 0, 'general/region/state_required', 'BR,CA,CH,EE,ES,HR,IN,LT,LV,RO,US'),
(13, 'default', 0, 'catalog/category/root_id', '2'),
(14, 'default', 0, 'msp_securitysuite_twofactorauth/duo/application_key', '0nSk1OdgoMEgTEHdPKortMjS0rIoTmiwswj7bWYCE6Kpzy0eq4N2CV0KtgBfXEPN'),
(15, 'default', 0, 'analytics/subscription/enabled', '1'),
(16, 'default', 0, 'crontab/default/jobs/analytics_subscribe/schedule/cron_expr', '0 * * * *'),
(17, 'website', 0, 'connector_configuration/transactional_data/order_statuses', 'canceled,closed,complete,fraud,holded,payment_review,paypal_canceled_reversal,paypal_reversed,pending,pending_payment,pending_paypal,processing'),
(18, 'website', 0, 'connector_configuration/catalog_sync/catalog_type', 'simple,virtual,configurable,downloadable,grouped,bundle'),
(19, 'website', 0, 'connector_configuration/catalog_sync/catalog_visibility', '1,2,3,4'),
(20, 'default', 0, 'connector_dynamic_content/external_dynamic_content_urls/passcode', 'rH7iJAWFBbsir4FXG5NLF5XWGjDTNPXz'),
(21, 'default', 0, 'connector_automation/review_settings/allow_non_subscribers', '1'),
(22, 'default', 0, 'connector_configuration/abandoned_carts/allow_non_subscribers', '1'),
(23, 'default', 0, 'sync_settings/addressbook/allow_non_subscribers', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
CREATE TABLE IF NOT EXISTS `cron_schedule` (
  `schedule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
CREATE TABLE IF NOT EXISTS `customer_address_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int(10) UNSIGNED DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int(10) UNSIGNED DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
CREATE TABLE IF NOT EXISTS `customer_eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';

--
-- Extraindo dados da tabela `customer_eav_attribute`
--

INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `is_searchable_in_grid`) VALUES
(1, 1, NULL, 0, NULL, 1, 10, NULL, 1, 1, 1, 0),
(2, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(3, 1, NULL, 0, NULL, 1, 20, NULL, 1, 1, 0, 1),
(4, 0, NULL, 0, NULL, 0, 30, NULL, 0, 0, 0, 0),
(5, 1, 'trim', 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 40, NULL, 0, 0, 0, 0),
(6, 0, 'trim', 0, NULL, 0, 50, NULL, 0, 0, 0, 0),
(7, 1, 'trim', 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 60, NULL, 0, 0, 0, 0),
(8, 0, NULL, 0, NULL, 0, 70, NULL, 0, 0, 0, 0),
(9, 1, NULL, 0, '{\"input_validation\":\"email\"}', 1, 80, NULL, 1, 1, 1, 1),
(10, 1, NULL, 0, NULL, 1, 25, NULL, 1, 1, 1, 0),
(11, 0, 'date', 0, '{\"input_validation\":\"date\"}', 0, 90, NULL, 1, 1, 1, 0),
(12, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(13, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(14, 0, NULL, 0, '{\"input_validation\":\"date\"}', 1, 0, NULL, 0, 0, 0, 0),
(15, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(16, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(17, 0, NULL, 0, '{\"max_text_length\":255}', 0, 100, NULL, 1, 1, 0, 1),
(18, 0, NULL, 0, NULL, 1, 0, NULL, 1, 1, 1, 0),
(19, 0, NULL, 0, NULL, 0, 0, NULL, 1, 1, 1, 0),
(20, 0, NULL, 0, '[]', 0, 110, NULL, 1, 1, 1, 0),
(21, 1, NULL, 0, NULL, 1, 28, NULL, 0, 0, 0, 0),
(22, 0, NULL, 0, NULL, 0, 10, NULL, 0, 0, 0, 0),
(23, 1, 'trim', 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 20, NULL, 1, 0, 0, 1),
(24, 0, 'trim', 0, NULL, 0, 30, NULL, 0, 0, 0, 0),
(25, 1, 'trim', 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 40, NULL, 1, 0, 0, 1),
(26, 0, NULL, 0, NULL, 0, 50, NULL, 0, 0, 0, 0),
(27, 1, NULL, 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 60, NULL, 1, 0, 0, 1),
(28, 1, NULL, 3, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 70, NULL, 1, 0, 0, 1),
(29, 1, NULL, 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 80, NULL, 1, 0, 0, 1),
(30, 1, NULL, 0, NULL, 1, 90, NULL, 1, 1, 1, 0),
(31, 1, NULL, 0, NULL, 1, 100, NULL, 1, 1, 0, 1),
(32, 1, NULL, 0, NULL, 1, 100, NULL, 0, 0, 0, 0),
(33, 1, NULL, 0, '[]', 1, 110, 'Magento\\Customer\\Model\\Attribute\\Data\\Postcode', 1, 1, 1, 1),
(34, 1, NULL, 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 120, NULL, 1, 1, 1, 1),
(35, 0, NULL, 0, '{\"max_text_length\":255,\"min_text_length\":1}', 0, 130, NULL, 1, 0, 0, 1),
(36, 1, NULL, 0, NULL, 1, 140, NULL, 0, 0, 0, 0),
(37, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(38, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(39, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(40, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(41, 0, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0),
(42, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(43, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(44, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
CREATE TABLE IF NOT EXISTS `customer_eav_attribute_website` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';

--
-- Extraindo dados da tabela `customer_eav_attribute_website`
--

INSERT INTO `customer_eav_attribute_website` (`attribute_id`, `website_id`, `is_visible`, `is_required`, `default_value`, `multiline_count`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(3, 1, NULL, NULL, NULL, NULL),
(5, 1, NULL, NULL, NULL, NULL),
(6, 1, NULL, NULL, NULL, NULL),
(7, 1, NULL, NULL, NULL, NULL),
(9, 1, NULL, NULL, NULL, NULL),
(10, 1, NULL, NULL, NULL, NULL),
(11, 1, NULL, NULL, NULL, NULL),
(17, 1, NULL, NULL, NULL, NULL),
(18, 1, NULL, NULL, NULL, NULL),
(19, 1, NULL, NULL, NULL, NULL),
(20, 1, NULL, NULL, NULL, NULL),
(21, 1, NULL, NULL, NULL, NULL),
(23, 1, NULL, NULL, NULL, NULL),
(24, 1, NULL, NULL, NULL, NULL),
(25, 1, NULL, NULL, NULL, NULL),
(27, 1, NULL, NULL, NULL, NULL),
(28, 1, NULL, NULL, NULL, NULL),
(29, 1, NULL, NULL, NULL, NULL),
(30, 1, NULL, NULL, NULL, NULL),
(31, 1, NULL, NULL, NULL, NULL),
(32, 1, NULL, NULL, NULL, NULL),
(33, 1, NULL, NULL, NULL, NULL),
(34, 1, NULL, NULL, NULL, NULL),
(35, 1, NULL, NULL, NULL, NULL),
(36, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
CREATE TABLE IF NOT EXISTS `customer_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int(10) UNSIGNED DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int(10) UNSIGNED DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
CREATE TABLE IF NOT EXISTS `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
CREATE TABLE IF NOT EXISTS `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
CREATE TABLE IF NOT EXISTS `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
CREATE TABLE IF NOT EXISTS `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
CREATE TABLE IF NOT EXISTS `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
CREATE TABLE IF NOT EXISTS `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';

--
-- Extraindo dados da tabela `customer_form_attribute`
--

INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES
('adminhtml_customer', 1),
('adminhtml_customer', 3),
('adminhtml_customer', 4),
('customer_account_create', 4),
('customer_account_edit', 4),
('adminhtml_customer', 5),
('customer_account_create', 5),
('customer_account_edit', 5),
('adminhtml_customer', 6),
('customer_account_create', 6),
('customer_account_edit', 6),
('adminhtml_customer', 7),
('customer_account_create', 7),
('customer_account_edit', 7),
('adminhtml_customer', 8),
('customer_account_create', 8),
('customer_account_edit', 8),
('adminhtml_checkout', 9),
('adminhtml_customer', 9),
('customer_account_create', 9),
('customer_account_edit', 9),
('adminhtml_checkout', 10),
('adminhtml_customer', 10),
('adminhtml_checkout', 11),
('adminhtml_customer', 11),
('customer_account_create', 11),
('customer_account_edit', 11),
('adminhtml_checkout', 17),
('adminhtml_customer', 17),
('customer_account_create', 17),
('customer_account_edit', 17),
('adminhtml_customer', 19),
('customer_account_create', 19),
('customer_account_edit', 19),
('adminhtml_checkout', 20),
('adminhtml_customer', 20),
('customer_account_create', 20),
('customer_account_edit', 20),
('adminhtml_customer', 21),
('adminhtml_customer_address', 22),
('customer_address_edit', 22),
('customer_register_address', 22),
('adminhtml_customer_address', 23),
('customer_address_edit', 23),
('customer_register_address', 23),
('adminhtml_customer_address', 24),
('customer_address_edit', 24),
('customer_register_address', 24),
('adminhtml_customer_address', 25),
('customer_address_edit', 25),
('customer_register_address', 25),
('adminhtml_customer_address', 26),
('customer_address_edit', 26),
('customer_register_address', 26),
('adminhtml_customer_address', 27),
('customer_address_edit', 27),
('customer_register_address', 27),
('adminhtml_customer_address', 28),
('customer_address_edit', 28),
('customer_register_address', 28),
('adminhtml_customer_address', 29),
('customer_address_edit', 29),
('customer_register_address', 29),
('adminhtml_customer_address', 30),
('customer_address_edit', 30),
('customer_register_address', 30),
('adminhtml_customer_address', 31),
('customer_address_edit', 31),
('customer_register_address', 31),
('adminhtml_customer_address', 32),
('customer_address_edit', 32),
('customer_register_address', 32),
('adminhtml_customer_address', 33),
('customer_address_edit', 33),
('customer_register_address', 33),
('adminhtml_customer_address', 34),
('customer_address_edit', 34),
('customer_register_address', 34),
('adminhtml_customer_address', 35),
('customer_address_edit', 35),
('customer_register_address', 35),
('adminhtml_customer_address', 36),
('customer_address_edit', 36),
('customer_register_address', 36);

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_grid_flat`
--

DROP TABLE IF EXISTS `customer_grid_flat`;
CREATE TABLE IF NOT EXISTS `customer_grid_flat` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int(11) DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int(11) DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int(11) DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text COMMENT 'Shipping_full',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='customer_grid_flat';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer Group';

--
-- Extraindo dados da tabela `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0, 'NOT LOGGED IN', 3),
(1, 'General', 3),
(2, 'Wholesale', 3),
(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_log`
--

DROP TABLE IF EXISTS `customer_log`;
CREATE TABLE IF NOT EXISTS `customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Log Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_visitor`
--

DROP TABLE IF EXISTS `customer_visitor`;
CREATE TABLE IF NOT EXISTS `customer_visitor` (
  `visitor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Visitor Table';

--
-- Extraindo dados da tabela `customer_visitor`
--

INSERT INTO `customer_visitor` (`visitor_id`, `customer_id`, `session_id`, `last_visit_at`) VALUES
(1, NULL, 'nfn40r3ff6iurhmg8sujbojulh', '2022-04-29 18:47:33'),
(2, NULL, '48g3i1h7qhnsdhbj3kh320utnj', '2022-04-29 19:39:27'),
(3, NULL, 'p36fgj3djpiig0ihibcmjd5idb', '2022-05-05 18:46:17'),
(4, NULL, 'lrh6r2k859km47se5iv3ei666t', '2022-05-05 19:37:04'),
(5, NULL, '37erv6ue14n5278fjl0hrlm2ql', '2022-05-05 19:53:38'),
(6, NULL, '954gmigeeed98f8l21m8jlkclt', '2022-05-05 19:54:59'),
(7, NULL, 'am2qnma95mlrbejc19l9mr3bgb', '2022-05-06 20:58:00'),
(8, NULL, 't730qq5oqvnr72dmdth8lefdt4', '2022-05-09 14:24:47'),
(9, NULL, 'brvc97p3n4csv5n0cnojb6b7o8', '2022-05-10 12:43:31'),
(10, NULL, 'b6qds06u8h3nael05fbil13hk9', '2022-05-10 17:12:33'),
(11, NULL, 'ddvl5pa5ihumm5a8bcbq38dujn', '2022-05-10 17:45:11'),
(12, NULL, 'taa7ejfjg3ibn1khr07qjqab3l', '2022-05-11 19:11:32'),
(13, NULL, 'bd3dfatj4a6vglqr62dvvun153', '2022-05-11 19:39:47');

-- --------------------------------------------------------

--
-- Estrutura da tabela `design_change`
--

DROP TABLE IF EXISTS `design_change`;
CREATE TABLE IF NOT EXISTS `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `DESIGN_CHANGE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';

-- --------------------------------------------------------

--
-- Estrutura da tabela `design_config_grid_flat`
--

DROP TABLE IF EXISTS `design_config_grid_flat`;
CREATE TABLE IF NOT EXISTS `design_config_grid_flat` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `store_website_id` int(11) DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int(11) DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int(11) DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='design_config_grid_flat';

--
-- Extraindo dados da tabela `design_config_grid_flat`
--

INSERT INTO `design_config_grid_flat` (`entity_id`, `store_website_id`, `store_group_id`, `store_id`, `theme_theme_id`) VALUES
(0, NULL, NULL, NULL, ''),
(1, 1, NULL, NULL, ''),
(2, 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
CREATE TABLE IF NOT EXISTS `directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';

--
-- Extraindo dados da tabela `directory_country`
--

INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD', 'AD', 'AND'),
('AE', 'AE', 'ARE'),
('AF', 'AF', 'AFG'),
('AG', 'AG', 'ATG'),
('AI', 'AI', 'AIA'),
('AL', 'AL', 'ALB'),
('AM', 'AM', 'ARM'),
('AN', 'AN', 'ANT'),
('AO', 'AO', 'AGO'),
('AQ', 'AQ', 'ATA'),
('AR', 'AR', 'ARG'),
('AS', 'AS', 'ASM'),
('AT', 'AT', 'AUT'),
('AU', 'AU', 'AUS'),
('AW', 'AW', 'ABW'),
('AX', 'AX', 'ALA'),
('AZ', 'AZ', 'AZE'),
('BA', 'BA', 'BIH'),
('BB', 'BB', 'BRB'),
('BD', 'BD', 'BGD'),
('BE', 'BE', 'BEL'),
('BF', 'BF', 'BFA'),
('BG', 'BG', 'BGR'),
('BH', 'BH', 'BHR'),
('BI', 'BI', 'BDI'),
('BJ', 'BJ', 'BEN'),
('BL', 'BL', 'BLM'),
('BM', 'BM', 'BMU'),
('BN', 'BN', 'BRN'),
('BO', 'BO', 'BOL'),
('BR', 'BR', 'BRA'),
('BS', 'BS', 'BHS'),
('BT', 'BT', 'BTN'),
('BV', 'BV', 'BVT'),
('BW', 'BW', 'BWA'),
('BY', 'BY', 'BLR'),
('BZ', 'BZ', 'BLZ'),
('CA', 'CA', 'CAN'),
('CC', 'CC', 'CCK'),
('CD', 'CD', 'COD'),
('CF', 'CF', 'CAF'),
('CG', 'CG', 'COG'),
('CH', 'CH', 'CHE'),
('CI', 'CI', 'CIV'),
('CK', 'CK', 'COK'),
('CL', 'CL', 'CHL'),
('CM', 'CM', 'CMR'),
('CN', 'CN', 'CHN'),
('CO', 'CO', 'COL'),
('CR', 'CR', 'CRI'),
('CU', 'CU', 'CUB'),
('CV', 'CV', 'CPV'),
('CX', 'CX', 'CXR'),
('CY', 'CY', 'CYP'),
('CZ', 'CZ', 'CZE'),
('DE', 'DE', 'DEU'),
('DJ', 'DJ', 'DJI'),
('DK', 'DK', 'DNK'),
('DM', 'DM', 'DMA'),
('DO', 'DO', 'DOM'),
('DZ', 'DZ', 'DZA'),
('EC', 'EC', 'ECU'),
('EE', 'EE', 'EST'),
('EG', 'EG', 'EGY'),
('EH', 'EH', 'ESH'),
('ER', 'ER', 'ERI'),
('ES', 'ES', 'ESP'),
('ET', 'ET', 'ETH'),
('FI', 'FI', 'FIN'),
('FJ', 'FJ', 'FJI'),
('FK', 'FK', 'FLK'),
('FM', 'FM', 'FSM'),
('FO', 'FO', 'FRO'),
('FR', 'FR', 'FRA'),
('GA', 'GA', 'GAB'),
('GB', 'GB', 'GBR'),
('GD', 'GD', 'GRD'),
('GE', 'GE', 'GEO'),
('GF', 'GF', 'GUF'),
('GG', 'GG', 'GGY'),
('GH', 'GH', 'GHA'),
('GI', 'GI', 'GIB'),
('GL', 'GL', 'GRL'),
('GM', 'GM', 'GMB'),
('GN', 'GN', 'GIN'),
('GP', 'GP', 'GLP'),
('GQ', 'GQ', 'GNQ'),
('GR', 'GR', 'GRC'),
('GS', 'GS', 'SGS'),
('GT', 'GT', 'GTM'),
('GU', 'GU', 'GUM'),
('GW', 'GW', 'GNB'),
('GY', 'GY', 'GUY'),
('HK', 'HK', 'HKG'),
('HM', 'HM', 'HMD'),
('HN', 'HN', 'HND'),
('HR', 'HR', 'HRV'),
('HT', 'HT', 'HTI'),
('HU', 'HU', 'HUN'),
('ID', 'ID', 'IDN'),
('IE', 'IE', 'IRL'),
('IL', 'IL', 'ISR'),
('IM', 'IM', 'IMN'),
('IN', 'IN', 'IND'),
('IO', 'IO', 'IOT'),
('IQ', 'IQ', 'IRQ'),
('IR', 'IR', 'IRN'),
('IS', 'IS', 'ISL'),
('IT', 'IT', 'ITA'),
('JE', 'JE', 'JEY'),
('JM', 'JM', 'JAM'),
('JO', 'JO', 'JOR'),
('JP', 'JP', 'JPN'),
('KE', 'KE', 'KEN'),
('KG', 'KG', 'KGZ'),
('KH', 'KH', 'KHM'),
('KI', 'KI', 'KIR'),
('KM', 'KM', 'COM'),
('KN', 'KN', 'KNA'),
('KP', 'KP', 'PRK'),
('KR', 'KR', 'KOR'),
('KW', 'KW', 'KWT'),
('KY', 'KY', 'CYM'),
('KZ', 'KZ', 'KAZ'),
('LA', 'LA', 'LAO'),
('LB', 'LB', 'LBN'),
('LC', 'LC', 'LCA'),
('LI', 'LI', 'LIE'),
('LK', 'LK', 'LKA'),
('LR', 'LR', 'LBR'),
('LS', 'LS', 'LSO'),
('LT', 'LT', 'LTU'),
('LU', 'LU', 'LUX'),
('LV', 'LV', 'LVA'),
('LY', 'LY', 'LBY'),
('MA', 'MA', 'MAR'),
('MC', 'MC', 'MCO'),
('MD', 'MD', 'MDA'),
('ME', 'ME', 'MNE'),
('MF', 'MF', 'MAF'),
('MG', 'MG', 'MDG'),
('MH', 'MH', 'MHL'),
('MK', 'MK', 'MKD'),
('ML', 'ML', 'MLI'),
('MM', 'MM', 'MMR'),
('MN', 'MN', 'MNG'),
('MO', 'MO', 'MAC'),
('MP', 'MP', 'MNP'),
('MQ', 'MQ', 'MTQ'),
('MR', 'MR', 'MRT'),
('MS', 'MS', 'MSR'),
('MT', 'MT', 'MLT'),
('MU', 'MU', 'MUS'),
('MV', 'MV', 'MDV'),
('MW', 'MW', 'MWI'),
('MX', 'MX', 'MEX'),
('MY', 'MY', 'MYS'),
('MZ', 'MZ', 'MOZ'),
('NA', 'NA', 'NAM'),
('NC', 'NC', 'NCL'),
('NE', 'NE', 'NER'),
('NF', 'NF', 'NFK'),
('NG', 'NG', 'NGA'),
('NI', 'NI', 'NIC'),
('NL', 'NL', 'NLD'),
('NO', 'NO', 'NOR'),
('NP', 'NP', 'NPL'),
('NR', 'NR', 'NRU'),
('NU', 'NU', 'NIU'),
('NZ', 'NZ', 'NZL'),
('OM', 'OM', 'OMN'),
('PA', 'PA', 'PAN'),
('PE', 'PE', 'PER'),
('PF', 'PF', 'PYF'),
('PG', 'PG', 'PNG'),
('PH', 'PH', 'PHL'),
('PK', 'PK', 'PAK'),
('PL', 'PL', 'POL'),
('PM', 'PM', 'SPM'),
('PN', 'PN', 'PCN'),
('PS', 'PS', 'PSE'),
('PT', 'PT', 'PRT'),
('PW', 'PW', 'PLW'),
('PY', 'PY', 'PRY'),
('QA', 'QA', 'QAT'),
('RE', 'RE', 'REU'),
('RO', 'RO', 'ROU'),
('RS', 'RS', 'SRB'),
('RU', 'RU', 'RUS'),
('RW', 'RW', 'RWA'),
('SA', 'SA', 'SAU'),
('SB', 'SB', 'SLB'),
('SC', 'SC', 'SYC'),
('SD', 'SD', 'SDN'),
('SE', 'SE', 'SWE'),
('SG', 'SG', 'SGP'),
('SH', 'SH', 'SHN'),
('SI', 'SI', 'SVN'),
('SJ', 'SJ', 'SJM'),
('SK', 'SK', 'SVK'),
('SL', 'SL', 'SLE'),
('SM', 'SM', 'SMR'),
('SN', 'SN', 'SEN'),
('SO', 'SO', 'SOM'),
('SR', 'SR', 'SUR'),
('ST', 'ST', 'STP'),
('SV', 'SV', 'SLV'),
('SY', 'SY', 'SYR'),
('SZ', 'SZ', 'SWZ'),
('TC', 'TC', 'TCA'),
('TD', 'TD', 'TCD'),
('TF', 'TF', 'ATF'),
('TG', 'TG', 'TGO'),
('TH', 'TH', 'THA'),
('TJ', 'TJ', 'TJK'),
('TK', 'TK', 'TKL'),
('TL', 'TL', 'TLS'),
('TM', 'TM', 'TKM'),
('TN', 'TN', 'TUN'),
('TO', 'TO', 'TON'),
('TR', 'TR', 'TUR'),
('TT', 'TT', 'TTO'),
('TV', 'TV', 'TUV'),
('TW', 'TW', 'TWN'),
('TZ', 'TZ', 'TZA'),
('UA', 'UA', 'UKR'),
('UG', 'UG', 'UGA'),
('UM', 'UM', 'UMI'),
('US', 'US', 'USA'),
('UY', 'UY', 'URY'),
('UZ', 'UZ', 'UZB'),
('VA', 'VA', 'VAT'),
('VC', 'VC', 'VCT'),
('VE', 'VE', 'VEN'),
('VG', 'VG', 'VGB'),
('VI', 'VI', 'VIR'),
('VN', 'VN', 'VNM'),
('VU', 'VU', 'VUT'),
('WF', 'WF', 'WLF'),
('WS', 'WS', 'WSM'),
('YE', 'YE', 'YEM'),
('YT', 'YT', 'MYT'),
('ZA', 'ZA', 'ZAF'),
('ZM', 'ZM', 'ZMB'),
('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
CREATE TABLE IF NOT EXISTS `directory_country_format` (
  `country_format_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';

-- --------------------------------------------------------

--
-- Estrutura da tabela `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
CREATE TABLE IF NOT EXISTS `directory_country_region` (
  `region_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';

--
-- Extraindo dados da tabela `directory_country_region`
--

INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1, 'US', 'AL', 'Alabama'),
(2, 'US', 'AK', 'Alaska'),
(3, 'US', 'AS', 'American Samoa'),
(4, 'US', 'AZ', 'Arizona'),
(5, 'US', 'AR', 'Arkansas'),
(6, 'US', 'AE', 'Armed Forces Africa'),
(7, 'US', 'AA', 'Armed Forces Americas'),
(8, 'US', 'AE', 'Armed Forces Canada'),
(9, 'US', 'AE', 'Armed Forces Europe'),
(10, 'US', 'AE', 'Armed Forces Middle East'),
(11, 'US', 'AP', 'Armed Forces Pacific'),
(12, 'US', 'CA', 'California'),
(13, 'US', 'CO', 'Colorado'),
(14, 'US', 'CT', 'Connecticut'),
(15, 'US', 'DE', 'Delaware'),
(16, 'US', 'DC', 'District of Columbia'),
(17, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 'US', 'FL', 'Florida'),
(19, 'US', 'GA', 'Georgia'),
(20, 'US', 'GU', 'Guam'),
(21, 'US', 'HI', 'Hawaii'),
(22, 'US', 'ID', 'Idaho'),
(23, 'US', 'IL', 'Illinois'),
(24, 'US', 'IN', 'Indiana'),
(25, 'US', 'IA', 'Iowa'),
(26, 'US', 'KS', 'Kansas'),
(27, 'US', 'KY', 'Kentucky'),
(28, 'US', 'LA', 'Louisiana'),
(29, 'US', 'ME', 'Maine'),
(30, 'US', 'MH', 'Marshall Islands'),
(31, 'US', 'MD', 'Maryland'),
(32, 'US', 'MA', 'Massachusetts'),
(33, 'US', 'MI', 'Michigan'),
(34, 'US', 'MN', 'Minnesota'),
(35, 'US', 'MS', 'Mississippi'),
(36, 'US', 'MO', 'Missouri'),
(37, 'US', 'MT', 'Montana'),
(38, 'US', 'NE', 'Nebraska'),
(39, 'US', 'NV', 'Nevada'),
(40, 'US', 'NH', 'New Hampshire'),
(41, 'US', 'NJ', 'New Jersey'),
(42, 'US', 'NM', 'New Mexico'),
(43, 'US', 'NY', 'New York'),
(44, 'US', 'NC', 'North Carolina'),
(45, 'US', 'ND', 'North Dakota'),
(46, 'US', 'MP', 'Northern Mariana Islands'),
(47, 'US', 'OH', 'Ohio'),
(48, 'US', 'OK', 'Oklahoma'),
(49, 'US', 'OR', 'Oregon'),
(50, 'US', 'PW', 'Palau'),
(51, 'US', 'PA', 'Pennsylvania'),
(52, 'US', 'PR', 'Puerto Rico'),
(53, 'US', 'RI', 'Rhode Island'),
(54, 'US', 'SC', 'South Carolina'),
(55, 'US', 'SD', 'South Dakota'),
(56, 'US', 'TN', 'Tennessee'),
(57, 'US', 'TX', 'Texas'),
(58, 'US', 'UT', 'Utah'),
(59, 'US', 'VT', 'Vermont'),
(60, 'US', 'VI', 'Virgin Islands'),
(61, 'US', 'VA', 'Virginia'),
(62, 'US', 'WA', 'Washington'),
(63, 'US', 'WV', 'West Virginia'),
(64, 'US', 'WI', 'Wisconsin'),
(65, 'US', 'WY', 'Wyoming'),
(66, 'CA', 'AB', 'Alberta'),
(67, 'CA', 'BC', 'British Columbia'),
(68, 'CA', 'MB', 'Manitoba'),
(69, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 'CA', 'NB', 'New Brunswick'),
(71, 'CA', 'NS', 'Nova Scotia'),
(72, 'CA', 'NT', 'Northwest Territories'),
(73, 'CA', 'NU', 'Nunavut'),
(74, 'CA', 'ON', 'Ontario'),
(75, 'CA', 'PE', 'Prince Edward Island'),
(76, 'CA', 'QC', 'Quebec'),
(77, 'CA', 'SK', 'Saskatchewan'),
(78, 'CA', 'YT', 'Yukon Territory'),
(79, 'DE', 'NDS', 'Niedersachsen'),
(80, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 'DE', 'BAY', 'Bayern'),
(82, 'DE', 'BER', 'Berlin'),
(83, 'DE', 'BRG', 'Brandenburg'),
(84, 'DE', 'BRE', 'Bremen'),
(85, 'DE', 'HAM', 'Hamburg'),
(86, 'DE', 'HES', 'Hessen'),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 'DE', 'SAR', 'Saarland'),
(91, 'DE', 'SAS', 'Sachsen'),
(92, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 'DE', 'THE', 'Thüringen'),
(95, 'AT', 'WI', 'Wien'),
(96, 'AT', 'NO', 'Niederösterreich'),
(97, 'AT', 'OO', 'Oberösterreich'),
(98, 'AT', 'SB', 'Salzburg'),
(99, 'AT', 'KN', 'Kärnten'),
(100, 'AT', 'ST', 'Steiermark'),
(101, 'AT', 'TI', 'Tirol'),
(102, 'AT', 'BL', 'Burgenland'),
(103, 'AT', 'VB', 'Vorarlberg'),
(104, 'CH', 'AG', 'Aargau'),
(105, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 'CH', 'BE', 'Bern'),
(108, 'CH', 'BL', 'Basel-Landschaft'),
(109, 'CH', 'BS', 'Basel-Stadt'),
(110, 'CH', 'FR', 'Freiburg'),
(111, 'CH', 'GE', 'Genf'),
(112, 'CH', 'GL', 'Glarus'),
(113, 'CH', 'GR', 'Graubünden'),
(114, 'CH', 'JU', 'Jura'),
(115, 'CH', 'LU', 'Luzern'),
(116, 'CH', 'NE', 'Neuenburg'),
(117, 'CH', 'NW', 'Nidwalden'),
(118, 'CH', 'OW', 'Obwalden'),
(119, 'CH', 'SG', 'St. Gallen'),
(120, 'CH', 'SH', 'Schaffhausen'),
(121, 'CH', 'SO', 'Solothurn'),
(122, 'CH', 'SZ', 'Schwyz'),
(123, 'CH', 'TG', 'Thurgau'),
(124, 'CH', 'TI', 'Tessin'),
(125, 'CH', 'UR', 'Uri'),
(126, 'CH', 'VD', 'Waadt'),
(127, 'CH', 'VS', 'Wallis'),
(128, 'CH', 'ZG', 'Zug'),
(129, 'CH', 'ZH', 'Zürich'),
(130, 'ES', 'A Coruсa', 'A Coruña'),
(131, 'ES', 'Alava', 'Alava'),
(132, 'ES', 'Albacete', 'Albacete'),
(133, 'ES', 'Alicante', 'Alicante'),
(134, 'ES', 'Almeria', 'Almeria'),
(135, 'ES', 'Asturias', 'Asturias'),
(136, 'ES', 'Avila', 'Avila'),
(137, 'ES', 'Badajoz', 'Badajoz'),
(138, 'ES', 'Baleares', 'Baleares'),
(139, 'ES', 'Barcelona', 'Barcelona'),
(140, 'ES', 'Burgos', 'Burgos'),
(141, 'ES', 'Caceres', 'Caceres'),
(142, 'ES', 'Cadiz', 'Cadiz'),
(143, 'ES', 'Cantabria', 'Cantabria'),
(144, 'ES', 'Castellon', 'Castellon'),
(145, 'ES', 'Ceuta', 'Ceuta'),
(146, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 'ES', 'Cordoba', 'Cordoba'),
(148, 'ES', 'Cuenca', 'Cuenca'),
(149, 'ES', 'Girona', 'Girona'),
(150, 'ES', 'Granada', 'Granada'),
(151, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 'ES', 'Huelva', 'Huelva'),
(154, 'ES', 'Huesca', 'Huesca'),
(155, 'ES', 'Jaen', 'Jaen'),
(156, 'ES', 'La Rioja', 'La Rioja'),
(157, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 'ES', 'Leon', 'Leon'),
(159, 'ES', 'Lleida', 'Lleida'),
(160, 'ES', 'Lugo', 'Lugo'),
(161, 'ES', 'Madrid', 'Madrid'),
(162, 'ES', 'Malaga', 'Malaga'),
(163, 'ES', 'Melilla', 'Melilla'),
(164, 'ES', 'Murcia', 'Murcia'),
(165, 'ES', 'Navarra', 'Navarra'),
(166, 'ES', 'Ourense', 'Ourense'),
(167, 'ES', 'Palencia', 'Palencia'),
(168, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 'ES', 'Salamanca', 'Salamanca'),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 'ES', 'Segovia', 'Segovia'),
(172, 'ES', 'Sevilla', 'Sevilla'),
(173, 'ES', 'Soria', 'Soria'),
(174, 'ES', 'Tarragona', 'Tarragona'),
(175, 'ES', 'Teruel', 'Teruel'),
(176, 'ES', 'Toledo', 'Toledo'),
(177, 'ES', 'Valencia', 'Valencia'),
(178, 'ES', 'Valladolid', 'Valladolid'),
(179, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 'ES', 'Zamora', 'Zamora'),
(181, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 'FR', '1', 'Ain'),
(183, 'FR', '2', 'Aisne'),
(184, 'FR', '3', 'Allier'),
(185, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 'FR', '5', 'Hautes-Alpes'),
(187, 'FR', '6', 'Alpes-Maritimes'),
(188, 'FR', '7', 'Ardèche'),
(189, 'FR', '8', 'Ardennes'),
(190, 'FR', '9', 'Ariège'),
(191, 'FR', '10', 'Aube'),
(192, 'FR', '11', 'Aude'),
(193, 'FR', '12', 'Aveyron'),
(194, 'FR', '13', 'Bouches-du-Rhône'),
(195, 'FR', '14', 'Calvados'),
(196, 'FR', '15', 'Cantal'),
(197, 'FR', '16', 'Charente'),
(198, 'FR', '17', 'Charente-Maritime'),
(199, 'FR', '18', 'Cher'),
(200, 'FR', '19', 'Corrèze'),
(201, 'FR', '2A', 'Corse-du-Sud'),
(202, 'FR', '2B', 'Haute-Corse'),
(203, 'FR', '21', 'Côte-d\'Or'),
(204, 'FR', '22', 'Côtes-d\'Armor'),
(205, 'FR', '23', 'Creuse'),
(206, 'FR', '24', 'Dordogne'),
(207, 'FR', '25', 'Doubs'),
(208, 'FR', '26', 'Drôme'),
(209, 'FR', '27', 'Eure'),
(210, 'FR', '28', 'Eure-et-Loir'),
(211, 'FR', '29', 'Finistère'),
(212, 'FR', '30', 'Gard'),
(213, 'FR', '31', 'Haute-Garonne'),
(214, 'FR', '32', 'Gers'),
(215, 'FR', '33', 'Gironde'),
(216, 'FR', '34', 'Hérault'),
(217, 'FR', '35', 'Ille-et-Vilaine'),
(218, 'FR', '36', 'Indre'),
(219, 'FR', '37', 'Indre-et-Loire'),
(220, 'FR', '38', 'Isère'),
(221, 'FR', '39', 'Jura'),
(222, 'FR', '40', 'Landes'),
(223, 'FR', '41', 'Loir-et-Cher'),
(224, 'FR', '42', 'Loire'),
(225, 'FR', '43', 'Haute-Loire'),
(226, 'FR', '44', 'Loire-Atlantique'),
(227, 'FR', '45', 'Loiret'),
(228, 'FR', '46', 'Lot'),
(229, 'FR', '47', 'Lot-et-Garonne'),
(230, 'FR', '48', 'Lozère'),
(231, 'FR', '49', 'Maine-et-Loire'),
(232, 'FR', '50', 'Manche'),
(233, 'FR', '51', 'Marne'),
(234, 'FR', '52', 'Haute-Marne'),
(235, 'FR', '53', 'Mayenne'),
(236, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 'FR', '55', 'Meuse'),
(238, 'FR', '56', 'Morbihan'),
(239, 'FR', '57', 'Moselle'),
(240, 'FR', '58', 'Nièvre'),
(241, 'FR', '59', 'Nord'),
(242, 'FR', '60', 'Oise'),
(243, 'FR', '61', 'Orne'),
(244, 'FR', '62', 'Pas-de-Calais'),
(245, 'FR', '63', 'Puy-de-Dôme'),
(246, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 'FR', '65', 'Hautes-Pyrénées'),
(248, 'FR', '66', 'Pyrénées-Orientales'),
(249, 'FR', '67', 'Bas-Rhin'),
(250, 'FR', '68', 'Haut-Rhin'),
(251, 'FR', '69', 'Rhône'),
(252, 'FR', '70', 'Haute-Saône'),
(253, 'FR', '71', 'Saône-et-Loire'),
(254, 'FR', '72', 'Sarthe'),
(255, 'FR', '73', 'Savoie'),
(256, 'FR', '74', 'Haute-Savoie'),
(257, 'FR', '75', 'Paris'),
(258, 'FR', '76', 'Seine-Maritime'),
(259, 'FR', '77', 'Seine-et-Marne'),
(260, 'FR', '78', 'Yvelines'),
(261, 'FR', '79', 'Deux-Sèvres'),
(262, 'FR', '80', 'Somme'),
(263, 'FR', '81', 'Tarn'),
(264, 'FR', '82', 'Tarn-et-Garonne'),
(265, 'FR', '83', 'Var'),
(266, 'FR', '84', 'Vaucluse'),
(267, 'FR', '85', 'Vendée'),
(268, 'FR', '86', 'Vienne'),
(269, 'FR', '87', 'Haute-Vienne'),
(270, 'FR', '88', 'Vosges'),
(271, 'FR', '89', 'Yonne'),
(272, 'FR', '90', 'Territoire-de-Belfort'),
(273, 'FR', '91', 'Essonne'),
(274, 'FR', '92', 'Hauts-de-Seine'),
(275, 'FR', '93', 'Seine-Saint-Denis'),
(276, 'FR', '94', 'Val-de-Marne'),
(277, 'FR', '95', 'Val-d\'Oise'),
(278, 'RO', 'AB', 'Alba'),
(279, 'RO', 'AR', 'Arad'),
(280, 'RO', 'AG', 'Argeş'),
(281, 'RO', 'BC', 'Bacău'),
(282, 'RO', 'BH', 'Bihor'),
(283, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 'RO', 'BT', 'Botoşani'),
(285, 'RO', 'BV', 'Braşov'),
(286, 'RO', 'BR', 'Brăila'),
(287, 'RO', 'B', 'Bucureşti'),
(288, 'RO', 'BZ', 'Buzău'),
(289, 'RO', 'CS', 'Caraş-Severin'),
(290, 'RO', 'CL', 'Călăraşi'),
(291, 'RO', 'CJ', 'Cluj'),
(292, 'RO', 'CT', 'Constanţa'),
(293, 'RO', 'CV', 'Covasna'),
(294, 'RO', 'DB', 'Dâmboviţa'),
(295, 'RO', 'DJ', 'Dolj'),
(296, 'RO', 'GL', 'Galaţi'),
(297, 'RO', 'GR', 'Giurgiu'),
(298, 'RO', 'GJ', 'Gorj'),
(299, 'RO', 'HR', 'Harghita'),
(300, 'RO', 'HD', 'Hunedoara'),
(301, 'RO', 'IL', 'Ialomiţa'),
(302, 'RO', 'IS', 'Iaşi'),
(303, 'RO', 'IF', 'Ilfov'),
(304, 'RO', 'MM', 'Maramureş'),
(305, 'RO', 'MH', 'Mehedinţi'),
(306, 'RO', 'MS', 'Mureş'),
(307, 'RO', 'NT', 'Neamţ'),
(308, 'RO', 'OT', 'Olt'),
(309, 'RO', 'PH', 'Prahova'),
(310, 'RO', 'SM', 'Satu-Mare'),
(311, 'RO', 'SJ', 'Sălaj'),
(312, 'RO', 'SB', 'Sibiu'),
(313, 'RO', 'SV', 'Suceava'),
(314, 'RO', 'TR', 'Teleorman'),
(315, 'RO', 'TM', 'Timiş'),
(316, 'RO', 'TL', 'Tulcea'),
(317, 'RO', 'VS', 'Vaslui'),
(318, 'RO', 'VL', 'Vâlcea'),
(319, 'RO', 'VN', 'Vrancea'),
(320, 'FI', 'Lappi', 'Lappi'),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 'FI', 'Kainuu', 'Kainuu'),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 'FI', 'Satakunta', 'Satakunta'),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 'EE', 'EE-37', 'Harjumaa'),
(341, 'EE', 'EE-39', 'Hiiumaa'),
(342, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 'EE', 'EE-51', 'Järvamaa'),
(345, 'EE', 'EE-57', 'Läänemaa'),
(346, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 'EE', 'EE-65', 'Põlvamaa'),
(348, 'EE', 'EE-67', 'Pärnumaa'),
(349, 'EE', 'EE-70', 'Raplamaa'),
(350, 'EE', 'EE-74', 'Saaremaa'),
(351, 'EE', 'EE-78', 'Tartumaa'),
(352, 'EE', 'EE-82', 'Valgamaa'),
(353, 'EE', 'EE-84', 'Viljandimaa'),
(354, 'EE', 'EE-86', 'Võrumaa'),
(355, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 'LV', 'LV-JEL', 'Jelgava'),
(357, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 'LV', 'LV-LPX', 'Liepāja'),
(360, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 'LV', 'LV-RIX', 'Rīga'),
(363, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 'LV', 'Valmiera', 'Valmiera'),
(365, 'LV', 'LV-VEN', 'Ventspils'),
(366, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 'LV', 'Apes novads', 'Apes novads'),
(375, 'LV', 'Auces novads', 'Auces novads'),
(376, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 'LV', 'LV-BL', 'Balvu novads'),
(380, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 'LV', 'Engures novads', 'Engures novads'),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 'LV', 'LV-MA', 'Madonas novads'),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 'LV', 'LV-OG', 'Ogres novads'),
(427, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 'LV', 'Salas novads', 'Salas novads'),
(446, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 'LV', 'LV-SA', 'Saldus novads'),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 'LV', 'LV-TA', 'Talsu novads'),
(457, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 'LV', 'LV-VK', 'Valkas novads'),
(461, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 'BR', 'AC', 'Acre'),
(486, 'BR', 'AL', 'Alagoas'),
(487, 'BR', 'AP', 'Amapá'),
(488, 'BR', 'AM', 'Amazonas'),
(489, 'BR', 'BA', 'Bahia'),
(490, 'BR', 'CE', 'Ceará'),
(491, 'BR', 'ES', 'Espírito Santo'),
(492, 'BR', 'GO', 'Goiás'),
(493, 'BR', 'MA', 'Maranhão'),
(494, 'BR', 'MT', 'Mato Grosso'),
(495, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 'BR', 'MG', 'Minas Gerais'),
(497, 'BR', 'PA', 'Pará'),
(498, 'BR', 'PB', 'Paraíba'),
(499, 'BR', 'PR', 'Paraná'),
(500, 'BR', 'PE', 'Pernambuco'),
(501, 'BR', 'PI', 'Piauí'),
(502, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 'BR', 'RO', 'Rondônia'),
(506, 'BR', 'RR', 'Roraima'),
(507, 'BR', 'SC', 'Santa Catarina'),
(508, 'BR', 'SP', 'São Paulo'),
(509, 'BR', 'SE', 'Sergipe'),
(510, 'BR', 'TO', 'Tocantins'),
(511, 'BR', 'DF', 'Distrito Federal'),
(512, 'HR', 'HR-01', 'Zagrebačka županija'),
(513, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(514, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(515, 'HR', 'HR-04', 'Karlovačka županija'),
(516, 'HR', 'HR-05', 'Varaždinska županija'),
(517, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(518, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(519, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(520, 'HR', 'HR-09', 'Ličko-senjska županija'),
(521, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(522, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(523, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(524, 'HR', 'HR-13', 'Zadarska županija'),
(525, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(526, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(527, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(528, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(529, 'HR', 'HR-18', 'Istarska županija'),
(530, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(531, 'HR', 'HR-20', 'Međimurska županija'),
(532, 'HR', 'HR-21', 'Grad Zagreb'),
(533, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(534, 'IN', 'AP', 'Andhra Pradesh'),
(535, 'IN', 'AR', 'Arunachal Pradesh'),
(536, 'IN', 'AS', 'Assam'),
(537, 'IN', 'BR', 'Bihar'),
(538, 'IN', 'CH', 'Chandigarh'),
(539, 'IN', 'CT', 'Chhattisgarh'),
(540, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(541, 'IN', 'DD', 'Daman and Diu'),
(542, 'IN', 'DL', 'Delhi'),
(543, 'IN', 'GA', 'Goa'),
(544, 'IN', 'GJ', 'Gujarat'),
(545, 'IN', 'HR', 'Haryana'),
(546, 'IN', 'HP', 'Himachal Pradesh'),
(547, 'IN', 'JK', 'Jammu and Kashmir'),
(548, 'IN', 'JH', 'Jharkhand'),
(549, 'IN', 'KA', 'Karnataka'),
(550, 'IN', 'KL', 'Kerala'),
(551, 'IN', 'LD', 'Lakshadweep'),
(552, 'IN', 'MP', 'Madhya Pradesh'),
(553, 'IN', 'MH', 'Maharashtra'),
(554, 'IN', 'MN', 'Manipur'),
(555, 'IN', 'ML', 'Meghalaya'),
(556, 'IN', 'MZ', 'Mizoram'),
(557, 'IN', 'NL', 'Nagaland'),
(558, 'IN', 'OR', 'Odisha'),
(559, 'IN', 'PY', 'Puducherry'),
(560, 'IN', 'PB', 'Punjab'),
(561, 'IN', 'RJ', 'Rajasthan'),
(562, 'IN', 'SK', 'Sikkim'),
(563, 'IN', 'TN', 'Tamil Nadu'),
(564, 'IN', 'TG', 'Telangana'),
(565, 'IN', 'TR', 'Tripura'),
(566, 'IN', 'UP', 'Uttar Pradesh'),
(567, 'IN', 'UT', 'Uttarakhand'),
(568, 'IN', 'WB', 'West Bengal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
CREATE TABLE IF NOT EXISTS `directory_country_region_name` (
  `locale` varchar(8) NOT NULL COMMENT 'Locale',
  `region_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';

--
-- Extraindo dados da tabela `directory_country_region_name`
--

INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US', 1, 'Alabama'),
('en_US', 2, 'Alaska'),
('en_US', 3, 'American Samoa'),
('en_US', 4, 'Arizona'),
('en_US', 5, 'Arkansas'),
('en_US', 6, 'Armed Forces Africa'),
('en_US', 7, 'Armed Forces Americas'),
('en_US', 8, 'Armed Forces Canada'),
('en_US', 9, 'Armed Forces Europe'),
('en_US', 10, 'Armed Forces Middle East'),
('en_US', 11, 'Armed Forces Pacific'),
('en_US', 12, 'California'),
('en_US', 13, 'Colorado'),
('en_US', 14, 'Connecticut'),
('en_US', 15, 'Delaware'),
('en_US', 16, 'District of Columbia'),
('en_US', 17, 'Federated States Of Micronesia'),
('en_US', 18, 'Florida'),
('en_US', 19, 'Georgia'),
('en_US', 20, 'Guam'),
('en_US', 21, 'Hawaii'),
('en_US', 22, 'Idaho'),
('en_US', 23, 'Illinois'),
('en_US', 24, 'Indiana'),
('en_US', 25, 'Iowa'),
('en_US', 26, 'Kansas'),
('en_US', 27, 'Kentucky'),
('en_US', 28, 'Louisiana'),
('en_US', 29, 'Maine'),
('en_US', 30, 'Marshall Islands'),
('en_US', 31, 'Maryland'),
('en_US', 32, 'Massachusetts'),
('en_US', 33, 'Michigan'),
('en_US', 34, 'Minnesota'),
('en_US', 35, 'Mississippi'),
('en_US', 36, 'Missouri'),
('en_US', 37, 'Montana'),
('en_US', 38, 'Nebraska'),
('en_US', 39, 'Nevada'),
('en_US', 40, 'New Hampshire'),
('en_US', 41, 'New Jersey'),
('en_US', 42, 'New Mexico'),
('en_US', 43, 'New York'),
('en_US', 44, 'North Carolina'),
('en_US', 45, 'North Dakota'),
('en_US', 46, 'Northern Mariana Islands'),
('en_US', 47, 'Ohio'),
('en_US', 48, 'Oklahoma'),
('en_US', 49, 'Oregon'),
('en_US', 50, 'Palau'),
('en_US', 51, 'Pennsylvania'),
('en_US', 52, 'Puerto Rico'),
('en_US', 53, 'Rhode Island'),
('en_US', 54, 'South Carolina'),
('en_US', 55, 'South Dakota'),
('en_US', 56, 'Tennessee'),
('en_US', 57, 'Texas'),
('en_US', 58, 'Utah'),
('en_US', 59, 'Vermont'),
('en_US', 60, 'Virgin Islands'),
('en_US', 61, 'Virginia'),
('en_US', 62, 'Washington'),
('en_US', 63, 'West Virginia'),
('en_US', 64, 'Wisconsin'),
('en_US', 65, 'Wyoming'),
('en_US', 66, 'Alberta'),
('en_US', 67, 'British Columbia'),
('en_US', 68, 'Manitoba'),
('en_US', 69, 'Newfoundland and Labrador'),
('en_US', 70, 'New Brunswick'),
('en_US', 71, 'Nova Scotia'),
('en_US', 72, 'Northwest Territories'),
('en_US', 73, 'Nunavut'),
('en_US', 74, 'Ontario'),
('en_US', 75, 'Prince Edward Island'),
('en_US', 76, 'Quebec'),
('en_US', 77, 'Saskatchewan'),
('en_US', 78, 'Yukon Territory'),
('en_US', 79, 'Niedersachsen'),
('en_US', 80, 'Baden-Württemberg'),
('en_US', 81, 'Bayern'),
('en_US', 82, 'Berlin'),
('en_US', 83, 'Brandenburg'),
('en_US', 84, 'Bremen'),
('en_US', 85, 'Hamburg'),
('en_US', 86, 'Hessen'),
('en_US', 87, 'Mecklenburg-Vorpommern'),
('en_US', 88, 'Nordrhein-Westfalen'),
('en_US', 89, 'Rheinland-Pfalz'),
('en_US', 90, 'Saarland'),
('en_US', 91, 'Sachsen'),
('en_US', 92, 'Sachsen-Anhalt'),
('en_US', 93, 'Schleswig-Holstein'),
('en_US', 94, 'Thüringen'),
('en_US', 95, 'Wien'),
('en_US', 96, 'Niederösterreich'),
('en_US', 97, 'Oberösterreich'),
('en_US', 98, 'Salzburg'),
('en_US', 99, 'Kärnten'),
('en_US', 100, 'Steiermark'),
('en_US', 101, 'Tirol'),
('en_US', 102, 'Burgenland'),
('en_US', 103, 'Vorarlberg'),
('en_US', 104, 'Aargau'),
('en_US', 105, 'Appenzell Innerrhoden'),
('en_US', 106, 'Appenzell Ausserrhoden'),
('en_US', 107, 'Bern'),
('en_US', 108, 'Basel-Landschaft'),
('en_US', 109, 'Basel-Stadt'),
('en_US', 110, 'Freiburg'),
('en_US', 111, 'Genf'),
('en_US', 112, 'Glarus'),
('en_US', 113, 'Graubünden'),
('en_US', 114, 'Jura'),
('en_US', 115, 'Luzern'),
('en_US', 116, 'Neuenburg'),
('en_US', 117, 'Nidwalden'),
('en_US', 118, 'Obwalden'),
('en_US', 119, 'St. Gallen'),
('en_US', 120, 'Schaffhausen'),
('en_US', 121, 'Solothurn'),
('en_US', 122, 'Schwyz'),
('en_US', 123, 'Thurgau'),
('en_US', 124, 'Tessin'),
('en_US', 125, 'Uri'),
('en_US', 126, 'Waadt'),
('en_US', 127, 'Wallis'),
('en_US', 128, 'Zug'),
('en_US', 129, 'Zürich'),
('en_US', 130, 'A Coruña'),
('en_US', 131, 'Alava'),
('en_US', 132, 'Albacete'),
('en_US', 133, 'Alicante'),
('en_US', 134, 'Almeria'),
('en_US', 135, 'Asturias'),
('en_US', 136, 'Avila'),
('en_US', 137, 'Badajoz'),
('en_US', 138, 'Baleares'),
('en_US', 139, 'Barcelona'),
('en_US', 140, 'Burgos'),
('en_US', 141, 'Caceres'),
('en_US', 142, 'Cadiz'),
('en_US', 143, 'Cantabria'),
('en_US', 144, 'Castellon'),
('en_US', 145, 'Ceuta'),
('en_US', 146, 'Ciudad Real'),
('en_US', 147, 'Cordoba'),
('en_US', 148, 'Cuenca'),
('en_US', 149, 'Girona'),
('en_US', 150, 'Granada'),
('en_US', 151, 'Guadalajara'),
('en_US', 152, 'Guipuzcoa'),
('en_US', 153, 'Huelva'),
('en_US', 154, 'Huesca'),
('en_US', 155, 'Jaen'),
('en_US', 156, 'La Rioja'),
('en_US', 157, 'Las Palmas'),
('en_US', 158, 'Leon'),
('en_US', 159, 'Lleida'),
('en_US', 160, 'Lugo'),
('en_US', 161, 'Madrid'),
('en_US', 162, 'Malaga'),
('en_US', 163, 'Melilla'),
('en_US', 164, 'Murcia'),
('en_US', 165, 'Navarra'),
('en_US', 166, 'Ourense'),
('en_US', 167, 'Palencia'),
('en_US', 168, 'Pontevedra'),
('en_US', 169, 'Salamanca'),
('en_US', 170, 'Santa Cruz de Tenerife'),
('en_US', 171, 'Segovia'),
('en_US', 172, 'Sevilla'),
('en_US', 173, 'Soria'),
('en_US', 174, 'Tarragona'),
('en_US', 175, 'Teruel'),
('en_US', 176, 'Toledo'),
('en_US', 177, 'Valencia'),
('en_US', 178, 'Valladolid'),
('en_US', 179, 'Vizcaya'),
('en_US', 180, 'Zamora'),
('en_US', 181, 'Zaragoza'),
('en_US', 182, 'Ain'),
('en_US', 183, 'Aisne'),
('en_US', 184, 'Allier'),
('en_US', 185, 'Alpes-de-Haute-Provence'),
('en_US', 186, 'Hautes-Alpes'),
('en_US', 187, 'Alpes-Maritimes'),
('en_US', 188, 'Ardèche'),
('en_US', 189, 'Ardennes'),
('en_US', 190, 'Ariège'),
('en_US', 191, 'Aube'),
('en_US', 192, 'Aude'),
('en_US', 193, 'Aveyron'),
('en_US', 194, 'Bouches-du-Rhône'),
('en_US', 195, 'Calvados'),
('en_US', 196, 'Cantal'),
('en_US', 197, 'Charente'),
('en_US', 198, 'Charente-Maritime'),
('en_US', 199, 'Cher'),
('en_US', 200, 'Corrèze'),
('en_US', 201, 'Corse-du-Sud'),
('en_US', 202, 'Haute-Corse'),
('en_US', 203, 'Côte-d\'Or'),
('en_US', 204, 'Côtes-d\'Armor'),
('en_US', 205, 'Creuse'),
('en_US', 206, 'Dordogne'),
('en_US', 207, 'Doubs'),
('en_US', 208, 'Drôme'),
('en_US', 209, 'Eure'),
('en_US', 210, 'Eure-et-Loir'),
('en_US', 211, 'Finistère'),
('en_US', 212, 'Gard'),
('en_US', 213, 'Haute-Garonne'),
('en_US', 214, 'Gers'),
('en_US', 215, 'Gironde'),
('en_US', 216, 'Hérault'),
('en_US', 217, 'Ille-et-Vilaine'),
('en_US', 218, 'Indre'),
('en_US', 219, 'Indre-et-Loire'),
('en_US', 220, 'Isère'),
('en_US', 221, 'Jura'),
('en_US', 222, 'Landes'),
('en_US', 223, 'Loir-et-Cher'),
('en_US', 224, 'Loire'),
('en_US', 225, 'Haute-Loire'),
('en_US', 226, 'Loire-Atlantique'),
('en_US', 227, 'Loiret'),
('en_US', 228, 'Lot'),
('en_US', 229, 'Lot-et-Garonne'),
('en_US', 230, 'Lozère'),
('en_US', 231, 'Maine-et-Loire'),
('en_US', 232, 'Manche'),
('en_US', 233, 'Marne'),
('en_US', 234, 'Haute-Marne'),
('en_US', 235, 'Mayenne'),
('en_US', 236, 'Meurthe-et-Moselle'),
('en_US', 237, 'Meuse'),
('en_US', 238, 'Morbihan'),
('en_US', 239, 'Moselle'),
('en_US', 240, 'Nièvre'),
('en_US', 241, 'Nord'),
('en_US', 242, 'Oise'),
('en_US', 243, 'Orne'),
('en_US', 244, 'Pas-de-Calais'),
('en_US', 245, 'Puy-de-Dôme'),
('en_US', 246, 'Pyrénées-Atlantiques'),
('en_US', 247, 'Hautes-Pyrénées'),
('en_US', 248, 'Pyrénées-Orientales'),
('en_US', 249, 'Bas-Rhin'),
('en_US', 250, 'Haut-Rhin'),
('en_US', 251, 'Rhône'),
('en_US', 252, 'Haute-Saône'),
('en_US', 253, 'Saône-et-Loire'),
('en_US', 254, 'Sarthe'),
('en_US', 255, 'Savoie'),
('en_US', 256, 'Haute-Savoie'),
('en_US', 257, 'Paris'),
('en_US', 258, 'Seine-Maritime'),
('en_US', 259, 'Seine-et-Marne'),
('en_US', 260, 'Yvelines'),
('en_US', 261, 'Deux-Sèvres'),
('en_US', 262, 'Somme'),
('en_US', 263, 'Tarn'),
('en_US', 264, 'Tarn-et-Garonne'),
('en_US', 265, 'Var'),
('en_US', 266, 'Vaucluse'),
('en_US', 267, 'Vendée'),
('en_US', 268, 'Vienne'),
('en_US', 269, 'Haute-Vienne'),
('en_US', 270, 'Vosges'),
('en_US', 271, 'Yonne'),
('en_US', 272, 'Territoire-de-Belfort'),
('en_US', 273, 'Essonne'),
('en_US', 274, 'Hauts-de-Seine'),
('en_US', 275, 'Seine-Saint-Denis'),
('en_US', 276, 'Val-de-Marne'),
('en_US', 277, 'Val-d\'Oise'),
('en_US', 278, 'Alba'),
('en_US', 279, 'Arad'),
('en_US', 280, 'Argeş'),
('en_US', 281, 'Bacău'),
('en_US', 282, 'Bihor'),
('en_US', 283, 'Bistriţa-Năsăud'),
('en_US', 284, 'Botoşani'),
('en_US', 285, 'Braşov'),
('en_US', 286, 'Brăila'),
('en_US', 287, 'Bucureşti'),
('en_US', 288, 'Buzău'),
('en_US', 289, 'Caraş-Severin'),
('en_US', 290, 'Călăraşi'),
('en_US', 291, 'Cluj'),
('en_US', 292, 'Constanţa'),
('en_US', 293, 'Covasna'),
('en_US', 294, 'Dâmboviţa'),
('en_US', 295, 'Dolj'),
('en_US', 296, 'Galaţi'),
('en_US', 297, 'Giurgiu'),
('en_US', 298, 'Gorj'),
('en_US', 299, 'Harghita'),
('en_US', 300, 'Hunedoara'),
('en_US', 301, 'Ialomiţa'),
('en_US', 302, 'Iaşi'),
('en_US', 303, 'Ilfov'),
('en_US', 304, 'Maramureş'),
('en_US', 305, 'Mehedinţi'),
('en_US', 306, 'Mureş'),
('en_US', 307, 'Neamţ'),
('en_US', 308, 'Olt'),
('en_US', 309, 'Prahova'),
('en_US', 310, 'Satu-Mare'),
('en_US', 311, 'Sălaj'),
('en_US', 312, 'Sibiu'),
('en_US', 313, 'Suceava'),
('en_US', 314, 'Teleorman'),
('en_US', 315, 'Timiş'),
('en_US', 316, 'Tulcea'),
('en_US', 317, 'Vaslui'),
('en_US', 318, 'Vâlcea'),
('en_US', 319, 'Vrancea'),
('en_US', 320, 'Lappi'),
('en_US', 321, 'Pohjois-Pohjanmaa'),
('en_US', 322, 'Kainuu'),
('en_US', 323, 'Pohjois-Karjala'),
('en_US', 324, 'Pohjois-Savo'),
('en_US', 325, 'Etelä-Savo'),
('en_US', 326, 'Etelä-Pohjanmaa'),
('en_US', 327, 'Pohjanmaa'),
('en_US', 328, 'Pirkanmaa'),
('en_US', 329, 'Satakunta'),
('en_US', 330, 'Keski-Pohjanmaa'),
('en_US', 331, 'Keski-Suomi'),
('en_US', 332, 'Varsinais-Suomi'),
('en_US', 333, 'Etelä-Karjala'),
('en_US', 334, 'Päijät-Häme'),
('en_US', 335, 'Kanta-Häme'),
('en_US', 336, 'Uusimaa'),
('en_US', 337, 'Itä-Uusimaa'),
('en_US', 338, 'Kymenlaakso'),
('en_US', 339, 'Ahvenanmaa'),
('en_US', 340, 'Harjumaa'),
('en_US', 341, 'Hiiumaa'),
('en_US', 342, 'Ida-Virumaa'),
('en_US', 343, 'Jõgevamaa'),
('en_US', 344, 'Järvamaa'),
('en_US', 345, 'Läänemaa'),
('en_US', 346, 'Lääne-Virumaa'),
('en_US', 347, 'Põlvamaa'),
('en_US', 348, 'Pärnumaa'),
('en_US', 349, 'Raplamaa'),
('en_US', 350, 'Saaremaa'),
('en_US', 351, 'Tartumaa'),
('en_US', 352, 'Valgamaa'),
('en_US', 353, 'Viljandimaa'),
('en_US', 354, 'Võrumaa'),
('en_US', 355, 'Daugavpils'),
('en_US', 356, 'Jelgava'),
('en_US', 357, 'Jēkabpils'),
('en_US', 358, 'Jūrmala'),
('en_US', 359, 'Liepāja'),
('en_US', 360, 'Liepājas novads'),
('en_US', 361, 'Rēzekne'),
('en_US', 362, 'Rīga'),
('en_US', 363, 'Rīgas novads'),
('en_US', 364, 'Valmiera'),
('en_US', 365, 'Ventspils'),
('en_US', 366, 'Aglonas novads'),
('en_US', 367, 'Aizkraukles novads'),
('en_US', 368, 'Aizputes novads'),
('en_US', 369, 'Aknīstes novads'),
('en_US', 370, 'Alojas novads'),
('en_US', 371, 'Alsungas novads'),
('en_US', 372, 'Alūksnes novads'),
('en_US', 373, 'Amatas novads'),
('en_US', 374, 'Apes novads'),
('en_US', 375, 'Auces novads'),
('en_US', 376, 'Babītes novads'),
('en_US', 377, 'Baldones novads'),
('en_US', 378, 'Baltinavas novads'),
('en_US', 379, 'Balvu novads'),
('en_US', 380, 'Bauskas novads'),
('en_US', 381, 'Beverīnas novads'),
('en_US', 382, 'Brocēnu novads'),
('en_US', 383, 'Burtnieku novads'),
('en_US', 384, 'Carnikavas novads'),
('en_US', 385, 'Cesvaines novads'),
('en_US', 386, 'Ciblas novads'),
('en_US', 387, 'Cēsu novads'),
('en_US', 388, 'Dagdas novads'),
('en_US', 389, 'Daugavpils novads'),
('en_US', 390, 'Dobeles novads'),
('en_US', 391, 'Dundagas novads'),
('en_US', 392, 'Durbes novads'),
('en_US', 393, 'Engures novads'),
('en_US', 394, 'Garkalnes novads'),
('en_US', 395, 'Grobiņas novads'),
('en_US', 396, 'Gulbenes novads'),
('en_US', 397, 'Iecavas novads'),
('en_US', 398, 'Ikšķiles novads'),
('en_US', 399, 'Ilūkstes novads'),
('en_US', 400, 'Inčukalna novads'),
('en_US', 401, 'Jaunjelgavas novads'),
('en_US', 402, 'Jaunpiebalgas novads'),
('en_US', 403, 'Jaunpils novads'),
('en_US', 404, 'Jelgavas novads'),
('en_US', 405, 'Jēkabpils novads'),
('en_US', 406, 'Kandavas novads'),
('en_US', 407, 'Kokneses novads'),
('en_US', 408, 'Krimuldas novads'),
('en_US', 409, 'Krustpils novads'),
('en_US', 410, 'Krāslavas novads'),
('en_US', 411, 'Kuldīgas novads'),
('en_US', 412, 'Kārsavas novads'),
('en_US', 413, 'Lielvārdes novads'),
('en_US', 414, 'Limbažu novads'),
('en_US', 415, 'Lubānas novads'),
('en_US', 416, 'Ludzas novads'),
('en_US', 417, 'Līgatnes novads'),
('en_US', 418, 'Līvānu novads'),
('en_US', 419, 'Madonas novads'),
('en_US', 420, 'Mazsalacas novads'),
('en_US', 421, 'Mālpils novads'),
('en_US', 422, 'Mārupes novads'),
('en_US', 423, 'Naukšēnu novads'),
('en_US', 424, 'Neretas novads'),
('en_US', 425, 'Nīcas novads'),
('en_US', 426, 'Ogres novads'),
('en_US', 427, 'Olaines novads'),
('en_US', 428, 'Ozolnieku novads'),
('en_US', 429, 'Preiļu novads'),
('en_US', 430, 'Priekules novads'),
('en_US', 431, 'Priekuļu novads'),
('en_US', 432, 'Pārgaujas novads'),
('en_US', 433, 'Pāvilostas novads'),
('en_US', 434, 'Pļaviņu novads'),
('en_US', 435, 'Raunas novads'),
('en_US', 436, 'Riebiņu novads'),
('en_US', 437, 'Rojas novads'),
('en_US', 438, 'Ropažu novads'),
('en_US', 439, 'Rucavas novads'),
('en_US', 440, 'Rugāju novads'),
('en_US', 441, 'Rundāles novads'),
('en_US', 442, 'Rēzeknes novads'),
('en_US', 443, 'Rūjienas novads'),
('en_US', 444, 'Salacgrīvas novads'),
('en_US', 445, 'Salas novads'),
('en_US', 446, 'Salaspils novads'),
('en_US', 447, 'Saldus novads'),
('en_US', 448, 'Saulkrastu novads'),
('en_US', 449, 'Siguldas novads'),
('en_US', 450, 'Skrundas novads'),
('en_US', 451, 'Skrīveru novads'),
('en_US', 452, 'Smiltenes novads'),
('en_US', 453, 'Stopiņu novads'),
('en_US', 454, 'Strenču novads'),
('en_US', 455, 'Sējas novads'),
('en_US', 456, 'Talsu novads'),
('en_US', 457, 'Tukuma novads'),
('en_US', 458, 'Tērvetes novads'),
('en_US', 459, 'Vaiņodes novads'),
('en_US', 460, 'Valkas novads'),
('en_US', 461, 'Valmieras novads'),
('en_US', 462, 'Varakļānu novads'),
('en_US', 463, 'Vecpiebalgas novads'),
('en_US', 464, 'Vecumnieku novads'),
('en_US', 465, 'Ventspils novads'),
('en_US', 466, 'Viesītes novads'),
('en_US', 467, 'Viļakas novads'),
('en_US', 468, 'Viļānu novads'),
('en_US', 469, 'Vārkavas novads'),
('en_US', 470, 'Zilupes novads'),
('en_US', 471, 'Ādažu novads'),
('en_US', 472, 'Ērgļu novads'),
('en_US', 473, 'Ķeguma novads'),
('en_US', 474, 'Ķekavas novads'),
('en_US', 475, 'Alytaus Apskritis'),
('en_US', 476, 'Kauno Apskritis'),
('en_US', 477, 'Klaipėdos Apskritis'),
('en_US', 478, 'Marijampolės Apskritis'),
('en_US', 479, 'Panevėžio Apskritis'),
('en_US', 480, 'Šiaulių Apskritis'),
('en_US', 481, 'Tauragės Apskritis'),
('en_US', 482, 'Telšių Apskritis'),
('en_US', 483, 'Utenos Apskritis'),
('en_US', 484, 'Vilniaus Apskritis'),
('en_US', 485, 'Acre'),
('en_US', 486, 'Alagoas'),
('en_US', 487, 'Amapá'),
('en_US', 488, 'Amazonas'),
('en_US', 489, 'Bahia'),
('en_US', 490, 'Ceará'),
('en_US', 491, 'Espírito Santo'),
('en_US', 492, 'Goiás'),
('en_US', 493, 'Maranhão'),
('en_US', 494, 'Mato Grosso'),
('en_US', 495, 'Mato Grosso do Sul'),
('en_US', 496, 'Minas Gerais'),
('en_US', 497, 'Pará'),
('en_US', 498, 'Paraíba'),
('en_US', 499, 'Paraná'),
('en_US', 500, 'Pernambuco'),
('en_US', 501, 'Piauí'),
('en_US', 502, 'Rio de Janeiro'),
('en_US', 503, 'Rio Grande do Norte'),
('en_US', 504, 'Rio Grande do Sul'),
('en_US', 505, 'Rondônia'),
('en_US', 506, 'Roraima'),
('en_US', 507, 'Santa Catarina'),
('en_US', 508, 'São Paulo'),
('en_US', 509, 'Sergipe'),
('en_US', 510, 'Tocantins'),
('en_US', 511, 'Distrito Federal'),
('en_US', 512, 'Zagrebačka županija'),
('en_US', 513, 'Krapinsko-zagorska županija'),
('en_US', 514, 'Sisačko-moslavačka županija'),
('en_US', 515, 'Karlovačka županija'),
('en_US', 516, 'Varaždinska županija'),
('en_US', 517, 'Koprivničko-križevačka županija'),
('en_US', 518, 'Bjelovarsko-bilogorska županija'),
('en_US', 519, 'Primorsko-goranska županija'),
('en_US', 520, 'Ličko-senjska županija'),
('en_US', 521, 'Virovitičko-podravska županija'),
('en_US', 522, 'Požeško-slavonska županija'),
('en_US', 523, 'Brodsko-posavska županija'),
('en_US', 524, 'Zadarska županija'),
('en_US', 525, 'Osječko-baranjska županija'),
('en_US', 526, 'Šibensko-kninska županija'),
('en_US', 527, 'Vukovarsko-srijemska županija'),
('en_US', 528, 'Splitsko-dalmatinska županija'),
('en_US', 529, 'Istarska županija'),
('en_US', 530, 'Dubrovačko-neretvanska županija'),
('en_US', 531, 'Međimurska županija'),
('en_US', 532, 'Grad Zagreb'),
('en_US', 533, 'Andaman and Nicobar Islands'),
('en_US', 534, 'Andhra Pradesh'),
('en_US', 535, 'Arunachal Pradesh'),
('en_US', 536, 'Assam'),
('en_US', 537, 'Bihar'),
('en_US', 538, 'Chandigarh'),
('en_US', 539, 'Chhattisgarh'),
('en_US', 540, 'Dadra and Nagar Haveli'),
('en_US', 541, 'Daman and Diu'),
('en_US', 542, 'Delhi'),
('en_US', 543, 'Goa'),
('en_US', 544, 'Gujarat'),
('en_US', 545, 'Haryana'),
('en_US', 546, 'Himachal Pradesh'),
('en_US', 547, 'Jammu and Kashmir'),
('en_US', 548, 'Jharkhand'),
('en_US', 549, 'Karnataka'),
('en_US', 550, 'Kerala'),
('en_US', 551, 'Lakshadweep'),
('en_US', 552, 'Madhya Pradesh'),
('en_US', 553, 'Maharashtra'),
('en_US', 554, 'Manipur'),
('en_US', 555, 'Meghalaya'),
('en_US', 556, 'Mizoram'),
('en_US', 557, 'Nagaland'),
('en_US', 558, 'Odisha'),
('en_US', 559, 'Puducherry'),
('en_US', 560, 'Punjab'),
('en_US', 561, 'Rajasthan'),
('en_US', 562, 'Sikkim'),
('en_US', 563, 'Tamil Nadu'),
('en_US', 564, 'Telangana'),
('en_US', 565, 'Tripura'),
('en_US', 566, 'Uttar Pradesh'),
('en_US', 567, 'Uttarakhand'),
('en_US', 568, 'West Bengal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
CREATE TABLE IF NOT EXISTS `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';

--
-- Extraindo dados da tabela `directory_currency_rate`
--

INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR', 'EUR', '1.000000000000'),
('EUR', 'USD', '1.415000000000'),
('USD', 'EUR', '0.706700000000'),
('USD', 'USD', '1.000000000000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
CREATE TABLE IF NOT EXISTS `downloadable_link` (
  `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
CREATE TABLE IF NOT EXISTS `downloadable_link_price` (
  `price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
CREATE TABLE IF NOT EXISTS `downloadable_link_purchased` (
  `purchased_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
CREATE TABLE IF NOT EXISTS `downloadable_link_purchased_item` (
  `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
CREATE TABLE IF NOT EXISTS `downloadable_link_title` (
  `title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
CREATE TABLE IF NOT EXISTS `downloadable_sample` (
  `sample_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
CREATE TABLE IF NOT EXISTS `downloadable_sample_title` (
  `title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
CREATE TABLE IF NOT EXISTS `eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';

--
-- Extraindo dados da tabela `eav_attribute`
--

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1, 1, 'website_id', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website', 'static', NULL, NULL, 'select', 'Associate to Website', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website', 1, 0, NULL, 0, NULL),
(2, 1, 'store_id', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store', 'static', NULL, NULL, 'select', 'Create In', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store', 1, 0, NULL, 0, NULL),
(3, 1, 'created_in', NULL, NULL, 'static', NULL, NULL, 'text', 'Created From', NULL, NULL, 0, 0, NULL, 0, NULL),
(4, 1, 'prefix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(5, 1, 'firstname', NULL, NULL, 'static', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(6, 1, 'middlename', NULL, NULL, 'static', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(7, 1, 'lastname', NULL, NULL, 'static', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(8, 1, 'suffix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(9, 1, 'email', NULL, NULL, 'static', NULL, NULL, 'text', 'Email', NULL, NULL, 1, 0, NULL, 0, NULL),
(10, 1, 'group_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Group', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group', 1, 0, NULL, 0, NULL),
(11, 1, 'dob', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'static', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime', 'date', 'Date of Birth', NULL, NULL, 0, 0, NULL, 0, NULL),
(12, 1, 'password_hash', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password', 'static', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(13, 1, 'rp_token', NULL, NULL, 'static', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(14, 1, 'rp_token_created_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(15, 1, 'default_billing', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing', 'static', NULL, NULL, 'text', 'Default Billing Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(16, 1, 'default_shipping', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping', 'static', NULL, NULL, 'text', 'Default Shipping Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(17, 1, 'taxvat', NULL, NULL, 'static', NULL, NULL, 'text', 'Tax/VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(18, 1, 'confirmation', NULL, NULL, 'static', NULL, NULL, 'text', 'Is Confirmed', NULL, NULL, 0, 0, NULL, 0, NULL),
(19, 1, 'created_at', NULL, NULL, 'static', NULL, NULL, 'date', 'Created At', NULL, NULL, 0, 0, NULL, 0, NULL),
(20, 1, 'gender', NULL, NULL, 'static', NULL, NULL, 'select', 'Gender', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table', 0, 0, NULL, 0, NULL),
(21, 1, 'disable_auto_group_change', NULL, 'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean', 'static', NULL, NULL, 'boolean', 'Disable Automatic Group Change Based on VAT ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(22, 2, 'prefix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(23, 2, 'firstname', NULL, NULL, 'static', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(24, 2, 'middlename', NULL, NULL, 'static', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(25, 2, 'lastname', NULL, NULL, 'static', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(26, 2, 'suffix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(27, 2, 'company', NULL, NULL, 'static', NULL, NULL, 'text', 'Company', NULL, NULL, 0, 0, NULL, 0, NULL),
(28, 2, 'street', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend', 'static', NULL, NULL, 'multiline', 'Street Address', NULL, NULL, 1, 0, NULL, 0, NULL),
(29, 2, 'city', NULL, NULL, 'static', NULL, NULL, 'text', 'City', NULL, NULL, 1, 0, NULL, 0, NULL),
(30, 2, 'country_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Country', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country', 1, 0, NULL, 0, NULL),
(31, 2, 'region', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region', 'static', NULL, NULL, 'text', 'State/Province', NULL, NULL, 0, 0, NULL, 0, NULL),
(32, 2, 'region_id', NULL, NULL, 'static', NULL, NULL, 'hidden', 'State/Province', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region', 0, 0, NULL, 0, NULL),
(33, 2, 'postcode', NULL, NULL, 'static', NULL, NULL, 'text', 'Zip/Postal Code', NULL, NULL, 0, 0, NULL, 0, NULL),
(34, 2, 'telephone', NULL, NULL, 'static', NULL, NULL, 'text', 'Phone Number', NULL, NULL, 1, 0, NULL, 0, NULL),
(35, 2, 'fax', NULL, NULL, 'static', NULL, NULL, 'text', 'Fax', NULL, NULL, 0, 0, NULL, 0, NULL),
(36, 2, 'vat_id', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(37, 2, 'vat_is_valid', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validity', NULL, NULL, 0, 0, NULL, 0, NULL),
(38, 2, 'vat_request_id', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(39, 2, 'vat_request_date', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request date', NULL, NULL, 0, 0, NULL, 0, NULL),
(40, 2, 'vat_request_success', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request success', NULL, NULL, 0, 0, NULL, 0, NULL),
(41, 1, 'updated_at', NULL, NULL, 'static', NULL, NULL, 'date', 'Updated At', NULL, NULL, 0, 0, NULL, 0, NULL),
(42, 1, 'failures_num', NULL, NULL, 'static', NULL, NULL, 'hidden', 'Failures Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(43, 1, 'first_failure', NULL, NULL, 'static', NULL, NULL, 'date', 'First Failure Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(44, 1, 'lock_expires', NULL, NULL, 'static', NULL, NULL, 'date', 'Failures Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(45, 3, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(46, 3, 'is_active', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Active', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 1, 0, NULL, 0, NULL),
(47, 3, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(48, 3, 'image', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image', 'varchar', NULL, NULL, 'image', 'Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(49, 3, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Page Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(50, 3, 'meta_keywords', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(51, 3, 'meta_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(52, 3, 'display_mode', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Mode', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode', 0, 0, NULL, 0, NULL),
(53, 3, 'landing_page', NULL, NULL, 'int', NULL, NULL, 'select', 'CMS Block', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page', 0, 0, NULL, 0, NULL),
(54, 3, 'is_anchor', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Anchor', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, '1', 0, NULL),
(55, 3, 'path', NULL, NULL, 'static', NULL, NULL, 'text', 'Path', NULL, NULL, 0, 0, NULL, 0, NULL),
(56, 3, 'position', NULL, NULL, 'static', NULL, NULL, 'text', 'Position', NULL, NULL, 0, 0, NULL, 0, NULL),
(57, 3, 'all_children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(58, 3, 'path_in_store', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(59, 3, 'children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(60, 3, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'Magento\\Theme\\Model\\Theme\\Source\\Theme', 0, 0, NULL, 0, NULL),
(61, 3, 'custom_design_from', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime', 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(62, 3, 'custom_design_to', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(63, 3, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(64, 3, 'custom_layout_update', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(65, 3, 'level', NULL, NULL, 'static', NULL, NULL, 'text', 'Level', NULL, NULL, 0, 0, NULL, 0, NULL),
(66, 3, 'children_count', NULL, NULL, 'static', NULL, NULL, 'text', 'Children Count', NULL, NULL, 0, 0, NULL, 0, NULL),
(67, 3, 'available_sort_by', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby', 'text', NULL, NULL, 'multiselect', 'Available Product Listing Sort By', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby', 1, 0, NULL, 0, NULL),
(68, 3, 'default_sort_by', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby', 'varchar', NULL, NULL, 'select', 'Default Product Listing Sort By', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby', 1, 0, NULL, 0, NULL),
(69, 3, 'include_in_menu', NULL, NULL, 'int', NULL, NULL, 'select', 'Include in Navigation Menu', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 1, 0, '1', 0, NULL),
(70, 3, 'custom_use_parent_settings', NULL, NULL, 'int', NULL, NULL, 'select', 'Use Parent Category Settings', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(71, 3, 'custom_apply_to_products', NULL, NULL, 'int', NULL, NULL, 'select', 'Apply To Products', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(72, 3, 'filter_price_range', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Layered Navigation Price Step', NULL, NULL, 0, 0, NULL, 0, NULL),
(73, 4, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Product Name', 'validate-length maximum-length-255', NULL, 1, 0, NULL, 0, NULL),
(74, 4, 'sku', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku', 'static', NULL, NULL, 'text', 'SKU', 'validate-length maximum-length-64', NULL, 1, 0, NULL, 1, NULL),
(75, 4, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(76, 4, 'short_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Short Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(77, 4, 'price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Price', NULL, NULL, 1, 0, NULL, 0, NULL),
(78, 4, 'special_price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Special Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(79, 4, 'special_from_date', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Special Price From Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(80, 4, 'special_to_date', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Special Price To Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(81, 4, 'cost', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Cost', NULL, NULL, 0, 1, NULL, 0, NULL),
(82, 4, 'weight', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight', 'decimal', NULL, NULL, 'weight', 'Weight', NULL, NULL, 0, 0, NULL, 0, NULL),
(83, 4, 'manufacturer', NULL, NULL, 'int', NULL, NULL, 'select', 'Manufacturer', NULL, NULL, 0, 1, NULL, 0, NULL),
(84, 4, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Meta Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(85, 4, 'meta_keyword', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(86, 4, 'meta_description', NULL, NULL, 'varchar', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, 'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),
(87, 4, 'image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Base', NULL, NULL, 0, 0, NULL, 0, NULL),
(88, 4, 'small_image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Small', NULL, NULL, 0, 0, NULL, 0, NULL),
(89, 4, 'thumbnail', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Thumbnail', NULL, NULL, 0, 0, NULL, 0, NULL),
(90, 4, 'media_gallery', NULL, NULL, 'static', NULL, NULL, 'gallery', 'Media Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(91, 4, 'old_id', NULL, NULL, 'int', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(92, 4, 'tier_price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice', 'decimal', NULL, NULL, 'text', 'Tier Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(93, 4, 'color', NULL, NULL, 'int', NULL, NULL, 'select', 'Color', NULL, NULL, 0, 1, NULL, 0, NULL),
(94, 4, 'news_from_date', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Set Product as New from Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(95, 4, 'news_to_date', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Set Product as New to Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(96, 4, 'gallery', NULL, NULL, 'varchar', NULL, NULL, 'gallery', 'Image Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(97, 4, 'status', NULL, NULL, 'int', NULL, NULL, 'select', 'Enable Product', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status', 0, 0, '1', 0, NULL),
(98, 4, 'minimal_price', NULL, NULL, 'decimal', NULL, NULL, 'price', 'Minimal Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(99, 4, 'visibility', NULL, NULL, 'int', NULL, NULL, 'select', 'Visibility', NULL, 'Magento\\Catalog\\Model\\Product\\Visibility', 0, 0, '4', 0, NULL),
(100, 4, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'New Theme', NULL, 'Magento\\Theme\\Model\\Theme\\Source\\Theme', 0, 0, NULL, 0, NULL),
(101, 4, 'custom_design_from', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(102, 4, 'custom_design_to', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(103, 4, 'custom_layout_update', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Layout Update XML', NULL, NULL, 0, 0, NULL, 0, NULL),
(104, 4, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Layout', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(105, 4, 'category_ids', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category', 'static', NULL, NULL, 'text', 'Categories', NULL, NULL, 0, 0, NULL, 0, NULL),
(106, 4, 'options_container', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Product Options In', NULL, 'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container', 0, 0, 'container2', 0, NULL),
(107, 4, 'required_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(108, 4, 'has_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(109, 4, 'image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(110, 4, 'small_image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Small Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(111, 4, 'thumbnail_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Thumbnail Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(112, 4, 'created_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(113, 4, 'updated_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(114, 4, 'country_of_manufacture', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country of Manufacture', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture', 0, 0, NULL, 0, NULL),
(115, 4, 'quantity_and_stock_status', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock', 'int', NULL, NULL, 'select', 'Quantity', NULL, 'Magento\\CatalogInventory\\Model\\Source\\Stock', 0, 0, '1', 0, NULL),
(116, 4, 'custom_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'New Layout', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(117, 4, 'msrp', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Manufacturer\'s Suggested Retail Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(118, 4, 'msrp_display_actual_price_type', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean', 'varchar', NULL, NULL, 'select', 'Display Actual Price', NULL, 'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price', 0, 0, '0', 0, NULL),
(119, 3, 'url_key', NULL, NULL, 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(120, 3, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(121, 4, 'url_key', NULL, NULL, 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(122, 4, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(123, 4, 'links_purchased_separately', NULL, NULL, 'int', NULL, NULL, NULL, 'Links can be purchased separately', NULL, NULL, 1, 0, NULL, 0, NULL),
(124, 4, 'samples_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Samples title', NULL, NULL, 1, 0, NULL, 0, NULL),
(125, 4, 'links_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Links title', NULL, NULL, 1, 0, NULL, 0, NULL),
(126, 4, 'links_exist', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0', 0, NULL),
(127, 4, 'gift_message_available', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean', 'varchar', NULL, NULL, 'select', 'Allow Gift Message', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(128, 4, 'swatch_image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Swatch', NULL, NULL, 0, 0, NULL, 0, NULL),
(129, 4, 'tax_class_id', NULL, NULL, 'int', NULL, NULL, 'select', 'Tax Class', NULL, 'Magento\\Tax\\Model\\TaxClass\\Source\\Product', 0, 0, '2', 0, NULL),
(130, 4, 'price_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic Price', NULL, NULL, 1, 0, '0', 0, NULL),
(131, 4, 'sku_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic SKU', NULL, NULL, 1, 0, '0', 0, NULL),
(132, 4, 'weight_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic Weight', NULL, NULL, 1, 0, '0', 0, NULL),
(133, 4, 'price_view', NULL, NULL, 'int', NULL, NULL, 'select', 'Price View', NULL, 'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View', 1, 0, NULL, 0, NULL),
(134, 4, 'shipment_type', NULL, NULL, 'int', NULL, NULL, 'select', 'Ship Bundle Items', NULL, 'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type', 1, 0, '0', 0, NULL),
(135, 4, 'ts_dimensions_length', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Length', NULL, NULL, 0, 0, NULL, 0, NULL),
(136, 4, 'ts_dimensions_width', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Width', NULL, NULL, 0, 0, NULL, 0, NULL),
(137, 4, 'ts_dimensions_height', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Height', NULL, NULL, 0, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
CREATE TABLE IF NOT EXISTS `eav_attribute_group` (
  `attribute_group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Default Id',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';

--
-- Extraindo dados da tabela `eav_attribute_group`
--

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`, `attribute_group_code`, `tab_group_code`) VALUES
(1, 1, 'General', 1, 1, 'general', NULL),
(2, 2, 'General', 1, 1, 'general', NULL),
(3, 3, 'General', 10, 1, 'general', NULL),
(4, 3, 'General Information', 2, 0, 'general-information', NULL),
(5, 3, 'Display Settings', 20, 0, 'display-settings', NULL),
(6, 3, 'Custom Design', 30, 0, 'custom-design', NULL),
(7, 4, 'Product Details', 10, 1, 'product-details', 'basic'),
(8, 4, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(9, 4, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(10, 4, 'Images', 20, 0, 'image-management', 'basic'),
(11, 4, 'Design', 50, 0, 'design', 'advanced'),
(12, 4, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(13, 4, 'Content', 15, 0, 'content', 'basic'),
(14, 4, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(15, 5, 'General', 1, 1, 'general', NULL),
(16, 6, 'General', 1, 1, 'general', NULL),
(17, 7, 'General', 1, 1, 'general', NULL),
(18, 8, 'General', 1, 1, 'general', NULL),
(19, 4, 'Gift Options', 61, 0, 'gift-options', NULL),
(20, 4, 'Bundle Items', 16, 0, 'bundle-items', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
CREATE TABLE IF NOT EXISTS `eav_attribute_label` (
  `attribute_label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
CREATE TABLE IF NOT EXISTS `eav_attribute_option` (
  `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';

--
-- Extraindo dados da tabela `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 20, 0),
(2, 20, 1),
(3, 20, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_attribute_option_swatch`
--

DROP TABLE IF EXISTS `eav_attribute_option_swatch`;
CREATE TABLE IF NOT EXISTS `eav_attribute_option_swatch` (
  `swatch_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `type` smallint(5) UNSIGNED NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
CREATE TABLE IF NOT EXISTS `eav_attribute_option_value` (
  `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';

--
-- Extraindo dados da tabela `eav_attribute_option_value`
--

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female'),
(3, 3, 0, 'Not Specified');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
CREATE TABLE IF NOT EXISTS `eav_attribute_set` (
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';

--
-- Extraindo dados da tabela `eav_attribute_set`
--

INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1, 1, 'Default', 2),
(2, 2, 'Default', 2),
(3, 3, 'Default', 1),
(4, 4, 'Default', 1),
(5, 5, 'Default', 1),
(6, 6, 'Default', 1),
(7, 7, 'Default', 1),
(8, 8, 'Default', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
CREATE TABLE IF NOT EXISTS `eav_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
CREATE TABLE IF NOT EXISTS `eav_entity_attribute` (
  `entity_attribute_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';

--
-- Extraindo dados da tabela `eav_entity_attribute`
--

INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 10),
(2, 1, 1, 1, 2, 20),
(3, 1, 1, 1, 3, 20),
(4, 1, 1, 1, 4, 30),
(5, 1, 1, 1, 5, 40),
(6, 1, 1, 1, 6, 50),
(7, 1, 1, 1, 7, 60),
(8, 1, 1, 1, 8, 70),
(9, 1, 1, 1, 9, 80),
(10, 1, 1, 1, 10, 25),
(11, 1, 1, 1, 11, 90),
(12, 1, 1, 1, 12, 81),
(13, 1, 1, 1, 13, 115),
(14, 1, 1, 1, 14, 120),
(15, 1, 1, 1, 15, 82),
(16, 1, 1, 1, 16, 83),
(17, 1, 1, 1, 17, 100),
(18, 1, 1, 1, 18, 0),
(19, 1, 1, 1, 19, 0),
(20, 1, 1, 1, 20, 110),
(21, 1, 1, 1, 21, 28),
(22, 2, 2, 2, 22, 10),
(23, 2, 2, 2, 23, 20),
(24, 2, 2, 2, 24, 30),
(25, 2, 2, 2, 25, 40),
(26, 2, 2, 2, 26, 50),
(27, 2, 2, 2, 27, 60),
(28, 2, 2, 2, 28, 70),
(29, 2, 2, 2, 29, 80),
(30, 2, 2, 2, 30, 90),
(31, 2, 2, 2, 31, 100),
(32, 2, 2, 2, 32, 100),
(33, 2, 2, 2, 33, 110),
(34, 2, 2, 2, 34, 120),
(35, 2, 2, 2, 35, 130),
(36, 2, 2, 2, 36, 140),
(37, 2, 2, 2, 37, 132),
(38, 2, 2, 2, 38, 133),
(39, 2, 2, 2, 39, 134),
(40, 2, 2, 2, 40, 135),
(41, 1, 1, 1, 41, 87),
(42, 1, 1, 1, 42, 100),
(43, 1, 1, 1, 43, 110),
(44, 1, 1, 1, 44, 120),
(45, 3, 3, 4, 45, 1),
(46, 3, 3, 4, 46, 2),
(47, 3, 3, 4, 47, 4),
(48, 3, 3, 4, 48, 5),
(49, 3, 3, 4, 49, 6),
(50, 3, 3, 4, 50, 7),
(51, 3, 3, 4, 51, 8),
(52, 3, 3, 5, 52, 10),
(53, 3, 3, 5, 53, 20),
(54, 3, 3, 5, 54, 30),
(55, 3, 3, 4, 55, 12),
(56, 3, 3, 4, 56, 13),
(57, 3, 3, 4, 57, 14),
(58, 3, 3, 4, 58, 15),
(59, 3, 3, 4, 59, 16),
(60, 3, 3, 6, 60, 10),
(61, 3, 3, 6, 61, 30),
(62, 3, 3, 6, 62, 40),
(63, 3, 3, 6, 63, 50),
(64, 3, 3, 6, 64, 60),
(65, 3, 3, 4, 65, 24),
(66, 3, 3, 4, 66, 25),
(67, 3, 3, 5, 67, 40),
(68, 3, 3, 5, 68, 50),
(69, 3, 3, 4, 69, 10),
(70, 3, 3, 6, 70, 5),
(71, 3, 3, 6, 71, 6),
(72, 3, 3, 5, 72, 51),
(73, 4, 4, 7, 73, 10),
(74, 4, 4, 7, 74, 20),
(75, 4, 4, 13, 75, 90),
(76, 4, 4, 13, 76, 100),
(77, 4, 4, 7, 77, 30),
(78, 4, 4, 8, 78, 3),
(79, 4, 4, 8, 79, 4),
(80, 4, 4, 8, 80, 5),
(81, 4, 4, 8, 81, 6),
(82, 4, 4, 7, 82, 70),
(83, 4, 4, 9, 84, 20),
(84, 4, 4, 9, 85, 30),
(85, 4, 4, 9, 86, 40),
(86, 4, 4, 10, 87, 1),
(87, 4, 4, 10, 88, 2),
(88, 4, 4, 10, 89, 3),
(89, 4, 4, 10, 90, 4),
(90, 4, 4, 7, 91, 6),
(91, 4, 4, 8, 92, 7),
(92, 4, 4, 7, 94, 90),
(93, 4, 4, 7, 95, 100),
(94, 4, 4, 10, 96, 5),
(95, 4, 4, 7, 97, 5),
(96, 4, 4, 8, 98, 8),
(97, 4, 4, 7, 99, 80),
(98, 4, 4, 14, 100, 40),
(99, 4, 4, 14, 101, 20),
(100, 4, 4, 14, 102, 30),
(101, 4, 4, 11, 103, 10),
(102, 4, 4, 11, 104, 5),
(103, 4, 4, 7, 105, 80),
(104, 4, 4, 11, 106, 6),
(105, 4, 4, 7, 107, 14),
(106, 4, 4, 7, 108, 15),
(107, 4, 4, 7, 109, 16),
(108, 4, 4, 7, 110, 17),
(109, 4, 4, 7, 111, 18),
(110, 4, 4, 7, 112, 19),
(111, 4, 4, 7, 113, 20),
(112, 4, 4, 7, 114, 110),
(113, 4, 4, 7, 115, 60),
(114, 4, 4, 14, 116, 50),
(115, 4, 4, 8, 117, 9),
(116, 4, 4, 8, 118, 10),
(117, 3, 3, 4, 119, 3),
(118, 3, 3, 4, 120, 17),
(119, 4, 4, 9, 121, 10),
(120, 4, 4, 7, 122, 11),
(121, 4, 4, 7, 123, 111),
(122, 4, 4, 7, 124, 112),
(123, 4, 4, 7, 125, 113),
(124, 4, 4, 7, 126, 114),
(125, 4, 4, 19, 127, 10),
(126, 4, 4, 10, 128, 3),
(127, 4, 4, 7, 129, 40),
(128, 4, 4, 7, 130, 31),
(129, 4, 4, 7, 131, 21),
(130, 4, 4, 7, 132, 71),
(131, 4, 4, 8, 133, 11),
(132, 4, 4, 20, 134, 1),
(133, 4, 4, 7, 135, 65),
(134, 4, 4, 7, 136, 66),
(135, 4, 4, 7, 137, 67);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
CREATE TABLE IF NOT EXISTS `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
CREATE TABLE IF NOT EXISTS `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
CREATE TABLE IF NOT EXISTS `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
CREATE TABLE IF NOT EXISTS `eav_entity_store` (
  `entity_store_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
CREATE TABLE IF NOT EXISTS `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
CREATE TABLE IF NOT EXISTS `eav_entity_type` (
  `entity_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) UNSIGNED NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';

--
-- Extraindo dados da tabela `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'Magento\\Customer\\Model\\ResourceModel\\Customer', 'Magento\\Customer\\Model\\Attribute', 'customer_entity', NULL, NULL, 1, 'default', 1, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 0, 8, '0', 'customer_eav_attribute', 'Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),
(2, 'customer_address', 'Magento\\Customer\\Model\\ResourceModel\\Address', 'Magento\\Customer\\Model\\Attribute', 'customer_address_entity', NULL, NULL, 1, 'default', 2, NULL, 0, 8, '0', 'customer_eav_attribute', 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),
(3, 'catalog_category', 'Magento\\Catalog\\Model\\ResourceModel\\Category', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'catalog_category_entity', NULL, NULL, 1, 'default', 3, NULL, 0, 8, '0', 'catalog_eav_attribute', 'Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),
(4, 'catalog_product', 'Magento\\Catalog\\Model\\ResourceModel\\Product', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'catalog_product_entity', NULL, NULL, 1, 'default', 4, NULL, 0, 8, '0', 'catalog_eav_attribute', 'Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),
(5, 'order', 'Magento\\Sales\\Model\\ResourceModel\\Order', NULL, 'sales_order', NULL, NULL, 1, 'default', 5, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(6, 'invoice', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Invoice', NULL, 'sales_invoice', NULL, NULL, 1, 'default', 6, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(7, 'creditmemo', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo', NULL, 'sales_creditmemo', NULL, NULL, 1, 'default', 7, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(8, 'shipment', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment', NULL, 'sales_shipment', NULL, NULL, 1, 'default', 8, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
CREATE TABLE IF NOT EXISTS `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
CREATE TABLE IF NOT EXISTS `eav_form_element` (
  `element_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';

--
-- Extraindo dados da tabela `eav_form_element`
--

INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, NULL, 23, 0),
(2, 1, NULL, 25, 1),
(3, 1, NULL, 27, 2),
(4, 1, NULL, 9, 3),
(5, 1, NULL, 28, 4),
(6, 1, NULL, 29, 5),
(7, 1, NULL, 31, 6),
(8, 1, NULL, 33, 7),
(9, 1, NULL, 30, 8),
(10, 1, NULL, 34, 9),
(11, 1, NULL, 35, 10),
(12, 2, NULL, 23, 0),
(13, 2, NULL, 25, 1),
(14, 2, NULL, 27, 2),
(15, 2, NULL, 9, 3),
(16, 2, NULL, 28, 4),
(17, 2, NULL, 29, 5),
(18, 2, NULL, 31, 6),
(19, 2, NULL, 33, 7),
(20, 2, NULL, 30, 8),
(21, 2, NULL, 34, 9),
(22, 2, NULL, 35, 10),
(23, 3, NULL, 23, 0),
(24, 3, NULL, 25, 1),
(25, 3, NULL, 27, 2),
(26, 3, NULL, 28, 3),
(27, 3, NULL, 29, 4),
(28, 3, NULL, 31, 5),
(29, 3, NULL, 33, 6),
(30, 3, NULL, 30, 7),
(31, 3, NULL, 34, 8),
(32, 3, NULL, 35, 9),
(33, 4, NULL, 23, 0),
(34, 4, NULL, 25, 1),
(35, 4, NULL, 27, 2),
(36, 4, NULL, 28, 3),
(37, 4, NULL, 29, 4),
(38, 4, NULL, 31, 5),
(39, 4, NULL, 33, 6),
(40, 4, NULL, 30, 7),
(41, 4, NULL, 34, 8),
(42, 4, NULL, 35, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
CREATE TABLE IF NOT EXISTS `eav_form_fieldset` (
  `fieldset_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
CREATE TABLE IF NOT EXISTS `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
CREATE TABLE IF NOT EXISTS `eav_form_type` (
  `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';

--
-- Extraindo dados da tabela `eav_form_type`
--

INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0),
(2, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0),
(3, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0),
(4, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
CREATE TABLE IF NOT EXISTS `eav_form_type_entity` (
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';

--
-- Extraindo dados da tabela `eav_form_type_entity`
--

INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_abandoned_cart`
--

DROP TABLE IF EXISTS `email_abandoned_cart`;
CREATE TABLE IF NOT EXISTS `email_abandoned_cart` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `quote_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Quote Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Email',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Quote Active',
  `quote_updated_at` timestamp NULL DEFAULT NULL COMMENT 'Quote updated at',
  `abandoned_cart_number` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Abandoned Cart number',
  `items_count` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Quote items count',
  `items_ids` varchar(255) DEFAULT NULL COMMENT 'Quote item ids',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated at',
  PRIMARY KEY (`id`),
  KEY `EMAIL_ABANDONED_CART_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_ABANDONED_CART_STORE_ID` (`store_id`),
  KEY `EMAIL_ABANDONED_CART_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_ABANDONED_CART_EMAIL` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Abandoned Carts Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_automation`
--

DROP TABLE IF EXISTS `email_automation`;
CREATE TABLE IF NOT EXISTS `email_automation` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `automation_type` varchar(255) DEFAULT NULL COMMENT 'Automation Type',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Automation Type',
  `enrolment_status` varchar(255) NOT NULL COMMENT 'Entrolment Status',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `type_id` varchar(255) DEFAULT NULL COMMENT 'Type ID',
  `program_id` varchar(255) DEFAULT NULL COMMENT 'Program ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `message` varchar(255) NOT NULL COMMENT 'Message',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_AUTOMATION_AUTOMATION_TYPE` (`automation_type`),
  KEY `EMAIL_AUTOMATION_ENROLMENT_STATUS` (`enrolment_status`),
  KEY `EMAIL_AUTOMATION_TYPE_ID` (`type_id`),
  KEY `EMAIL_AUTOMATION_EMAIL` (`email`),
  KEY `EMAIL_AUTOMATION_PROGRAM_ID` (`program_id`),
  KEY `EMAIL_AUTOMATION_CREATED_AT` (`created_at`),
  KEY `EMAIL_AUTOMATION_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_AUTOMATION_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Automation Status';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_campaign`
--

DROP TABLE IF EXISTS `email_campaign`;
CREATE TABLE IF NOT EXISTS `email_campaign` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `campaign_id` int(10) UNSIGNED NOT NULL COMMENT 'Campaign ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Contact Email',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer ID',
  `sent_at` timestamp NULL DEFAULT NULL COMMENT 'Send Date',
  `order_increment_id` varchar(50) NOT NULL COMMENT 'Order Increment ID',
  `quote_id` int(10) UNSIGNED NOT NULL COMMENT 'Sales Quote ID',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT 'Error Message',
  `checkout_method` varchar(255) NOT NULL DEFAULT '' COMMENT 'Checkout Method Used',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `event_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Name',
  `send_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Send Id',
  `send_status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Campaign send status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CAMPAIGN_STORE_ID` (`store_id`),
  KEY `EMAIL_CAMPAIGN_CAMPAIGN_ID` (`campaign_id`),
  KEY `EMAIL_CAMPAIGN_EMAIL` (`email`),
  KEY `EMAIL_CAMPAIGN_SEND_ID` (`send_id`),
  KEY `EMAIL_CAMPAIGN_SEND_STATUS` (`send_status`),
  KEY `EMAIL_CAMPAIGN_CREATED_AT` (`created_at`),
  KEY `EMAIL_CAMPAIGN_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_CAMPAIGN_SENT_AT` (`sent_at`),
  KEY `EMAIL_CAMPAIGN_EVENT_NAME` (`event_name`),
  KEY `EMAIL_CAMPAIGN_MESSAGE` (`message`),
  KEY `EMAIL_CAMPAIGN_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_CAMPAIGN_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Campaigns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_catalog`
--

DROP TABLE IF EXISTS `email_catalog`;
CREATE TABLE IF NOT EXISTS `email_catalog` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `imported` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Product Imported',
  `modified` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Product Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CATALOG_PRODUCT_ID` (`product_id`),
  KEY `EMAIL_CATALOG_IMPORTED` (`imported`),
  KEY `EMAIL_CATALOG_MODIFIED` (`modified`),
  KEY `EMAIL_CATALOG_CREATED_AT` (`created_at`),
  KEY `EMAIL_CATALOG_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Connector Catalog';

--
-- Extraindo dados da tabela `email_catalog`
--

INSERT INTO `email_catalog` (`id`, `product_id`, `imported`, `modified`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, '2022-04-29 18:33:36', '2022-04-29 18:33:36'),
(2, 2, NULL, NULL, '2022-05-09 14:24:24', '2022-05-09 14:24:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_contact`
--

DROP TABLE IF EXISTS `email_contact`;
CREATE TABLE IF NOT EXISTS `email_contact` (
  `email_contact_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `is_guest` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Guest',
  `contact_id` varchar(15) DEFAULT NULL COMMENT 'Connector Contact ID',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer ID',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Customer Email',
  `is_subscriber` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Subscriber',
  `subscriber_status` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Subscriber status',
  `email_imported` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Imported',
  `subscriber_imported` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Subscriber Imported',
  `suppressed` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Suppressed',
  PRIMARY KEY (`email_contact_id`),
  KEY `EMAIL_CONTACT_EMAIL_CONTACT_ID` (`email_contact_id`),
  KEY `EMAIL_CONTACT_IS_GUEST` (`is_guest`),
  KEY `EMAIL_CONTACT_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_CONTACT_WEBSITE_ID` (`website_id`),
  KEY `EMAIL_CONTACT_IS_SUBSCRIBER` (`is_subscriber`),
  KEY `EMAIL_CONTACT_SUBSCRIBER_STATUS` (`subscriber_status`),
  KEY `EMAIL_CONTACT_EMAIL_IMPORTED` (`email_imported`),
  KEY `EMAIL_CONTACT_SUBSCRIBER_IMPORTED` (`subscriber_imported`),
  KEY `EMAIL_CONTACT_SUPPRESSED` (`suppressed`),
  KEY `EMAIL_CONTACT_EMAIL` (`email`),
  KEY `EMAIL_CONTACT_CONTACT_ID` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Contacts';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_contact_consent`
--

DROP TABLE IF EXISTS `email_contact_consent`;
CREATE TABLE IF NOT EXISTS `email_contact_consent` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `email_contact_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Email Contact Id',
  `consent_url` varchar(255) DEFAULT NULL COMMENT 'Contact consent url',
  `consent_datetime` datetime DEFAULT NULL COMMENT 'Contact consent datetime',
  `consent_ip` varchar(255) DEFAULT NULL COMMENT 'Contact consent ip',
  `consent_user_agent` varchar(255) DEFAULT NULL COMMENT 'Contact consent user agent',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CONTACT_CONSENT_EMAIL_CONTACT_ID` (`email_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email contact consent table.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_failed_auth`
--

DROP TABLE IF EXISTS `email_failed_auth`;
CREATE TABLE IF NOT EXISTS `email_failed_auth` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `failures_num` int(10) UNSIGNED DEFAULT NULL COMMENT 'Number of fails',
  `first_attempt_date` datetime DEFAULT NULL COMMENT 'First attempt date',
  `last_attempt_date` datetime DEFAULT NULL COMMENT 'Last attempt date',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `store_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  PRIMARY KEY (`id`),
  KEY `EMAIL_AUTH_EDC_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Failed Auth Table.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_importer`
--

DROP TABLE IF EXISTS `email_importer`;
CREATE TABLE IF NOT EXISTS `email_importer` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `import_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Type',
  `website_id` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `import_status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Import Status',
  `import_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Id',
  `import_data` mediumblob NOT NULL COMMENT 'Import Data',
  `import_mode` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Mode',
  `import_file` text NOT NULL COMMENT 'Import File',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT 'Error Message',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `import_started` timestamp NULL DEFAULT NULL COMMENT 'Import Started',
  `import_finished` timestamp NULL DEFAULT NULL COMMENT 'Import Finished',
  PRIMARY KEY (`id`),
  KEY `EMAIL_IMPORTER_IMPORT_TYPE` (`import_type`),
  KEY `EMAIL_IMPORTER_WEBSITE_ID` (`website_id`),
  KEY `EMAIL_IMPORTER_IMPORT_STATUS` (`import_status`),
  KEY `EMAIL_IMPORTER_IMPORT_MODE` (`import_mode`),
  KEY `EMAIL_IMPORTER_CREATED_AT` (`created_at`),
  KEY `EMAIL_IMPORTER_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_IMPORTER_IMPORT_ID` (`import_id`),
  KEY `EMAIL_IMPORTER_IMPORT_STARTED` (`import_started`),
  KEY `EMAIL_IMPORTER_IMPORT_FINISHED` (`import_finished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Importer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_order`
--

DROP TABLE IF EXISTS `email_order`;
CREATE TABLE IF NOT EXISTS `email_order` (
  `email_order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order ID',
  `order_status` varchar(255) NOT NULL COMMENT 'Order Status',
  `quote_id` int(10) UNSIGNED NOT NULL COMMENT 'Sales Quote ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `email_imported` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Order Imported',
  `modified` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Order Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`email_order_id`),
  KEY `EMAIL_ORDER_STORE_ID` (`store_id`),
  KEY `EMAIL_ORDER_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_ORDER_EMAIL_IMPORTED` (`email_imported`),
  KEY `EMAIL_ORDER_ORDER_STATUS` (`order_status`),
  KEY `EMAIL_ORDER_MODIFIED` (`modified`),
  KEY `EMAIL_ORDER_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_ORDER_CREATED_AT` (`created_at`),
  KEY `EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transactional Order Data';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_review`
--

DROP TABLE IF EXISTS `email_review`;
CREATE TABLE IF NOT EXISTS `email_review` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `review_id` int(10) UNSIGNED NOT NULL COMMENT 'Review Id',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `review_imported` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Review Imported',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_REVIEW_REVIEW_ID` (`review_id`),
  KEY `EMAIL_REVIEW_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_REVIEW_STORE_ID` (`store_id`),
  KEY `EMAIL_REVIEW_REVIEW_IMPORTED` (`review_imported`),
  KEY `EMAIL_REVIEW_CREATED_AT` (`created_at`),
  KEY `EMAIL_REVIEW_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Reviews';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_rules`
--

DROP TABLE IF EXISTS `email_rules`;
CREATE TABLE IF NOT EXISTS `email_rules` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Rule Name',
  `website_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Rule Type',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `combination` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rule Condition',
  `conditions` blob NOT NULL COMMENT 'Rule Conditions',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Rules';

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_template`
--

DROP TABLE IF EXISTS `email_template`;
CREATE TABLE IF NOT EXISTS `email_template` (
  `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) UNSIGNED DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Email Templates';

--
-- Extraindo dados da tabela `email_template`
--

INSERT INTO `email_template` (`template_id`, `template_code`, `template_text`, `template_styles`, `template_type`, `template_subject`, `template_sender_name`, `template_sender_email`, `added_at`, `modified_at`, `orig_template_code`, `orig_template_variables`) VALUES
(1, 'New Pickup Order', '<!--@subject {{trans \"Your %store_name order confirmation\" store_name=$store.getFrontendName()}} @-->\n<!--@vars {\n\"var order.getCustomerName()\":\"Customer Name\",\n\"var store.getFrontendName()\":\"Customer Name\",\n\"var is_pickup_order\":\"Check if order is a pickup order\",\n\"var $this.getUrl($store,\'customer/account/\',[_nosid:1]) |raw\":\"Gets the link to the Customer Account\",\n\"var store_email |raw\":\"Defined Email Address for this type of mails\",\n\"var store_phone |raw\":\"Defined Phone Number in the Store Information\",\n\"var store_hours |raw\":\"Defined Opening Hours Phone Number in the Store Information\",\n\"var order.increment_id |raw\":\"Order Id\",\n\"var order.getCreatedAtFormatted(2) |raw\":\"Get the date of order creation\",\n\"var order.getEmailCustomerNote()\":\"Email Order Note\",\n\"var formattedBillingAddress|raw\":\"Billing Address\",\n\"var order.getIsNotVirtual()\":\"Check if shipment exists\",\n\"var pickupAddress|raw\":\"Pickup Location Address\",\n\"var formattedShippingAddress|raw\":\"Customer Shipping Address\",\n\"var payment_html|raw\":\"Payment Details\",\n\"var order.getShippingDescription()\":\"Shipping Description\",\n\"var shipping_msg\":\"Shipping message\",\n\"layout handle=\\\"sales_email_order_items\\\" order=$order area=\\\"frontend\\\"\":\"Order Items Grid\"\n} @-->\n\n{{template config_path=\"design/email/header_template\"}}\n\n<table>\n    <tr class=\"email-intro\">\n        <td>\n            <p class=\"greeting\">{{trans \"%customer_name,\" customer_name=$order.getCustomerName()}}</p>\n            <p>\n                {{trans \"Thank you for your order from %store_name.\" store_name=$store.getFrontendName()}}\n                {{if is_pickup_order}}\n                    {{trans \"We will send you a notification once your items are ready for pickup.\"}}\n                {{else}}\n                    {{trans \"Once your package ships we will send you a tracking number.\"}}\n                {{/if}}\n                {{trans \'You can check the status of your order by <a href=\"%account_url\">logging into your account</a>.\' account_url=$this.getUrl($store,\'customer/account/\',[_nosid:1]) |raw}}\n            </p>\n            <p>\n                {{trans \'If you have questions about your order, you can email us at <a href=\"mailto:%store_email\">%store_email</a>\' store_email=$store_email |raw}}{{depend store_phone}} {{trans \' or call us at <a href=\"tel:%store_phone\">%store_phone</a>\' store_phone=$store_phone |raw}}{{/depend}}.\n                {{depend store_hours}}\n                {{trans \'Our hours are <span class=\"no-link\">%store_hours</span>.\' store_hours=$store_hours |raw}}\n                {{/depend}}\n            </p>\n        </td>\n    </tr>\n    <tr class=\"email-summary\">\n        <td>\n            <h1>{{trans \'Your Order <span class=\"no-link\">#%increment_id</span>\' increment_id=$order.increment_id |raw}}</h1>\n            <p>{{trans \'Placed on <span class=\"no-link\">%created_at</span>\' created_at=$order.getCreatedAtFormatted(2) |raw}}</p>\n        </td>\n    </tr>\n    <tr class=\"email-information\">\n        <td>\n            {{depend order.getEmailCustomerNote()}}\n            <table class=\"message-info\">\n                <tr>\n                    <td>\n                        {{var order.getEmailCustomerNote()|escape|nl2br}}\n                    </td>\n                </tr>\n            </table>\n            {{/depend}}\n            <table class=\"order-details\">\n                <tr>\n                    <td class=\"address-details\">\n                        <h3>{{trans \"Billing Info\"}}</h3>\n                        <p>{{var formattedBillingAddress|raw}}</p>\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class=\"address-details\">\n                        <h3>{{trans \"Shipping Info\"}}</h3>\n                        {{if is_pickup_order}}\n                            <h4>{{trans \"Pickup Location\"}}</h4>\n                            <p>{{var pickupAddress|raw}}</p>\n                            <h4>{{trans \"Recipient Address\"}}</h4>\n                        {{/if}}\n                        <p>{{var formattedShippingAddress|raw}}</p>\n                    </td>\n                    {{/depend}}\n                </tr>\n                <tr>\n                    <td class=\"method-info\">\n                        <h3>{{trans \"Payment Method\"}}</h3>\n                        {{var payment_html|raw}}\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class=\"method-info\">\n                        <h3>{{trans \"Shipping Method\"}}</h3>\n                        <p>{{var order.getShippingDescription()}}</p>\n                        {{if shipping_msg}}\n                        <p>{{var shipping_msg}}</p>\n                        {{/if}}\n                    </td>\n                    {{/depend}}\n                </tr>\n            </table>\n            {{layout handle=\"sales_email_order_items\" order=$order area=\"frontend\"}}\n        </td>\n    </tr>\n</table>\n\n{{template config_path=\"design/email/footer_template\"}}\n', NULL, 2, '{{trans \"Your %store_name order confirmation\" store_name=$store.getFrontendName()}}', NULL, NULL, '2022-04-29 16:57:45', '2022-04-29 16:57:45', 'sales_email_order_template', '{\"var formattedBillingAddress|raw\":\"Billing Address\",\"var order.getEmailCustomerNote()\":\"Email Order Note\",\"var order.increment_id\":\"Order Id\",\"layout handle=\\\"sales_email_order_items\\\" order=$order area=\\\"frontend\\\"\":\"Order Items Grid\",\"var payment_html|raw\":\"Payment Details\",\"var formattedShippingAddress|raw\":\"Shipping Address\",\"var order.getShippingDescription()\":\"Shipping Description\",\"var shipping_msg\":\"Shipping message\"}'),
(2, 'New Pickup Order For Guest', '<!--@subject {{trans \"Your %store_name order confirmation\" store_name=$store.getFrontendName()}} @-->\n<!--@vars {\n\"var order.getBillingAddress().getName()\":\"Guest Customer Name\",\n\"var store.getFrontendName()\":\"Customer Name\",\n\"var is_pickup_order\":\"Check if order is a pickup order\",\n\"var store_email |raw\":\"Defined Email Address for this type of mails\",\n\"var store_phone |raw\":\"Defined Phone Number in the Store Information\",\n\"var store_hours |raw\":\"Defined Opening Hours Phone Number in the Store Information\",\n\"var order.increment_id |raw\":\"Order Id\",\n\"var order.getCreatedAtFormatted(2) |raw\":\"Get the date of order creation\",\n\"var order.getEmailCustomerNote()\":\"Email Order Note\",\n\"var formattedBillingAddress|raw\":\"Billing Address\",\n\"var order.getIsNotVirtual()\":\"Check if shipment exists\",\n\"var pickupAddress|raw\":\"Pickup Location Address\",\n\"var formattedShippingAddress|raw\":\"Customer Shipping Address\",\n\"var payment_html|raw\":\"Payment Details\",\n\"var order.getShippingDescription()\":\"Shipping Description\",\n\"var shipping_msg\":\"Shipping message\",\n\"layout handle=\\\"sales_email_order_items\\\" order=$order area=\\\"frontend\\\"\":\"Order Items Grid\"\n} @-->\n\n{{template config_path=\"design/email/header_template\"}}\n\n<table>\n    <tr class=\"email-intro\">\n        <td>\n            <p class=\"greeting\">{{trans \"%name,\" name=$order.getBillingAddress().getName()}}</p>\n            <p>\n                {{trans \"Thank you for your order from %store_name.\" store_name=$store.getFrontendName()}}\n                {{if is_pickup_order}}\n                    {{trans \"We will send you a notification once your items are ready for pickup.\"}}\n                {{else}}\n                    {{trans \"Once your package ships we will send an email with a link to track your order.\"}}\n                {{/if}}\n                {{trans \'If you have questions about your order, you can email us at <a href=\"mailto:%store_email\">%store_email</a>\' store_email=$store_email |raw}}{{depend store_phone}} {{trans \' or call us at <a href=\"tel:%store_phone\">%store_phone</a>\' store_phone=$store_phone |raw}}{{/depend}}.\n                {{depend store_hours}}\n                    {{trans \'Our hours are <span class=\"no-link\">%store_hours</span>.\' store_hours=$store_hours |raw}}\n                {{/depend}}\n            </p>\n        </td>\n    </tr>\n    <tr class=\"email-summary\">\n        <td>\n            <h1>{{trans \'Your Order <span class=\"no-link\">#%increment_id</span>\' increment_id=$order.increment_id |raw}}</h1>\n            <p>{{trans \'Placed on <span class=\"no-link\">%created_at</span>\' created_at=$order.getCreatedAtFormatted(2) |raw}}</p>\n        </td>\n    </tr>\n    <tr class=\"email-information\">\n        <td>\n            {{depend order.getEmailCustomerNote()}}\n            <table class=\"message-info\">\n                <tr>\n                    <td>\n                        {{var order.getEmailCustomerNote()|escape|nl2br}}\n                    </td>\n                </tr>\n            </table>\n            {{/depend}}\n            <table class=\"order-details\">\n                <tr>\n                    <td class=\"address-details\">\n                        <h3>{{trans \"Billing Info\"}}</h3>\n                        <p>{{var formattedBillingAddress|raw}}</p>\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class=\"address-details\">\n                        <h3>{{trans \"Shipping Info\"}}</h3>\n                        {{if is_pickup_order}}\n                            <h4>{{trans \"Pickup Location\"}}</h4>\n                            <p>{{var pickupAddress|raw}}</p>\n                            <h4>{{trans \"Recipient Address\"}}</h4>\n                        {{/if}}\n                        <p>{{var formattedShippingAddress|raw}}</p>\n                    </td>\n                    {{/depend}}\n                </tr>\n                <tr>\n                    <td class=\"method-info\">\n                        <h3>{{trans \"Payment Method\"}}</h3>\n                        {{var payment_html|raw}}\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class=\"method-info\">\n                        <h3>{{trans \"Shipping Method\"}}</h3>\n                        <p>{{var order.getShippingDescription()}}</p>\n                        {{if shipping_msg}}\n                        <p>{{var shipping_msg}}</p>\n                        {{/if}}\n                    </td>\n                    {{/depend}}\n                </tr>\n            </table>\n            {{layout handle=\"sales_email_order_items\" order=$order}}\n        </td>\n    </tr>\n</table>\n\n{{template config_path=\"design/email/footer_template\"}}\n', NULL, 2, '{{trans \"Your %store_name order confirmation\" store_name=$store.getFrontendName()}}', NULL, NULL, '2022-04-29 16:57:48', '2022-04-29 16:57:48', 'sales_email_order_guest_template', '{\"var formattedBillingAddress|raw\":\"Billing Address\",\"var order.getEmailCustomerNote()\":\"Email Order Note\",\"var order.getBillingAddress().getName()\":\"Guest Customer Name\",\"var order.getCreatedAtFormatted(2)\":\"Order Created At (datetime)\",\"var order.increment_id\":\"Order Id\",\"layout handle=\\\"sales_email_order_items\\\" order=$order\":\"Order Items Grid\",\"var payment_html|raw\":\"Payment Details\",\"var formattedShippingAddress|raw\":\"Shipping Address\",\"var order.getShippingDescription()\":\"Shipping Description\",\"var shipping_msg\":\"Shipping message\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_wishlist`
--

DROP TABLE IF EXISTS `email_wishlist`;
CREATE TABLE IF NOT EXISTS `email_wishlist` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `wishlist_id` int(10) UNSIGNED NOT NULL COMMENT 'Wishlist Id',
  `item_count` int(10) UNSIGNED NOT NULL COMMENT 'Item Count',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `wishlist_imported` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Wishlist Imported',
  `wishlist_modified` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Wishlist Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_WISHLIST_WISHLIST_ID` (`wishlist_id`),
  KEY `EMAIL_WISHLIST_ITEM_COUNT` (`item_count`),
  KEY `EMAIL_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_WISHLIST_WISHLIST_MODIFIED` (`wishlist_modified`),
  KEY `EMAIL_WISHLIST_WISHLIST_IMPORTED` (`wishlist_imported`),
  KEY `EMAIL_WISHLIST_CREATED_AT` (`created_at`),
  KEY `EMAIL_WISHLIST_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_WISHLIST_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Wishlist';

-- --------------------------------------------------------

--
-- Estrutura da tabela `flag`
--

DROP TABLE IF EXISTS `flag`;
CREATE TABLE IF NOT EXISTS `flag` (
  `flag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Flag';

--
-- Extraindo dados da tabela `flag`
--

INSERT INTO `flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES
(1, 'analytics_link_attempts_reverse_counter', 0, '24', '2022-04-29 16:57:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gift_message`
--

DROP TABLE IF EXISTS `gift_message`;
CREATE TABLE IF NOT EXISTS `gift_message` (
  `gift_message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';

-- --------------------------------------------------------

--
-- Estrutura da tabela `googleoptimizer_code`
--

DROP TABLE IF EXISTS `googleoptimizer_code`;
CREATE TABLE IF NOT EXISTS `googleoptimizer_code` (
  `code_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code id',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store id',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code';

-- --------------------------------------------------------

--
-- Estrutura da tabela `importexport_importdata`
--

DROP TABLE IF EXISTS `importexport_importdata`;
CREATE TABLE IF NOT EXISTS `importexport_importdata` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `import_history`
--

DROP TABLE IF EXISTS `import_history`;
CREATE TABLE IF NOT EXISTS `import_history` (
  `history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'History record Id',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import history table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `indexer_state`
--

DROP TABLE IF EXISTS `indexer_state`;
CREATE TABLE IF NOT EXISTS `indexer_state` (
  `state_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Indexer State Id',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer Id',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Indexer State';

--
-- Extraindo dados da tabela `indexer_state`
--

INSERT INTO `indexer_state` (`state_id`, `indexer_id`, `status`, `updated`, `hash_config`) VALUES
(1, 'design_config_grid', 'valid', '2022-05-05 19:32:05', '34ec592bfa6c952bed4d0a1d58c98770'),
(2, 'customer_grid', 'valid', '2022-05-05 19:32:05', 'b9632e06cf957d6e8103eb236ca38cc1'),
(3, 'catalog_category_product', 'invalid', '2022-04-29 16:57:33', '2124d5bfcd83b609c67eee94a0e4708c'),
(4, 'catalog_product_category', 'invalid', '2022-04-29 16:57:33', '77b6356629f3259568a68ea64c773238'),
(5, 'catalogrule_rule', 'invalid', '2022-04-29 16:57:33', 'c4f8344a2e6a7d8ebc065631454a4724'),
(6, 'catalog_product_attribute', 'invalid', '2022-04-29 16:57:33', 'f73cae77ec4dee3b587a60a2f38dd26a'),
(7, 'cataloginventory_stock', 'invalid', '2022-04-29 16:57:33', '1bf66e64558a5171e523b32f25cb99ca'),
(8, 'inventory', 'invalid', '2022-04-29 16:57:33', 'ff158179c0d7dcaeb1be1da0011eae73'),
(9, 'catalogrule_product', 'invalid', '2022-04-29 16:57:33', '667205576ee3764b1ee81c4a076d10ae'),
(10, 'catalog_product_price', 'invalid', '2022-04-29 16:57:33', '0e6c8cd322db03524968ab671629718f'),
(11, 'catalogsearch_fulltext', 'valid', '2022-04-29 16:57:42', 'f7969233b1a7e0a88687f63b60edb602');

-- --------------------------------------------------------

--
-- Estrutura da tabela `integration`
--

DROP TABLE IF EXISTS `integration`;
CREATE TABLE IF NOT EXISTS `integration` (
  `integration_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) UNSIGNED NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `INTEGRATION_NAME` (`name`),
  UNIQUE KEY `INTEGRATION_CONSUMER_ID` (`consumer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='integration';

--
-- Extraindo dados da tabela `integration`
--

INSERT INTO `integration` (`integration_id`, `name`, `email`, `endpoint`, `status`, `consumer_id`, `created_at`, `updated_at`, `setup_type`, `identity_link_url`) VALUES
(1, 'Teste integration', '', NULL, 1, 1, '2022-04-29 20:04:38', '2022-04-29 20:04:47', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_low_stock_notification_configuration`
--

DROP TABLE IF EXISTS `inventory_low_stock_notification_configuration`;
CREATE TABLE IF NOT EXISTS `inventory_low_stock_notification_configuration` (
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`source_code`,`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `inventory_low_stock_notification_configuration`
--

INSERT INTO `inventory_low_stock_notification_configuration` (`source_code`, `sku`, `notify_stock_qty`) VALUES
('default', '5858585', NULL),
('default', '987654', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_reservation`
--

DROP TABLE IF EXISTS `inventory_reservation`;
CREATE TABLE IF NOT EXISTS `inventory_reservation` (
  `reservation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `metadata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY` (`stock_id`,`sku`,`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_shipment_source`
--

DROP TABLE IF EXISTS `inventory_shipment_source`;
CREATE TABLE IF NOT EXISTS `inventory_shipment_source` (
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `source_code` varchar(255) NOT NULL,
  PRIMARY KEY (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_source`
--

DROP TABLE IF EXISTS `inventory_source`;
CREATE TABLE IF NOT EXISTS `inventory_source` (
  `source_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `description` text,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `region_id` int(10) UNSIGNED DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `use_default_carrier_config` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `inventory_source`
--

INSERT INTO `inventory_source` (`source_code`, `name`, `enabled`, `description`, `latitude`, `longitude`, `country_id`, `region_id`, `region`, `city`, `street`, `postcode`, `contact_name`, `email`, `phone`, `fax`, `use_default_carrier_config`) VALUES
('default', 'Default Source', 1, 'Default Source', '0.000000', '0.000000', 'US', NULL, NULL, NULL, NULL, '00000', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_source_carrier_link`
--

DROP TABLE IF EXISTS `inventory_source_carrier_link`;
CREATE TABLE IF NOT EXISTS `inventory_source_carrier_link` (
  `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `position` smallint(5) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_source_item`
--

DROP TABLE IF EXISTS `inventory_source_item`;
CREATE TABLE IF NOT EXISTS `inventory_source_item` (
  `source_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`source_item_id`),
  UNIQUE KEY `INVENTORY_SOURCE_ITEM_SOURCE_CODE_SKU` (`source_code`,`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `inventory_source_item`
--

INSERT INTO `inventory_source_item` (`source_item_id`, `source_code`, `sku`, `quantity`, `status`) VALUES
(1, 'default', '987654', '16.0000', 1),
(2, 'default', '5858585', '40.0000', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_source_stock_link`
--

DROP TABLE IF EXISTS `inventory_source_stock_link`;
CREATE TABLE IF NOT EXISTS `inventory_source_stock_link` (
  `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) UNSIGNED NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `priority` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE` (`stock_id`,`source_code`),
  KEY `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY` (`stock_id`,`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `inventory_source_stock_link`
--

INSERT INTO `inventory_source_stock_link` (`link_id`, `stock_id`, `source_code`, `priority`) VALUES
(1, 1, 'default', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_stock`
--

DROP TABLE IF EXISTS `inventory_stock`;
CREATE TABLE IF NOT EXISTS `inventory_stock` (
  `stock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `inventory_stock`
--

INSERT INTO `inventory_stock` (`stock_id`, `name`) VALUES
(1, 'Default Stock');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `inventory_stock_1`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `inventory_stock_1`;
CREATE TABLE IF NOT EXISTS `inventory_stock_1` (
`product_id` int(10) unsigned
,`website_id` smallint(5) unsigned
,`stock_id` smallint(5) unsigned
,`quantity` decimal(12,4)
,`is_salable` smallint(5) unsigned
,`sku` varchar(64)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_stock_sales_channel`
--

DROP TABLE IF EXISTS `inventory_stock_sales_channel`;
CREATE TABLE IF NOT EXISTS `inventory_stock_sales_channel` (
  `type` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `stock_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`type`,`code`),
  KEY `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `inventory_stock_sales_channel`
--

INSERT INTO `inventory_stock_sales_channel` (`type`, `code`, `stock_id`) VALUES
('website', 'base', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `klarna_core_order`
--

DROP TABLE IF EXISTS `klarna_core_order`;
CREATE TABLE IF NOT EXISTS `klarna_core_order` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `klarna_order_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Order Id',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'Session Id',
  `reservation_id` varchar(255) DEFAULT NULL COMMENT 'Reservation Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `is_acknowledged` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Acknowledged',
  PRIMARY KEY (`id`),
  KEY `KLARNA_CORE_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`),
  KEY `KLARNA_CORE_ORDER_IS_ACKNOWLEDGED` (`is_acknowledged`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Klarna Order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `klarna_payments_quote`
--

DROP TABLE IF EXISTS `klarna_payments_quote`;
CREATE TABLE IF NOT EXISTS `klarna_payments_quote` (
  `payments_quote_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Payments Id',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Session Id',
  `client_token` text COMMENT 'Klarna Client Token',
  `authorization_token` varchar(255) DEFAULT NULL COMMENT 'Authorization Token',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `quote_id` int(10) UNSIGNED NOT NULL COMMENT 'Quote Id',
  `payment_methods` varchar(255) DEFAULT NULL COMMENT 'Payment Method Categories',
  `payment_method_info` text COMMENT 'Payment Method Category Info',
  PRIMARY KEY (`payments_quote_id`),
  KEY `KLARNA_PAYMENTS_QUOTE_QUOTE_ID_QUOTE_ENTITY_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Klarna Payments Quote';

-- --------------------------------------------------------

--
-- Estrutura da tabela `layout_link`
--

DROP TABLE IF EXISTS `layout_link`;
CREATE TABLE IF NOT EXISTS `layout_link` (
  `layout_link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `theme_id` int(10) UNSIGNED NOT NULL COMMENT 'Theme id',
  `layout_update_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  KEY `LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';

-- --------------------------------------------------------

--
-- Estrutura da tabela `layout_update`
--

DROP TABLE IF EXISTS `layout_update`;
CREATE TABLE IF NOT EXISTS `layout_update` (
  `layout_update_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `magento_acknowledged_bulk`
--

DROP TABLE IF EXISTS `magento_acknowledged_bulk`;
CREATE TABLE IF NOT EXISTS `magento_acknowledged_bulk` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Internal ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID` (`bulk_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk that was viewed by user from notification area';

-- --------------------------------------------------------

--
-- Estrutura da tabela `magento_bulk`
--

DROP TABLE IF EXISTS `magento_bulk`;
CREATE TABLE IF NOT EXISTS `magento_bulk` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Bulk Internal ID (must not be exposed)',
  `uuid` varbinary(39) DEFAULT NULL COMMENT 'Bulk UUID (can be exposed to reference bulk entity)',
  `user_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'ID of the WebAPI user that performed an action',
  `user_type` int(11) DEFAULT NULL COMMENT 'Which type of user',
  `description` varchar(255) DEFAULT NULL COMMENT 'Bulk Description',
  `operation_count` int(10) UNSIGNED NOT NULL COMMENT 'Total number of operations scheduled within this bulk',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bulk start time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_BULK_UUID` (`uuid`),
  KEY `MAGENTO_BULK_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk entity that represents set of related asynchronous operations';

-- --------------------------------------------------------

--
-- Estrutura da tabela `magento_operation`
--

DROP TABLE IF EXISTS `magento_operation`;
CREATE TABLE IF NOT EXISTS `magento_operation` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Operation ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Name of the related message queue topic',
  `serialized_data` blob COMMENT 'Data (serialized) required to perform an operation',
  `result_serialized_data` blob COMMENT 'Result data (serialized) after perform an operation',
  `status` smallint(6) DEFAULT '0' COMMENT 'Operation status (OPEN | COMPLETE | RETRIABLY_FAILED | NOT_RETRIABLY_FAILED)',
  `error_code` smallint(6) DEFAULT NULL COMMENT 'Code of the error that appeared during operation execution (used to aggregate related failed operations)',
  `result_message` varchar(255) DEFAULT NULL COMMENT 'Operation result message',
  PRIMARY KEY (`id`),
  KEY `MAGENTO_OPERATION_BULK_UUID_ERROR_CODE` (`bulk_uuid`,`error_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Operation entity';

-- --------------------------------------------------------

--
-- Estrutura da tabela `msp_tfa_country_codes`
--

DROP TABLE IF EXISTS `msp_tfa_country_codes`;
CREATE TABLE IF NOT EXISTS `msp_tfa_country_codes` (
  `msp_tfa_country_codes_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'TFA admin user ID',
  `code` text NOT NULL COMMENT 'Country code',
  `name` text NOT NULL COMMENT 'Country name',
  `dial_code` text NOT NULL COMMENT 'Prefix',
  PRIMARY KEY (`msp_tfa_country_codes_id`),
  KEY `MSP_TFA_COUNTRY_CODES_CODE` (`code`(128))
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COMMENT='msp_tfa_country_codes';

--
-- Extraindo dados da tabela `msp_tfa_country_codes`
--

INSERT INTO `msp_tfa_country_codes` (`msp_tfa_country_codes_id`, `code`, `name`, `dial_code`) VALUES
(1, 'IL', 'Israel', '+972'),
(2, 'AF', 'Afghanistan', '+93'),
(3, 'AL', 'Albania', '+355'),
(4, 'DZ', 'Algeria', '+213'),
(5, 'AS', 'AmericanSamoa', '+1 684'),
(6, 'AD', 'Andorra', '+376'),
(7, 'AO', 'Angola', '+244'),
(8, 'AI', 'Anguilla', '+1 264'),
(9, 'AG', 'Antigua and Barbuda', '+1268'),
(10, 'AR', 'Argentina', '+54'),
(11, 'AM', 'Armenia', '+374'),
(12, 'AW', 'Aruba', '+297'),
(13, 'AU', 'Australia', '+61'),
(14, 'AT', 'Austria', '+43'),
(15, 'AZ', 'Azerbaijan', '+994'),
(16, 'BS', 'Bahamas', '+1 242'),
(17, 'BH', 'Bahrain', '+973'),
(18, 'BD', 'Bangladesh', '+880'),
(19, 'BB', 'Barbados', '+1 246'),
(20, 'BY', 'Belarus', '+375'),
(21, 'BE', 'Belgium', '+32'),
(22, 'BZ', 'Belize', '+501'),
(23, 'BJ', 'Benin', '+229'),
(24, 'BM', 'Bermuda', '+1 441'),
(25, 'BT', 'Bhutan', '+975'),
(26, 'BA', 'Bosnia and Herzegovina', '+387'),
(27, 'BW', 'Botswana', '+267'),
(28, 'BR', 'Brazil', '+55'),
(29, 'IO', 'British Indian Ocean Territory', '+246'),
(30, 'BG', 'Bulgaria', '+359'),
(31, 'BF', 'Burkina Faso', '+226'),
(32, 'BI', 'Burundi', '+257'),
(33, 'KH', 'Cambodia', '+855'),
(34, 'CM', 'Cameroon', '+237'),
(35, 'CA', 'Canada', '+1'),
(36, 'CV', 'Cape Verde', '+238'),
(37, 'KY', 'Cayman Islands', '+ 345'),
(38, 'CF', 'Central African Republic', '+236'),
(39, 'TD', 'Chad', '+235'),
(40, 'CL', 'Chile', '+56'),
(41, 'CN', 'China', '+86'),
(42, 'CX', 'Christmas Island', '+61'),
(43, 'CO', 'Colombia', '+57'),
(44, 'KM', 'Comoros', '+269'),
(45, 'CG', 'Congo', '+242'),
(46, 'CK', 'Cook Islands', '+682'),
(47, 'CR', 'Costa Rica', '+506'),
(48, 'HR', 'Croatia', '+385'),
(49, 'CU', 'Cuba', '+53'),
(50, 'CY', 'Cyprus', '+537'),
(51, 'CZ', 'Czech Republic', '+420'),
(52, 'DK', 'Denmark', '+45'),
(53, 'DJ', 'Djibouti', '+253'),
(54, 'DM', 'Dominica', '+1 767'),
(55, 'DO', 'Dominican Republic', '+1 849'),
(56, 'EC', 'Ecuador', '+593'),
(57, 'EG', 'Egypt', '+20'),
(58, 'SV', 'El Salvador', '+503'),
(59, 'GQ', 'Equatorial Guinea', '+240'),
(60, 'ER', 'Eritrea', '+291'),
(61, 'EE', 'Estonia', '+372'),
(62, 'ET', 'Ethiopia', '+251'),
(63, 'FO', 'Faroe Islands', '+298'),
(64, 'FJ', 'Fiji', '+679'),
(65, 'FI', 'Finland', '+358'),
(66, 'FR', 'France', '+33'),
(67, 'GF', 'French Guiana', '+594'),
(68, 'PF', 'French Polynesia', '+689'),
(69, 'GA', 'Gabon', '+241'),
(70, 'GM', 'Gambia', '+220'),
(71, 'GE', 'Georgia', '+995'),
(72, 'DE', 'Germany', '+49'),
(73, 'GH', 'Ghana', '+233'),
(74, 'GI', 'Gibraltar', '+350'),
(75, 'GR', 'Greece', '+30'),
(76, 'GL', 'Greenland', '+299'),
(77, 'GD', 'Grenada', '+1 473'),
(78, 'GP', 'Guadeloupe', '+590'),
(79, 'GU', 'Guam', '+1 671'),
(80, 'GT', 'Guatemala', '+502'),
(81, 'GN', 'Guinea', '+224'),
(82, 'GW', 'Guinea-Bissau', '+245'),
(83, 'GY', 'Guyana', '+595'),
(84, 'HT', 'Haiti', '+509'),
(85, 'HN', 'Honduras', '+504'),
(86, 'HU', 'Hungary', '+36'),
(87, 'IS', 'Iceland', '+354'),
(88, 'IN', 'India', '+91'),
(89, 'ID', 'Indonesia', '+62'),
(90, 'IQ', 'Iraq', '+964'),
(91, 'IE', 'Ireland', '+353'),
(92, 'IL', 'Israel', '+972'),
(93, 'IT', 'Italy', '+39'),
(94, 'JM', 'Jamaica', '+1 876'),
(95, 'JP', 'Japan', '+81'),
(96, 'JO', 'Jordan', '+962'),
(97, 'KZ', 'Kazakhstan', '+7 7'),
(98, 'KE', 'Kenya', '+254'),
(99, 'KI', 'Kiribati', '+686'),
(100, 'KW', 'Kuwait', '+965'),
(101, 'KG', 'Kyrgyzstan', '+996'),
(102, 'LV', 'Latvia', '+371'),
(103, 'LB', 'Lebanon', '+961'),
(104, 'LS', 'Lesotho', '+266'),
(105, 'LR', 'Liberia', '+231'),
(106, 'LI', 'Liechtenstein', '+423'),
(107, 'LT', 'Lithuania', '+370'),
(108, 'LU', 'Luxembourg', '+352'),
(109, 'MG', 'Madagascar', '+261'),
(110, 'MW', 'Malawi', '+265'),
(111, 'MY', 'Malaysia', '+60'),
(112, 'MV', 'Maldives', '+960'),
(113, 'ML', 'Mali', '+223'),
(114, 'MT', 'Malta', '+356'),
(115, 'MH', 'Marshall Islands', '+692'),
(116, 'MQ', 'Martinique', '+596'),
(117, 'MR', 'Mauritania', '+222'),
(118, 'MU', 'Mauritius', '+230'),
(119, 'YT', 'Mayotte', '+262'),
(120, 'MX', 'Mexico', '+52'),
(121, 'MC', 'Monaco', '+377'),
(122, 'MN', 'Mongolia', '+976'),
(123, 'ME', 'Montenegro', '+382'),
(124, 'MS', 'Montserrat', '+1664'),
(125, 'MA', 'Morocco', '+212'),
(126, 'MM', 'Myanmar', '+95'),
(127, 'NA', 'Namibia', '+264'),
(128, 'NR', 'Nauru', '+674'),
(129, 'NP', 'Nepal', '+977'),
(130, 'NL', 'Netherlands', '+31'),
(131, 'AN', 'Netherlands Antilles', '+599'),
(132, 'NC', 'New Caledonia', '+687'),
(133, 'NZ', 'New Zealand', '+64'),
(134, 'NI', 'Nicaragua', '+505'),
(135, 'NE', 'Niger', '+227'),
(136, 'NG', 'Nigeria', '+234'),
(137, 'NU', 'Niue', '+683'),
(138, 'NF', 'Norfolk Island', '+672'),
(139, 'MP', 'Northern Mariana Islands', '+1 670'),
(140, 'NO', 'Norway', '+47'),
(141, 'OM', 'Oman', '+968'),
(142, 'PK', 'Pakistan', '+92'),
(143, 'PW', 'Palau', '+680'),
(144, 'PA', 'Panama', '+507'),
(145, 'PG', 'Papua New Guinea', '+675'),
(146, 'PY', 'Paraguay', '+595'),
(147, 'PE', 'Peru', '+51'),
(148, 'PH', 'Philippines', '+63'),
(149, 'PL', 'Poland', '+48'),
(150, 'PT', 'Portugal', '+351'),
(151, 'PR', 'Puerto Rico', '+1 939'),
(152, 'QA', 'Qatar', '+974'),
(153, 'RO', 'Romania', '+40'),
(154, 'RW', 'Rwanda', '+250'),
(155, 'WS', 'Samoa', '+685'),
(156, 'SM', 'San Marino', '+378'),
(157, 'SA', 'Saudi Arabia', '+966'),
(158, 'SN', 'Senegal', '+221'),
(159, 'RS', 'Serbia', '+381'),
(160, 'SC', 'Seychelles', '+248'),
(161, 'SL', 'Sierra Leone', '+232'),
(162, 'SG', 'Singapore', '+65'),
(163, 'SK', 'Slovakia', '+421'),
(164, 'SI', 'Slovenia', '+386'),
(165, 'SB', 'Solomon Islands', '+677'),
(166, 'ZA', 'South Africa', '+27'),
(167, 'GS', 'South Georgia and the South Sandwich Islands', '+500'),
(168, 'ES', 'Spain', '+34'),
(169, 'LK', 'Sri Lanka', '+94'),
(170, 'SD', 'Sudan', '+249'),
(171, 'SR', 'Suriname', '+597'),
(172, 'SZ', 'Swaziland', '+268'),
(173, 'SE', 'Sweden', '+46'),
(174, 'CH', 'Switzerland', '+41'),
(175, 'TJ', 'Tajikistan', '+992'),
(176, 'TH', 'Thailand', '+66'),
(177, 'TG', 'Togo', '+228'),
(178, 'TK', 'Tokelau', '+690'),
(179, 'TO', 'Tonga', '+676'),
(180, 'TT', 'Trinidad and Tobago', '+1 868'),
(181, 'TN', 'Tunisia', '+216'),
(182, 'TR', 'Turkey', '+90'),
(183, 'TM', 'Turkmenistan', '+993'),
(184, 'TC', 'Turks and Caicos Islands', '+1 649'),
(185, 'TV', 'Tuvalu', '+688'),
(186, 'UG', 'Uganda', '+256'),
(187, 'UA', 'Ukraine', '+380'),
(188, 'AE', 'United Arab Emirates', '+971'),
(189, 'GB', 'United Kingdom', '+44'),
(190, 'US', 'United States', '+1'),
(191, 'UY', 'Uruguay', '+598'),
(192, 'UZ', 'Uzbekistan', '+998'),
(193, 'VU', 'Vanuatu', '+678'),
(194, 'WF', 'Wallis and Futuna', '+681'),
(195, 'YE', 'Yemen', '+967'),
(196, 'ZM', 'Zambia', '+260'),
(197, 'ZW', 'Zimbabwe', '+263'),
(198, 'AX', 'land Islands', ''),
(199, 'BO', 'Bolivia, Plurinational State of', '+591'),
(200, 'BN', 'Brunei Darussalam', '+673'),
(201, 'CC', 'Cocos (Keeling) Islands', '+61'),
(202, 'CD', 'Congo, The Democratic Republic of the', '+243'),
(203, 'CI', 'Cote d\'Ivoire', '+225'),
(204, 'FK', 'Falkland Islands (Malvinas)', '+500'),
(205, 'GG', 'Guernsey', '+44'),
(206, 'VA', 'Holy See (Vatican City State)', '+379'),
(207, 'HK', 'Hong Kong', '+852'),
(208, 'IR', 'Iran, Islamic Republic of', '+98'),
(209, 'IM', 'Isle of Man', '+44'),
(210, 'JE', 'Jersey', '+44'),
(211, 'KP', 'Korea, Democratic People\'s Republic of', '+850'),
(212, 'KR', 'Korea, Republic of', '+82'),
(213, 'LA', 'Lao People\'s Democratic Republic', '+856'),
(214, 'LY', 'Libyan Arab Jamahiriya', '+218'),
(215, 'MO', 'Macao', '+853'),
(216, 'MK', 'Macedonia, The Former Yugoslav Republic of', '+389'),
(217, 'FM', 'Micronesia, Federated States of', '+691'),
(218, 'MD', 'Moldova, Republic of', '+373'),
(219, 'MZ', 'Mozambique', '+258'),
(220, 'PS', 'Palestinian Territory, Occupied', '+970'),
(221, 'PN', 'Pitcairn', '+872'),
(222, 'RE', 'Réunion', '+262'),
(223, 'RU', 'Russia', '+7'),
(224, 'BL', 'Saint Barthélemy', '+590'),
(225, 'SH', 'Saint Helena, Ascension and Tristan Da Cunha', '+290'),
(226, 'KN', 'Saint Kitts and Nevis', '+1 869'),
(227, 'LC', 'Saint Lucia', '+1 758'),
(228, 'MF', 'Saint Martin', '+590'),
(229, 'PM', 'Saint Pierre and Miquelon', '+508'),
(230, 'VC', 'Saint Vincent and the Grenadines', '+1 784'),
(231, 'ST', 'Sao Tome and Principe', '+239'),
(232, 'SO', 'Somalia', '+252'),
(233, 'SJ', 'Svalbard and Jan Mayen', '+47'),
(234, 'SY', 'Syrian Arab Republic', '+963'),
(235, 'TW', 'Taiwan, Province of China', '+886'),
(236, 'TZ', 'Tanzania, United Republic of', '+255'),
(237, 'TL', 'Timor-Leste', '+670'),
(238, 'VE', 'Venezuela, Bolivarian Republic of', '+58'),
(239, 'VN', 'Viet Nam', '+84'),
(240, 'VG', 'Virgin Islands, British', '+1 284'),
(241, 'VI', 'Virgin Islands, U.S.', '+1 340');

-- --------------------------------------------------------

--
-- Estrutura da tabela `msp_tfa_trusted`
--

DROP TABLE IF EXISTS `msp_tfa_trusted`;
CREATE TABLE IF NOT EXISTS `msp_tfa_trusted` (
  `msp_tfa_trusted_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Trusted device ID',
  `date_time` datetime NOT NULL COMMENT 'Date and time',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User ID',
  `device_name` text NOT NULL COMMENT 'Device name',
  `token` text NOT NULL COMMENT 'Token',
  `last_ip` text NOT NULL COMMENT 'Last IP',
  PRIMARY KEY (`msp_tfa_trusted_id`),
  KEY `MSP_TFA_TRUSTED_USER_ID_ADMIN_USER_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='msp_tfa_trusted';

-- --------------------------------------------------------

--
-- Estrutura da tabela `msp_tfa_user_config`
--

DROP TABLE IF EXISTS `msp_tfa_user_config`;
CREATE TABLE IF NOT EXISTS `msp_tfa_user_config` (
  `msp_tfa_user_config_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'TFA admin user ID',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User ID',
  `encoded_providers` text COMMENT 'Encoded providers list',
  `encoded_config` text COMMENT 'Encoded providers configuration',
  `default_provider` text COMMENT 'Default provider',
  PRIMARY KEY (`msp_tfa_user_config_id`),
  KEY `MSP_TFA_USER_CONFIG_USER_ID_ADMIN_USER_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='msp_tfa_user_config';

-- --------------------------------------------------------

--
-- Estrutura da tabela `mview_state`
--

DROP TABLE IF EXISTS `mview_state`;
CREATE TABLE IF NOT EXISTS `mview_state` (
  `state_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'View State Id',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View Id',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'View Version Id',
  PRIMARY KEY (`state_id`),
  KEY `MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='View State';

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter_problem`
--

DROP TABLE IF EXISTS `newsletter_problem`;
CREATE TABLE IF NOT EXISTS `newsletter_problem` (
  `problem_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) UNSIGNED DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter_queue`
--

DROP TABLE IF EXISTS `newsletter_queue`;
CREATE TABLE IF NOT EXISTS `newsletter_queue` (
  `queue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter_queue_link`
--

DROP TABLE IF EXISTS `newsletter_queue_link`;
CREATE TABLE IF NOT EXISTS `newsletter_queue_link` (
  `queue_link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `newsletter_queue_store_link`;
CREATE TABLE IF NOT EXISTS `newsletter_queue_store_link` (
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter_subscriber`
--

DROP TABLE IF EXISTS `newsletter_subscriber`;
CREATE TABLE IF NOT EXISTS `newsletter_subscriber` (
  `subscriber_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  KEY `NEWSLETTER_SUBSCRIBER_SUBSCRIBER_EMAIL` (`subscriber_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter_template`
--

DROP TABLE IF EXISTS `newsletter_template`;
CREATE TABLE IF NOT EXISTS `newsletter_template` (
  `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) UNSIGNED DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) UNSIGNED DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';

--
-- Extraindo dados da tabela `oauth_consumer`
--

INSERT INTO `oauth_consumer` (`entity_id`, `created_at`, `updated_at`, `name`, `key`, `secret`, `callback_url`, `rejected_callback_url`) VALUES
(1, '2022-04-29 20:04:38', '0000-00-00 00:00:00', 'Integration1', 'n067wa9z4se0bk9p4pcx16ps7qcgjnzv', 'wrnjdyqqibz2mqi476buiox10nggiwis', NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) UNSIGNED NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) UNSIGNED NOT NULL COMMENT 'Consumer ID',
  UNIQUE KEY `OAUTH_NONCE_NONCE_CONSUMER_ID` (`nonce`,`consumer_id`),
  KEY `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  KEY `OAUTH_NONCE_TIMESTAMP` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_token`
--

DROP TABLE IF EXISTS `oauth_token`;
CREATE TABLE IF NOT EXISTS `oauth_token` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_TOKEN_TOKEN` (`token`),
  KEY `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  KEY `OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';

--
-- Extraindo dados da tabela `oauth_token`
--

INSERT INTO `oauth_token` (`entity_id`, `consumer_id`, `admin_id`, `customer_id`, `type`, `token`, `secret`, `verifier`, `callback_url`, `revoked`, `authorized`, `user_type`, `created_at`) VALUES
(2, 1, NULL, NULL, 'access', 'g7mihii207o6jvxi1gyvf5dkshs7tb03', 'mc638dje4kbzrbhwbc89c7gc5wj1l3js', '9vm94k8bx4ww4e9s7up0c9r8xtxxxzpy', 'oob', 0, 0, 1, '2022-05-10 17:12:44');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_token_request_log`
--

DROP TABLE IF EXISTS `oauth_token_request_log`;
CREATE TABLE IF NOT EXISTS `oauth_token_request_log` (
  `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint(5) UNSIGNED NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of token request authentication failures.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_request_event`
--

DROP TABLE IF EXISTS `password_reset_request_event`;
CREATE TABLE IF NOT EXISTS `password_reset_request_event` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint(5) UNSIGNED NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Password Reset Request Event under a security control';

-- --------------------------------------------------------

--
-- Estrutura da tabela `patch_list`
--

DROP TABLE IF EXISTS `patch_list`;
CREATE TABLE IF NOT EXISTS `patch_list` (
  `patch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Patch Auto Increment',
  `patch_name` varchar(1024) NOT NULL COMMENT 'Patch Class Name',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='List of data/schema patches';

--
-- Extraindo dados da tabela `patch_list`
--

INSERT INTO `patch_list` (`patch_id`, `patch_name`) VALUES
(1, 'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),
(2, 'Magento\\Catalog\\Setup\\Patch\\Schema\\EnableSegmentation'),
(3, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\CreateLegacyStockStatusView'),
(4, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\InitializeDefaultStock'),
(5, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\UpdateInventorySourceItem'),
(6, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\ReindexDefaultSource'),
(7, 'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),
(8, 'Magento\\InventorySales\\Setup\\Patch\\Schema\\InitializeWebsiteDefaultSock'),
(9, 'Magento\\Bundle\\Setup\\Patch\\Schema\\UpdateBundleRelatedSchema'),
(10, 'Magento\\Store\\Setup\\Patch\\Data\\UpdateStoreGroupCodes'),
(11, 'Magento\\Directory\\Setup\\Patch\\Data\\InitializeDirectoryData'),
(12, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCroatia'),
(13, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIndia'),
(14, 'Magento\\Theme\\Setup\\Patch\\Data\\RegisterThemes'),
(15, 'Magento\\Theme\\Setup\\Patch\\Data\\ConvertSerializedData'),
(16, 'Magento\\Eav\\Setup\\Patch\\Data\\InitializeAttributeModels'),
(17, 'Magento\\Config\\Setup\\Patch\\Data\\UpdateClassAliases'),
(18, 'Magento\\Indexer\\Setup\\Patch\\Data\\InitializeIndexerState'),
(19, 'Magento\\User\\Setup\\Patch\\Data\\UpgradePasswordHashes'),
(20, 'Magento\\User\\Setup\\Patch\\Data\\UpgradeSerializedFields'),
(21, 'Magento\\Authorization\\Setup\\Patch\\Data\\InitializeAuthRoles'),
(22, 'Magento\\Customer\\Setup\\Patch\\Data\\DefaultCustomerGroupsAndAttributes'),
(23, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributesMetadata'),
(24, 'Magento\\Customer\\Setup\\Patch\\Data\\AddNonSpecifiedGenderAttributeOption'),
(25, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateIdentifierCustomerAttributesVisibility'),
(26, 'Magento\\Customer\\Setup\\Patch\\Data\\AddCustomerUpdatedAtAttribute'),
(27, 'Magento\\Customer\\Setup\\Patch\\Data\\UpgradePasswordHashAndAddress'),
(28, 'Magento\\Customer\\Setup\\Patch\\Data\\RemoveCheckoutRegisterAndUpdateAttributes'),
(29, 'Magento\\Customer\\Setup\\Patch\\Data\\AddSecurityTrackingAttributes'),
(30, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateAutocompleteOnStorefrontConfigPath'),
(31, 'Magento\\Customer\\Setup\\Patch\\Data\\MigrateStoresAllowedCountriesToWebsite'),
(32, 'Magento\\Customer\\Setup\\Patch\\Data\\ConvertValidationRulesFromSerializedToJson'),
(33, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateVATNumber'),
(34, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributeInputFilters'),
(35, 'Magento\\Cms\\Setup\\Patch\\Data\\CreateDefaultPages'),
(36, 'Magento\\Cms\\Setup\\Patch\\Data\\UpdatePrivacyPolicyPage'),
(37, 'Magento\\Cms\\Setup\\Patch\\Data\\ConvertWidgetConditionsToJson'),
(38, 'Magento\\Catalog\\Setup\\Patch\\Data\\InstallDefaultCategories'),
(39, 'Magento\\Catalog\\Setup\\Patch\\Data\\SetNewResourceModelsPaths'),
(40, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateDefaultAttributeValue'),
(41, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMediaAttributesBackendTypes'),
(42, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductAttributes'),
(43, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductMetaDescription'),
(44, 'Magento\\Catalog\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),
(45, 'Magento\\Catalog\\Setup\\Patch\\Data\\DisallowUsingHtmlForProductName'),
(46, 'Magento\\Catalog\\Setup\\Patch\\Data\\EnableDirectiveParsing'),
(47, 'Magento\\Catalog\\Setup\\Patch\\Data\\EnableSegmentation'),
(48, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWidgetData'),
(49, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWebsiteAttributes'),
(50, 'Magento\\Quote\\Setup\\Patch\\Data\\InstallEntityTypes'),
(51, 'Magento\\Quote\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(52, 'Magento\\Integration\\Setup\\Patch\\Data\\RemoveInactiveTokens'),
(53, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\CreateDefaultStock'),
(54, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\UpdateStockItemsWebsite'),
(55, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(56, 'Magento\\Msrp\\Setup\\Patch\\Data\\InitializeMsrpAttributes'),
(57, 'Magento\\Msrp\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),
(58, 'Magento\\CatalogRule\\Setup\\Patch\\Data\\UpdateClassAliasesForCatalogRules'),
(59, 'Magento\\CatalogRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(60, 'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\CreateUrlAttributes'),
(61, 'Magento\\Widget\\Setup\\Patch\\Data\\UpgradeModelInstanceClassAliases'),
(62, 'Magento\\Widget\\Setup\\Patch\\Data\\ConvertSerializedData'),
(63, 'Magento\\Sales\\Setup\\Patch\\Data\\InstallOrderStatusesAndInitialSalesConfig'),
(64, 'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypes'),
(65, 'Magento\\Sales\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(66, 'Magento\\Sales\\Setup\\Patch\\Data\\FillQuoteAddressIdInSalesOrderAddress'),
(67, 'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypeModelForInvoice'),
(68, 'Magento\\Checkout\\Setup\\Patch\\Data\\PrepareInitialCheckoutConfiguration'),
(69, 'Magento\\Vault\\Setup\\Patch\\Data\\SetCreditCardAsDefaultTokenType'),
(70, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\InstallInitialConfigurableAttributes'),
(71, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateManufacturerAttribute'),
(72, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateTierPriceAttribute'),
(73, 'Magento\\CurrencySymbol\\Setup\\Patch\\Data\\ConvertSerializedCustomCurrencySymbolToJson'),
(74, 'Magento\\Paypal\\Setup\\Patch\\Data\\AddPaypalOrderStatuses'),
(75, 'Magento\\Analytics\\Setup\\Patch\\Data\\PrepareInitialConfig'),
(76, 'Magento\\Dhl\\Setup\\Patch\\Data\\PrepareShipmentDays'),
(77, 'Magento\\Downloadable\\Setup\\Patch\\Data\\InstallDownloadableAttributes'),
(78, 'Magento\\CatalogSearch\\Setup\\Patch\\Data\\MySQLSearchDeprecationNotification'),
(79, 'Magento\\CatalogSearch\\Setup\\Patch\\Data\\SetInitialSearchWeightForAttributes'),
(80, 'Magento\\EncryptionKey\\Setup\\Patch\\Data\\SodiumChachaPatch'),
(81, 'Magento\\Fedex\\Setup\\Patch\\Data\\ConfigureFedexDefaults'),
(82, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\AddGiftMessageAttributes'),
(83, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\MoveGiftMessageToGiftOptionsGroup'),
(84, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\UpdateGiftMessageAttribute'),
(85, 'Magento\\GroupedProduct\\Setup\\Patch\\Data\\InitializeGroupedProductLinks'),
(86, 'Magento\\GroupedProduct\\Setup\\Patch\\Data\\UpdateProductRelations'),
(87, 'Magento\\Braintree\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(88, 'Magento\\InventoryLowQuantityNotification\\Setup\\Patch\\Data\\MigrateCatalogInventoryNotifyStockQuantityData'),
(89, 'Magento\\SalesRule\\Setup\\Patch\\Data\\PrepareRuleModelSerializedData'),
(90, 'Magento\\SalesRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(91, 'Magento\\SalesRule\\Setup\\Patch\\Data\\FillSalesRuleProductAttributeTable'),
(92, 'Magento\\Reports\\Setup\\Patch\\Data\\InitializeReportEntityTypesAndPages'),
(93, 'Magento\\Review\\Setup\\Patch\\Data\\InitReviewStatusesAndData'),
(94, 'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateQuoteShippingAddresses'),
(95, 'Magento\\UrlRewrite\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(96, 'Magento\\Wishlist\\Setup\\Patch\\Data\\ConvertSerializedData'),
(97, 'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageAttribute'),
(98, 'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageToDefaultAttribtueSet'),
(99, 'Magento\\Swatches\\Setup\\Patch\\Data\\UpdateAdminTextSwatchValues'),
(100, 'Magento\\Swatches\\Setup\\Patch\\Data\\ConvertAdditionalDataToJson'),
(101, 'Magento\\Tax\\Setup\\Patch\\Data\\AddTaxAttributeAndTaxClasses'),
(102, 'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxClassAttributeVisibility'),
(103, 'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxRegionId'),
(104, 'Magento\\SampleData\\Setup\\Patch\\Data\\ClearSampleDataState'),
(105, 'Magento\\Usps\\Setup\\Patch\\Data\\UpdateAllowedMethods'),
(106, 'Magento\\Bundle\\Setup\\Patch\\Data\\ApplyAttributesUpdate'),
(107, 'Magento\\Bundle\\Setup\\Patch\\Data\\UpdateBundleRelatedEntityTytpes'),
(108, 'Magento\\Weee\\Setup\\Patch\\Data\\InitQuoteAndOrderAttributes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_billing_agreement`
--

DROP TABLE IF EXISTS `paypal_billing_agreement`;
CREATE TABLE IF NOT EXISTS `paypal_billing_agreement` (
  `agreement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_billing_agreement_order`
--

DROP TABLE IF EXISTS `paypal_billing_agreement_order`;
CREATE TABLE IF NOT EXISTS `paypal_billing_agreement_order` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_cert`
--

DROP TABLE IF EXISTS `paypal_cert`;
CREATE TABLE IF NOT EXISTS `paypal_cert` (
  `cert_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `PAYPAL_CERT_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_payment_transaction`
--

DROP TABLE IF EXISTS `paypal_payment_transaction`;
CREATE TABLE IF NOT EXISTS `paypal_payment_transaction` (
  `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_settlement_report`
--

DROP TABLE IF EXISTS `paypal_settlement_report`;
CREATE TABLE IF NOT EXISTS `paypal_settlement_report` (
  `report_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `paypal_settlement_report_row`;
CREATE TABLE IF NOT EXISTS `paypal_settlement_report_row` (
  `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) UNSIGNED NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `persistent_session`
--

DROP TABLE IF EXISTS `persistent_session`;
CREATE TABLE IF NOT EXISTS `persistent_session` (
  `persistent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  KEY `PERSISTENT_SESSION_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_alert_price`
--

DROP TABLE IF EXISTS `product_alert_price`;
CREATE TABLE IF NOT EXISTS `product_alert_price` (
  `alert_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_alert_stock`
--

DROP TABLE IF EXISTS `product_alert_stock`;
CREATE TABLE IF NOT EXISTS `product_alert_stock` (
  `alert_stock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';

-- --------------------------------------------------------

--
-- Estrutura da tabela `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Queue name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table storing unique queues';

-- --------------------------------------------------------

--
-- Estrutura da tabela `queue_lock`
--

DROP TABLE IF EXISTS `queue_lock`;
CREATE TABLE IF NOT EXISTS `queue_lock` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `message_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_LOCK_MESSAGE_CODE` (`message_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Messages that were processed are inserted here to be locked.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `queue_message`
--

DROP TABLE IF EXISTS `queue_message`;
CREATE TABLE IF NOT EXISTS `queue_message` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Message topic',
  `body` longtext COMMENT 'Message body',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Queue messages';

-- --------------------------------------------------------

--
-- Estrutura da tabela `queue_message_status`
--

DROP TABLE IF EXISTS `queue_message_status`;
CREATE TABLE IF NOT EXISTS `queue_message_status` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Relation ID',
  `queue_id` int(10) UNSIGNED NOT NULL COMMENT 'Queue ID',
  `message_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Message ID',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `status` smallint(5) UNSIGNED NOT NULL COMMENT 'Message status in particular queue',
  `number_of_trials` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of trials to processed failed message processing',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_MESSAGE_STATUS_QUEUE_ID_MESSAGE_ID` (`queue_id`,`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` (`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_STATUS_UPDATED_AT` (`status`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relation table to keep associations between queues and messages';

-- --------------------------------------------------------

--
-- Estrutura da tabela `quote`
--

DROP TABLE IF EXISTS `quote`;
CREATE TABLE IF NOT EXISTS `quote` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) UNSIGNED DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) UNSIGNED DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) UNSIGNED DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `is_persistent` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Quote Persistent',
  PRIMARY KEY (`entity_id`),
  KEY `QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `QUOTE_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';

--
-- Extraindo dados da tabela `quote`
--

INSERT INTO `quote` (`entity_id`, `store_id`, `created_at`, `updated_at`, `converted_at`, `is_active`, `is_virtual`, `is_multi_shipping`, `items_count`, `items_qty`, `orig_order_id`, `store_to_base_rate`, `store_to_quote_rate`, `base_currency_code`, `store_currency_code`, `quote_currency_code`, `grand_total`, `base_grand_total`, `checkout_method`, `customer_id`, `customer_tax_class_id`, `customer_group_id`, `customer_email`, `customer_prefix`, `customer_firstname`, `customer_middlename`, `customer_lastname`, `customer_suffix`, `customer_dob`, `customer_note`, `customer_note_notify`, `customer_is_guest`, `remote_ip`, `applied_rule_ids`, `reserved_order_id`, `password_hash`, `coupon_code`, `global_currency_code`, `base_to_global_rate`, `base_to_quote_rate`, `customer_taxvat`, `customer_gender`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `is_changed`, `trigger_recollect`, `ext_shipping_info`, `gift_message_id`, `is_persistent`) VALUES
(1, 1, '2022-04-29 19:39:29', '2022-04-29 19:39:29', NULL, 1, 0, 0, 1, '1.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '49.9000', '49.9000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '49.9000', '49.9000', '49.9000', '49.9000', 1, 0, NULL, NULL, 0),
(2, 1, '2022-04-29 20:09:13', '2022-04-29 20:09:13', NULL, 1, 0, 0, 0, '0.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0, NULL, NULL, 0),
(3, 1, '2022-04-29 20:19:48', '2022-04-29 20:19:48', NULL, 1, 0, 0, 0, '0.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0, NULL, NULL, 0),
(4, 1, '2022-05-05 19:01:00', '2022-05-05 19:51:32', NULL, 1, 0, 0, 1, '5.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '249.5000', '249.5000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '249.5000', '249.5000', '249.5000', '249.5000', 1, 0, NULL, NULL, 0),
(5, 1, '2022-05-05 20:02:46', '2022-05-05 20:02:46', NULL, 1, 0, 0, 1, '4.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '199.6000', '199.6000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '199.6000', '199.6000', '199.6000', '199.6000', 1, 0, NULL, NULL, 0),
(6, 1, '2022-05-06 19:55:41', '2022-05-06 19:57:00', NULL, 1, 0, 0, 1, '16.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '798.4000', '798.4000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '798.4000', '798.4000', '798.4000', '798.4000', 1, 0, NULL, NULL, 0),
(7, 1, '2022-05-06 19:58:59', '2022-05-06 20:58:08', NULL, 1, 0, 0, 1, '5.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '249.5000', '249.5000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '249.5000', '249.5000', '249.5000', '249.5000', 1, 0, NULL, NULL, 0),
(8, 1, '2022-05-06 20:43:49', '2022-05-06 20:46:31', NULL, 1, 0, 0, 1, '15.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '748.5000', '748.5000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '748.5000', '748.5000', '748.5000', '748.5000', 1, 0, NULL, NULL, 0),
(9, 1, '2022-05-06 20:51:39', '2022-05-06 20:51:39', NULL, 1, 0, 0, 1, '5.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '249.5000', '249.5000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '249.5000', '249.5000', '249.5000', '249.5000', 1, 0, NULL, NULL, 0),
(10, 1, '2022-05-09 14:09:25', '2022-05-09 14:13:01', NULL, 1, 0, 0, 1, '15.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '748.5000', '748.5000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '748.5000', '748.5000', '748.5000', '748.5000', 1, 0, NULL, NULL, 0),
(11, 1, '2022-05-10 12:45:53', '2022-05-10 13:21:42', NULL, 1, 0, 0, 2, '16.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '1198.4000', '1198.4000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '1198.4000', '1198.4000', '1198.4000', '1198.4000', 1, 0, NULL, NULL, 0),
(12, 1, '2022-05-11 19:21:08', '2022-05-11 19:36:07', NULL, 1, 0, 0, 2, '35.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '2506.5000', '2506.5000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '2506.5000', '2506.5000', '2506.5000', '2506.5000', 1, 0, NULL, NULL, 0),
(13, 1, '2022-05-11 19:37:35', '2022-05-11 19:37:49', NULL, 1, 0, 0, 1, '2.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '99.8000', '99.8000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '99.8000', '99.8000', '99.8000', '99.8000', 1, 0, NULL, NULL, 0),
(14, 1, '2022-05-11 19:38:23', '2022-05-11 19:38:39', NULL, 1, 0, 0, 1, '2.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '99.8000', '99.8000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '99.8000', '99.8000', '99.8000', '99.8000', 1, 0, NULL, NULL, 0),
(15, 1, '2022-05-11 19:40:17', '2022-05-11 19:41:51', NULL, 1, 0, 0, 2, '4.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '239.6000', '239.6000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '239.6000', '239.6000', '239.6000', '239.6000', 1, 0, NULL, NULL, 0),
(16, 1, '2022-05-11 19:42:18', '2022-05-11 19:48:48', NULL, 1, 0, 0, 2, '20.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '1318.0000', '1318.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '1318.0000', '1318.0000', '1318.0000', '1318.0000', 1, 0, NULL, NULL, 0),
(17, 1, '2022-05-11 19:44:15', '2022-05-11 19:44:15', NULL, 1, 0, 0, 1, '2.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '99.8000', '99.8000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '99.8000', '99.8000', '99.8000', '99.8000', 1, 0, NULL, NULL, 0),
(18, 1, '2022-05-11 19:49:08', '2022-05-11 19:50:02', NULL, 1, 0, 0, 1, '4.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '199.6000', '199.6000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '199.6000', '199.6000', '199.6000', '199.6000', 1, 0, NULL, NULL, 0),
(19, 1, '2022-05-11 19:50:36', '2022-05-11 19:50:47', NULL, 1, 0, 0, 1, '4.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '359.6000', '359.6000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '359.6000', '359.6000', '359.6000', '359.6000', 1, 0, NULL, NULL, 0),
(20, 1, '2022-05-11 19:52:35', '2022-05-11 19:52:35', NULL, 1, 0, 0, 1, '2.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '179.8000', '179.8000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '179.8000', '179.8000', '179.8000', '179.8000', 1, 0, NULL, NULL, 0),
(21, 1, '2022-05-11 19:53:39', '2022-05-11 19:54:35', NULL, 1, 0, 0, 1, '4.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '359.6000', '359.6000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '359.6000', '359.6000', '359.6000', '359.6000', 1, 0, NULL, NULL, 0),
(22, 1, '2022-05-11 19:56:48', '2022-05-11 20:11:20', NULL, 1, 0, 0, 2, '20.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '1478.0000', '1478.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '1478.0000', '1478.0000', '1478.0000', '1478.0000', 1, 0, NULL, NULL, 0),
(23, 1, '2022-05-11 20:11:44', '2022-05-11 20:11:44', NULL, 1, 0, 0, 1, '2.0000', 0, '0.0000', '0.0000', 'BRL', 'BRL', 'BRL', '179.8000', '179.8000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 'BRL', '1.0000', '1.0000', NULL, NULL, '179.8000', '179.8000', '179.8000', '179.8000', 1, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quote_address`
--

DROP TABLE IF EXISTS `quote_address`;
CREATE TABLE IF NOT EXISTS `quote_address` (
  `address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  PRIMARY KEY (`address_id`),
  KEY `QUOTE_ADDRESS_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';

--
-- Extraindo dados da tabela `quote_address`
--

INSERT INTO `quote_address` (`address_id`, `quote_id`, `created_at`, `updated_at`, `customer_id`, `save_in_address_book`, `customer_address_id`, `address_type`, `email`, `prefix`, `firstname`, `middlename`, `lastname`, `suffix`, `company`, `street`, `city`, `region`, `region_id`, `postcode`, `country_id`, `telephone`, `fax`, `same_as_billing`, `collect_shipping_rates`, `shipping_method`, `shipping_description`, `weight`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `tax_amount`, `base_tax_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `discount_amount`, `base_discount_amount`, `grand_total`, `base_grand_total`, `customer_notes`, `applied_taxes`, `discount_description`, `shipping_discount_amount`, `base_shipping_discount_amount`, `subtotal_incl_tax`, `base_subtotal_total_incl_tax`, `discount_tax_compensation_amount`, `base_discount_tax_compensation_amount`, `shipping_discount_tax_compensation_amount`, `base_shipping_discount_tax_compensation_amnt`, `shipping_incl_tax`, `base_shipping_incl_tax`, `vat_id`, `vat_is_valid`, `vat_request_id`, `vat_request_date`, `vat_request_success`, `gift_message_id`, `free_shipping`) VALUES
(1, 1, '2022-04-29 19:39:29', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 1, '2022-04-29 19:39:29', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '0.0000', '49.9000', '49.9000', '49.9000', '49.9000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '49.9000', '49.9000', NULL, '[]', NULL, '0.0000', '0.0000', '49.9000', '49.9000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 2, '2022-04-29 20:09:13', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 2, '2022-04-29 20:09:13', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 3, '2022-04-29 20:19:48', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 3, '2022-04-29 20:19:48', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 4, '2022-05-05 19:37:04', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 4, '2022-05-05 19:37:04', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '0.0000', '249.5000', '249.5000', '249.5000', '249.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '249.5000', '249.5000', NULL, '[]', NULL, '0.0000', '0.0000', '249.5000', '249.5000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 5, '2022-05-05 20:02:46', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 5, '2022-05-05 20:02:46', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '0.0000', '199.6000', '199.6000', '199.6000', '199.6000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '199.6000', '199.6000', NULL, '[]', NULL, '0.0000', '0.0000', '199.6000', '199.6000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, 6, '2022-05-06 19:55:41', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(14, 6, '2022-05-06 19:55:41', '2022-05-06 19:55:42', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '798.4000', '798.4000', '798.4000', '798.4000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '798.4000', '798.4000', NULL, '[]', NULL, '0.0000', '0.0000', '798.4000', '798.4000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(21, 8, '2022-05-06 20:43:49', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(22, 8, '2022-05-06 20:43:49', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '748.5000', '748.5000', '748.5000', '748.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '748.5000', '748.5000', NULL, '[]', NULL, '0.0000', '0.0000', '748.5000', '748.5000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(25, 9, '2022-05-06 20:51:39', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(26, 9, '2022-05-06 20:51:39', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '0.0000', '249.5000', '249.5000', '249.5000', '249.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '249.5000', '249.5000', NULL, '[]', NULL, '0.0000', '0.0000', '249.5000', '249.5000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(27, 7, '2022-05-06 20:58:00', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(28, 7, '2022-05-06 20:58:00', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '0.0000', '249.5000', '249.5000', '249.5000', '249.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '249.5000', '249.5000', NULL, '[]', NULL, '0.0000', '0.0000', '249.5000', '249.5000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(29, 10, '2022-05-09 14:09:25', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(30, 10, '2022-05-09 14:09:25', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '748.5000', '748.5000', '748.5000', '748.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '748.5000', '748.5000', NULL, '[]', NULL, '0.0000', '0.0000', '748.5000', '748.5000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(31, 11, '2022-05-10 12:45:53', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(32, 11, '2022-05-10 12:45:53', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '1198.4000', '1198.4000', '1198.4000', '1198.4000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1198.4000', '1198.4000', NULL, '[]', NULL, '0.0000', '0.0000', '1198.4000', '1198.4000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(33, 12, '2022-05-11 19:21:08', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(34, 12, '2022-05-11 19:21:08', '2022-05-11 19:21:08', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '2506.5000', '2506.5000', '2506.5000', '2506.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2506.5000', '2506.5000', NULL, '[]', NULL, '0.0000', '0.0000', '2506.5000', '2506.5000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(35, 13, '2022-05-11 19:37:35', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(36, 13, '2022-05-11 19:37:35', '2022-05-11 19:37:36', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '99.8000', '99.8000', '99.8000', '99.8000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '99.8000', '99.8000', NULL, '[]', NULL, '0.0000', '0.0000', '99.8000', '99.8000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(37, 14, '2022-05-11 19:38:23', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(38, 14, '2022-05-11 19:38:23', '2022-05-11 19:38:23', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '99.8000', '99.8000', '99.8000', '99.8000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '99.8000', '99.8000', NULL, '[]', NULL, '0.0000', '0.0000', '99.8000', '99.8000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(39, 15, '2022-05-11 19:40:17', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(40, 15, '2022-05-11 19:40:17', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '239.6000', '239.6000', '239.6000', '239.6000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '239.6000', '239.6000', NULL, '[]', NULL, '0.0000', '0.0000', '239.6000', '239.6000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(41, 16, '2022-05-11 19:42:18', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(42, 16, '2022-05-11 19:42:18', '2022-05-11 19:42:18', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '1318.0000', '1318.0000', '1318.0000', '1318.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1318.0000', '1318.0000', NULL, '[]', NULL, '0.0000', '0.0000', '1318.0000', '1318.0000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(43, 17, '2022-05-11 19:44:15', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(44, 17, '2022-05-11 19:44:15', '2022-05-11 19:44:16', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '99.8000', '99.8000', '99.8000', '99.8000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '99.8000', '99.8000', NULL, '[]', NULL, '0.0000', '0.0000', '99.8000', '99.8000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(45, 18, '2022-05-11 19:49:08', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(46, 18, '2022-05-11 19:49:08', '2022-05-11 19:49:08', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '199.6000', '199.6000', '199.6000', '199.6000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '199.6000', '199.6000', NULL, '[]', NULL, '0.0000', '0.0000', '199.6000', '199.6000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(47, 19, '2022-05-11 19:50:37', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(48, 19, '2022-05-11 19:50:37', '2022-05-11 19:50:37', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '359.6000', '359.6000', '359.6000', '359.6000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '359.6000', '359.6000', NULL, '[]', NULL, '0.0000', '0.0000', '359.6000', '359.6000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(49, 20, '2022-05-11 19:52:35', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(50, 20, '2022-05-11 19:52:35', '2022-05-11 19:52:35', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '179.8000', '179.8000', '179.8000', '179.8000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '179.8000', '179.8000', NULL, '[]', NULL, '0.0000', '0.0000', '179.8000', '179.8000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(51, 21, '2022-05-11 19:53:39', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(52, 21, '2022-05-11 19:53:39', '2022-05-11 19:53:39', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '359.6000', '359.6000', '359.6000', '359.6000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '359.6000', '359.6000', NULL, '[]', NULL, '0.0000', '0.0000', '359.6000', '359.6000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(53, 22, '2022-05-11 19:56:48', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(54, 22, '2022-05-11 19:56:48', '2022-05-11 19:56:48', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '1478.0000', '1478.0000', '1478.0000', '1478.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1478.0000', '1478.0000', NULL, '[]', NULL, '0.0000', '0.0000', '1478.0000', '1478.0000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(55, 23, '2022-05-11 20:11:44', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'null', NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(56, 23, '2022-05-11 20:11:44', '2022-05-11 20:11:45', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '0.0000', '179.8000', '179.8000', '179.8000', '179.8000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '179.8000', '179.8000', NULL, '[]', NULL, '0.0000', '0.0000', '179.8000', '179.8000', '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quote_address_item`
--

DROP TABLE IF EXISTS `quote_address_item`;
CREATE TABLE IF NOT EXISTS `quote_address_item` (
  `address_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int(10) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) UNSIGNED DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` int(10) UNSIGNED DEFAULT NULL COMMENT 'Free Shipping',
  PRIMARY KEY (`address_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';

-- --------------------------------------------------------

--
-- Estrutura da tabela `quote_id_mask`
--

DROP TABLE IF EXISTS `quote_id_mask`;
CREATE TABLE IF NOT EXISTS `quote_id_mask` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `quote_id` int(10) UNSIGNED NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ID_MASK_MASKED_ID` (`masked_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Quote ID and masked ID mapping';

--
-- Extraindo dados da tabela `quote_id_mask`
--

INSERT INTO `quote_id_mask` (`entity_id`, `quote_id`, `masked_id`) VALUES
(17, 19, '0QNSrd2WYEblT87ZRLbMANujuEbcCPEr'),
(14, 16, '0VnvZfXFR8bFt4xBi2JpS0vauQrbDjZK'),
(21, 23, '89DJ981amVO3O9DrpwjHNGfF5DFMwL4O'),
(3, 4, 'AgHcRL75RzYCR19noQe80KcjwAf8d5EF'),
(18, 20, 'AHwPM2hPjHwi5aHMymhROwL5ewmvnRxN'),
(15, 17, 'CEAjHGcbQe8vFpc2JuLoxOmB8jKKkCJr'),
(12, 14, 'CjhKGQSLtDTMc5ESidPfwFMlIBJq2uRb'),
(10, 12, 'cwkm8xX9ryCk9HvcYKlMcZh0gpi6nOvw'),
(8, 10, 'DqD9LUG64q0TSR69BEFjXpHREhUXd2p7'),
(11, 13, 'EiAvvGBLaehptrlvIoLdglcwWLJyozec'),
(13, 15, 'h5Tqm19DClgxDtPXsKdVeCyuudWUlPgQ'),
(4, 5, 'HJApaCDuEhX03w6zKhyDFT40Wz5RdLyQ'),
(16, 18, 'NUzKGFXokoStACbkIw271wbewu34LpSU'),
(20, 22, 'OxD0n9chsoJECoMQYulSxYSMoUGgpxf6'),
(2, 3, 'pOqC9sPokeh0qQCXNdHewLbvUC1GMuei'),
(19, 21, 'qjuU7o5tw3BbJ5k9qyWvKnweHrWLYDqk'),
(7, 8, 'sc4mFLRy3zGSD7hED4X5hTBQUxkCIzIk'),
(6, 7, 'UJH9hOTnI7VsGpdUxkRPho7uAtU4WIZV'),
(1, 1, 'V8Cr0wI9WxZbSquOke5m8Kfm1Lu1n1Ik'),
(5, 6, 'vBWF0H69vPiVDyXinrsesLFCQ63Tuo49'),
(9, 11, 'ZrfRGoTeUVQ8uZNRc4xRLCIiefoYG8bh');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quote_item`
--

DROP TABLE IF EXISTS `quote_item`;
CREATE TABLE IF NOT EXISTS `quote_item` (
  `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';

--
-- Extraindo dados da tabela `quote_item`
--

INSERT INTO `quote_item` (`item_id`, `quote_id`, `created_at`, `updated_at`, `product_id`, `store_id`, `parent_item_id`, `is_virtual`, `sku`, `name`, `description`, `applied_rule_ids`, `additional_data`, `is_qty_decimal`, `no_discount`, `weight`, `qty`, `price`, `base_price`, `custom_price`, `discount_percent`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `row_total`, `base_row_total`, `row_total_with_discount`, `row_weight`, `product_type`, `base_tax_before_discount`, `tax_before_discount`, `original_custom_price`, `redirect_url`, `base_cost`, `price_incl_tax`, `base_price_incl_tax`, `row_total_incl_tax`, `base_row_total_incl_tax`, `discount_tax_compensation_amount`, `base_discount_tax_compensation_amount`, `gift_message_id`, `free_shipping`, `weee_tax_applied`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`) VALUES
(1, 1, '2022-04-29 19:39:29', '0000-00-00 00:00:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '1.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '49.9000', '49.9000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '49.9000', '49.9000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, '2022-05-05 19:51:32', '0000-00-00 00:00:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '5.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '249.5000', '249.5000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '249.5000', '249.5000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 5, '2022-05-05 20:02:46', '0000-00-00 00:00:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '4.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '199.6000', '199.6000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '199.6000', '199.6000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 6, '2022-05-06 19:55:41', '2022-05-06 19:57:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '16.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '798.4000', '798.4000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '798.4000', '798.4000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 8, '2022-05-06 20:43:49', '2022-05-06 20:46:31', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '15.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '748.5000', '748.5000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '748.5000', '748.5000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 9, '2022-05-06 20:51:39', '0000-00-00 00:00:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '5.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '249.5000', '249.5000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '249.5000', '249.5000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 7, '2022-05-06 20:58:08', '0000-00-00 00:00:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '5.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '249.5000', '249.5000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '249.5000', '249.5000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 10, '2022-05-09 14:09:25', '2022-05-09 14:13:01', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '15.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '748.5000', '748.5000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '748.5000', '748.5000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 11, '2022-05-10 12:45:53', '2022-05-10 13:21:43', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '14.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '899.0000', '899.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '899.0000', '899.0000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 11, '2022-05-10 12:47:01', '2022-05-10 13:21:42', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '6.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '299.4000', '299.4000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '299.4000', '299.4000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 12, '2022-05-11 19:21:08', '2022-05-11 19:36:07', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '16.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '798.4000', '798.4000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '798.4000', '798.4000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 12, '2022-05-11 19:22:07', '2022-05-11 19:36:08', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '21.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1708.1000', '1708.1000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '1708.1000', '1708.1000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 13, '2022-05-11 19:37:35', '2022-05-11 19:37:49', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '99.8000', '99.8000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '99.8000', '99.8000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 13, '2022-05-11 19:37:49', '2022-05-11 19:37:49', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 14, '2022-05-11 19:38:23', '2022-05-11 19:38:39', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '99.8000', '99.8000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '99.8000', '99.8000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 14, '2022-05-11 19:38:39', '0000-00-00 00:00:00', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '1.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 15, '2022-05-11 19:40:17', '2022-05-11 19:41:52', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '3.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '89.9000', '89.9000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '89.9000', '89.9000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 15, '2022-05-11 19:40:38', '2022-05-11 19:41:51', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '3.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '149.7000', '149.7000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '149.7000', '149.7000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 16, '2022-05-11 19:42:18', '2022-05-11 19:48:48', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '12.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '598.8000', '598.8000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '598.8000', '598.8000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 16, '2022-05-11 19:42:33', '2022-05-11 19:48:48', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '10.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '719.2000', '719.2000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '719.2000', '719.2000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 17, '2022-05-11 19:44:15', '0000-00-00 00:00:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '99.8000', '99.8000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '99.8000', '99.8000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 18, '2022-05-11 19:49:08', '2022-05-11 19:50:02', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '4.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '199.6000', '199.6000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '199.6000', '199.6000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 18, '2022-05-11 19:50:02', '0000-00-00 00:00:00', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 19, '2022-05-11 19:50:37', '2022-05-11 19:50:47', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '4.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '359.6000', '359.6000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '359.6000', '359.6000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 19, '2022-05-11 19:50:48', '0000-00-00 00:00:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 20, '2022-05-11 19:52:35', '0000-00-00 00:00:00', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '179.8000', '179.8000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '179.8000', '179.8000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 21, '2022-05-11 19:53:39', '2022-05-11 19:54:35', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '4.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '359.6000', '359.6000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '359.6000', '359.6000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 21, '2022-05-11 19:54:35', '0000-00-00 00:00:00', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 22, '2022-05-11 19:56:48', '2022-05-11 20:11:20', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '12.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1078.8000', '1078.8000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '1078.8000', '1078.8000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 22, '2022-05-11 19:56:58', '2022-05-11 20:11:21', 1, 1, NULL, 0, '987654', 'Blusa de manga curta canelada', NULL, NULL, NULL, 0, 0, NULL, '11.0000', '49.9000', '49.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '399.2000', '399.2000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '49.9000', '49.9000', '399.2000', '399.2000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 23, '2022-05-11 20:11:44', '0000-00-00 00:00:00', 2, 1, NULL, 0, '5858585', 'Calça Cargo Sarja VZ Refletivo', NULL, NULL, NULL, 0, 0, NULL, '2.0000', '89.9000', '89.9000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '179.8000', '179.8000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '89.9000', '89.9000', '179.8000', '179.8000', '0.0000', '0.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quote_item_option`
--

DROP TABLE IF EXISTS `quote_item_option`;
CREATE TABLE IF NOT EXISTS `quote_item_option` (
  `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';

--
-- Extraindo dados da tabela `quote_item_option`
--

INSERT INTO `quote_item_option` (`option_id`, `item_id`, `product_id`, `code`, `value`) VALUES
(1, 1, 1, 'info_buyRequest', '{\"uenc\":\"aHR0cDovLzEyNy4wLjAuMS9tYWdlbnRvdGVzdGUvY2F0YWxvZ3NlYXJjaC9yZXN1bHQvP3E9Qmx1\",\"product\":\"1\",\"qty\":1}'),
(3, 3, 1, 'info_buyRequest', '{\"qty\":\"5\"}'),
(4, 4, 1, 'info_buyRequest', '{\"qty\":\"4\"}'),
(5, 5, 1, 'info_buyRequest', '{\"qty\":\"3\"}'),
(9, 9, 1, 'info_buyRequest', '{\"qty\":\"5\"}'),
(11, 11, 1, 'info_buyRequest', '{\"qty\":\"5\"}'),
(12, 12, 1, 'info_buyRequest', '{\"qty\":\"5\"}'),
(13, 13, 1, 'info_buyRequest', '{\"qty\":\"5\"}'),
(14, 14, 2, 'info_buyRequest', '{\"qty\":\"5\"}'),
(15, 15, 1, 'info_buyRequest', '{\"qty\":\"3\"}'),
(16, 16, 1, 'info_buyRequest', '{\"qty\":\"2\"}'),
(17, 17, 2, 'info_buyRequest', '{\"qty\":\"3\"}'),
(18, 18, 1, 'info_buyRequest', '{\"qty\":\"1\"}'),
(19, 19, 2, 'info_buyRequest', '{\"qty\":\"1\"}'),
(20, 20, 1, 'info_buyRequest', '{\"qty\":\"1\"}'),
(21, 21, 2, 'info_buyRequest', '{\"qty\":\"1\"}'),
(22, 22, 2, 'info_buyRequest', '{\"qty\":\"1\"}'),
(23, 23, 1, 'info_buyRequest', '{\"qty\":\"1\"}'),
(24, 24, 1, 'info_buyRequest', '{\"qty\":\"2\"}'),
(25, 25, 2, 'info_buyRequest', '{\"qty\":\"2\"}'),
(26, 26, 1, 'info_buyRequest', '{\"qty\":\"2\"}'),
(27, 27, 1, 'info_buyRequest', '{\"qty\":\"2\"}'),
(28, 28, 2, 'info_buyRequest', '{\"qty\":\"2\"}'),
(29, 29, 2, 'info_buyRequest', '{\"qty\":\"2\"}'),
(30, 30, 1, 'info_buyRequest', '{\"qty\":\"2\"}'),
(31, 31, 2, 'info_buyRequest', '{\"qty\":\"2\"}'),
(32, 32, 2, 'info_buyRequest', '{\"qty\":\"2\"}'),
(33, 33, 1, 'info_buyRequest', '{\"qty\":\"2\"}'),
(34, 34, 2, 'info_buyRequest', '{\"qty\":\"2\"}'),
(35, 35, 1, 'info_buyRequest', '{\"qty\":\"2\"}'),
(36, 36, 2, 'info_buyRequest', '{\"qty\":\"2\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quote_payment`
--

DROP TABLE IF EXISTS `quote_payment`;
CREATE TABLE IF NOT EXISTS `quote_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `QUOTE_PAYMENT_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';

-- --------------------------------------------------------

--
-- Estrutura da tabela `quote_shipping_rate`
--

DROP TABLE IF EXISTS `quote_shipping_rate`;
CREATE TABLE IF NOT EXISTS `quote_shipping_rate` (
  `rate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `rating_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `RATING_RATING_CODE` (`rating_code`),
  KEY `RATING_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Ratings';

--
-- Extraindo dados da tabela `rating`
--

INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`, `is_active`) VALUES
(1, 1, 'Quality', 0, 1),
(2, 1, 'Value', 0, 1),
(3, 1, 'Price', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating_entity`
--

DROP TABLE IF EXISTS `rating_entity`;
CREATE TABLE IF NOT EXISTS `rating_entity` (
  `entity_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';

--
-- Extraindo dados da tabela `rating_entity`
--

INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'product_review'),
(3, 'review');

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating_option`
--

DROP TABLE IF EXISTS `rating_option`;
CREATE TABLE IF NOT EXISTS `rating_option` (
  `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `RATING_OPTION_RATING_ID` (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';

--
-- Extraindo dados da tabela `rating_option`
--

INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1, 1, '1', 1, 1),
(2, 1, '2', 2, 2),
(3, 1, '3', 3, 3),
(4, 1, '4', 4, 4),
(5, 1, '5', 5, 5),
(6, 2, '1', 1, 1),
(7, 2, '2', 2, 2),
(8, 2, '3', 3, 3),
(9, 2, '4', 4, 4),
(10, 2, '5', 5, 5),
(11, 3, '1', 1, 1),
(12, 3, '2', 2, 2),
(13, 3, '3', 3, 3),
(14, 3, '4', 4, 4),
(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating_option_vote`
--

DROP TABLE IF EXISTS `rating_option_vote`;
CREATE TABLE IF NOT EXISTS `rating_option_vote` (
  `vote_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  KEY `RATING_OPTION_VOTE_OPTION_ID` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
CREATE TABLE IF NOT EXISTS `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating_store`
--

DROP TABLE IF EXISTS `rating_store`;
CREATE TABLE IF NOT EXISTS `rating_store` (
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating_title`
--

DROP TABLE IF EXISTS `rating_title`;
CREATE TABLE IF NOT EXISTS `rating_title` (
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';

-- --------------------------------------------------------

--
-- Estrutura da tabela `release_notification_viewer_log`
--

DROP TABLE IF EXISTS `release_notification_viewer_log`;
CREATE TABLE IF NOT EXISTS `release_notification_viewer_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `viewer_id` int(10) UNSIGNED NOT NULL COMMENT 'Viewer admin user ID',
  `last_view_version` varchar(16) NOT NULL COMMENT 'Viewer last view on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID` (`viewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Release Notification Viewer Log Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `reporting_counts`
--

DROP TABLE IF EXISTS `reporting_counts`;
CREATE TABLE IF NOT EXISTS `reporting_counts` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int(10) UNSIGNED DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all count related events generated via the cron job';

-- --------------------------------------------------------

--
-- Estrutura da tabela `reporting_module_status`
--

DROP TABLE IF EXISTS `reporting_module_status`;
CREATE TABLE IF NOT EXISTS `reporting_module_status` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Module Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module Status Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `reporting_orders`
--

DROP TABLE IF EXISTS `reporting_orders`;
CREATE TABLE IF NOT EXISTS `reporting_orders` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `total` decimal(10,0) UNSIGNED DEFAULT NULL,
  `total_base` decimal(10,0) UNSIGNED DEFAULT NULL,
  `item_count` int(10) UNSIGNED NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all orders';

-- --------------------------------------------------------

--
-- Estrutura da tabela `reporting_system_updates`
--

DROP TABLE IF EXISTS `reporting_system_updates`;
CREATE TABLE IF NOT EXISTS `reporting_system_updates` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for system updates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `reporting_users`
--

DROP TABLE IF EXISTS `reporting_users`;
CREATE TABLE IF NOT EXISTS `reporting_users` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for user actions';

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_compared_product_index`
--

DROP TABLE IF EXISTS `report_compared_product_index`;
CREATE TABLE IF NOT EXISTS `report_compared_product_index` (
  `index_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_event`
--

DROP TABLE IF EXISTS `report_event`;
CREATE TABLE IF NOT EXISTS `report_event` (
  `event_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `REPORT_EVENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';

--
-- Extraindo dados da tabela `report_event`
--

INSERT INTO `report_event` (`event_id`, `logged_at`, `event_type_id`, `object_id`, `subject_id`, `subtype`, `store_id`) VALUES
(1, '2022-04-29 19:39:29', 4, 1, 2, 1, 1),
(2, '2022-04-29 20:22:52', 1, 1, 2, 1, 1),
(3, '2022-05-05 19:01:00', 4, 1, 4, 1, 1),
(4, '2022-05-05 19:51:32', 4, 1, 4, 1, 1),
(5, '2022-05-05 20:02:46', 4, 1, 6, 1, 1),
(6, '2022-05-06 19:55:41', 4, 1, 0, 1, 1),
(7, '2022-05-06 19:58:59', 4, 1, 7, 1, 1),
(8, '2022-05-06 20:05:19', 4, 1, 7, 1, 1),
(9, '2022-05-06 20:38:10', 4, 1, 7, 1, 1),
(10, '2022-05-06 20:43:49', 4, 1, 0, 1, 1),
(11, '2022-05-06 20:48:13', 4, 1, 7, 1, 1),
(12, '2022-05-06 20:51:39', 4, 1, 0, 1, 1),
(13, '2022-05-06 20:58:08', 4, 1, 7, 1, 1),
(14, '2022-05-09 14:09:25', 4, 1, 0, 1, 1),
(15, '2022-05-10 12:44:22', 1, 1, 0, 1, 1),
(16, '2022-05-10 12:45:53', 4, 2, 0, 1, 1),
(17, '2022-05-10 12:47:01', 4, 1, 0, 1, 1),
(18, '2022-05-11 19:21:08', 4, 1, 0, 1, 1),
(19, '2022-05-11 19:22:07', 4, 2, 0, 1, 1),
(20, '2022-05-11 19:37:35', 4, 1, 0, 1, 1),
(21, '2022-05-11 19:37:49', 4, 2, 0, 1, 1),
(22, '2022-05-11 19:38:23', 4, 1, 0, 1, 1),
(23, '2022-05-11 19:38:39', 4, 2, 0, 1, 1),
(24, '2022-05-11 19:40:17', 4, 2, 0, 1, 1),
(25, '2022-05-11 19:40:38', 4, 1, 0, 1, 1),
(26, '2022-05-11 19:42:18', 4, 1, 0, 1, 1),
(27, '2022-05-11 19:42:33', 4, 2, 0, 1, 1),
(28, '2022-05-11 19:44:15', 4, 1, 13, 1, 1),
(29, '2022-05-11 19:49:08', 4, 1, 0, 1, 1),
(30, '2022-05-11 19:50:02', 4, 2, 0, 1, 1),
(31, '2022-05-11 19:50:37', 4, 2, 0, 1, 1),
(32, '2022-05-11 19:50:48', 4, 1, 0, 1, 1),
(33, '2022-05-11 19:52:35', 4, 2, 0, 1, 1),
(34, '2022-05-11 19:53:39', 4, 2, 0, 1, 1),
(35, '2022-05-11 19:54:35', 4, 1, 0, 1, 1),
(36, '2022-05-11 19:56:48', 4, 2, 0, 1, 1),
(37, '2022-05-11 19:56:58', 4, 1, 0, 1, 1),
(38, '2022-05-11 20:11:44', 4, 2, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_event_types`
--

DROP TABLE IF EXISTS `report_event_types`;
CREATE TABLE IF NOT EXISTS `report_event_types` (
  `event_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';

--
-- Extraindo dados da tabela `report_event_types`
--

INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1, 'catalog_product_view', 0),
(2, 'sendfriend_product', 0),
(3, 'catalog_product_compare_add_product', 0),
(4, 'checkout_cart_add_product', 0),
(5, 'wishlist_add_product', 0),
(6, 'wishlist_share', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_daily`;
CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_daily` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_monthly`;
CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_monthly` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_yearly`;
CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_yearly` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_viewed_product_index`
--

DROP TABLE IF EXISTS `report_viewed_product_index`;
CREATE TABLE IF NOT EXISTS `report_viewed_product_index` (
  `index_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';

--
-- Extraindo dados da tabela `report_viewed_product_index`
--

INSERT INTO `report_viewed_product_index` (`index_id`, `visitor_id`, `customer_id`, `product_id`, `store_id`, `added_at`) VALUES
(1, 2, NULL, 1, 1, '2022-04-29 20:22:52'),
(2, NULL, NULL, 1, 1, '2022-05-10 12:44:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `REVIEW_ENTITY_ID` (`entity_id`),
  KEY `REVIEW_STATUS_ID` (`status_id`),
  KEY `REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_detail`
--

DROP TABLE IF EXISTS `review_detail`;
CREATE TABLE IF NOT EXISTS `review_detail` (
  `detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
CREATE TABLE IF NOT EXISTS `review_entity` (
  `entity_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';

--
-- Extraindo dados da tabela `review_entity`
--

INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'customer'),
(3, 'category');

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_entity_summary`
--

DROP TABLE IF EXISTS `review_entity_summary`;
CREATE TABLE IF NOT EXISTS `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_status`
--

DROP TABLE IF EXISTS `review_status`;
CREATE TABLE IF NOT EXISTS `review_status` (
  `status_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';

--
-- Extraindo dados da tabela `review_status`
--

INSERT INTO `review_status` (`status_id`, `status_code`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_store`
--

DROP TABLE IF EXISTS `review_store`;
CREATE TABLE IF NOT EXISTS `review_store` (
  `review_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `REVIEW_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule`
--

DROP TABLE IF EXISTS `salesrule`;
CREATE TABLE IF NOT EXISTS `salesrule` (
  `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  PRIMARY KEY (`rule_id`),
  KEY `SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_coupon`
--

DROP TABLE IF EXISTS `salesrule_coupon`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon` (
  `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) UNSIGNED DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) UNSIGNED DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  `generated_by_dotmailer` smallint(6) DEFAULT NULL COMMENT '1 = Generated by dotmailer',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `SALESRULE_COUPON_RULE_ID` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_coupon_aggregated`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_order`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_updated`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_7196FA120A4F0F84E1B66605E87E213E` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Aggregated Updated';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `salesrule_coupon_usage`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon_usage` (
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
CREATE TABLE IF NOT EXISTS `salesrule_customer` (
  `rule_customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_customer_group`
--

DROP TABLE IF EXISTS `salesrule_customer_group`;
CREATE TABLE IF NOT EXISTS `salesrule_customer_group` (
  `rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_label`
--

DROP TABLE IF EXISTS `salesrule_label`;
CREATE TABLE IF NOT EXISTS `salesrule_label` (
  `label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `SALESRULE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_product_attribute`
--

DROP TABLE IF EXISTS `salesrule_product_attribute`;
CREATE TABLE IF NOT EXISTS `salesrule_product_attribute` (
  `rule_id` int(10) UNSIGNED NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';

-- --------------------------------------------------------

--
-- Estrutura da tabela `salesrule_website`
--

DROP TABLE IF EXISTS `salesrule_website`;
CREATE TABLE IF NOT EXISTS `salesrule_website` (
  `rule_id` int(10) UNSIGNED NOT NULL,
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_daily` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_monthly` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_yearly` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_creditmemo`
--

DROP TABLE IF EXISTS `sales_creditmemo`;
CREATE TABLE IF NOT EXISTS `sales_creditmemo` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `SALES_CREDITMEMO_STATE` (`state`),
  KEY `SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_creditmemo_comment`
--

DROP TABLE IF EXISTS `sales_creditmemo_comment`;
CREATE TABLE IF NOT EXISTS `sales_creditmemo_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_creditmemo_grid`
--

DROP TABLE IF EXISTS `sales_creditmemo_grid`;
CREATE TABLE IF NOT EXISTS `sales_creditmemo_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int(11) DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_creditmemo_item`
--

DROP TABLE IF EXISTS `sales_creditmemo_item`;
CREATE TABLE IF NOT EXISTS `sales_creditmemo_item` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_invoice`
--

DROP TABLE IF EXISTS `sales_invoice`;
CREATE TABLE IF NOT EXISTS `sales_invoice` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_STATE` (`state`),
  KEY `SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `SALES_INVOICE_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
CREATE TABLE IF NOT EXISTS `sales_invoiced_aggregated` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
CREATE TABLE IF NOT EXISTS `sales_invoiced_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_invoice_comment`
--

DROP TABLE IF EXISTS `sales_invoice_comment`;
CREATE TABLE IF NOT EXISTS `sales_invoice_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_invoice_grid`
--

DROP TABLE IF EXISTS `sales_invoice_grid`;
CREATE TABLE IF NOT EXISTS `sales_invoice_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_GRID_STATE` (`state`),
  KEY `SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_invoice_item`
--

DROP TABLE IF EXISTS `sales_invoice_item`;
CREATE TABLE IF NOT EXISTS `sales_invoice_item` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE IF NOT EXISTS `sales_order` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` int(11) DEFAULT NULL,
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(32) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(32) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(32) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(32) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_STATUS` (`status`),
  KEY `SALES_ORDER_STATE` (`state`),
  KEY `SALES_ORDER_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `SALES_ORDER_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_address`
--

DROP TABLE IF EXISTS `sales_order_address`;
CREATE TABLE IF NOT EXISTS `sales_order_address` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
CREATE TABLE IF NOT EXISTS `sales_order_aggregated_created` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `sales_order_aggregated_updated`;
CREATE TABLE IF NOT EXISTS `sales_order_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_grid`
--

DROP TABLE IF EXISTS `sales_order_grid`;
CREATE TABLE IF NOT EXISTS `sales_order_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `signifyd_guarantee_status` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_GRID_STATUS` (`status`),
  KEY `SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_GRID_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_item`
--

DROP TABLE IF EXISTS `sales_order_item`;
CREATE TABLE IF NOT EXISTS `sales_order_item` (
  `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `SALES_ORDER_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_payment`
--

DROP TABLE IF EXISTS `sales_order_payment`;
CREATE TABLE IF NOT EXISTS `sales_order_payment` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(32) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans Id',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_status`
--

DROP TABLE IF EXISTS `sales_order_status`;
CREATE TABLE IF NOT EXISTS `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Extraindo dados da tabela `sales_order_status`
--

INSERT INTO `sales_order_status` (`status`, `label`) VALUES
('canceled', 'Canceled'),
('closed', 'Closed'),
('complete', 'Complete'),
('fraud', 'Suspected Fraud'),
('holded', 'On Hold'),
('payment_review', 'Payment Review'),
('paypal_canceled_reversal', 'PayPal Canceled Reversal'),
('paypal_reversed', 'PayPal Reversed'),
('pending', 'Pending'),
('pending_payment', 'Pending Payment'),
('pending_paypal', 'Pending PayPal'),
('processing', 'Processing');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_status_history`
--

DROP TABLE IF EXISTS `sales_order_status_history`;
CREATE TABLE IF NOT EXISTS `sales_order_status_history` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_status_label`
--

DROP TABLE IF EXISTS `sales_order_status_label`;
CREATE TABLE IF NOT EXISTS `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_status_state`
--

DROP TABLE IF EXISTS `sales_order_status_state`;
CREATE TABLE IF NOT EXISTS `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Extraindo dados da tabela `sales_order_status_state`
--

INSERT INTO `sales_order_status_state` (`status`, `state`, `is_default`, `visible_on_front`) VALUES
('canceled', 'canceled', 1, 1),
('closed', 'closed', 1, 1),
('complete', 'complete', 1, 1),
('fraud', 'payment_review', 0, 1),
('fraud', 'processing', 0, 1),
('holded', 'holded', 1, 1),
('payment_review', 'payment_review', 1, 1),
('pending', 'new', 1, 1),
('pending_payment', 'pending_payment', 1, 0),
('processing', 'processing', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_tax`
--

DROP TABLE IF EXISTS `sales_order_tax`;
CREATE TABLE IF NOT EXISTS `sales_order_tax` (
  `tax_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_order_tax_item`
--

DROP TABLE IF EXISTS `sales_order_tax_item`;
CREATE TABLE IF NOT EXISTS `sales_order_tax_item` (
  `tax_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) UNSIGNED NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(12,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(12,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(12,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(12,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` (`associated_item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_payment_transaction`
--

DROP TABLE IF EXISTS `sales_payment_transaction`;
CREATE TABLE IF NOT EXISTS `sales_payment_transaction` (
  `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated`;
CREATE TABLE IF NOT EXISTS `sales_refunded_aggregated` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
CREATE TABLE IF NOT EXISTS `sales_refunded_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_sequence_meta`
--

DROP TABLE IF EXISTS `sales_sequence_meta`;
CREATE TABLE IF NOT EXISTS `sales_sequence_meta` (
  `meta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `sequence_table` varchar(32) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='sales_sequence_meta';

--
-- Extraindo dados da tabela `sales_sequence_meta`
--

INSERT INTO `sales_sequence_meta` (`meta_id`, `entity_type`, `store_id`, `sequence_table`) VALUES
(1, 'order', 0, 'sequence_order_0'),
(2, 'invoice', 0, 'sequence_invoice_0'),
(3, 'creditmemo', 0, 'sequence_creditmemo_0'),
(4, 'shipment', 0, 'sequence_shipment_0'),
(5, 'order', 1, 'sequence_order_1'),
(6, 'invoice', 1, 'sequence_invoice_1'),
(7, 'creditmemo', 1, 'sequence_creditmemo_1'),
(8, 'shipment', 1, 'sequence_shipment_1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_sequence_profile`
--

DROP TABLE IF EXISTS `sales_sequence_profile`;
CREATE TABLE IF NOT EXISTS `sales_sequence_profile` (
  `profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `meta_id` int(10) UNSIGNED NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int(10) UNSIGNED NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int(10) UNSIGNED NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='sales_sequence_profile';

--
-- Extraindo dados da tabela `sales_sequence_profile`
--

INSERT INTO `sales_sequence_profile` (`profile_id`, `meta_id`, `prefix`, `suffix`, `start_value`, `step`, `max_value`, `warning_value`, `is_active`) VALUES
(1, 1, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(2, 2, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(3, 3, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(4, 4, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(5, 5, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(6, 6, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(7, 7, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(8, 8, NULL, NULL, 1, 1, 4294967295, 4294966295, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_shipment`
--

DROP TABLE IF EXISTS `sales_shipment`;
CREATE TABLE IF NOT EXISTS `sales_shipment` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Send Email',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `SALES_SHIPMENT_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_shipment_comment`
--

DROP TABLE IF EXISTS `sales_shipment_comment`;
CREATE TABLE IF NOT EXISTS `sales_shipment_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_shipment_grid`
--

DROP TABLE IF EXISTS `sales_shipment_grid`;
CREATE TABLE IF NOT EXISTS `sales_shipment_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Order Increment Id',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_shipment_item`
--

DROP TABLE IF EXISTS `sales_shipment_item`;
CREATE TABLE IF NOT EXISTS `sales_shipment_item` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_shipment_track`
--

DROP TABLE IF EXISTS `sales_shipment_track`;
CREATE TABLE IF NOT EXISTS `sales_shipment_track` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated`;
CREATE TABLE IF NOT EXISTS `sales_shipping_aggregated` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
CREATE TABLE IF NOT EXISTS `sales_shipping_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `search_query`
--

DROP TABLE IF EXISTS `search_query`;
CREATE TABLE IF NOT EXISTS `search_query` (
  `query_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `SEARCH_QUERY_IS_PROCESSED` (`is_processed`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Search query table';

--
-- Extraindo dados da tabela `search_query`
--

INSERT INTO `search_query` (`query_id`, `query_text`, `num_results`, `popularity`, `redirect`, `store_id`, `display_in_terms`, `is_active`, `is_processed`, `updated_at`) VALUES
(1, 'blusa', 1, 10, NULL, 1, 1, 1, 0, '2022-05-05 19:00:56'),
(12, 'Blu', 1, 1, NULL, 1, 1, 1, 0, '2022-04-29 19:39:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `search_synonyms`
--

DROP TABLE IF EXISTS `search_synonyms`;
CREATE TABLE IF NOT EXISTS `search_synonyms` (
  `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group Id',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id - identifies the store view these synonyms belong to',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id - identifies the website id these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table storing various synonyms groups';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sendfriend_log`
--

DROP TABLE IF EXISTS `sendfriend_log`;
CREATE TABLE IF NOT EXISTS `sendfriend_log` (
  `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `SENDFRIEND_LOG_IP` (`ip`),
  KEY `SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence_creditmemo_0`
--

DROP TABLE IF EXISTS `sequence_creditmemo_0`;
CREATE TABLE IF NOT EXISTS `sequence_creditmemo_0` (
  `sequence_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence_creditmemo_1`
--

DROP TABLE IF EXISTS `sequence_creditmemo_1`;
CREATE TABLE IF NOT EXISTS `sequence_creditmemo_1` (
  `sequence_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence_invoice_0`
--

DROP TABLE IF EXISTS `sequence_invoice_0`;
CREATE TABLE IF NOT EXISTS `sequence_invoice_0` (
  `sequence_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence_invoice_1`
--

DROP TABLE IF EXISTS `sequence_invoice_1`;
CREATE TABLE IF NOT EXISTS `sequence_invoice_1` (
  `sequence_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence_order_0`
--

DROP TABLE IF EXISTS `sequence_order_0`;
CREATE TABLE IF NOT EXISTS `sequence_order_0` (
  `sequence_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence_order_1`
--

DROP TABLE IF EXISTS `sequence_order_1`;
CREATE TABLE IF NOT EXISTS `sequence_order_1` (
  `sequence_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence_shipment_0`
--

DROP TABLE IF EXISTS `sequence_shipment_0`;
CREATE TABLE IF NOT EXISTS `sequence_shipment_0` (
  `sequence_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sequence_shipment_1`
--

DROP TABLE IF EXISTS `sequence_shipment_1`;
CREATE TABLE IF NOT EXISTS `sequence_shipment_1` (
  `sequence_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';

-- --------------------------------------------------------

--
-- Estrutura da tabela `setup_module`
--

DROP TABLE IF EXISTS `setup_module`;
CREATE TABLE IF NOT EXISTS `setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module versions registry';

--
-- Extraindo dados da tabela `setup_module`
--

INSERT INTO `setup_module` (`module`, `schema_version`, `data_version`) VALUES
('ADM_QuickDevBar', '0.1.18', '0.1.18'),
('Amazon_Core', '3.0.0', '3.0.0'),
('Amazon_Login', '3.0.0', '3.0.0'),
('Amazon_Payment', '3.0.0', '3.0.0'),
('Dotdigitalgroup_Email', '3.0.1', '3.0.1'),
('Klarna_Core', '5.0.0', '5.0.0'),
('Klarna_Kp', '6.0.0', '6.0.0'),
('Klarna_Ordermanagement', '5.0.2', '5.0.2'),
('Magento_Inventory', '1.0.0', '1.0.0'),
('Magento_InventoryAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryApi', '1.0.0', '1.0.0'),
('Magento_InventoryBundleProduct', '1.0.0', '1.0.0'),
('Magento_InventoryBundleProductAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryCache', '1.0.0', '1.0.0'),
('Magento_InventoryCatalog', '1.0.0', '1.0.0'),
('Magento_InventoryCatalogAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryCatalogApi', '1.0.0', '1.0.0'),
('Magento_InventoryCatalogSearch', '1.0.0', '1.0.0'),
('Magento_InventoryConfigurableProduct', '1.0.0', '1.0.0'),
('Magento_InventoryConfigurableProductAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryConfigurableProductIndexer', '1.0.0', '1.0.0'),
('Magento_InventoryConfiguration', '1.0.0', '1.0.0'),
('Magento_InventoryConfigurationApi', '1.0.0', '1.0.0'),
('Magento_InventoryGroupedProduct', '1.0.0', '1.0.0'),
('Magento_InventoryGroupedProductAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryGroupedProductIndexer', '1.0.0', '1.0.0'),
('Magento_InventoryImportExport', '1.0.0', '1.0.0'),
('Magento_InventoryIndexer', '1.0.0', '1.0.0'),
('Magento_InventoryLowQuantityNotification', '1.0.0', '1.0.0'),
('Magento_InventoryLowQuantityNotificationAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryLowQuantityNotificationApi', '1.0.0', '1.0.0'),
('Magento_InventoryMultiDimensionalIndexerApi', '1.0.0', '1.0.0'),
('Magento_InventoryProductAlert', '1.0.0', '1.0.0'),
('Magento_InventoryReservations', '1.0.0', '1.0.0'),
('Magento_InventoryReservationsApi', '1.0.0', '1.0.0'),
('Magento_InventorySales', '1.0.0', '1.0.0'),
('Magento_InventorySalesAdminUi', '1.0.0', '1.0.0'),
('Magento_InventorySalesApi', '1.0.0', '1.0.0'),
('Magento_InventoryShipping', '1.0.0', '1.0.0'),
('Magento_InventoryShippingAdminUi', '1.0.0', '1.0.0'),
('Magento_InventorySourceDeductionApi', '1.0.0', '1.0.0'),
('Magento_InventorySourceSelection', '1.0.0', '1.0.0'),
('Magento_InventorySourceSelectionApi', '1.0.0', '1.0.0'),
('MSP_ReCaptcha', '1.5.0', '1.5.0'),
('MSP_TwoFactorAuth', '2.2.0', '2.2.0'),
('Oli_Integration', '1.0.0', '1.0.0'),
('Temando_Shipping', '1.4.0', '1.4.0'),
('Vertex_Tax', '100.2.1', '100.2.1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `shipping_tablerate`
--

DROP TABLE IF EXISTS `shipping_tablerate`;
CREATE TABLE IF NOT EXISTS `shipping_tablerate` (
  `pk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';

-- --------------------------------------------------------

--
-- Estrutura da tabela `signifyd_case`
--

DROP TABLE IF EXISTS `signifyd_case`;
CREATE TABLE IF NOT EXISTS `signifyd_case` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `order_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Order_id',
  `case_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Case_id',
  `guarantee_eligible` tinyint(1) DEFAULT NULL COMMENT 'Guarantee_eligible',
  `guarantee_disposition` varchar(32) DEFAULT 'PENDING' COMMENT 'Guarantee_disposition',
  `status` varchar(32) DEFAULT 'PENDING' COMMENT 'Status',
  `score` int(10) UNSIGNED DEFAULT NULL COMMENT 'Score',
  `associated_team` text COMMENT 'Associated_team',
  `review_disposition` varchar(32) DEFAULT NULL COMMENT 'Review_disposition',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated_at',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SIGNIFYD_CASE_ORDER_ID` (`order_id`),
  UNIQUE KEY `SIGNIFYD_CASE_CASE_ID` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='signifyd_case';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
CREATE TABLE IF NOT EXISTS `sitemap` (
  `sitemap_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `SITEMAP_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap';

-- --------------------------------------------------------

--
-- Estrutura da tabela `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `store_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `STORE_CODE` (`code`),
  KEY `STORE_WEBSITE_ID` (`website_id`),
  KEY `STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `STORE_GROUP_ID` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';

--
-- Extraindo dados da tabela `store`
--

INSERT INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0, 'admin', 0, 0, 'Admin', 0, 1),
(1, 'default', 1, 1, 'Default Store View', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_group`
--

DROP TABLE IF EXISTS `store_group`;
CREATE TABLE IF NOT EXISTS `store_group` (
  `group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `STORE_GROUP_CODE` (`code`),
  KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store Groups';

--
-- Extraindo dados da tabela `store_group`
--

INSERT INTO `store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`, `code`) VALUES
(0, 0, 'Default', 0, 0, 'default'),
(1, 1, 'Main Website Store', 2, 1, 'main_website_store');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_website`
--

DROP TABLE IF EXISTS `store_website`;
CREATE TABLE IF NOT EXISTS `store_website` (
  `website_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `STORE_WEBSITE_CODE` (`code`),
  KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';

--
-- Extraindo dados da tabela `store_website`
--

INSERT INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0, 'admin', 'Admin', 0, 0, 0),
(1, 'base', 'Main Website', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_calculation`
--

DROP TABLE IF EXISTS `tax_calculation`;
CREATE TABLE IF NOT EXISTS `tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_calculation_rate`
--

DROP TABLE IF EXISTS `tax_calculation_rate`;
CREATE TABLE IF NOT EXISTS `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) UNSIGNED DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) UNSIGNED DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';

--
-- Extraindo dados da tabela `tax_calculation_rate`
--

INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1, 'US', 12, '*', 'US-CA-*-Rate 1', '8.2500', NULL, NULL, NULL),
(2, 'US', 43, '*', 'US-NY-*-Rate 1', '8.3750', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
CREATE TABLE IF NOT EXISTS `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_calculation_rule`
--

DROP TABLE IF EXISTS `tax_calculation_rule`;
CREATE TABLE IF NOT EXISTS `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE IF NOT EXISTS `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Tax Class';

--
-- Extraindo dados da tabela `tax_class`
--

INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2, 'Taxable Goods', 'PRODUCT'),
(3, 'Retail Customer', 'CUSTOMER'),
(4, 'Refund Adjustments', 'PRODUCT'),
(5, 'Gift Options', 'PRODUCT'),
(6, 'Order Gift Wrapping', 'PRODUCT'),
(7, 'Item Gift Wrapping', 'PRODUCT'),
(8, 'Printed Gift Card', 'PRODUCT'),
(9, 'Reward Points', 'PRODUCT');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
CREATE TABLE IF NOT EXISTS `tax_order_aggregated_created` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `tax_order_aggregated_updated`;
CREATE TABLE IF NOT EXISTS `tax_order_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_checkout_address`
--

DROP TABLE IF EXISTS `temando_checkout_address`;
CREATE TABLE IF NOT EXISTS `temando_checkout_address` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `shipping_address_id` int(10) UNSIGNED NOT NULL COMMENT 'Magento Quote Address Id',
  `service_selection` text COMMENT 'Value Added Services',
  PRIMARY KEY (`entity_id`),
  KEY `TEMANDO_CHKT_ADDR_SHPP_ADDR_ID_QUOTE_ADDR_ADDR_ID` (`shipping_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Checkout Address';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_collection_point_search`
--

DROP TABLE IF EXISTS `temando_collection_point_search`;
CREATE TABLE IF NOT EXISTS `temando_collection_point_search` (
  `shipping_address_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `country_id` varchar(2) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Pending',
  PRIMARY KEY (`shipping_address_id`),
  KEY `TEMANDO_COLLECTION_POINT_SRCH_COUNTRY_ID_DIR_COUNTRY_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Collection Point Search';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_order`
--

DROP TABLE IF EXISTS `temando_order`;
CREATE TABLE IF NOT EXISTS `temando_order` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Magento Order Id',
  `ext_order_id` varchar(64) NOT NULL COMMENT 'Temando Order Id',
  PRIMARY KEY (`entity_id`),
  KEY `TEMANDO_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Order';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_order_collection_point`
--

DROP TABLE IF EXISTS `temando_order_collection_point`;
CREATE TABLE IF NOT EXISTS `temando_order_collection_point` (
  `recipient_address_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `collection_point_id` varchar(64) NOT NULL COMMENT 'Collection Point Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  PRIMARY KEY (`recipient_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order Collection Point Entity';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_order_pickup_location`
--

DROP TABLE IF EXISTS `temando_order_pickup_location`;
CREATE TABLE IF NOT EXISTS `temando_order_pickup_location` (
  `recipient_address_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `pickup_location_id` varchar(64) NOT NULL COMMENT 'Pickup Location Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  PRIMARY KEY (`recipient_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order Pickup Location Entity';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_pickup_location_search`
--

DROP TABLE IF EXISTS `temando_pickup_location_search`;
CREATE TABLE IF NOT EXISTS `temando_pickup_location_search` (
  `shipping_address_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `active` tinyint(1) NOT NULL COMMENT 'Active',
  PRIMARY KEY (`shipping_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pickup Location Search';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_quote_collection_point`
--

DROP TABLE IF EXISTS `temando_quote_collection_point`;
CREATE TABLE IF NOT EXISTS `temando_quote_collection_point` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `recipient_address_id` int(10) UNSIGNED NOT NULL COMMENT 'Quote Address Id',
  `collection_point_id` varchar(64) NOT NULL COMMENT 'Collection Point Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  `opening_hours` text NOT NULL COMMENT 'Opening Hours',
  `shipping_experiences` text NOT NULL COMMENT 'Shipping Experiences',
  `selected` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Selected',
  PRIMARY KEY (`entity_id`),
  KEY `FK_4ABED96BBA0BAF57A5EC10E47B5A0F12` (`recipient_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote Collection Point Entity';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_quote_pickup_location`
--

DROP TABLE IF EXISTS `temando_quote_pickup_location`;
CREATE TABLE IF NOT EXISTS `temando_quote_pickup_location` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `recipient_address_id` int(10) UNSIGNED NOT NULL COMMENT 'Quote Address Id',
  `pickup_location_id` varchar(64) NOT NULL COMMENT 'Pickup Location Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  `opening_hours` text NOT NULL COMMENT 'Opening Hours',
  `shipping_experiences` text NOT NULL COMMENT 'Shipping Experiences',
  `selected` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Selected',
  PRIMARY KEY (`entity_id`),
  KEY `FK_9010B10870AF99FB0560ADA50F3F99F4` (`recipient_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote Pickup Location Entity';

-- --------------------------------------------------------

--
-- Estrutura da tabela `temando_shipment`
--

DROP TABLE IF EXISTS `temando_shipment`;
CREATE TABLE IF NOT EXISTS `temando_shipment` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `shipment_id` int(10) UNSIGNED NOT NULL COMMENT 'Magento Shipment Id',
  `ext_shipment_id` varchar(64) NOT NULL COMMENT 'External Shipment Id',
  `ext_location_id` varchar(64) DEFAULT NULL,
  `ext_tracking_url` varchar(255) DEFAULT NULL COMMENT 'External Tracking Url',
  `ext_tracking_reference` varchar(255) DEFAULT NULL COMMENT 'External Tracking Reference',
  `ext_return_shipment_id` varchar(64) DEFAULT NULL COMMENT 'External Return Shipment Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `TEMANDO_SHIPMENT_SHIPMENT_ID_EXT_SHIPMENT_ID` (`shipment_id`,`ext_shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Shipment';

-- --------------------------------------------------------

--
-- Estrutura da tabela `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `theme_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Id',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Core theme';

--
-- Extraindo dados da tabela `theme`
--

INSERT INTO `theme` (`theme_id`, `parent_id`, `theme_path`, `theme_title`, `preview_image`, `is_featured`, `area`, `type`, `code`) VALUES
(1, NULL, 'Magento/blank', 'Magento Blank', 'preview_image_626c18fd259e9.jpeg', 0, 'frontend', 0, 'Magento/blank'),
(2, 1, 'Magento/luma', 'Magento Luma', 'preview_image_626c18fd3afaf.jpeg', 0, 'frontend', 0, 'Magento/luma'),
(3, NULL, 'Magento/backend', 'Magento 2 backend', NULL, 0, 'adminhtml', 0, 'Magento/backend');

-- --------------------------------------------------------

--
-- Estrutura da tabela `theme_file`
--

DROP TABLE IF EXISTS `theme_file`;
CREATE TABLE IF NOT EXISTS `theme_file` (
  `theme_files_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) UNSIGNED NOT NULL COMMENT 'Theme Id',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files';

-- --------------------------------------------------------

--
-- Estrutura da tabela `translation`
--

DROP TABLE IF EXISTS `translation`;
CREATE TABLE IF NOT EXISTS `translation` (
  `key_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';

-- --------------------------------------------------------

--
-- Estrutura da tabela `ui_bookmark`
--

DROP TABLE IF EXISTS `ui_bookmark`;
CREATE TABLE IF NOT EXISTS `ui_bookmark` (
  `bookmark_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User Id',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint(6) NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Bookmark';

--
-- Extraindo dados da tabela `ui_bookmark`
--

INSERT INTO `ui_bookmark` (`bookmark_id`, `user_id`, `namespace`, `identifier`, `current`, `title`, `config`, `created_at`, `updated_at`) VALUES
(1, 1, 'cms_page_listing', 'current', 0, NULL, '{\"current\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"search\":{\"value\":\"\"},\"columns\":{\"page_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keywords\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"custom_theme_from\":{\"visible\":false,\"sorting\":false},\"custom_theme_to\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"custom_theme\":{\"visible\":false,\"sorting\":false},\"custom_root_template\":{\"visible\":false,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"page_id\":1,\"title\":2,\"identifier\":3,\"page_layout\":4,\"store_id\":5,\"is_active\":6,\"creation_time\":7,\"update_time\":8,\"custom_theme_from\":9,\"custom_theme_to\":10,\"custom_theme\":11,\"custom_root_template\":12,\"meta_title\":13,\"meta_keywords\":14,\"meta_description\":15,\"actions\":16},\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'cms_page_listing', 'default', 1, 'Default View', '{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"search\":{\"value\":\"\"},\"columns\":{\"page_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keywords\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"custom_theme_from\":{\"visible\":false,\"sorting\":false},\"custom_theme_to\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"custom_theme\":{\"visible\":false,\"sorting\":false},\"custom_root_template\":{\"visible\":false,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"page_id\":1,\"title\":2,\"identifier\":3,\"page_layout\":4,\"store_id\":5,\"is_active\":6,\"creation_time\":7,\"update_time\":8,\"custom_theme_from\":9,\"custom_theme_to\":10,\"custom_theme\":11,\"custom_root_template\":12,\"meta_title\":13,\"meta_keywords\":14,\"meta_description\":15,\"actions\":16},\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20}},\"value\":\"Default View\"}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'product_listing', 'default', 1, 'Default View', '{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"search\":{\"value\":\"\"},\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"sku\":{\"visible\":true,\"sorting\":false},\"price\":{\"visible\":true,\"sorting\":false},\"websites\":{\"visible\":true,\"sorting\":false},\"qty\":{\"visible\":true,\"sorting\":false},\"short_description\":{\"visible\":false,\"sorting\":false},\"special_price\":{\"visible\":false,\"sorting\":false},\"cost\":{\"visible\":false,\"sorting\":false},\"weight\":{\"visible\":false,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keyword\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"msrp\":{\"visible\":false,\"sorting\":false},\"url_key\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"type_id\":{\"visible\":true,\"sorting\":false},\"attribute_set_id\":{\"visible\":true,\"sorting\":false},\"visibility\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"manufacturer\":{\"visible\":false,\"sorting\":false},\"color\":{\"visible\":false,\"sorting\":false},\"custom_design\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":false,\"sorting\":false},\"country_of_manufacture\":{\"visible\":false,\"sorting\":false},\"custom_layout\":{\"visible\":false,\"sorting\":false},\"gift_message_available\":{\"visible\":false,\"sorting\":false},\"tax_class_id\":{\"visible\":false,\"sorting\":false},\"special_from_date\":{\"visible\":false,\"sorting\":false},\"special_to_date\":{\"visible\":false,\"sorting\":false},\"news_from_date\":{\"visible\":false,\"sorting\":false},\"news_to_date\":{\"visible\":false,\"sorting\":false},\"custom_design_from\":{\"visible\":false,\"sorting\":false},\"custom_design_to\":{\"visible\":false,\"sorting\":false},\"salable_quantity\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false}},\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"entity_id\":1,\"thumbnail\":2,\"name\":3,\"type_id\":4,\"attribute_set_id\":5,\"sku\":6,\"price\":7,\"qty\":8,\"salable_quantity\":9,\"visibility\":10,\"status\":11,\"websites\":12,\"short_description\":13,\"special_price\":14,\"special_from_date\":15,\"special_to_date\":16,\"cost\":17,\"weight\":18,\"manufacturer\":19,\"meta_title\":20,\"meta_keyword\":21,\"meta_description\":22,\"color\":23,\"news_from_date\":24,\"news_to_date\":25,\"custom_design\":26,\"custom_design_from\":27,\"custom_design_to\":28,\"page_layout\":29,\"country_of_manufacture\":30,\"custom_layout\":31,\"msrp\":32,\"url_key\":33,\"gift_message_available\":34,\"tax_class_id\":35,\"actions\":36}},\"value\":\"Default View\"}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'product_listing', 'current', 0, NULL, '{\"current\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"search\":{\"value\":\"\"},\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"sku\":{\"visible\":true,\"sorting\":false},\"price\":{\"visible\":true,\"sorting\":false},\"websites\":{\"visible\":true,\"sorting\":false},\"qty\":{\"visible\":true,\"sorting\":false},\"short_description\":{\"visible\":false,\"sorting\":false},\"special_price\":{\"visible\":false,\"sorting\":false},\"cost\":{\"visible\":false,\"sorting\":false},\"weight\":{\"visible\":false,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keyword\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"msrp\":{\"visible\":false,\"sorting\":false},\"url_key\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"type_id\":{\"visible\":true,\"sorting\":false},\"attribute_set_id\":{\"visible\":true,\"sorting\":false},\"visibility\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"manufacturer\":{\"visible\":false,\"sorting\":false},\"color\":{\"visible\":false,\"sorting\":false},\"custom_design\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":false,\"sorting\":false},\"country_of_manufacture\":{\"visible\":false,\"sorting\":false},\"custom_layout\":{\"visible\":false,\"sorting\":false},\"gift_message_available\":{\"visible\":false,\"sorting\":false},\"tax_class_id\":{\"visible\":false,\"sorting\":false},\"special_from_date\":{\"visible\":false,\"sorting\":false},\"special_to_date\":{\"visible\":false,\"sorting\":false},\"news_from_date\":{\"visible\":false,\"sorting\":false},\"news_to_date\":{\"visible\":false,\"sorting\":false},\"custom_design_from\":{\"visible\":false,\"sorting\":false},\"custom_design_to\":{\"visible\":false,\"sorting\":false},\"salable_quantity\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false}},\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"entity_id\":1,\"thumbnail\":2,\"name\":3,\"type_id\":4,\"attribute_set_id\":5,\"sku\":6,\"price\":7,\"qty\":8,\"salable_quantity\":9,\"visibility\":10,\"status\":11,\"websites\":12,\"short_description\":13,\"special_price\":14,\"special_from_date\":15,\"special_to_date\":16,\"cost\":17,\"weight\":18,\"manufacturer\":19,\"meta_title\":20,\"meta_keyword\":21,\"meta_description\":22,\"color\":23,\"news_from_date\":24,\"news_to_date\":25,\"custom_design\":26,\"custom_design_from\":27,\"custom_design_to\":28,\"page_layout\":29,\"country_of_manufacture\":30,\"custom_layout\":31,\"msrp\":32,\"url_key\":33,\"gift_message_available\":34,\"tax_class_id\":35,\"actions\":36}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `url_rewrite`
--

DROP TABLE IF EXISTS `url_rewrite`;
CREATE TABLE IF NOT EXISTS `url_rewrite` (
  `url_rewrite_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';

--
-- Extraindo dados da tabela `url_rewrite`
--

INSERT INTO `url_rewrite` (`url_rewrite_id`, `entity_type`, `entity_id`, `request_path`, `target_path`, `redirect_type`, `store_id`, `description`, `is_autogenerated`, `metadata`) VALUES
(1, 'cms-page', 1, 'no-route', 'cms/page/view/page_id/1', 0, 1, NULL, 1, NULL),
(2, 'cms-page', 2, 'home', 'cms/page/view/page_id/2', 0, 1, NULL, 1, NULL),
(3, 'cms-page', 3, 'enable-cookies', 'cms/page/view/page_id/3', 0, 1, NULL, 1, NULL),
(4, 'cms-page', 4, 'privacy-policy-cookie-restriction-mode', 'cms/page/view/page_id/4', 0, 1, NULL, 1, NULL),
(5, 'product', 1, 'blusa-de-manga-curta-canelada.html', 'catalog/product/view/id/1', 0, 1, NULL, 1, NULL),
(6, 'product', 2, 'calca-cargo-sarja-vz-refletivo.html', 'catalog/product/view/id/2', 0, 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `variable`
--

DROP TABLE IF EXISTS `variable`;
CREATE TABLE IF NOT EXISTS `variable` (
  `variable_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `variable_value`
--

DROP TABLE IF EXISTS `variable_value`;
CREATE TABLE IF NOT EXISTS `variable_value` (
  `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `VARIABLE_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';

-- --------------------------------------------------------

--
-- Estrutura da tabela `vault_payment_token`
--

DROP TABLE IF EXISTS `vault_payment_token`;
CREATE TABLE IF NOT EXISTS `vault_payment_token` (
  `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PAYMENT_METHOD_CODE_CSTR_ID_GATEWAY_TOKEN` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vault tokens of payment';

-- --------------------------------------------------------

--
-- Estrutura da tabela `vault_payment_token_order_payment_link`
--

DROP TABLE IF EXISTS `vault_payment_token_order_payment_link`;
CREATE TABLE IF NOT EXISTS `vault_payment_token_order_payment_link` (
  `order_payment_id` int(10) UNSIGNED NOT NULL COMMENT 'Order payment Id',
  `payment_token_id` int(10) UNSIGNED NOT NULL COMMENT 'Payment token Id',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_4ED894655446D385894580BECA993862` (`payment_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order payments to vault token';

-- --------------------------------------------------------

--
-- Estrutura da tabela `vertex_customer_code`
--

DROP TABLE IF EXISTS `vertex_customer_code`;
CREATE TABLE IF NOT EXISTS `vertex_customer_code` (
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer ID',
  `customer_code` text COMMENT 'Customer Code for Vertex',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vertex_customer_code';

-- --------------------------------------------------------

--
-- Estrutura da tabela `vertex_invoice_sent`
--

DROP TABLE IF EXISTS `vertex_invoice_sent`;
CREATE TABLE IF NOT EXISTS `vertex_invoice_sent` (
  `invoice_id` int(10) UNSIGNED NOT NULL COMMENT 'Invoice ID',
  `sent_to_vertex` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Invoice has been logged in Vertex',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vertex_invoice_sent';

-- --------------------------------------------------------

--
-- Estrutura da tabela `vertex_order_invoice_status`
--

DROP TABLE IF EXISTS `vertex_order_invoice_status`;
CREATE TABLE IF NOT EXISTS `vertex_order_invoice_status` (
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order ID',
  `sent_to_vertex` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Invoice has been logged in Vertex',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vertex_order_invoice_status';

-- --------------------------------------------------------

--
-- Estrutura da tabela `vertex_taxrequest`
--

DROP TABLE IF EXISTS `vertex_taxrequest`;
CREATE TABLE IF NOT EXISTS `vertex_taxrequest` (
  `request_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `request_type` varchar(255) NOT NULL COMMENT 'Request Type',
  `quote_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `total_tax` varchar(255) NOT NULL COMMENT 'Total Tax Amount',
  `source_path` varchar(255) NOT NULL COMMENT 'Source path controller_module_action',
  `tax_area_id` varchar(255) NOT NULL COMMENT 'Tax Jurisdictions Id',
  `sub_total` varchar(255) NOT NULL COMMENT 'Response Subtotal Amount',
  `total` varchar(255) NOT NULL COMMENT 'Response Total Amount',
  `lookup_result` varchar(255) NOT NULL COMMENT 'Tax Area Response Lookup Result',
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Request create date',
  `request_xml` text NOT NULL COMMENT 'Request XML',
  `response_xml` text NOT NULL COMMENT 'Response XML',
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `VERTEX_TAXREQUEST_REQUEST_ID` (`request_id`),
  KEY `VERTEX_TAXREQUEST_REQUEST_TYPE` (`request_type`),
  KEY `VERTEX_TAXREQUEST_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of requests to Vertex';

-- --------------------------------------------------------

--
-- Estrutura da tabela `weee_tax`
--

DROP TABLE IF EXISTS `weee_tax`;
CREATE TABLE IF NOT EXISTS `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`value_id`),
  KEY `WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `WEEE_TAX_COUNTRY` (`country`),
  KEY `WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';

-- --------------------------------------------------------

--
-- Estrutura da tabela `widget`
--

DROP TABLE IF EXISTS `widget`;
CREATE TABLE IF NOT EXISTS `widget` (
  `widget_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';

-- --------------------------------------------------------

--
-- Estrutura da tabela `widget_instance`
--

DROP TABLE IF EXISTS `widget_instance`;
CREATE TABLE IF NOT EXISTS `widget_instance` (
  `instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) UNSIGNED NOT NULL COMMENT 'Theme id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';

-- --------------------------------------------------------

--
-- Estrutura da tabela `widget_instance_page`
--

DROP TABLE IF EXISTS `widget_instance_page`;
CREATE TABLE IF NOT EXISTS `widget_instance_page` (
  `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';

-- --------------------------------------------------------

--
-- Estrutura da tabela `widget_instance_page_layout`
--

DROP TABLE IF EXISTS `widget_instance_page_layout`;
CREATE TABLE IF NOT EXISTS `widget_instance_page_layout` (
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `WISHLIST_SHARED` (`shared`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
CREATE TABLE IF NOT EXISTS `wishlist_item` (
  `wishlist_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `WISHLIST_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `wishlist_item_option`
--

DROP TABLE IF EXISTS `wishlist_item_option`;
CREATE TABLE IF NOT EXISTS `wishlist_item_option` (
  `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';

-- --------------------------------------------------------

--
-- Estrutura para vista `inventory_stock_1`
--
DROP TABLE IF EXISTS `inventory_stock_1`;

DROP VIEW IF EXISTS `inventory_stock_1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `inventory_stock_1`  AS  select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`cataloginventory_stock_status` `legacy_stock_status` join `catalog_product_entity` `product` on((`legacy_stock_status`.`product_id` = `product`.`entity_id`))) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `catalogsearch_fulltext_scope1`
--
ALTER TABLE `catalogsearch_fulltext_scope1` ADD FULLTEXT KEY `FTI_FULLTEXT_DATA_INDEX` (`data_index`);

--
-- Índices para tabela `cms_block`
--
ALTER TABLE `cms_block` ADD FULLTEXT KEY `CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`);

--
-- Índices para tabela `cms_page`
--
ALTER TABLE `cms_page` ADD FULLTEXT KEY `CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`);

--
-- Índices para tabela `customer_grid_flat`
--
ALTER TABLE `customer_grid_flat` ADD FULLTEXT KEY `FTI_8746F705702DD5F6D45B8C7CE7FE9F2F` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`);

--
-- Índices para tabela `design_config_grid_flat`
--
ALTER TABLE `design_config_grid_flat` ADD FULLTEXT KEY `DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`);

--
-- Índices para tabela `sales_creditmemo_grid`
--
ALTER TABLE `sales_creditmemo_grid` ADD FULLTEXT KEY `FTI_32B7BA885941A8254EE84AE650ABDC86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`);

--
-- Índices para tabela `sales_invoice_grid`
--
ALTER TABLE `sales_invoice_grid` ADD FULLTEXT KEY `FTI_95D9C924DD6A8734EB8B5D01D60F90DE` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`);

--
-- Índices para tabela `sales_order_grid`
--
ALTER TABLE `sales_order_grid` ADD FULLTEXT KEY `FTI_65B9E9925EC58F0C7C2E2F6379C233E7` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`);

--
-- Índices para tabela `sales_shipment_grid`
--
ALTER TABLE `sales_shipment_grid` ADD FULLTEXT KEY `FTI_086B40C8955F167B8EA76653437879B4` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`);

--
-- Índices para tabela `search_synonyms`
--
ALTER TABLE `search_synonyms` ADD FULLTEXT KEY `SEARCH_SYNONYMS_SYNONYMS` (`synonyms`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `admin_passwords`
--
ALTER TABLE `admin_passwords`
  ADD CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `admin_user_session`
--
ALTER TABLE `admin_user_session`
  ADD CONSTRAINT `ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `amazon_customer`
--
ALTER TABLE `amazon_customer`
  ADD CONSTRAINT `AMAZON_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `amazon_quote`
--
ALTER TABLE `amazon_quote`
  ADD CONSTRAINT `AMAZON_QUOTE_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `amazon_sales_order`
--
ALTER TABLE `amazon_sales_order`
  ADD CONSTRAINT `AMAZON_SALES_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `authorization_rule`
--
ALTER TABLE `authorization_rule`
  ADD CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  ADD CONSTRAINT `CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalogrule_customer_group`
--
ALTER TABLE `catalogrule_customer_group`
  ADD CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalogrule_website`
--
ALTER TABLE `catalogrule_website`
  ADD CONSTRAINT `CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalogsearch_recommendations`
--
ALTER TABLE `catalogsearch_recommendations`
  ADD CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`relation_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  ADD CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  ADD CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  ADD CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  ADD CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_bundle_price_index`
--
ALTER TABLE `catalog_product_bundle_price_index`
  ADD CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  ADD CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_bundle_selection_price`
--
ALTER TABLE `catalog_product_bundle_selection_price`
  ADD CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_media_gallery_value_to_entity`
--
ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity`
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_media_gallery_value_video`
--
ALTER TABLE `catalog_product_entity_media_gallery_value_video`
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  ADD CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_frontend_action`
--
ALTER TABLE `catalog_product_frontend_action`
  ADD CONSTRAINT `CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_index_tier_price`
--
ALTER TABLE `catalog_product_index_tier_price`
  ADD CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_index_website`
--
ALTER TABLE `catalog_product_index_website`
  ADD CONSTRAINT `CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  ADD CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  ADD CONSTRAINT `CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  ADD CONSTRAINT `CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  ADD CONSTRAINT `CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  ADD CONSTRAINT `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  ADD CONSTRAINT `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  ADD CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  ADD CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  ADD CONSTRAINT `CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_relation`
--
ALTER TABLE `catalog_product_relation`
  ADD CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  ADD CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  ADD CONSTRAINT `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  ADD CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_product_website`
--
ALTER TABLE `catalog_product_website`
  ADD CONSTRAINT `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `catalog_url_rewrite_product_category`
--
ALTER TABLE `catalog_url_rewrite_product_category`
  ADD CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `checkout_agreement_store`
--
ALTER TABLE `checkout_agreement_store`
  ADD CONSTRAINT `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `cms_block_store`
--
ALTER TABLE `cms_block_store`
  ADD CONSTRAINT `CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `cms_page_store`
--
ALTER TABLE `cms_page_store`
  ADD CONSTRAINT `CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  ADD CONSTRAINT `CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_eav_attribute`
--
ALTER TABLE `customer_eav_attribute`
  ADD CONSTRAINT `CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_eav_attribute_website`
--
ALTER TABLE `customer_eav_attribute_website`
  ADD CONSTRAINT `CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_entity`
--
ALTER TABLE `customer_entity`
  ADD CONSTRAINT `CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  ADD CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  ADD CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  ADD CONSTRAINT `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  ADD CONSTRAINT `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  ADD CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `customer_form_attribute`
--
ALTER TABLE `customer_form_attribute`
  ADD CONSTRAINT `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `design_change`
--
ALTER TABLE `design_change`
  ADD CONSTRAINT `DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `directory_country_region_name`
--
ALTER TABLE `directory_country_region_name`
  ADD CONSTRAINT `DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `downloadable_link`
--
ALTER TABLE `downloadable_link`
  ADD CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  ADD CONSTRAINT `DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  ADD CONSTRAINT `DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  ADD CONSTRAINT `DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  ADD CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  ADD CONSTRAINT `DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD CONSTRAINT `EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD CONSTRAINT `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_attribute_option_swatch`
--
ALTER TABLE `eav_attribute_option_swatch`
  ADD CONSTRAINT `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD CONSTRAINT `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  ADD CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD CONSTRAINT `EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  ADD CONSTRAINT `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  ADD CONSTRAINT `EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  ADD CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  ADD CONSTRAINT `EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  ADD CONSTRAINT `EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  ADD CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  ADD CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_form_element`
--
ALTER TABLE `eav_form_element`
  ADD CONSTRAINT `EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  ADD CONSTRAINT `EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_form_fieldset_label`
--
ALTER TABLE `eav_form_fieldset_label`
  ADD CONSTRAINT `EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_form_type`
--
ALTER TABLE `eav_form_type`
  ADD CONSTRAINT `EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eav_form_type_entity`
--
ALTER TABLE `eav_form_type_entity`
  ADD CONSTRAINT `EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `email_campaign`
--
ALTER TABLE `email_campaign`
  ADD CONSTRAINT `EMAIL_CAMPAIGN_STORE_ID_CORE/STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `email_catalog`
--
ALTER TABLE `email_catalog`
  ADD CONSTRAINT `EMAIL_CATALOG_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `email_contact`
--
ALTER TABLE `email_contact`
  ADD CONSTRAINT `EMAIL_CONTACT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `email_contact_consent`
--
ALTER TABLE `email_contact_consent`
  ADD CONSTRAINT `FK_17E9EA0C469163E550BC6B732AC49FDB` FOREIGN KEY (`email_contact_id`) REFERENCES `email_contact` (`email_contact_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `email_order`
--
ALTER TABLE `email_order`
  ADD CONSTRAINT `EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EMAIL_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `email_wishlist`
--
ALTER TABLE `email_wishlist`
  ADD CONSTRAINT `EMAIL_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EMAIL_WISHLIST_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `googleoptimizer_code`
--
ALTER TABLE `googleoptimizer_code`
  ADD CONSTRAINT `GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `integration`
--
ALTER TABLE `integration`
  ADD CONSTRAINT `INTEGRATION_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `inventory_source_carrier_link`
--
ALTER TABLE `inventory_source_carrier_link`
  ADD CONSTRAINT `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `inventory_source_item`
--
ALTER TABLE `inventory_source_item`
  ADD CONSTRAINT `INVENTORY_SOURCE_ITEM_SOURCE_CODE_INVENTORY_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `inventory_source_stock_link`
--
ALTER TABLE `inventory_source_stock_link`
  ADD CONSTRAINT `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `inventory_stock_sales_channel`
--
ALTER TABLE `inventory_stock_sales_channel`
  ADD CONSTRAINT `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `layout_link`
--
ALTER TABLE `layout_link`
  ADD CONSTRAINT `LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `magento_acknowledged_bulk`
--
ALTER TABLE `magento_acknowledged_bulk`
  ADD CONSTRAINT `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `magento_operation`
--
ALTER TABLE `magento_operation`
  ADD CONSTRAINT `MAGENTO_OPERATION_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `msp_tfa_trusted`
--
ALTER TABLE `msp_tfa_trusted`
  ADD CONSTRAINT `MSP_TFA_TRUSTED_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `msp_tfa_user_config`
--
ALTER TABLE `msp_tfa_user_config`
  ADD CONSTRAINT `MSP_TFA_USER_CONFIG_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  ADD CONSTRAINT `NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  ADD CONSTRAINT `NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  ADD CONSTRAINT `NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `newsletter_queue_store_link`
--
ALTER TABLE `newsletter_queue_store_link`
  ADD CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD CONSTRAINT `NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `oauth_nonce`
--
ALTER TABLE `oauth_nonce`
  ADD CONSTRAINT `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `oauth_token`
--
ALTER TABLE `oauth_token`
  ADD CONSTRAINT `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `paypal_billing_agreement`
--
ALTER TABLE `paypal_billing_agreement`
  ADD CONSTRAINT `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `paypal_billing_agreement_order`
--
ALTER TABLE `paypal_billing_agreement_order`
  ADD CONSTRAINT `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PAYPAL_BILLING_AGRT_ORDER_AGRT_ID_PAYPAL_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `paypal_cert`
--
ALTER TABLE `paypal_cert`
  ADD CONSTRAINT `PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `paypal_settlement_report_row`
--
ALTER TABLE `paypal_settlement_report_row`
  ADD CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `persistent_session`
--
ALTER TABLE `persistent_session`
  ADD CONSTRAINT `PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `product_alert_price`
--
ALTER TABLE `product_alert_price`
  ADD CONSTRAINT `PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_PRICE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  ADD CONSTRAINT `PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_STOCK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `queue_message_status`
--
ALTER TABLE `queue_message_status`
  ADD CONSTRAINT `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` FOREIGN KEY (`message_id`) REFERENCES `queue_message` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUEUE_MESSAGE_STATUS_QUEUE_ID_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quote`
--
ALTER TABLE `quote`
  ADD CONSTRAINT `QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quote_address`
--
ALTER TABLE `quote_address`
  ADD CONSTRAINT `QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quote_address_item`
--
ALTER TABLE `quote_address_item`
  ADD CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_address_item` (`address_item_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quote_id_mask`
--
ALTER TABLE `quote_id_mask`
  ADD CONSTRAINT `QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quote_item`
--
ALTER TABLE `quote_item`
  ADD CONSTRAINT `QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `quote_item_option`
--
ALTER TABLE `quote_item_option`
  ADD CONSTRAINT `QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quote_payment`
--
ALTER TABLE `quote_payment`
  ADD CONSTRAINT `QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quote_shipping_rate`
--
ALTER TABLE `quote_shipping_rate`
  ADD CONSTRAINT `QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `rating_option`
--
ALTER TABLE `rating_option`
  ADD CONSTRAINT `RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  ADD CONSTRAINT `RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  ADD CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `rating_store`
--
ALTER TABLE `rating_store`
  ADD CONSTRAINT `RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `rating_title`
--
ALTER TABLE `rating_title`
  ADD CONSTRAINT `RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `release_notification_viewer_log`
--
ALTER TABLE `release_notification_viewer_log`
  ADD CONSTRAINT `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`viewer_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  ADD CONSTRAINT `REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `report_event`
--
ALTER TABLE `report_event`
  ADD CONSTRAINT `REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  ADD CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  ADD CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  ADD CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  ADD CONSTRAINT `REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`) ON DELETE NO ACTION;

--
-- Limitadores para a tabela `review_detail`
--
ALTER TABLE `review_detail`
  ADD CONSTRAINT `REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  ADD CONSTRAINT `REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `review_store`
--
ALTER TABLE `review_store`
  ADD CONSTRAINT `REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  ADD CONSTRAINT `SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_coupon_aggregated`
--
ALTER TABLE `salesrule_coupon_aggregated`
  ADD CONSTRAINT `SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_coupon_aggregated_order`
--
ALTER TABLE `salesrule_coupon_aggregated_order`
  ADD CONSTRAINT `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_coupon_aggregated_updated`
--
ALTER TABLE `salesrule_coupon_aggregated_updated`
  ADD CONSTRAINT `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_coupon_usage`
--
ALTER TABLE `salesrule_coupon_usage`
  ADD CONSTRAINT `SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  ADD CONSTRAINT `SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_customer_group`
--
ALTER TABLE `salesrule_customer_group`
  ADD CONSTRAINT `SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_label`
--
ALTER TABLE `salesrule_label`
  ADD CONSTRAINT `SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_product_attribute`
--
ALTER TABLE `salesrule_product_attribute`
  ADD CONSTRAINT `SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `salesrule_website`
--
ALTER TABLE `salesrule_website`
  ADD CONSTRAINT `SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  ADD CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  ADD CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  ADD CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_creditmemo`
--
ALTER TABLE `sales_creditmemo`
  ADD CONSTRAINT `SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_creditmemo_comment`
--
ALTER TABLE `sales_creditmemo_comment`
  ADD CONSTRAINT `SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_creditmemo_item`
--
ALTER TABLE `sales_creditmemo_item`
  ADD CONSTRAINT `SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_invoice`
--
ALTER TABLE `sales_invoice`
  ADD CONSTRAINT `SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  ADD CONSTRAINT `SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  ADD CONSTRAINT `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_invoice_comment`
--
ALTER TABLE `sales_invoice_comment`
  ADD CONSTRAINT `SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_invoice_item`
--
ALTER TABLE `sales_invoice_item`
  ADD CONSTRAINT `SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_order_address`
--
ALTER TABLE `sales_order_address`
  ADD CONSTRAINT `SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  ADD CONSTRAINT `SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  ADD CONSTRAINT `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_order_item`
--
ALTER TABLE `sales_order_item`
  ADD CONSTRAINT `SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_order_payment`
--
ALTER TABLE `sales_order_payment`
  ADD CONSTRAINT `SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_order_status_history`
--
ALTER TABLE `sales_order_status_history`
  ADD CONSTRAINT `SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_order_status_label`
--
ALTER TABLE `sales_order_status_label`
  ADD CONSTRAINT `SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_order_status_state`
--
ALTER TABLE `sales_order_status_state`
  ADD CONSTRAINT `SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  ADD CONSTRAINT `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`associated_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  ADD CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_PAYMENT_TRANSACTION_PAYMENT_ID_SALES_ORDER_PAYMENT_ENTT_ID` FOREIGN KEY (`payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  ADD CONSTRAINT `SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  ADD CONSTRAINT `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_sequence_profile`
--
ALTER TABLE `sales_sequence_profile`
  ADD CONSTRAINT `SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `sales_sequence_meta` (`meta_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_shipment`
--
ALTER TABLE `sales_shipment`
  ADD CONSTRAINT `SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_shipment_comment`
--
ALTER TABLE `sales_shipment_comment`
  ADD CONSTRAINT `SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_shipment_item`
--
ALTER TABLE `sales_shipment_item`
  ADD CONSTRAINT `SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_shipment_track`
--
ALTER TABLE `sales_shipment_track`
  ADD CONSTRAINT `SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  ADD CONSTRAINT `SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  ADD CONSTRAINT `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `search_query`
--
ALTER TABLE `search_query`
  ADD CONSTRAINT `SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `search_synonyms`
--
ALTER TABLE `search_synonyms`
  ADD CONSTRAINT `SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `signifyd_case`
--
ALTER TABLE `signifyd_case`
  ADD CONSTRAINT `SIGNIFYD_CASE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sitemap`
--
ALTER TABLE `sitemap`
  ADD CONSTRAINT `SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `store_group` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `store_group`
--
ALTER TABLE `store_group`
  ADD CONSTRAINT `STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tax_calculation`
--
ALTER TABLE `tax_calculation`
  ADD CONSTRAINT `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  ADD CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  ADD CONSTRAINT `TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  ADD CONSTRAINT `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_checkout_address`
--
ALTER TABLE `temando_checkout_address`
  ADD CONSTRAINT `TEMANDO_CHKT_ADDR_SHPP_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`shipping_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_collection_point_search`
--
ALTER TABLE `temando_collection_point_search`
  ADD CONSTRAINT `TEMANDO_COLLECTION_POINT_SRCH_COUNTRY_ID_DIR_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country_id`) REFERENCES `directory_country` (`country_id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `TEMANDO_COLLECTION_POINT_SRCH_SHPP_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`shipping_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_order`
--
ALTER TABLE `temando_order`
  ADD CONSTRAINT `TEMANDO_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_order_collection_point`
--
ALTER TABLE `temando_order_collection_point`
  ADD CONSTRAINT `FK_EEB9F0F035B969ECA24160257CFC6F6B` FOREIGN KEY (`recipient_address_id`) REFERENCES `sales_order_address` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_order_pickup_location`
--
ALTER TABLE `temando_order_pickup_location`
  ADD CONSTRAINT `FK_E106C6C0802F4A217B859D0FEA67E900` FOREIGN KEY (`recipient_address_id`) REFERENCES `sales_order_address` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_pickup_location_search`
--
ALTER TABLE `temando_pickup_location_search`
  ADD CONSTRAINT `TEMANDO_PICKUP_LOCATION_SRCH_SHPP_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`shipping_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_quote_collection_point`
--
ALTER TABLE `temando_quote_collection_point`
  ADD CONSTRAINT `FK_4ABED96BBA0BAF57A5EC10E47B5A0F12` FOREIGN KEY (`recipient_address_id`) REFERENCES `temando_collection_point_search` (`shipping_address_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_quote_pickup_location`
--
ALTER TABLE `temando_quote_pickup_location`
  ADD CONSTRAINT `FK_9010B10870AF99FB0560ADA50F3F99F4` FOREIGN KEY (`recipient_address_id`) REFERENCES `temando_pickup_location_search` (`shipping_address_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `temando_shipment`
--
ALTER TABLE `temando_shipment`
  ADD CONSTRAINT `TEMANDO_SHIPMENT_SHIPMENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`shipment_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `theme_file`
--
ALTER TABLE `theme_file`
  ADD CONSTRAINT `THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `translation`
--
ALTER TABLE `translation`
  ADD CONSTRAINT `TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ui_bookmark`
--
ALTER TABLE `ui_bookmark`
  ADD CONSTRAINT `UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `variable_value`
--
ALTER TABLE `variable_value`
  ADD CONSTRAINT `VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `variable` (`variable_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `vault_payment_token`
--
ALTER TABLE `vault_payment_token`
  ADD CONSTRAINT `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `vault_payment_token_order_payment_link`
--
ALTER TABLE `vault_payment_token_order_payment_link`
  ADD CONSTRAINT `FK_4ED894655446D385894580BECA993862` FOREIGN KEY (`payment_token_id`) REFERENCES `vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CF37B9D854256534BE23C818F6291CA2` FOREIGN KEY (`order_payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `weee_tax`
--
ALTER TABLE `weee_tax`
  ADD CONSTRAINT `WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `widget_instance`
--
ALTER TABLE `widget_instance`
  ADD CONSTRAINT `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  ADD CONSTRAINT `WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `widget_instance_page_layout`
--
ALTER TABLE `widget_instance_page_layout`
  ADD CONSTRAINT `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WIDGET_INSTANCE_PAGE_LYT_LYT_UPDATE_ID_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD CONSTRAINT `WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  ADD CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
