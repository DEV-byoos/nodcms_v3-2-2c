-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 22 déc. 2021 à 11:47
-- Version du serveur : 10.5.12-MariaDB-1:10.5.12+maria~buster
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `v2021_nodcms_portage_ci415_3215_source`
--

-- --------------------------------------------------------

--
-- Structure de la table `about_profiles`
--

CREATE TABLE `about_profiles` (
  `profile_id` int(11) UNSIGNED NOT NULL,
  `profile_name` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `profile_uri` varchar(255) DEFAULT NULL,
  `profile_theme` varchar(255) DEFAULT NULL,
  `created_date` int(11) UNSIGNED NOT NULL,
  `public` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `about_profiles`
--

INSERT INTO `about_profiles` (`profile_id`, `profile_name`, `profile_image`, `profile_uri`, `profile_theme`, `created_date`, `public`, `order`) VALUES
(2, 'aboutus', 'upload_file/images-library/cce171dc6f915c882ad5978ee7d5479c.jpg', 'us', 'default', 1639906595, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `article_uri` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_date` int(11) UNSIGNED NOT NULL,
  `public` int(11) UNSIGNED NOT NULL,
  `top` int(1) UNSIGNED NOT NULL,
  `order` int(11) UNSIGNED DEFAULT NULL,
  `parent` int(11) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`article_id`, `name`, `article_uri`, `image`, `created_date`, `public`, `top`, `order`, `parent`) VALUES
(1, 'presentation', 'presentation', 'upload_file/images-library/306b264aaa44fdf5a0976b4c9a2f7230.png', 1578844316, 1, 0, 1, 0),
(2, 'Catalogue', 'othersite', '', 1579775023, 1, 0, 2, 0),
(3, 'developments', 'developpments', '', 1607448753, 1, 0, 3, 0),
(4, 'academy', 'academy', 'upload_file/images-library/68a2106bceef8d33fc8a48b48586754b.png', 1629580021, 1, 0, 4, 0),
(5, 'migration_linux_debian', 'linux', 'upload_file/images-library/cce171dc6f915c882ad5978ee7d5479c.jpg', 1631267715, 1, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `auto_email_messages`
--

CREATE TABLE `auto_email_messages` (
  `msg_id` int(10) UNSIGNED NOT NULL,
  `code_key` varchar(100) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `language_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `category_id` int(11) UNSIGNED NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `blog_categories`
--

INSERT INTO `blog_categories` (`category_id`, `category_name`, `category_image`) VALUES
(1, 'applications', ''),
(2, 'cms', ''),
(3, 'erp', ''),
(4, 'Télémédecine', 'upload_file/images-library/203dc57421ac9f26e5586a8f470c1884.png'),
(5, 'school', ''),
(6, 'digital', ''),
(7, 'e-commerce', 'upload_file/images-library/71675cb7189e8989588e46893f464d84.png'),
(9, 'Recyclage', ''),
(10, 'academy', 'upload_file/images-library/68a2106bceef8d33fc8a48b48586754b.png'),
(11, 'linux', 'upload_file/images-library/cce171dc6f915c882ad5978ee7d5479c.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `comment_id` int(11) UNSIGNED NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `reply_to` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `admin_side` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `post_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `language_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `comment_name` varchar(255) DEFAULT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_notification` int(1) NOT NULL DEFAULT 0,
  `comment_content` text DEFAULT NULL,
  `created_date` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `comment_read` int(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `post_id` int(11) UNSIGNED NOT NULL,
  `post_name` varchar(255) DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `post_categories` varchar(255) DEFAULT NULL,
  `post_public` int(1) UNSIGNED DEFAULT NULL,
  `post_private` int(1) UNSIGNED DEFAULT NULL,
  `comment_status` int(1) UNSIGNED DEFAULT NULL,
  `created_date` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `blog_posts`
--

INSERT INTO `blog_posts` (`post_id`, `post_name`, `post_image`, `post_categories`, `post_public`, `post_private`, `comment_status`, `created_date`, `user_id`) VALUES
(1, 'debian', 'upload_file/images-library/36cf012c8b8416582c9cf34065d11d4f.png', NULL, 1, 0, 1, 1578846804, NULL),
(2, 'Comment ré initialiser le mot de passe administrateur (root) de MariaDB ?', 'upload_file/images-library/bdc8c4556ea5480dd8944feb9de218d8.png', NULL, 1, 0, 1, 1578847154, NULL),
(3, 'recyclage logiciels', 'upload_file/images-library/dd6c07a4990cc6f8fa575a05223eeb81.jpg', NULL, 1, 0, 1, 1578928878, NULL),
(4, 'virus', 'upload_file/images-library/344116add46e6d6481b86f8735328b30.png', NULL, 1, 0, 1, 1578986304, NULL),
(5, 'oddo10', 'upload_file/images-library/fe53ccee3466ed1bb0b27fd90b744ec5.png', NULL, 1, 0, 1, 1579015766, NULL),
(6, 'nodcms', 'upload_file/images-library/a4b91c7fb0dcc3000fbc2cd8acc10547.png', NULL, 0, 0, 0, 1579018665, NULL),
(7, 'medlines', 'upload_file/images-library/3b44acd16a3c9ec4a1023cf952f3a021.png', NULL, 1, 0, 1, 1579078608, NULL),
(8, 'Facturation Medlines', '', NULL, 1, 0, 1, 1579082706, NULL),
(9, 'Mairie  -  Town Hall', 'upload_file/images-library/4db70664dbffe6f0d5ee1115e1463700.png', NULL, 1, 0, 1, 1591523301, NULL),
(10, 'Traduction des applications WEB', 'upload_file/images-library/7329e3f81b88d3527f9f7d4780104f61.jpg', NULL, 1, 0, 1, 1595182050, NULL),
(11, 'e-commerce', 'upload_file/images-library/a731f51a3a52b5e7b96a3df84ce5064d.png', NULL, 1, 0, 0, 1604484428, NULL),
(12, 'liste_ecommerce_cameroun', 'upload_file/images-library/1095254f298ba7ebb108874356a0d2e2.png', NULL, 1, 0, 0, 1604562919, NULL),
(13, 'projet Leboncamer.com', 'upload_file/images-library/080a84e32f891b842960d97cc68dcadc.png', NULL, 1, 0, 0, 1604565501, NULL),
(14, 'sauvegarde sous LINUX', 'upload_file/images-library/f688d5accb10be45050a6521dec2a722.jpg', NULL, 1, 0, 0, 1615888048, NULL),
(15, 'Recyclage des déchets', 'upload_file/images-library/5a418ae90770c0a4c76eb69cf07a0532.jpg', NULL, 1, 0, 1, 1616920447, NULL),
(16, 'academy', 'upload_file/images-library/68a2106bceef8d33fc8a48b48586754b.png', NULL, 1, 0, 1, 1629579213, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `blog_posts_categories`
--

CREATE TABLE `blog_posts_categories` (
  `post_cat_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `post_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `blog_posts_categories`
--

INSERT INTO `blog_posts_categories` (`post_cat_id`, `category_id`, `post_id`) VALUES
(5, 6, 1),
(10, 1, 3),
(11, 6, 2),
(13, 6, 4),
(15, 3, 5),
(16, 2, 6),
(20, 4, 7),
(21, 4, 8),
(22, 1, 9),
(23, 6, 9),
(28, 4, 10),
(35, 7, 11),
(41, 7, 13),
(42, 7, 12),
(44, 1, 14),
(46, 9, 15),
(51, 10, 16);

-- --------------------------------------------------------

--
-- Structure de la table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) UNSIGNED NOT NULL,
  `gallery_uri` varchar(255) DEFAULT NULL,
  `gallery_name` varchar(255) DEFAULT NULL,
  `gallery_image` varchar(255) DEFAULT NULL,
  `created_date` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `gallery_public` int(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gallery_images`
--

CREATE TABLE `gallery_images` (
  `image_id` int(11) UNSIGNED NOT NULL,
  `gallery_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `image_name` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_date` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(10) NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `backend_login` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`, `backend_login`) VALUES
(1, 'Admin', 1),
(20, 'Users', 0);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `width` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `height` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `size` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `root` varchar(255) DEFAULT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `created_date` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`image_id`, `name`, `image`, `width`, `height`, `size`, `root`, `folder`, `created_date`, `user_id`) VALUES
(1, 'logo_byoos_2016v2_300px.png', 'upload_file/images-library/306b264aaa44fdf5a0976b4c9a2f7230.png', 300, 225, 82, 'upload_file/images-library/', 'images-library', 1578478123, 1),
(2, 'logo_byoos_2016v2_150px_transp.png', 'upload_file/images-library/203dc57421ac9f26e5586a8f470c1884.png', 150, 113, 24, 'upload_file/images-library/', 'images-library', 1578910880, 1),
(3, 'Candle-CMS-favicon.png', 'upload_file/images-library/badeac77651576faeaa325511512152a.png', 32, 24, 2, 'upload_file/images-library/', 'images-library', 1578910991, 1),
(4, 'logo_debian_150x76_transpv1.png', 'upload_file/images-library/ffdd5bf3d81cc00024584e7dd6f7fa2f.png', 150, 76, 14, 'upload_file/images-library/', 'images-library', 1578913064, 1),
(5, 'logo_debian_150x73v3.png', 'upload_file/images-library/36cf012c8b8416582c9cf34065d11d4f.png', 150, 73, 5, 'upload_file/images-library/', 'images-library', 1578928301, 1),
(6, 'logiciel_app_2015.jpg', 'upload_file/images-library/dd6c07a4990cc6f8fa575a05223eeb81.jpg', 156, 117, 4, 'upload_file/images-library/', 'images-library', 1578929638, 1),
(7, 'logo_mariadb_150x47v2.png', 'upload_file/images-library/bdc8c4556ea5480dd8944feb9de218d8.png', 150, 47, 4, 'upload_file/images-library/', 'images-library', 1578985178, 1),
(8, 'Wanna-Cry-Virus_150x76.png', 'upload_file/images-library/344116add46e6d6481b86f8735328b30.png', 150, 78, 17, 'upload_file/images-library/', 'images-library', 1579015103, 1),
(9, 'odoo_experts_description_300x150.png', 'upload_file/images-library/fe53ccee3466ed1bb0b27fd90b744ec5.png', 300, 150, 46, 'upload_file/images-library/', 'images-library', 1579015755, 1),
(10, 'logo_nodcms_569x199.png', 'upload_file/images-library/a4b91c7fb0dcc3000fbc2cd8acc10547.png', 569, 199, 26, 'upload_file/images-library/', 'images-library', 1579018555, 1),
(11, 'logo_custom_2020_300x106.png', 'upload_file/images-library/3b44acd16a3c9ec4a1023cf952f3a021.png', 300, 106, 30, 'upload_file/images-library/', 'images-library', 1579078485, 1),
(12, 'townhall150x95.png', 'upload_file/images-library/4db70664dbffe6f0d5ee1115e1463700.png', 150, 95, 15, 'upload_file/images-library/', 'images-library', 1591523243, 1),
(13, 'codeigniter-logo.jpg', 'upload_file/images-library/7329e3f81b88d3527f9f7d4780104f61.jpg', 250, 248, 24, 'upload_file/images-library/', 'images-library', 1595182079, 1),
(14, 'Logo_Leboncamer_transp_v2-2_150x150.png', 'upload_file/images-library/71675cb7189e8989588e46893f464d84.png', 150, 88, 18, 'upload_file/images-library/', 'images-library', 1604483822, 1),
(15, 'logo_leboncamer_972x492_transp.png', 'upload_file/images-library/080a84e32f891b842960d97cc68dcadc.png', 972, 492, 82, 'upload_file/images-library/', 'images-library', 1604484584, 1),
(16, 'shopping-cart-800x800.png', 'upload_file/images-library/a731f51a3a52b5e7b96a3df84ce5064d.png', 800, 766, 78, 'upload_file/images-library/', 'images-library', 1604563136, 1),
(17, 'shop_214x236.png', 'upload_file/images-library/1095254f298ba7ebb108874356a0d2e2.png', 214, 236, 41, 'upload_file/images-library/', 'images-library', 1604567523, 1),
(18, 'logo_byoos_2021.png', 'upload_file/images-library/c78a4e23258ec1942efac237ae0a1101.png', 570, 200, 8, 'upload_file/images-library/', 'images-library', 1610439748, 1),
(19, 'i_use_linux.jpg', 'upload_file/images-library/f688d5accb10be45050a6521dec2a722.jpg', 360, 446, 55, 'upload_file/images-library/', 'images-library', 1615888094, 1),
(20, 'recyclage_electronique.jpg', 'upload_file/images-library/5a418ae90770c0a4c76eb69cf07a0532.jpg', 236, 236, 12, 'upload_file/images-library/', 'images-library', 1616920184, 1),
(21, 'academy_128x66.png', 'upload_file/images-library/68a2106bceef8d33fc8a48b48586754b.png', 128, 66, 15, 'upload_file/images-library/', 'images-library', 1629578862, 1),
(22, 'Linux-Kernel-3-4-67-LTS.jpg', 'upload_file/images-library/cce171dc6f915c882ad5978ee7d5479c.jpg', 728, 392, 27, 'upload_file/images-library/', 'images-library', 1631267860, 1);

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language_name` varchar(255) DEFAULT NULL,
  `language_title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `public` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `rtl` int(1) UNSIGNED DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `created_date` int(11) DEFAULT NULL,
  `default` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`language_id`, `language_name`, `language_title`, `code`, `public`, `rtl`, `sort_order`, `created_date`, `default`, `image`) VALUES
(1, 'english', 'English', 'en', 1, 0, 1, 1578476451, 0, 'upload_file/lang/en.png'),
(2, 'french', 'French', 'fr', 1, 0, NULL, 1578844033, 1, 'upload_file/lang/fr.png');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `sub_menu` int(10) UNSIGNED DEFAULT 0,
  `created_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `menu_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `public` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `menu_url` varchar(300) DEFAULT NULL,
  `menu_key` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_icon`, `sub_menu`, `created_date`, `menu_order`, `public`, `menu_url`, `menu_key`) VALUES
(1, 'presentation', NULL, 0, 1578844111, 1, 1, 'article/presentation', 'top_menu'),
(2, 'BYOOS digital', NULL, 0, 1579019212, 0, 0, '', 'footer_menu'),
(3, 'othersite', NULL, 0, 1579774553, 2, 1, 'article/othersite', 'top_menu'),
(4, 'Blog', NULL, 0, 1604559378, 0, 1, 'blog', 'footer_menu'),
(6, 'Blog', NULL, 0, 1604559625, 3, 1, 'blog', 'top_menu'),
(7, 'developpments', NULL, 0, 1607447516, 4, 1, 'article/developpments', 'top_menu'),
(8, 'academy', NULL, 0, 1629579340, 5, 1, 'article/academy', 'top_menu'),
(9, 'services', NULL, 0, 1629623628, 6, 1, 'service-academy', 'top_menu'),
(10, 'contact', NULL, 0, 1640167800, 0, 1, 'contact', 'top_menu');

-- --------------------------------------------------------

--
-- Structure de la table `packages`
--

CREATE TABLE `packages` (
  `package_id` int(11) UNSIGNED NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `package_sort` int(11) UNSIGNED NOT NULL,
  `created_date` int(11) UNSIGNED NOT NULL,
  `active` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `packages`
--

INSERT INTO `packages` (`package_id`, `package_name`, `package_sort`, `created_date`, `active`) VALUES
(1, 'About', 0, 1578844558, 1),
(2, 'Blog', 0, 1578844559, 1),
(3, 'Gallery', 0, 1578844559, 1),
(4, 'Portfolio', 0, 1578844559, 1),
(5, 'Pricing_table', 0, 1578844559, 0),
(6, 'Services', 0, 1578844559, 1),
(7, 'nodcms-articles', 1, 1639642573, 1),
(8, 'nodcms-about', 2, 1639642577, 1),
(9, 'nodcms-blog', 3, 1639642580, 1),
(10, 'nodcms-gallery', 4, 1639642584, 1),
(11, 'nodcms-portfolio', 5, 1639642587, 1),
(12, 'nodcms-pricingtable', 6, 1639642590, 1),
(13, 'nodcms-services', 7, 1639642593, 1);

-- --------------------------------------------------------

--
-- Structure de la table `packages_dashboard`
--

CREATE TABLE `packages_dashboard` (
  `package_id` int(11) UNSIGNED NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `package_sort` int(11) UNSIGNED NOT NULL,
  `created_date` int(11) UNSIGNED NOT NULL,
  `active` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `packages_dashboard`
--

INSERT INTO `packages_dashboard` (`package_id`, `package_name`, `package_sort`, `created_date`, `active`) VALUES
(8, 'about', 0, 1639568108, 0),
(9, 'blog', 1, 1639568108, 0),
(10, 'gallery', 2, 1639568108, 0),
(11, 'portfolio', 3, 1639568108, 0),
(12, 'services', 4, 1639568108, 0),
(13, 'nodcms-articles', 4, 1639642599, 0),
(14, 'nodcms-about', 5, 1639642599, 0),
(15, 'nodcms-blog', 6, 1639642599, 0),
(16, 'nodcms-gallery', 7, 1639642599, 0),
(17, 'nodcms-portfolio', 8, 1639642599, 0),
(18, 'nodcms-pricingtable', 9, 1639642599, 0),
(19, 'nodcms-services', 10, 1639642599, 0);

-- --------------------------------------------------------

--
-- Structure de la table `portfolio`
--

CREATE TABLE `portfolio` (
  `portfolio_id` int(11) UNSIGNED NOT NULL,
  `portfolio_name` varchar(255) DEFAULT NULL,
  `portfolio_image` varchar(255) DEFAULT NULL,
  `portfolio_public` int(1) UNSIGNED DEFAULT NULL,
  `portfolio_date` int(11) UNSIGNED DEFAULT NULL,
  `created_date` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pricing_tables`
--

CREATE TABLE `pricing_tables` (
  `table_id` int(11) UNSIGNED NOT NULL,
  `table_url` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `table_price` float UNSIGNED DEFAULT NULL,
  `created_date` int(11) UNSIGNED DEFAULT NULL,
  `sort_order` int(11) UNSIGNED DEFAULT NULL,
  `table_public` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `table_highlight` int(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pricing_tables`
--

INSERT INTO `pricing_tables` (`table_id`, `table_url`, `table_name`, `table_price`, `created_date`, `sort_order`, `table_public`, `table_highlight`) VALUES
(1, '/codage', 'codage ', 1000, 1640025326, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pricing_tables_records`
--

CREATE TABLE `pricing_tables_records` (
  `record_id` int(11) UNSIGNED NOT NULL,
  `table_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `record_name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) UNSIGNED DEFAULT NULL,
  `record_public` int(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) UNSIGNED NOT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `service_uri` varchar(255) DEFAULT NULL,
  `service_image` varchar(255) DEFAULT NULL,
  `service_icon` varchar(255) DEFAULT NULL,
  `created_date` int(11) UNSIGNED NOT NULL,
  `service_public` int(11) UNSIGNED NOT NULL,
  `service_price` float UNSIGNED NOT NULL,
  `sort_order` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_uri`, `service_image`, `service_icon`, `created_date`, `service_public`, `service_price`, `sort_order`) VALUES
(1, 'academy', 'academy', 'upload_file/images-library/68a2106bceef8d33fc8a48b48586754b.png', NULL, 1629623129, 1, 250, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(11) UNSIGNED DEFAULT 0,
  `field_name` varchar(200) DEFAULT NULL,
  `field_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `language_id`, `field_name`, `field_value`) VALUES
(1, 0, 'firstname', 'BOBARD'),
(2, 0, 'lastname', 'Gabriel'),
(3, 0, 'company', 'BYOOS DiGiTAL  sarl'),
(4, 0, 'email', 'gbobard@gmail.com'),
(5, 0, 'timezone', 'Africa/Douala'),
(6, 0, 'date_format', 'd.m.Y'),
(7, 0, 'time_format', 'H:i'),
(8, 0, 'sent_email', 'gbobard@gmail.com'),
(10, 0, 'logo', 'upload_file/images-library/c78a4e23258ec1942efac237ae0a1101.png'),
(11, 0, 'logo_light', 'upload_file/images-library/c78a4e23258ec1942efac237ae0a1101.png'),
(12, 0, 'fav_icon', 'upload_file/images-library/badeac77651576faeaa325511512152a.png'),
(13, 0, 'google_map_url', ''),
(20, 0, 'phone', '+2379654756'),
(21, 0, 'fax', ''),
(22, 0, 'address', 'Cameroun'),
(23, 0, 'google_map', ''),
(24, 0, 'contact_form', '1'),
(33, 0, 'send_email', 'do-not-replay@byoosdigital.com'),
(34, 0, 'smtp_host', ''),
(35, 0, 'smtp_port', '0'),
(36, 0, 'smtp_username', ''),
(37, 0, 'smtp_password', ''),
(54, 1, 'services_page_title', 'Expertise / Consulting'),
(55, 2, 'services_page_title', 'Expertises / Consultant'),
(56, 0, 'services_display_mode', 'image'),
(57, 0, 'services_display_price', '1'),
(58, 0, 'services_page', '1');

-- --------------------------------------------------------

--
-- Structure de la table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `titles`
--

CREATE TABLE `titles` (
  `title_id` int(10) UNSIGNED NOT NULL,
  `title_caption` varchar(255) DEFAULT NULL,
  `relation_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data_type` varchar(255) DEFAULT NULL,
  `language_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `titles`
--

INSERT INTO `titles` (`title_id`, `title_caption`, `relation_id`, `data_type`, `language_id`) VALUES
(1, 'Présentation', 1, 'menu', 2),
(2, 'Presentation', 1, 'menu', 1),
(3, 'BYOOS digital', 2, 'menu', 2),
(4, 'BYOOS digital', 2, 'menu', 1),
(11, 'Catalogue', 3, 'menu', 2),
(12, 'Catalog', 3, 'menu', 1),
(13, 'blog', 4, 'menu', 2),
(14, 'blog', 4, 'menu', 1),
(15, 'blog', 5, 'menu', 2),
(16, 'blog', 5, 'menu', 1),
(17, 'Blog', 6, 'menu', 2),
(18, 'Blog', 6, 'menu', 1),
(27, 'Développements', 7, 'menu', 2),
(28, 'Developpments', 7, 'menu', 1),
(35, 'Académie', 8, 'menu', 2),
(36, 'Academy', 8, 'menu', 1),
(39, 'Services', 9, 'menu', 2),
(40, 'Services', 9, 'menu', 1);

-- --------------------------------------------------------

--
-- Structure de la table `translates`
--

CREATE TABLE `translates` (
  `translate_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `translate_table` varchar(255) DEFAULT NULL,
  `translate_table_key` int(10) UNSIGNED DEFAULT NULL,
  `translate_field` varchar(255) DEFAULT NULL,
  `translate_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `translation_id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`translation_id`, `table_id`, `table_name`, `field_name`, `language_id`, `translated_text`) VALUES
(7, 1, 'article', 'title', 2, 'Présentation'),
(8, 1, 'article', 'description', 2, 'Bienvenue sur le site de BYOOS solutions\n     Cabinet conseils en transformation digitale'),
(9, 1, 'article', 'keywords', 2, 'byoos, BYOOS, digital, digitale, cameroun, linux, debian, codeigniter, transformation digitale, , approche PLS, performance, innovation'),
(10, 1, 'article', 'content', 2, '<p>La transformation digital est une migration des processus de type manuel vers la digitalisation des mêmes processus.</p>\n\n<ul>\n <li>Un seul système de gestion</li>\n <li>Digitalisation efficace des processus</li>\n <li>Eviter à tous prix la redondance des systèmes d&#39;information</li>\n</ul>\n\n<p>NOTA<br>\nL&#39;engagement des collaborateurs est la clé du succes.</p>\n'),
(11, 1, 'article', 'title', 1, 'Presentation'),
(12, 1, 'article', 'description', 1, 'Welcome to the BYOOS solutions website\n     Consulting firm in digital transformation'),
(13, 1, 'article', 'keywords', 1, 'byoos, BYOOS, digital, digitale, cameroun, linux, debian, codeigniter, transformation digitale, PLS approach, performance, innovation'),
(14, 1, 'article', 'content', 1, '<p>The digital transformation is a migration from manual processes to digitalization of the same processes.</p>\n\n<ul>\n <li>A single management system</li>\n <li>Efficient digitalization of processes</li>\n <li>Avoid at all costs the redundancy of information systems</li>\n</ul>\n\n<p>NOTE<br>\nEmployee commitment is the key to success.</p>\n'),
(15, 1, 'blog_categories', 'title', 2, 'Applications'),
(16, 1, 'blog_categories', 'title', 1, 'Applications'),
(17, 2, 'blog_categories', 'title', 2, 'CMS gestion de contenu'),
(18, 2, 'blog_categories', 'title', 1, 'CMS content managment system'),
(19, 3, 'blog_categories', 'title', 2, 'E.R.P programme de gestion Industriel'),
(20, 3, 'blog_categories', 'title', 1, 'E.R.P Enterprise Resource Planning'),
(21, 4, 'blog_categories', 'title', 2, 'S.I.H système de gestion hospitalier'),
(22, 4, 'blog_categories', 'title', 1, 'M.R.N Medical Record Number'),
(23, 5, 'blog_categories', 'title', 2, 'Gestion des écoles'),
(24, 5, 'blog_categories', 'title', 1, 'shool Managment'),
(25, 6, 'blog_categories', 'title', 2, 'Numérique ou Digital'),
(26, 6, 'blog_categories', 'title', 1, 'Digital'),
(27, 1, 'blog_posts', 'title', 2, 'Pourquoi Linux DEBIAN ?'),
(28, 1, 'blog_posts', 'description', 2, 'Ici un nouvel article sur le système d\'exploitation des ordinateurs PC - AMD64, ARM64, ARMel, ARMhf, i386, MIPS, MIPS64el, MIPSel, PowerPC64el et s390x.  en architecture i386 & i64, bonne lecture.\n\nhttps://www.debian.org/intro/why_debian.fr.html'),
(29, 1, 'blog_posts', 'keywords', 2, 'debian'),
(30, 1, 'blog_posts', 'content', 2, '<p><a href=\"http://linuxfr.org/news/debian-9-stretch-deploie-ses-tentacules\">http://linuxfr.org/news/debian-9-stretch-deploie-ses-tentacules</a></p>\n\n<p> </p>\n\n<p>Nous devons ce système à notre FEU Ian MURDOCH, ingénieur informaticien, localisé aux U.S.A, paix à son âme.</p>\n\n<p>cet article va nous monter comment installer la version 9 de DEBIAN autrement nommé \"stretch\", vous aurez deviné que le site officiel très complet se situe à l&#39;adresse <a href=\"https://www.debian.org/index.fr.html\" target=\"_parent\">https://www.debian.org</a>  vous aurez aussi les packages à l&#39;adresse  <a href=\"https://packages.debian.org\" target=\"_parent\">https://packages.debian.org</a></p>\n\n<p><strong>LE VIF DU SUJET</strong></p>\n\n<p>En premier lieu se procurer la dernière distribution DEBIAN ( au moment de la composition de cet article il sagit de la 9.2 ) mais comme nous n&#39;avons pas eu la chance de réussir le téléchargement nous allons nous contenter de la DEBIAN 9.1    <a href=\"https://www.debian.org/distrib/\" target=\"_parent\">https://www.debian.org/distrib/</a></p>\n\n<p>Ceci dit cela ne dérange pas car un fois tout installé nous pouvons lancer la commande  \"sudo apt update && apt upgrade\"</p>\n\n<p>Une fois la complilation .iso entre vous mains, vous avez le choix entre la réalisation du support DVD 4Go et supérieur OU la création d&#39;un clé USB bootable qui aura l&#39;avantage d&#39;être réutilisable pour les versions suivantes...<br>\nLà encore  vous avez la possiblité de lancer le programme libre RUFUS  <a href=\"https://rufus.akeo.ie/?locale=fr_FR\" target=\"_parent\">https://rufus.akeo.ie/?locale=fr_FR</a></p>\n\n<p>Une fois votre clé USB  bootable en main, vous l&#39;insérez naturellement dans un port USB ( le système BIOS doit se lancer sur les port USB ou alors disque dur externe ) puis on re-démarre le système...</p>\n\n<p><strong>PRECAUTIONS</strong> à prendre si votre poste de travail ou serveur est une version UEFI, il est impératif de créer un bootLoder ( partition de boot ) de la taille 500Mo maximum et formatée au système EFI ( option possible sous DEBIAN 9.x )  si vous ne disposez pas de cette partition, l&#39;installation va échouer au monement d&#39;installer l&#39;utilitaire de démarage LINUX nommé GRUB.</p>\n\n<p>La fameuse partition de boot EFI  doit de situer en début de disque ce qui veut dire créé en premimière partition.</p>\n\n<p>NOTA dans le cas d&#39;un dual boot avec Windows et Debian  la partition sera créé automatiquement par Windows. Pour une installation SOLO de debian il est indispensable de désactiver  la mode \"secure boot\" et  la mode de compatibilité  \"legacy\" du BIOS de votre machine.</p>\n\n<p><strong>LA DOCUMENTATION COMPLETE</strong>     <a href=\"https://debian-handbook.info/browse/fr-FR/stable/\" target=\"_self\">https://debian-handbook.info/browse/fr-FR/stable/</a></p>\n'),
(31, 1, 'blog_posts', 'title', 1, 'Why Linux DEBIAN?'),
(32, 1, 'blog_posts', 'description', 1, 'Why Linux DEBIAN?'),
(33, 1, 'blog_posts', 'keywords', 1, 'debian'),
(34, 1, 'blog_posts', 'content', 1, ''),
(35, 2, 'blog_posts', 'title', 2, 'Comment ré initialiser le mot de passe administrateur (root) de MariaDB ?'),
(36, 2, 'blog_posts', 'description', 2, ''),
(37, 2, 'blog_posts', 'keywords', 2, 'mysql, mariadb'),
(38, 2, 'blog_posts', 'content', 2, '<p>pour Mariadb 10.x et Debian 9.x<br>\nnous commençons par vérifier le version du serveur de base de données ( attention au nouveau format des mots de passe MariaDB )<br>\nNOTA: au moins une lettre majuscule au moins un chiffre au moins 6 caractères !!!</p>\n\n<pre class=\"code-pre command\">\n<code>mysql --version</code></pre>\n\n<p>En premier lieu stopper le service</p>\n\n<pre>\nsudo  systemctl  stop  mariadb.service</pre>\n\n<p>Puis se connecter au serveur  en mode skip-grant ( sans la table des droits )</p>\n\n<pre class=\"code-pre command\">\n<code>sudo mysqld_safe --skip-grant-tables --skip-networking &</code></pre>\n\n<p>se connecter</p>\n\n<pre class=\"code-pre command\">\n<code>mysql -u root</code></pre>\n\n<p> </p>\n\n<pre class=\"code-pre \">\n<code>Type &#39;help;&#39; or &#39;\\h&#39; for help. Type &#39;\\c&#39; to clear the current input statement.\n\nMariaDB [(none)]></code></pre>\n\n<p><var><kbd><samp><code>Mettre à jour le mot de passe</code></samp></kbd></var></p>\n\n<pre class=\"code-pre custom_prefix\">\n<span class=\"note\"><code>UPDATE mysql.user SET authentication_string = PASSWORD(&#39;<span class=\"highlight\">new_password</span>&#39;) WHERE User = &#39;root&#39; AND Host = &#39;localhost&#39;;</code></span></pre>\n\n<p>Remplacer<span class=\"note\"><code> (&#39;<span class=\"highlight\">new_password</span>&#39;)</code></span>    par votre mot de passe en tenant compte de le composer avec au moins une lettre majuscule et au moins un chiffre ( sinon la reqête de mise à jour ne sera pas validée ).</p>\n\n<p>Supprimer le processus mysqld</p>\n\n<pre class=\"code-pre command\">\n<code>sudo kill `/var/run/mariadb/mariadb.pid`</code></pre>\n\n<p><code>ou</code></p>\n\n<pre class=\"code-pre command\">\n<code>sudo killall  mysqld</code></pre>\n\n<p>Relancer le service mariadb</p>\n\n<pre class=\"code-pre command\">\nsudo  systemctl  start  mariadb.service</pre>\n\n<p>source</p>\n\n<p><a href=\"https://www.digitalocean.com/community/tutorials/how-to-reset-your-mysql-or-mariadb-root-password\">https://www.digitalocean.com/community/tutorials/how-to-reset-your-mysql-or-mariadb-root-password</a></p>\n'),
(39, 2, 'blog_posts', 'title', 1, ''),
(40, 2, 'blog_posts', 'description', 1, ''),
(41, 2, 'blog_posts', 'keywords', 1, ''),
(42, 2, 'blog_posts', 'content', 1, ''),
(43, 3, 'blog_posts', 'title', 2, 'Projet de recyclage logiciel'),
(44, 3, 'blog_posts', 'description', 2, 'Projet de recyclage logiciel'),
(45, 3, 'blog_posts', 'keywords', 2, ''),
(46, 3, 'blog_posts', 'content', 2, '<p>Le Projet de recyclage logiciel  est né d&#39;une vision d&#39;un logiciel devenu INUTILISABLE du fait de l&#39;évolution des langages de programmation (php7.4) puis des systèmes d&#39;exploitation (Debian 10.2) et finalement de la sécurité des données personnelles (bcrypt)<br>\nAuteurs Gabriel BOBARD gbobard@gmail.com / BYOOS solutions Cameroun.</p>\n\n<p> </p>\n\n<p>Le travail consite à identifier une source datant de 8 à 10 ans basée sur le Framwork de codeIgniter et proprement codée.</p>\n\n<p>Exemple ( codeigniter-Forum, FladsClassifieds, goCart2.3.3 ... ) identification de la version C.I d&#39;origine, implémentation du système C.I 3.1.11 <a href=\"http://codeigniter.com\">http://codeigniter.com</a></p>\n\n<p>Reprise du codage afin de mettre les classes controlleurs, librairies et modèles aux nouvelles spécifications.</p>\n\n<p><a href=\"http://leboncamer.com\">http://leboncamer.com</a></p>\n\n<p><a href=\"http://byoos.eu\">http://byoos.eu</a></p>\n\n<p><a href=\"http://www.byoos.com\">http://www.byoos.com</a></p>\n'),
(47, 3, 'blog_posts', 'title', 1, ''),
(48, 3, 'blog_posts', 'description', 1, ''),
(49, 3, 'blog_posts', 'keywords', 1, ''),
(50, 3, 'blog_posts', 'content', 1, ''),
(51, 4, 'blog_posts', 'title', 2, 'CYBER ATTAQUE WannaCRY'),
(52, 4, 'blog_posts', 'description', 2, 'Protéger ses données informatiques d\'une cyber attaque est vital pour votre entreprise...'),
(53, 4, 'blog_posts', 'keywords', 2, ''),
(54, 4, 'blog_posts', 'content', 2, '<p>Protéger ses données informatiques d&#39;une cyber attaque est vital pour votre entreprise.<br>\nle virus Wcrypt autrement nommé WannaCRY est une grave menace qui infecte toutes les plateformes Windows<br>\nBYOOS sarl vous propose la sécurité DEBIAN 8 avec sa suite bureautique LibreOffice 5.<br>\nDebian votre système d&#39;exploitation universel<br>\nPrennez la bonne décision et entrez dans le monde de LINUX.<br>\n<br>\n<a href=\"http://www.lemonde.fr/international/article/2017/05/13/une-cyberattaque-massive-bloque-des-ordinateurs-dans-des-dizaines-de-pays_5127158_3210.html\" rel=\"nofollow\" target=\"_blank\">http://www.lemonde.fr/international/article/2017/05/13/une-cyberattaque-massive-bloque-des-ordinateurs-dans-des-dizaines-de-pays_5127158_3210.html</a><br>\n<br>\n<a href=\"http://pjarillon.free.fr/redac/virus.html\" rel=\"nofollow\" target=\"_blank\">http://pjarillon.free.fr/redac/virus.html</a></p>\n'),
(55, 4, 'blog_posts', 'title', 1, 'CYBER ATTAQUE WannaCRY'),
(56, 4, 'blog_posts', 'description', 1, 'Protecting your computer data from a cyber attack is vital to your business...'),
(57, 4, 'blog_posts', 'keywords', 1, ''),
(58, 4, 'blog_posts', 'content', 1, ''),
(59, 5, 'blog_posts', 'title', 2, ' EXPÉRIENCE BYOOS ODOO 10 '),
(60, 5, 'blog_posts', 'description', 2, 'Attention, Ce tutoriel nécessite avoir installé Odoo\nVersion 10 exclusivement avec le nouvel API, traduction partielle et ajouts au TUTO \nhttps://www.odoo.com/documentation/10.0/howtos/backend.html'),
(61, 5, 'blog_posts', 'keywords', 2, ''),
(62, 5, 'blog_posts', 'content', 2, '<p><strong>EXPÉRIENCE BYOOS ODOO 10</strong></p>\n\n<p>Source du modula openacademy_v9 à convertir en v10</p>\n\n<p><a href=\"https://github.com/macagua/openacademy_demo\">https://github.com/macagua/openacademy_demo</a></p>\n\n<p> </p>\n\n<p>nous avons installé odoo dans le répertoire des OPTIONS LINUX <strong>/opt/</strong><strong>odoo10/odoo10-server</strong></p>\n\n<p>les modules sont installés dans <strong>/opt/</strong><strong>odoo10/custom/addons</strong></p>\n\n<p> </p>\n\n<p><strong>L’E.R.P </strong><span>est logé dans le répertoire odoo</span><span>10</span><span>/odoo</span><span>10</span><span>-server, les modules clients sont installé dans le répertoire odoo</span><span>10</span><span>/custom/addons</span></p>\n\n<p> </p>\n\n<p><strong>Article 1 : création d’un nouveau module d‘applicxation ODOO v10 sous debian 8.6 ( jessie )</strong></p>\n\n<p> </p>\n\n<p>se positionner dans le répertoire système odoo</p>\n\n<p>$cd /opt/odoo9/odoo9-server</p>\n\n<p> </p>\n\n<p>lancer la commande de création du module</p>\n\n<p><code class=\"western\">sudo ./odoo-</code><code class=\"western\">bin</code><code class=\"western\"> scaffold </code><code class=\"western\">openacademy_</code><code class=\"western\">v9to</code><code class=\"western\">v10 </code><code class=\"western\"> /</code><code class=\"western\">opt/custom/</code><code class=\"western\">addons</code></p>\n\n<p> </p>\n\n<p><code class=\"western\">ci-dessous l’arborescence crée</code></p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p><code class=\"western\">ajoutez y les répertoires : </code></p>\n\n<ol>\n <li>\n <p><code class=\"western\">static/description/icons </code></p>\n </li>\n <li>\n <p><code class=\"western\">static/src/</code><code class=\"western\">img </code></p>\n </li>\n <li>\n <p><code class=\"western\">static/js</code></p>\n </li>\n <li>\n <p><code class=\"western\">static/css</code></p>\n </li>\n</ol>\n\n<p> </p>\n\n<p>Démarrer / Arrêter le serveur Odoo</p>\n\n<p>Odoo utilise une architecture client / serveur dans laquelle les clients sont des navigateurs Web accédant au serveur Odoo via RPC.</p>\n\n<p>La logique métier et l&#39;extension sont généralement exécutées côté serveur, bien que les fonctionnalités du client (par exemple, une nouvelle représentation de données telles que des cartes interactives) puissent être ajoutées au client.</p>\n\n<p>Pour démarrer le serveur, appelez simplement la commande <a href=\"https://translate.googleusercontent.com/translate_c?depth=1&rurl=translate.google.com&sl=en&tl=fr&u=https://www.odoo.com/documentation/10.0/reference/cmdline.html&usg=ALkJrhi80_DpSc7WQWzmzDXN0LOI8Bl3jA#reference-cmdline\">Odoo-bin</a> dans le terminal, en ajoutant le chemin complet vers le fichier si nécessaire:</p>\n\n<pre class=\"western\">\nOdoo-bin</pre>\n\n<p>Le serveur est arrêté en appuyant sur <code class=\"western\">Ctrl-C</code> deux fois depuis le terminal, ou en tuant le processus du système d&#39;exploitation correspondant.<br>\nSous le système DEBIAN 8  utilisez  le démon systemd:</p>\n\n<p>$ systemctl   start  odoo10-server.service<br>\nstop pour arrêter le serveur,   restart pour le redémarrer,  status pour en connaître l&#39;état.</p>\n\n<h2 class=\"western\">Construire un module Odoo</h2>\n\n<p>Les deux extensions serveur et client sont conditionnés sous forme de <em>modules</em> qui sont éventuellement chargés dans une <em>base</em> de <em>données.</em></p>\n\n<p>Les modules Odoo peuvent soit ajouter une nouvelle logique commerciale à un système Odoo, soit modifier et étendre la logique métier existante: un module peut être créé pour ajouter les règles comptables de votre pays au support comptable générique d&#39;Odoo, tandis que le module suivant ajoute un support pour la visualisation en temps réel D&#39;une flotte d&#39;autobus.</p>\n\n<p>Tout dans Odoo commence donc et se termine par des modules.</p>\n\n<h3 class=\"western\">Composition d&#39;un module</h3>\n\n<p>Un module Odoo peut contenir un certain nombre d&#39;éléments:</p>\n\n<dl>\n <dt>Business objects</dt>\n <dd>Déclarées comme des classes Python, ces ressources sont automatiquement conservées par Odoo en fonction de leur configuration</dd>\n <dd> </dd>\n <dd>Data files</dd>\n <dd>Fichiers XML ou CSV déclarant des métadonnées (vues ou workflows), des données de configuration (paramétrage des modules), des données de démonstration et plus</dd>\n <dd> </dd>\n <dt>Web controllers</dt>\n <dd>Gérer les demandes des navigateurs Web</dd>\n <dd> </dd>\n <dt>Static web data</dt>\n <dd>Images, fichiers CSS ou javascript utilisés par l&#39;interface Web ou le site Web</dd>\n</dl>\n\n<h3 class=\"western\">Structure du module</h3>\n\n<p>Chaque module est un répertoire dans un <em>répertoire </em><em>réservé a</em><em>u</em><em>x</em><em> module</em><em>s</em><em>. </em><em>La position du r</em>épertoire des modules est spécifié en utilisant le <code class=\"western\">--addons-path</code> option du ficjier de configuration Odoo ( /etc/odoo10-server.conf ) défini à l‘installation de l‘E.R.P.</p>\n\n<p><strong>NOTE</strong></p>\n\n<p>la plupart des options de ligne de commande peuvent également être configurés en utilisant un fichier de configuration</p>\n\n<p>Un module Odoo est déclaré par son manifeste . Voir la documentation manifeste informations à ce sujet.</p>\n\n<p>Un module est également un package Python avec un <code class=\"western\">__init__.py</code> fichier, contenant des instructions d&#39;importation pour les différents fichiers Python dans le module.</p>\n\n<p>Par exemple, si le module a un seul <code class=\"western\">mymodule.py</code> fichier <code class=\"western\">__init__.py</code> pourrait contenir:</p>\n\n<p><code class=\"western\">from . import mymodule</code></p>\n\n<pre class=\"western\">\n </pre>\n\n<p><code class=\"western\">Odoo fournit un mécanisme pour aider à mettre en place un nouveau module, Odoo-bin a une</code><code class=\"western\">sous </code><code class=\"western\">commande</code><code class=\"western\"> - scaffold pour créer un module vide</code></p>\n\n<pre class=\"western\">\n </pre>\n\n<p>$ odoo-bin scaffold</p>\n\n<p> </p>\n\n<p><code class=\"western\"><span>La commande crée un sous-répertoire pour votre module et crée automatiquement un groupe de fichiers standard pour un module.</span></code><code class=\"western\"> La plupart d&#39;entre eux contiennent simplement du code commenté ou XML. L&#39;utilisation de la plupart de ces fichiers sera expliquée le long de ce didacticiel.</code></p>\n\n<p><code class=\"western\"><strong>Exercice</strong></code><code class=\"western\"> </code></p>\n\n<p>Création du module</p>\n\n<p>Utilisez la ligne de commande ci-dessus pour créer un module vide Open Academy et l&#39;installer dans Odoo.</p>\n\n<ol>\n <li>\n <p>Invoquer les commandes <code class=\"western\"><em>odoo-bin scaffold openacademy</em></code><code class=\"western\"><em>v9tov10</em></code><code class=\"western\"><em> /</em></code><code class=\"western\"><em>opt/odoo10/custom/</em></code><code class=\"western\"><em>addons</em></code></p>\n </li>\n <li>\n <p>Adaptez le fichier manifeste à votre module.</p>\n </li>\n <li>\n <p>Ne vous occupez pas des autres fichiers.</p>\n </li>\n</ol>\n\n<p> </p>\n\n<p><em>Openacademy</em><em>v9tov10</em><em> / __ manifest__.py</em></p>\n\n<p> </p>\n\n<p><code class=\"western\"><span># -*- coding: utf-8 -*-</span></code></p>\n\n<p><code class=\"western\"><span>{</span></code></p>\n\n<p><code class=\"western\">&#39;name&#39;: \"Open Academy Odoo v9 to v10\",</code></p>\n\n<p> </p>\n\n<p><code class=\"western\">&#39;summary&#39;: \"\"\"Manage trainings\"\"\",</code></p>\n\n<p> </p>\n\n<p><code class=\"western\">&#39;description&#39;: \"\"\"</code></p>\n\n<p><code class=\"western\">Open Academy module for managing trainings:</code></p>\n\n<p><code class=\"western\">- training courses</code></p>\n\n<p><code class=\"western\">- training sessions</code></p>\n\n<p><code class=\"western\">- attendees registration</code></p>\n\n<p><code class=\"western\">\"\"\",</code></p>\n\n<p> </p>\n\n<p><code class=\"western\">&#39;author&#39;: \"Covantec R.L. and Byoos\",</code></p>\n\n<p><code class=\"western\">&#39;website&#39;: \"<a href=\"https://coderwall.com/team/covantec\">https://coderwall.com/team/covantec</a>\",</code></p>\n\n<p><code class=\"western\">&#39;website&#39;: \"http://byoos.net\",</code></p>\n\n<p> </p>\n\n<p><code class=\"western\"># Categories can be used to filter modules in modules listing</code></p>\n\n<p><code class=\"western\"># Check https://github.com/odoo/odoo/blob/master/openerp/addons/base/module/module_data.xml</code></p>\n\n<p><code class=\"western\"># for the full list</code></p>\n\n<p><code class=\"western\">&#39;category&#39;: &#39;Test&#39;,</code></p>\n\n<p><code class=\"western\">&#39;version&#39;: &#39;0.1&#39;,</code></p>\n\n<p> </p>\n\n<p><code class=\"western\"># any module necessary for this one to work correctly</code></p>\n\n<p><code class=\"western\">&#39;depends&#39;: [&#39;base&#39;, &#39;web_gantt&#39;],</code></p>\n\n<p> </p>\n\n<p><code class=\"western\"># always loaded</code></p>\n\n<p><code class=\"western\">&#39;data&#39;: [</code></p>\n\n<p><code class=\"western\"># &#39;security/ir.model.access.csv&#39;,</code></p>\n\n<p><code class=\"western\">&#39;views/openacademy.xml&#39;,</code></p>\n\n<p><code class=\"western\">&#39;views/partner.xml&#39;,</code></p>\n\n<p><code class=\"western\">&#39;views/views.xml&#39;,</code></p>\n\n<p><code class=\"western\">&#39;views/templates.xml&#39;,</code></p>\n\n<p><code class=\"western\">],</code></p>\n\n<p><code class=\"western\"># only loaded in demonstration mode</code></p>\n\n<p><code class=\"western\">&#39;demo&#39;: [</code></p>\n\n<p><code class=\"western\">&#39;demo/demo.xml&#39;,</code></p>\n\n<p><code class=\"western\">],</code></p>\n\n<p><code class=\"western\"><span>}</span></code></p>\n'),
(63, 5, 'blog_posts', 'title', 1, ' EXPERIENCE BYOOS ODOO 10 '),
(64, 5, 'blog_posts', 'description', 1, ''),
(65, 5, 'blog_posts', 'keywords', 1, ''),
(66, 5, 'blog_posts', 'content', 1, ''),
(67, 6, 'blog_posts', 'title', 2, 'Gestionnaire de contenu NodCms  version2-1'),
(68, 6, 'blog_posts', 'description', 2, ''),
(69, 6, 'blog_posts', 'keywords', 2, ''),
(70, 6, 'blog_posts', 'content', 2, ''),
(71, 6, 'blog_posts', 'title', 1, 'NodCms Content Manager version2-1'),
(72, 6, 'blog_posts', 'description', 1, ''),
(73, 6, 'blog_posts', 'keywords', 1, ''),
(74, 6, 'blog_posts', 'content', 1, ''),
(75, 7, 'blog_posts', 'title', 2, 'Medlines+ / Mediboard'),
(76, 7, 'blog_posts', 'description', 2, 'Cet article présente la méthode d\'installation  et modification'),
(77, 7, 'blog_posts', 'keywords', 2, 'sih, medlines+'),
(78, 7, 'blog_posts', 'content', 2, '<p><strong>En premier lieu téléchargez le dernier repositorie</strong></p>\n\n<p>$ sudo svn  export https://svn.openxtrem.com/gpl/trunk/    mediboard20200115b771b<br>\nPuis copier la source dans votre serveur WEB apache2, appliquez les droits d&#39;accès, CHMOD - CHOWN -CHGRP.<br>\nplacez  le flag \"memory_limit\"  /etc/apache2/php.ini  à la valeur 256Mo  au lieu de 128Mo</p>\n\n<p>Une fois prêt lancez votre navigateur à adresse d&#39;installation  http://domaine/repertoire<br>\n </p>\n\n<p> </p>\n'),
(79, 7, 'blog_posts', 'title', 1, 'Medlines+ / Mediboard'),
(80, 7, 'blog_posts', 'description', 1, ''),
(81, 7, 'blog_posts', 'keywords', 1, ''),
(82, 7, 'blog_posts', 'content', 1, ''),
(83, 8, 'blog_posts', 'title', 2, 'Facturation avancée sur MEDLINES 2018'),
(84, 8, 'blog_posts', 'description', 2, ''),
(85, 8, 'blog_posts', 'keywords', 2, ''),
(86, 8, 'blog_posts', 'content', 2, '<p>La version 2018 de MEDLINES apporte de nombreuses améliorations du côté Facturation des prestations médicales. En effet dans la version source du Framework  MEDIBOARD il n&#39;est pas possible lors d&#39;une consultation de suivre les tarifs de facture, le montant des prestations étant cumulés sur un montant total que l&#39;établissement ou le médecin facture à la caisse d&#39;assurance maladie ( modèle français ) où l&#39;assurance maladie est oblgatoire et suivi par les Caisses d&#39;assurance maladie ( CPAM, RSI ...)</p>\n\n<p>Fort de ce constat  BYOOS a mis au point une extention du module Facturation MEDLINES+  afin de prendre en compte la gestion des tarifs par domaine de gestion.</p>\n\n<p><strong>Méthode</strong></p>\n\n<p>Après l&#39;accès au portail de Medlines,  l&#39;utilisateur de caisse  s&#39;identifie, automatiquement il reçoit les droits sur les modules dont il a la charge:</p>\n\n<ul>\n <li>Dossier Patient</li>\n <li>Consultation</li>\n <li>Facturation</li>\n <li>Messagerie</li>\n</ul>\n\n<p>le caissier ouvre une SESSION d&#39;activité recettes sur facture et son compteur s&#39;initialise à la valeur zéro ( 0 )<br>\ntout au long de son activité de facturation les recettes sont cumulées afin d&#39;obtenir un total SESSION.</p>\n\n<p>A la fin de son activité le caissier va fermer sa session de travail ainsi le montant total caisse est enregistré puis la session verouillée  afin que le caissier ne puisse plus modifier sont montant total caisse ( recette ).</p>\n\n<p>Ensuite il dépose son montant perçu auprès du régisseur qui lui sera chargé du contrôle de la session et devra valider le montant sur son interface MEDLINES.</p>\n\n<p>La gestion des items de facturation au niveau de la consultation ouvre un grand champ de possibilés de suivi statistiques des items consommées par domaine et/ou par service.</p>\n\n<p>Pour engager la facturation l&#39;utilisateur doit avoir un profil \"caisse\" pour les autres profil la facturation n&#39;est pas permise.</p>\n\n<p><strong>Méthode</strong></p>\n\n<ol>\n <li>Ouvrir une session avec un compte caisse (par exemple : caisse_1)</li>\n <li>Vérifier  si la session est ouverte dans l’onglet facturation</li>\n <li>Puis aller dans dossier patient, pour renseigner le nom du patient à qui la facture doit être faite</li>\n <li>Cliquez sur le nom du patient</li>\n <li>Choisir la consultation immédiate</li>\n <li>Choisir le nom du Médecin praticien qui prendra le patient en charge et cliquez sur consulter</li>\n <li>Ensuite choisir la prestation demandée au niveau des cotations</li>\n <li> Clôturer la facture</li>\n <li>Aller dans l’onglet règlements pour approuver le montant qui devra être versé par le patient</li>\n <li>En fin de journée clôturer la session dans l’onglet facturation</li>\n</ol>\n\n<p>Site de démontartion   <a href=\"http://www.byoos.eu\">http://www.byoos.eu</a></p>\n'),
(87, 8, 'blog_posts', 'title', 1, ''),
(88, 8, 'blog_posts', 'description', 1, ''),
(89, 8, 'blog_posts', 'keywords', 1, ''),
(90, 8, 'blog_posts', 'content', 1, ''),
(91, 2, 'article', 'title', 2, 'Autres sites'),
(92, 2, 'article', 'description', 2, 'Les autres sites de démonstration publiés par Byoos digital'),
(93, 2, 'article', 'keywords', 2, 'byoos, bhospital, bschool, bhostel'),
(94, 2, 'article', 'content', 2, '<p>Secteurs d&#39;activité</p>\n\n<ul>\n <li>Centre de Santé, Radiologie, gestion des établissements de Santé</li>\n <li>Kiné / Ostéopathe / Podologue / Dentiste / Psychologue,...</li>\n <li>Restaurant, Bar, Traiteur</li>\n <li>Hôtel, gestion des hôtels</li>\n <li>Mairies</li>\n <li>Enseignement, Centre de formations, Auto-école, ...</li>\n <li>Artisan, Plombier, Serrurier, Peintre, Maçon, ...</li>\n</ul>\n\n<p><strong>Les autres sites de démonstration publiés par Byoos digital</strong></p>\n\n<p>Informatique médicale Médecine Santé  <a href=\"http://byoos.com/medicine_health\" target=\"_blank\">http://byoos.com/medicine_health</a>     login    byoosdigital     pass demo237a</p>\n\n<p>Gestion e-commerce     http://<a href=\"http://byoos.com/shop\" target=\"_blank\">byoos.com/shop</a></p>\n\n<p>Gestion  des stocks, clients  point de vente  <a href=\"http://byoos.com/ospos334a/login\" target=\"_blank\">http://byoos.com/ospos334a/login</a>     login    byoosdigital     pass demo237a</p>\n\n<p>Gestion des hôtels     <a href=\"http://byoos.com/hostel\" target=\"_blank\">http://byoos.com/hostel</a></p>\n\n<p>Gestion des contenus CMS     <a href=\"http://byoos.com/demo_cms\" target=\"_blank\">http://byoos.com/demo_cms</a></p>\n\n<p>Site de petites annonces  <a href=\"http://www.leboncamer.com/shop\" target=\"_blank\">http://www.leboncamer.com/shop</a></p>\n\n<div>\n<p>ci-dessous le lien de notre dépôt GITHUB sur lequel vous pouvez télécharger le code byoosPOS point de vente, toutes les APP&#39;s sont codées sur le même modèle visant ainsi à simplifier la maintenance - FrameWork  codeIgniter v3.1.11, base MariaDB 10.x  serveur Debian 9 ou 10</p>\n</div>\n\n<div><a href=\"https://github.com/DEV-byoos/byoospos\" target=\"_blank\">https://github.com/DEV-byoos/byoospos</a></div>\n\n<div> </div>\n\n<div>vous pouvez aussi nous retrouver sur <a href=\"http://byoosdigital.com\" target=\"_blank\">http://byoosdigital.com</a>  site WEB codé avec le NodCMS version 2.1</div>\n\n<div><a href=\"https://github.com/DEV-byoos/nodcms_v2-1c\">github.com/DEV-byoos/nodcms_v2-1c</a></div>\n\n<p> </p>\n\n<p> </p>\n'),
(95, 2, 'article', 'title', 1, 'Catalog'),
(96, 2, 'article', 'description', 1, 'Other demo sites advertised by Byoos digital'),
(97, 2, 'article', 'keywords', 1, 'byoos, bhospital, bschool, bhostel'),
(98, 2, 'article', 'content', 1, '<p>Activity sectors</p>\n\n<ul>\n <li>    Health Center, Radiology, management of health facilities</li>\n <li>    Physiotherapist / Osteopath / Podiatrist / Dentist / Psychologist,...</li>\n <li>    Restaurant, Bar, Caterer</li>\n <li>    Hotel, hotel management</li>\n <li>    Town Halls</li>\n <li>    Teaching, training center, driving school, ...</li>\n <li>    Craftsman, Plumber, Locksmith, Painter, Mason, ...</li>\n</ul>\n\n<p><strong>Other demo sites advertised by Byoos digital</strong></p>\n\n<p>Medical Informatics <a href=\"http://byoos.com/medicine_healt\" target=\"_blank\">http://byoos.com/medicine_healt</a>    login    byoosdigital     pass demo237a</p>\n\n<p>E-commerce management <a href=\"http://byoos.com/shop\" target=\"_blank\">http://byoos.com/shop</a></p>\n\n<p>Stock management, point of sale customers <a href=\"http://byoos.com/ospos334a/login\">http://byoos.com/ospos334a/login</a>      login    byoosdigital     pass demo237a</p>\n\n<p>Hostel managment  <a href=\"http://byoos.com/hostel\" target=\"_blank\">http://byoos.com/hostel</a></p>\n\n<p>Content managment sytem CMS     <a href=\"http://byoos.com/demo_cms\" target=\"_blank\">http://byoos.com/demo_cms</a></p>\n\n<p>Classifieds site  <a href=\"http://www.leboncamer.com/shop\" target=\"_blank\">http://www.leboncamer.com/shop</a></p>\n\n<p>Below is the link to our GITHUB repository where you can download the byoosPOS point of sale code, all APP&#39;s are coded on the same template to simplify maintenance - FrameWork codeIgniter v3.1.11, MariaDB 10.x base Debian 9 or 10 server</p>\n\n<p><a href=\"https://github.com/DEV-byoos/byoospos\">github.com/DEV-byoos/byoospos</a></p>\n\n<p>you can also find us on <a href=\"http://byoosdigital.com\">http://byoosdigital.com</a> website coded with NodCMS version 2.1</p>\n\n<p><a href=\"https://github.com/DEV-byoos/nodcms_v2-1c\">github.com/DEV-byoos/nodcms_v2-1c</a></p>\n\n<p> </p>\n\n<p> </p>\n'),
(99, 9, 'blog_posts', 'title', 2, 'nouvelle application de gestion des mairies TOWNHALL version 2020'),
(100, 9, 'blog_posts', 'description', 2, 'gère la mairie de A - Z'),
(101, 9, 'blog_posts', 'keywords', 2, ''),
(102, 9, 'blog_posts', 'content', 2, '<p>nouvelle application de gestion des mairies TOWNHALL version 2020</p>\n\n<p>gestion des citoyens<br>\nétat civil<br>\ngestion des employés, rôles et permissions<br>\ngestion des dépenses et recettes<br>\ngestion des véhicules<br>\nédition des rapports</p>\n'),
(103, 9, 'blog_posts', 'title', 1, 'new town hall management application TOWNHALL version 2020'),
(104, 9, 'blog_posts', 'description', 1, 'manages the town hall from A to Z'),
(105, 9, 'blog_posts', 'keywords', 1, ''),
(106, 9, 'blog_posts', 'content', 1, '<p>new town hall management application TOWNHALL version 2020</p>\n\n<p>citizen management<br>\nmarital status<br>\nemployee management, roles and permissions<br>\nexpenditure and revenue management<br>\nvehicle management<br>\nreport editing</p>\n'),
(107, 10, 'blog_posts', 'title', 2, 'CI_translator'),
(108, 10, 'blog_posts', 'description', 2, 'convertir les messages à partir de l\'anglais vers une autre langue supportée par Google translate'),
(109, 10, 'blog_posts', 'keywords', 2, 'codeIgniter, PHP, traduction'),
(110, 10, 'blog_posts', 'content', 2, '<p>voir le script  php</p>\n\n<hr>\n<p>&lt;?php<br>\n        error_reporting(E_ALL);<br>\n        ini_set(&#39;display_errors&#39;, 1);<br>\n/*  translate   from  english  to  french or other language  CI_translator<br>\n * BYOOS solutions 2020/07/07  gbobard@gmail.com  <br>\n * step_1  construt one texte file form  SQL original or array language CI<br>\n * step_2  traduce the file issue of step_1 ON https://translate.google.com/?hl=fr<br>\n * step_3  translate manuelly this text file english to french<br>\n * step_4  replace the pattern english by str  french<br>\n * ********************************************************/<br>\n </p>\n\n<p>function fixtags($text){<br>\n    $text = htmlspecialchars($text);<br>\n    $text = preg_replace(\"/=/\", \"=\\\"\\\"\", $text);<br>\n    $text = preg_replace(\"/\"/\", \"\"\\\"\", $text);<br>\n    $tags = \"/&lt;(\\/|)(\\w*)(\\ |)(\\w*)([\\\\\\=]*)(?|(\\\")\\\"\"\\\"|)(?|(.*)?\"(\\\")|)([\\ ]?)(\\/|)>/i\";<br>\n    $replacement = \"&lt;$1$2$3$4$5$6$7$8$9$10>\";<br>\n    $text = preg_replace($tags, $replacement, $text);<br>\n    $text = preg_replace(\"/=\\\"\\\"/\", \"=\", $text);<br>\n    return $text;<br>\n}</p>\n\n<p>function lister_fichiers($rep)  <br>\n{  <br>\n    if(is_dir($rep))  <br>\n    {  <br>\n        if($iteration = opendir($rep))  <br>\n        {<br>\n            while(($fichier = readdir($iteration)) !== false)  <br>\n            {  <br>\n                if($fichier != \".\" && $fichier != \"..\" && $fichier != \"Thumbs.db\")  <br>\n                {<br>\n                    $list_files_src[] = $fichier;<br>\n                    //echo &#39;<a href=\"&#39;.$rep.$fichier.&#39;\" target=\"_blank\">&#39;.$fichier.&#39;</a><br>&#39;.\"\\n\";  <br>\n                }  <br>\n            }  <br>\n            closedir($iteration);  <br>\n        }<br>\n        return $list_files_src;<br>\n    }<br>\n}</p>\n\n<p>function lire_ligne_fichiers($_file)  <br>\n{<br>\n        $handle = fopen&#40;$_file, &#39;r&#39;&#41;;<br>\n        if ($handle)<br>\n        {<br>\n            while (!feof($handle))<br>\n            {<br>\n                $buffer = fgets($handle);<br>\n                echo $buffer;<br>\n            }<br>\n            fclose($handle);<br>\n        }<br>\n}</p>\n\n<p>$step = &#39;step_4&#39;;// setp_1 OR step_4<br>\n$source = &#39;en&#39;;<br>\n$target = &#39;fr&#39;;<br>\n$attempts = 5;<br>\n$tab = array();<br>\n$list_files_src = array();</p>\n\n<p>$path_src = &#39;./english/&#39;;<br>\n$path_dest = &#39;./french/&#39;;<br>\nis_dir($path_dest) ? &#39;&#39;: mkdir(\"$path_dest\", 0755);<br>\n    <br>\n$list_files_src = lister_fichiers(\"./english/\");<br>\necho &#39; Start of TRAD  ARRAY  language codeIgniter 3.1.11  &#39;.date(&#39;d-m-Y His&#39;).&#39;<br>&#39;;</p>\n\n<p>switch ($step){<br>\n    case &#39;step_1&#39;:<br>\n        $file_dest_en = fopen&#40;\"./fichier_language_en.txt\", \"w+\"&#41;;<br>\n        foreach ( $list_files_src as $file_src )<br>\n        {<br>\n            $handle = fopen&#40;$path_src.$file_src, &#39;r&#39;&#41;;<br>\n            if ($handle)<br>\n            {<br>\n                echo $file_src.&#39;<br>&#39;;<br>\n                fwrite($file_dest_en,\"////\".$file_src.\"\\r\\n\");</p>\n\n<p>                while (!feof($handle))<br>\n                {<br>\n                    $buffer = fgets($handle);<br>\n                    $tab = explode( &#39;=&#39;, $buffer);<br>\n                    if ( substr($buffer,1,5) === &#39;lang[&#39;){    <br>\n                        $text = trim(str_replace(array(&#39;\"&#39;, \"&#39;\"), \"\", str_replace(\";\",\"\",$tab[1])));<br>\n                        echo &#39;<pre>&#39;;print_r( $text );echo &#39;</pre>&#39;;//BYOOS_tag<br>\n                        fwrite($file_dest_en, $text.\"\\r\\n\");<br>\n                    }<br>\n                }<br>\n                fclose($handle);<br>\n            }<br>\n        }<br>\n        fclose($file_dest_en);<br>\n        <br>\n    break;<br>\n    case &#39;step_4&#39;:<br>\n        echo $step.&#39;<br>&#39;;<br>\n        error_reporting(E_ALL);<br>\n        ini_set(&#39;display_errors&#39;, 1);<br>\n        $file_src_dest = array();<br>\n        $file_dest_fr = null;<br>\n        $file_src_en = null;<br>\n        $buffer = &#39;&#39;;<br>\n        $i=0;<br>\n        /*open source file in french translate*/<br>\n        $lines = file&#40;&#39;./fichier_language_fr.txt&#39;&#41;;<br>\n        /*Scroll through the $lines table and display the contents of each line preceded by its number.*/<br>\n        foreach ($lines as $lineNumber => $lineContent)<br>\n        {</p>\n\n<p>            if ( $lineNumber &lt;= 4022) {// line number in file  english source<br>\n                echo &#39; compteur  &#39;.$lineNumber.&#39;   &#39;.$lineContent.&#39;<br>&#39;;<br>\n            }<br>\n            else {<br>\n                echo &#39; STOP &#39;;exit();</p>\n\n<p>            }        </p>\n\n<p>            $filename = trim(substr($lineContent,4,strlen($lineContent)-4));</p>\n\n<p>            if ( substr($lineContent,0,4) === &#39;////&#39;){<br>\n                $i=0;// init count of $file_src_en source english            <br>\n                ( $file_dest_fr ) ? fclose( $file_dest_fr ) : &#39;&#39;;<br>\n                $file_dest_fr = fopen&#40;$path_dest.$filename, \"w+\"&#41;;<br>\n                //$file_src_en = file&#40;$path_src.$filename&#41;;<br>\n                $linksArray = file&#40;$path_src.$filename&#41;;<br>\n                // reindex and filter the array<br>\n                $file_src_en = array_merge(array_filter($linksArray, function($value) { return substr($value,1,5) === &#39;lang[&#39;; }));<br>\n                var_dump($file_src_en );//BYOOS_tag<br>\n                fwrite($file_dest_fr, &#39;&lt;?php /*&#39;. $path_dest.$filename. &#39; French Language  BYOOS  gbobard@gmail.com */&#39;.\"\\r\\n\");<br>\n                echo $lineNumber.&#39;   &#39;.$lineContent.&#39; ********** &#39;.$filename.&#39;<br>&#39;;<br>\n            }else<br>\n                {<br>\n                    $file_src_dest[$i] = $lineContent;<br>\n                    $buffer = $file_src_en[$i];</p>\n\n<p>                    echo &#39;buffer src_en  &#39;.$lineNumber.&#39;   &#39;.$lineContent;var_dump($file_src_en[$i], $buffer, $i);echo &#39;<br>&#39;;<br>\n                    if ( substr($buffer,1,5) === &#39;lang[&#39;){<br>\n                        $result = rtrim($lineContent);<br>\n                        echo &#39;result lineContent &#39;.$lineNumber.&#39;   &#39;.var_dump($result, $i);echo &#39;<br>&#39;;</p>\n\n<p>                        $trad_target = substr_replace($buffer,\"= &#39;\".trim(str_replace(\"&#39;\", \"\\&#39;\",$result)).\"&#39;;\", strpos($buffer, &#39;=&#39;));<br>\n                        echo &#39;<pre>&#39;;print_r( $trad_target );echo &#39;</pre>&#39;;//BYOOS_tag<br>\n                        fwrite($file_dest_fr,$trad_target.\"\\r\\n\");<br>\n                        $i++;<br>\n                    }<br>\n                }<br>\n            }    <br>\n        echo &#39;<pre>&#39;;print_r($file_src_dest);echo &#39;</pre>&#39;;exit();<br>\n    break;<br>\n    default:<br>\n    $message = &#39; No step selected !!!   &#39;;<br>\n        echo &#39;TRAD  &#39;.$message.&#39;<br>&#39;;die;<br>\n    break;<br>\n}<br>\necho &#39;END of traduce  &#39;;</p>\n\n<p>?&gt;</p>\n\n<p> </p>\n'),
(111, 10, 'blog_posts', 'title', 1, 'CI_translator'),
(112, 10, 'blog_posts', 'description', 1, 'convert messages from English to another language supported by Google translate'),
(113, 10, 'blog_posts', 'keywords', 1, 'codeIgniter, PHP, transtate'),
(114, 10, 'blog_posts', 'content', 1, '<p>See th script PHP</p>\n'),
(115, 7, 'blog_categories', 'title', 2, 'e-commerce'),
(116, 7, 'blog_categories', 'title', 1, 'e-commerce'),
(119, 11, 'blog_posts', 'title', 2, 'Etat des lieux du e-commerce au Cameroun octobre 2020'),
(120, 11, 'blog_posts', 'description', 2, 'Cimetière des sociétés de e-commerce au Cameroun'),
(121, 11, 'blog_posts', 'keywords', 2, 'leboncamer, e-commerce, BYOOS, byoos\nétude de BYOOS digital 10/2020'),
(122, 11, 'blog_posts', 'content', 2, '<table cellpadding=\"4\" cellspacing=\"0\">\n <tbody>\n  <tr>\n   <td width=\"20%\">\n   <p><strong>Promoteur</strong></p>\n   </td>\n   <td width=\"20%\">\n   <p><strong>Nom de production</strong></p>\n   </td>\n   <td width=\"20%\">\n   <p><strong>Date début</strong></p>\n   </td>\n   <td width=\"20%\">\n   <p><strong>Date de fin</strong></p>\n   </td>\n   <td width=\"20%\">\n   <p><strong>Commentaires</strong></p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>N/A</p>\n   </td>\n   <td width=\"20%\">\n   <p>Kaymu.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2013</p>\n   </td>\n   <td width=\"20%\">\n   <p>2016</p>\n   </td>\n   <td width=\"20%\">\n   <p>Reprise par JUMIA</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>CASINO</p>\n   </td>\n   <td width=\"20%\">\n   <p>Cdiscount.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>12/2014</p>\n   </td>\n   <td width=\"20%\">\n   <p>07/2016</p>\n   </td>\n   <td width=\"20%\">\n   <p>Groupe Français</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>CFAO</p>\n   </td>\n   <td width=\"20%\">\n   <p>Africashop.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2015</p>\n   </td>\n   <td width=\"20%\">\n   <p>06/2018</p>\n   </td>\n   <td width=\"20%\">\n   <p>Groupe Français</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>AIG</p>\n   </td>\n   <td width=\"20%\">\n   <p>Afrimarket.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2013</p>\n   </td>\n   <td width=\"20%\">\n   <p>09/2019</p>\n   </td>\n   <td width=\"20%\">\n   <p>Rocket INT</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>AIG</p>\n   </td>\n   <td width=\"20%\">\n   <p>Jumia.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2012</p>\n   </td>\n   <td width=\"20%\">\n   <p>12/2019</p>\n   </td>\n   <td width=\"20%\">\n   <p>Fin du poid lourd du e-commerce au Cameroun</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>Jacques Temgo Guiffo</p>\n   </td>\n   <td width=\"20%\">\n   <p>Afribaba.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2015</p>\n   </td>\n   <td width=\"20%\">\n   <p>2019</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>AIG</p>\n   </td>\n   <td width=\"20%\">\n   <p>Africainternetgrou.com</p>\n   </td>\n   <td width=\"20%\">\n   <p>2012</p>\n   </td>\n   <td width=\"20%\">\n   <p>2020</p>\n   </td>\n   <td width=\"20%\">\n   <p>Rocket International</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>Vendito.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>06/2015</p>\n   </td>\n   <td width=\"20%\">\n   <p>2016</p>\n   </td>\n   <td width=\"20%\">\n   <p>Reprise par JUMIA</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>Lamundi</p>\n   </td>\n   <td width=\"20%\">\n   <p>Lamudi.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2014</p>\n   </td>\n   <td width=\"20%\">\n   <p>2016</p>\n   </td>\n   <td width=\"20%\">\n   <p>Reprise par JUMIA</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>DHL</p>\n   </td>\n   <td width=\"20%\">\n   <p>Africa-eshop.dhl</p>\n   </td>\n   <td width=\"20%\">\n   <p>2019</p>\n   </td>\n   <td width=\"20%\">\n   <p>...</p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>Welymarket.com</p>\n   </td>\n   <td width=\"20%\">\n   <p>2019</p>\n   </td>\n   <td width=\"20%\">\n   <p>…</p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>Sellam.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>glotelho.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>prem-market.com</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>https://sasayez.biz/</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>https://www.iziway.cm/</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n </tbody>\n</table>\n'),
(123, 11, 'blog_posts', 'title', 1, 'Status of e-commerce in Cameroon October 2020'),
(124, 11, 'blog_posts', 'description', 1, 'Cemetery of e-commerce companies in Cameroon'),
(125, 11, 'blog_posts', 'keywords', 1, 'leboncamer, e-commerce, BYOOS, byoos\nétude de BYOOS digital 10/2020');
INSERT INTO `translations` (`translation_id`, `table_id`, `table_name`, `field_name`, `language_id`, `translated_text`) VALUES
(126, 11, 'blog_posts', 'content', 1, '<table cellpadding=\"4\" cellspacing=\"0\">\n <tbody>\n  <tr>\n   <td width=\"20%\">\n   <p><strong>Promoteur</strong></p>\n   </td>\n   <td width=\"20%\">\n   <p><strong>Nom de production</strong></p>\n   </td>\n   <td width=\"20%\">\n   <p><strong>Date début</strong></p>\n   </td>\n   <td width=\"20%\">\n   <p><strong>Date de fin</strong></p>\n   </td>\n   <td width=\"20%\">\n   <p><strong>Commentaires</strong></p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>N/A</p>\n   </td>\n   <td width=\"20%\">\n   <p>Kaymu.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2013</p>\n   </td>\n   <td width=\"20%\">\n   <p>2016</p>\n   </td>\n   <td width=\"20%\">\n   <p>Reprise par JUMIA</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>CASINO</p>\n   </td>\n   <td width=\"20%\">\n   <p>Cdiscount.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>12/2014</p>\n   </td>\n   <td width=\"20%\">\n   <p>07/2016</p>\n   </td>\n   <td width=\"20%\">\n   <p>Groupe Français</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>CFAO</p>\n   </td>\n   <td width=\"20%\">\n   <p>Africashop.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2015</p>\n   </td>\n   <td width=\"20%\">\n   <p>06/2018</p>\n   </td>\n   <td width=\"20%\">\n   <p>Groupe Français</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>AIG</p>\n   </td>\n   <td width=\"20%\">\n   <p>Afrimarket.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2013</p>\n   </td>\n   <td width=\"20%\">\n   <p>09/2019</p>\n   </td>\n   <td width=\"20%\">\n   <p>Rocket INT</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>AIG</p>\n   </td>\n   <td width=\"20%\">\n   <p>Jumia.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2012</p>\n   </td>\n   <td width=\"20%\">\n   <p>12/2019</p>\n   </td>\n   <td width=\"20%\">\n   <p>Fin du poid lourd du e-commerce au Cameroun</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>Jacques Temgo Guiffo</p>\n   </td>\n   <td width=\"20%\">\n   <p>Afribaba.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2015</p>\n   </td>\n   <td width=\"20%\">\n   <p>2019</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>AIG</p>\n   </td>\n   <td width=\"20%\">\n   <p>Africainternetgrou.com</p>\n   </td>\n   <td width=\"20%\">\n   <p>2012</p>\n   </td>\n   <td width=\"20%\">\n   <p>2020</p>\n   </td>\n   <td width=\"20%\">\n   <p>Rocket International</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>Vendito.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>06/2015</p>\n   </td>\n   <td width=\"20%\">\n   <p>2016</p>\n   </td>\n   <td width=\"20%\">\n   <p>Reprise par JUMIA</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>Lamundi</p>\n   </td>\n   <td width=\"20%\">\n   <p>Lamudi.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p>2014</p>\n   </td>\n   <td width=\"20%\">\n   <p>2016</p>\n   </td>\n   <td width=\"20%\">\n   <p>Reprise par JUMIA</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p>DHL</p>\n   </td>\n   <td width=\"20%\">\n   <p>Africa-eshop.dhl</p>\n   </td>\n   <td width=\"20%\">\n   <p>2019</p>\n   </td>\n   <td width=\"20%\">\n   <p>...</p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>Welymarket.com</p>\n   </td>\n   <td width=\"20%\">\n   <p>2019</p>\n   </td>\n   <td width=\"20%\">\n   <p>…</p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>Sellam.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>glotelho.cm</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>prem-market.com</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>https://sasayez.biz/</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>https://www.iziway.cm/</p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p> </p>\n   </td>\n   <td width=\"20%\">\n   <p>En production</p>\n   </td>\n  </tr>\n </tbody>\n</table>\n'),
(127, 12, 'blog_posts', 'title', 2, 'Top 10 des meilleurs sites de vente en ligne au Cameroun en 2020'),
(128, 12, 'blog_posts', 'description', 2, ''),
(129, 12, 'blog_posts', 'keywords', 2, 'BYOOS, byoos, byoosdigital.com'),
(130, 12, 'blog_posts', 'content', 2, '<table cellpadding=\"4\" cellspacing=\"0\">\n <tbody>\n  <tr>\n   <td width=\"121\">\n   <p><strong>Promoteur</strong></p>\n   </td>\n   <td width=\"121\">\n   <p><strong>Nom de production</strong></p>\n   </td>\n   <td width=\"120\">\n   <p><strong>Date début</strong></p>\n   </td>\n   <td width=\"121\">\n   <p><strong>Date de fin</strong></p>\n   </td>\n   <td width=\"121\">\n   <p><strong>Commentaires</strong></p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p>Durrell Market.</p>\n   </td>\n   <td width=\"121\">\n   <p>Durellmarket.com</p>\n   </td>\n   <td width=\"120\">\n   <p>2018</p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p>Prem&#39; Market</p>\n   </td>\n   <td width=\"121\">\n   <p>Prem-market.com</p>\n   </td>\n   <td width=\"120\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p>IZIWAY</p>\n   </td>\n   <td width=\"121\">\n   <p>iziway.cm</p>\n   </td>\n   <td width=\"120\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>Ledétaillant.biz</p>\n   </td>\n   <td width=\"120\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p>SOLDERIS</p>\n   </td>\n   <td width=\"121\">\n   <p>solderis.cm</p>\n   </td>\n   <td width=\"120\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p>EKOOLO</p>\n   </td>\n   <td width=\"121\">\n   <p>ekoolo.cm</p>\n   </td>\n   <td width=\"120\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>sasayez.biz</p>\n   </td>\n   <td width=\"120\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>Welymarket.com</p>\n   </td>\n   <td width=\"120\">\n   <p>2019</p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p>DHL</p>\n   </td>\n   <td width=\"121\">\n   <p>Africa-eshop.dhl</p>\n   </td>\n   <td width=\"120\">\n   <p>2019</p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>Sellam.cm</p>\n   </td>\n   <td width=\"120\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>glotelho.cm</p>\n   </td>\n   <td width=\"120\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>N/A</p>\n   </td>\n   <td width=\"121\">\n   <p>En production</p>\n   </td>\n  </tr>\n  <tr>\n   <td width=\"121\">\n   <p>BYOOS</p>\n   </td>\n   <td width=\"121\">\n   <p>Leboncamer.com</p>\n   </td>\n   <td width=\"120\">\n   <p>2020</p>\n   </td>\n   <td width=\"121\">\n   <p> </p>\n   </td>\n   <td width=\"121\">\n   <p>En lancement ...</p>\n   </td>\n  </tr>\n </tbody>\n</table>\n\n<p>01: Durrell Market<br>\n02: Prem&#39; Market<br>\n03: IZIWAY<br>\n04: Ledétaillant.biz<br>\n05: SOLDERIS<br>\n06 : Ekoolo<br>\n07: Sassayez.com<br>\n08 : Welly Market<br>\n09 : OnGeek.cm<br>\n10 : LiMarket.net</p>\n\n<p>…...</p>\n\n<ul>\n</ul>\n\n<p>sources</p>\n\n<p> </p>\n\n<p><a href=\"https://www.investiraucameroun.com/\">https://www.investiraucameroun.com</a></p>\n\n<p><a href=\"https://durrellmarket.com/top-des-meilleurs-sites-de-vente-en-ligne-au-cameroun/\">https://durrellmarket.com/</a></p>\n'),
(131, 12, 'blog_posts', 'title', 1, 'Top 10 of the best online stores in Cameroon in 2020'),
(132, 12, 'blog_posts', 'description', 1, 'Top 10 of the best online stores in Cameroon in 202'),
(133, 12, 'blog_posts', 'keywords', 1, ''),
(134, 12, 'blog_posts', 'content', 1, '<p>01: Durrell Market<br>\n02: Prem&#39; Market<br>\n03: IZIWAY<br>\n04: Ledétaillant.biz<br>\n05: SOLDERIS<br>\n06 : Ekoolo<br>\n07: Sassayez.com<br>\n08 : Welly Market<br>\n09 : OnGeek.cm<br>\n10 : LiMarket.net</p>\n\n<p>…...</p>\n\n<ul>\n</ul>\n\n<p>sources</p>\n\n<p> </p>\n\n<p><a href=\"https://www.investiraucameroun.com/\">https://www.investiraucameroun.com</a></p>\n\n<p><a href=\"https://durrellmarket.com/top-des-meilleurs-sites-de-vente-en-ligne-au-cameroun/\">https://durrellmarket.com/</a></p>\n'),
(135, 13, 'blog_posts', 'title', 2, 'Multi-magasins et petites annonces en ligne'),
(136, 13, 'blog_posts', 'description', 2, ''),
(137, 13, 'blog_posts', 'keywords', 2, 'leboncamer, leboncamer.com, BYOOS, byoosdigital'),
(138, 13, 'blog_posts', 'content', 2, '<p>Byoos digital lance le projet \"nouveau site collaboratif  e-commerce et petites annonces\" nous recherchons des investisseurs participatifs ainsi que des membres participatifs.<br>\nByoos digital fournit sa part avec le site professionnel puis la mise en ligne ... plus d,infos sur http://leboncamer.com ou sur WhatsApp #leboncamer</p>\n'),
(139, 13, 'blog_posts', 'title', 1, 'Multi-store and Classieds on line'),
(140, 13, 'blog_posts', 'description', 1, ''),
(141, 13, 'blog_posts', 'keywords', 1, 'leboncamer, leboncamer.com, BYOOS, byoosdigital'),
(142, 13, 'blog_posts', 'content', 1, '<p>Byoos digital launches the project \"new collaborative e-commerce and classified ads website\" we are looking for participative investors as well as participative members.<br>\nByoos digital provides its part with the professional website and then the online launch ... more info on http://leboncamer.com or on WhatsApp #leboncamer</p>\n'),
(143, 3, 'article', 'title', 2, 'Nos outils de développement'),
(144, 3, 'article', 'description', 2, 'BYOOS digital, solutions informatiques est une société de conseils, expertises, intégration de logiciels de gestion open source  pour les entreprises.\n\nDomaines d\'application\n  - Commerce en ligne\n  - E.R.P gestion globale d\'entreprise\n  - S.I.H système d\'information hospitalier\n  - gestion des stocks\n  - gestion des écoles & E-learning\n  - gestion des hôtels, restaurants'),
(145, 3, 'article', 'keywords', 2, 'leboncamer.com, php7, codeigniter, transformation digitale'),
(146, 3, 'article', 'content', 2, '<p>BYOOS digital, solutions informatiques est une société de conseils, expertises, intégration de logiciels de gestion open source  pour les entreprises.</p>\n\n<p>Domaines d&#39;application<br>\n  - Commerce en ligne<br>\n  - E.R.P gestion globale d&#39;entreprise<br>\n  - S.I.H système d&#39;information hospitalier<br>\n  - gestion des stocks<br>\n  - gestion des écoles & E-learning<br>\n  - gestion des hôtels, restaurants</p>\n\n<p>En tant que développeur d&#39;applications, BYOOS à mis un point d&#39;honneur à uniformiser le modèle de développement des sources en langage PHP7 associé au framework CODEIGNITER.<br>\nLe serveur quant à lui est propulsé sous le système LINUX - debian, la base de données est supportée par le moteur MARIADB.<br>\nNos applications de gestion remplacent avantageusement le registre papier et implique évidement une sécurité accrue des données utilisateurs.<br>\nBCRYPT est une librairie supportée par PHP depuis sa version 5.5 et entièrement opérationnelle sur nos développement.</p>\n\n<p><br>\nLINUX - debian serveur<br>\nPHP7 - BCRYPT  - CODEIGNITER<br>\nsont les atouts d&#39;une robustesse à toutes épreuves.</p>\n\n<p>L&#39;économie numérique est en marche, bénéficez de la qualité du logiciel libre où aussi nommé Open Source</p>\n\n<p>FireFox le navigateur WEB le plus utilisé au monde  <a href=\"https://www.mozilla.org/fr/firefox/products/\">https://www.mozilla.org/fr/firefox/products/</a><br>\nLibreOffice, la bureautique libre   <a href=\"https://fr.libreoffice.org/\">https://fr.libreoffice.org/</a><br>\nDEBIAN   le système stable et sécurisé   <a href=\"http://www.debian.org/\">http://www.debian.org/</a></p>\n\n<p>L&#39;architecture logiciel est au standard HMVC  ( hierarchical, models, views, controllers ) de type modulaire où chaque module est un petit MVC.<br>\nCe modèle est utilisé dans la plupart des applications WEB d&#39;aujourd&#39;hui.</p>\n\n<p>L&#39;architecture matériel est composée de plusieurs éléments dont:<br>\n  - un serveur LINUX<br>\n  - un régulateur de tension<br>\n  - un onduleur<br>\n  - deux disques externes HDD 500Go<br>\n  - une connexion Internet 1Mo/s<br>\n  - une multiprise avec parasurtenseur 220V  16A</p>\n\n<p>le mode en serveur CLOUD ( distant ) sera acquis chez un hébergeur de qualité.</p>\n\n<p>BYOOS digital est aussi porteur du projet  http://leboncamer.com  une place de marché multi store – Classifieds, merci de vous inscrire à l’onglet « Votre compte »</p>\n'),
(147, 3, 'article', 'title', 1, 'Our development tools'),
(148, 3, 'article', 'description', 1, 'BYOOS digital, IT solutions is a consulting company, expertise, integration of open source management software for companies.\n\nFields of application\n  - E-Commerce\n  - E.R.P global business management\n  - S.I.H hospital information system\n  - inventory management\n  - school management & E-learning\n  - management of hotels, restaurants'),
(149, 3, 'article', 'keywords', 1, 'leboncamer.com, php7, codeigniter, transformation digitale'),
(150, 3, 'article', 'content', 1, '<p>BYOOS digital, IT solutions is a consulting company, expertise, integration of open source management software for companies.</p>\n\n<p>Fields of application<br>\n  - E-Commerce<br>\n  - E.R.P global business management<br>\n  - S.I.H hospital information system<br>\n  - inventory management<br>\n  - school management & E-learning<br>\n  - management of hotels, restaurants</p>\n\n<p>As an application developer, BYOOS has made it a point of honor to standardize the PHP7 source development model associated with the CODEIGNITER framework.<br>\nAs for the server, it is powered by the LINUX - debian system, the database is supported by the MARIADB engine.<br>\nOur management applications advantageously replace the paper registry and obviously implies an increased security of user data.<br>\nBCRYPT is a library supported by PHP since its version 5.5 and fully operational on our developments.</p>\n\n<p><br>\nLINUX - debian server<br>\nPHP7 - BCRYPT - CODEIGNITER<br>\nare the assets of a robustness that can withstand any test.</p>\n\n<p>The digital economy is on the move, benefit from the quality of free software or also called Open Source.</p>\n\n<p>FireFox the most used WEB browser in the world <a href=\"https://www.mozilla.org/fr/firefox/products/\">https://www.mozilla.org/fr/firefox/products/</a><br>\nLibreOffice, the free office automation <a href=\"https://fr.libreoffice.org/\">https://fr.libreoffice.org/</a><br>\nDEBIAN the stable and secure system <a href=\"http://www.debian.org/\">http://www.debian.org/</a></p>\n\n<p>The software architecture is HMVC standard (hierarchical, models, views, controllers) of modular type where each module is a small MVC.<br>\nThis model is used in most of today&#39;s WEB applications.</p>\n\n<p>The hardware architecture is composed of several elements including:<br>\n  - a LINUX server<br>\n  - a voltage regulator<br>\n  - an inverter<br>\n  - two external 500GB HDDs<br>\n  - an Internet connection 1Mo/s<br>\n  - a multi-socket outlet with 220V 16A surge protector</p>\n\n<p>the CLOUD server mode (remote) will be acquired from a quality hosting provider.</p>\n\n<p>BYOOS digital is also carrying the project http://leboncamer.com a multi-store marketplace - Classifieds, please register at the tab \"Your account\".</p>\n\n<p>Translated with www.DeepL.com/Translator (free version)</p>\n'),
(151, 14, 'blog_posts', 'title', 2, 'sauvegarde de fichiers et répertoires sous LINUX et MACOS'),
(152, 14, 'blog_posts', 'description', 2, 'Script shell Linux à lancer à la ligne de commande   $ sh mon_script_de_sauvegarde.linux'),
(153, 14, 'blog_posts', 'keywords', 2, 'sauvegarde, LINUX,MACOS,backup'),
(154, 14, 'blog_posts', 'content', 2, '<p>export D=$(date +%y-%m-%d)<br>\necho $D\" save_my_work.linux\" >> /var/log/SAVE_MY_WORK<br>\nexport AGO=$(date -d &#39;6 days ago&#39; +%y-%m-%d)</p>\n\n<p>mkdir -p /media/username/SEDUSB/BACKUP/2021</p>\n\n<p>echo -e \"backup d une base de données supprimer le dièse du dessous\"<br>\n# mysqldump -umoncompte -pmonpass nomdemabase > /media/username/SEDUSB/BACKUP/2021/sql_monbackup-$D.sql</p>\n\n<p>echo -e \"backup du répertoire concerne\"<br>\n tar cpzf /media/username/SEDUSB/BACKUP/2021/file_monbackup-$D.tar.gz /home/username/Documents/1__PROJET_DEV</p>\n\n<p>echo  -e \"efface le bakup j-7\"<br>\n# rm /media/username/SEDUSB/BACKUP/2021/sql_monbackup-$AGO.sql<br>\n# rm /media/username/SEDUSB/BACKUP/2021/file_monbackup-$AGO.tar.gz</p>\n'),
(155, 14, 'blog_posts', 'title', 1, 'backup of files and directories under LINUX and MACOS'),
(156, 14, 'blog_posts', 'description', 1, 'Linux shell script to run at the command line $ sh my_script_backup.linux'),
(157, 14, 'blog_posts', 'keywords', 1, 'sauvegarde, LINUX,MACOS,backup'),
(158, 14, 'blog_posts', 'content', 1, '<p>export D=$(date +%y-%m-%d)<br>\necho $D\" save_my_work.linux\" >> /var/log/SAVE_MY_WORK<br>\nexport AGO=$(date -d &#39;6 days ago&#39; +%y-%m-%d)</p>\n\n<p>mkdir -p /media/username/SEDUSB/BACKUP/2021</p>\n\n<p>echo -e \"backup d une base de données supprimer le dièse du dessous\"<br>\n# mysqldump -umoncompte -pmonpass nomdemabase > /media/username/SEDUSB/BACKUP/2021/sql_monbackup-$D.sql</p>\n\n<p>echo -e \"backup du répertoire concerne\"<br>\n tar cpzf /media/username/SEDUSB/BACKUP/2021/file_monbackup-$D.tar.gz /home/username/Documents/1__PROJET_DEV</p>\n\n<p>echo  -e \"efface le bakup j-7\"<br>\n# rm /media/username/SEDUSB/BACKUP/2021/sql_monbackup-$AGO.sql<br>\n# rm /media/username/SEDUSB/BACKUP/2021/file_monbackup-$AGO.tar.gz</p>\n'),
(159, 9, 'blog_categories', 'title', 2, 'Recyclage des déchets'),
(160, 9, 'blog_categories', 'title', 1, 'Waste recycling'),
(161, 15, 'blog_posts', 'title', 2, 'Recyclage des déchets'),
(162, 15, 'blog_posts', 'description', 2, 'recyclage mobile phone'),
(163, 15, 'blog_posts', 'keywords', 2, 'recyclage, téléphone mobile, Cameroun, byoos'),
(164, 15, 'blog_posts', 'content', 2, '<p>recyclage mobile phone 26/03/2021</p>\n\n<p><a href=\"https://fctvcameroon.org/projects-programmes/urban-slum-programme/waste-mobile-phone-recycling-project/\">https://fctvcameroon.org/projects-programmes/urban-slum-programme/waste-mobile-phone-recycling-project/</a></p>\n\n<p><a href=\"https://biocamer.net/cameroun-la-deuxieme-vie-des-telephones-portables/\">https://biocamer.net/cameroun-la-deuxieme-vie-des-telephones-portables/</a></p>\n\n<p><a href=\"https://www.afrik21.africa/cameroun-un-centre-de-recyclage-des-dechets-electroniques-pour-yaounde-et-douala/\">https://www.afrik21.africa/cameroun-un-centre-de-recyclage-des-dechets-electroniques-pour-yaounde-et-douala/</a></p>\n\n<p>Recyclage autres déchets ( bouteilles plastique )<br>\nhttps://www.facebook.com/gestion.ecologique.des.dechets/</p>\n\n<p>Sources<br>\nhttps://fctvcameroon.org<br>\nhttps://biocamer.net</p>\n'),
(165, 15, 'blog_posts', 'title', 1, 'Waste recycling'),
(166, 15, 'blog_posts', 'description', 1, 'recycling mobile phone'),
(167, 15, 'blog_posts', 'keywords', 1, ''),
(168, 15, 'blog_posts', 'content', 1, '<p>recycling mobile phone 26/03/2021</p>\n\n<p>https://fctvcameroon.org/projects-programmes/urban-slum-programme/waste-mobile-phone-recycling-project/</p>\n\n<p>https://biocamer.net/cameroun-la-deuxieme-vie-des-telephones-portables/</p>\n\n<p>https://www.afrik21.africa/cameroun-un-centre-de-recyclage-des-dechets-electroniques-pour-yaounde-et-douala/</p>\n\n<p>Recycling of other waste (plastic bottles)<br>\nhttps://www.facebook.com/gestion.ecologique.des.dechets/</p>\n\n<p>Sources<br>\nhttps://fctvcameroon.org<br>\nhttps://biocamer.net</p>\n'),
(169, 10, 'blog_categories', 'title', 2, 'Académie'),
(170, 10, 'blog_categories', 'title', 1, 'Academy'),
(171, 16, 'blog_posts', 'title', 2, 'Apprentissage CodeIgniter4'),
(172, 16, 'blog_posts', 'description', 2, ' - Installation CodeIgniter4\n - Prérequis système\n...\n.....'),
(173, 16, 'blog_posts', 'keywords', 2, 'php 8, php, codeIgniter4, codeigniter,  Auth, blog, BLOG, domPDF, DOMDocument'),
(174, 16, 'blog_posts', 'content', 2, '<p><strong><strong>Pré-requis</strong></strong></p>\n\n<p><span>a) Langage de programmation WEB avec PHP 7,2 et supérieur, ici PHP 8,x</span></p>\n\n<p><span>b) Une base de données PostGres, MariaDB, MySQL …</span><br>\n<span>c) à installer sur votre serveur d’application ...</span></p>\n\n<p><span>apt install php8.0 php8.0-opcache libapache2-mod-php8.0 php8.0-mysql php8.0-curl php8.0-gd php8.0-intl php8.0-mbstring php8.0-xml php8.0-zip php8.0-fpm php8.0-readline</span></p>\n\n<p><span>a2enmod proxy_fcgi setenvif</span></p>\n\n<p><span>a2enconf php8.0-fpm</span></p>\n\n<p><span>a2dismod php8.0</span></p>\n\n<p> </p>\n\n<p><span>Puis nous allons redémarrer les services apache2 et php8.0-fpm<br>\nsystemctl reload apache2<br>\nsystemctl restart php8.0-fpm </span></p>\n\n<p><strong>En suivant ce tuto vous apprendrez ?</strong></p>\n\n<ol>\n <li><span>Introduction du modèle M.V.C ( modèle, Vues, Contrôleur )</span></li>\n <li><span>A installer codeIgniter 4</span></li>\n <li><span>A créer un site multilingue</span></li>\n <li><span>A créer un blog simplifié</span></li>\n <li><span>A créer des listes</span></li>\n <li><span>convertir une page HTML en format PDF</span></li>\n <li><span>A créer un authentification sécurisée BCRYPT</span></li>\n</ol>\n\n<p><a href=\"http://byoos.com/blogci4/public/fr\" name=\"blogci4\" target=\"_blank\">http://byoos.com/blogci4/public/fr</a></p>\n'),
(175, 16, 'blog_posts', 'title', 1, 'Learning CodeIgniter4'),
(176, 16, 'blog_posts', 'description', 1, ' - CodeIgniter4 Installation\n - System requirements\n...'),
(177, 16, 'blog_posts', 'keywords', 1, 'php 8, php, codeIgniter4, codeigniter,  Auth, blog, BLOG, domPDF, DOMDocument'),
(178, 16, 'blog_posts', 'content', 1, '<p><strong>Prerequisites</strong><br>\na) Web programming language with PHP 7,2 and higher, here PHP 8,x<br>\nb) A PostGres, MariaDB, MySQL database ...<br>\nc) to install on your application server ...</p>\n\n<p>apt install php8.0 php8.0-opcache libapache2-mod-php8.0 php8.0-mysql php8.0-curl php8.0-gd php8.0-intl php8.0-mbstring php8.0-xml php8.0-zip php8.0-fpm php8.0-readline</p>\n\n<p>    a2enmod proxy_fcgi setenvif<br>\n    a2enconf php8.0-fpm<br>\n    a2dismod php8.0</p>\n\n<p>Then we will restart the apache2 and php8.0-fpm services<br>\n    systemctl reload apache2<br>\n    systemctl restart php8.0-fpm    </p>\n\n<p><strong>By following this tuto you will learn ?</strong><br>\n    1. Introduction of the M.V.C model (Model, Views, Controller)<br>\n    2. To install codeIgniter 4<br>\n    3. To create a multilingual site<br>\n    4. To create a simplified blog<br>\n    5. To create lists<br>\n    6. Convert an HTML page to PDF format<br>\n    7. How to create a secure authentication BCRYPT</p>\n\n<p><a href=\"http://byoos.com/blogci4/public/fr\" target=\"_blank\">http://byoos.com/blogci4/public/fr</a></p>\n'),
(179, 4, 'article', 'title', 2, 'Académie'),
(180, 4, 'article', 'description', 2, 'Suivez nos cours en consultant notre BLOG Académie ...'),
(181, 4, 'article', 'keywords', 2, ''),
(182, 4, 'article', 'content', 2, '<p>Suivez nos cours en consultant notre <strong><a href=\"http://byoosdigital.com/cms/fr/blog-post-16\" target=\"_self\">BLOG</a></strong> Académie</p>\n'),
(183, 4, 'article', 'title', 1, 'Academy'),
(184, 4, 'article', 'description', 1, ' Follow our courses by consulting our BLOG Academy ...'),
(185, 4, 'article', 'keywords', 1, ''),
(186, 4, 'article', 'content', 1, '<p> Follow our courses by consulting our <strong><a href=\"http://byoosdigital.com/cms/en/blog-post-16\" target=\"_self\">BLOG</a></strong> Academy ...</p>\n'),
(187, 1, 'services', 'title', 1, 'Academy'),
(188, 1, 'services', 'home_preview', 1, ''),
(189, 1, 'services', 'title', 2, 'Académie'),
(190, 1, 'services', 'home_preview', 2, ''),
(191, 1, 'services', 'description', 1, ''),
(192, 1, 'services', 'keywords', 1, ''),
(193, 1, 'services', 'content', 1, '<p>Learning the CodeIgniter 4 framework,</p>\n\n<p>&nbsp;&nbsp;&nbsp; development of small modules<br />\n&nbsp;&nbsp;&nbsp; discovery of the C.M.S NodCms version 3.x<br />\n&nbsp;&nbsp;&nbsp; Debian Linux server version 11</p>\n'),
(194, 1, 'services', 'description', 2, ''),
(195, 1, 'services', 'keywords', 2, ''),
(196, 1, 'services', 'content', 2, '<p>Apprentissage au framework CodeIgniter 4,</p>\n\n<ul>\n	<li>&nbsp;&nbsp;&nbsp; d&eacute;veloppements de petits modules</li>\n	<li>&nbsp;&nbsp;&nbsp; d&eacute;couverte du C.M.S&nbsp; NodCms version 3.x</li>\n	<li>&nbsp;&nbsp;&nbsp; serveur Linux Debian version 11</li>\n</ul>\n'),
(197, 11, 'blog_categories', 'title', 2, 'LINUX apprentissage'),
(198, 11, 'blog_categories', 'title', 1, 'LINUX learning '),
(199, 5, 'article', 'title', 2, 'Miration Debian 10 vers Debian 11'),
(200, 5, 'article', 'description', 2, 'Suivre le chemin de la mise à jour, ne pas OUBLIER de réaliser la sauvegarde ULTIME de votre système...'),
(201, 5, 'article', 'keywords', 2, 'debian 10 mise à jour vers debian 11, LINUX, linux'),
(202, 5, 'article', 'content', 2, '<p><strong><span>Mettre à jour Debian 10 vers Debian 11</span></strong></p>\n\n<p>// Vérifier la version actuelle de votre système<br>\nlsb_release -a</p>\n\n<p>//réponse<br>\nNo LSB modules are available.<br>\nDistributor ID: Debian<br>\nDescription:    Debian GNU/Linux 10 (buster)<br>\nRelease:        10<br>\nCodename:       buster</p>\n\n<p>// Vérifier la vaersion du noyeau LINUX<br>\nuname -mrs</p>\n\n<p>// Réponse<br>\nLinux 5.10.0-0.bpo.8-amd64 x86_64</p>\n\n<p>// Contrôler la vers de Debian<br>\ncat /etc/debian_version</p>\n\n<p>// Réponse<br>\n10.10</p>\n\n<p>// Réaliser la dernière mise à jour Debian 10 avant de passer à Debian 11</p>\n\n<p>sudo apt update<br>\nsudo apt upgrade<br>\nsudo apt full-upgrade<br>\nsudo apt autoremove --purge</p>\n\n<p>//Redémarrer le système afin de prendre en compte le dernier noyeau LINUX et les mises à jour<br>\nsudo systemctl reboot</p>\n\n<p>// PUIS mettre à jour les dépôts<br>\nnano /etc/apt/sources.list</p>\n\n<p> </p>\n\n<p># Debian bullseye, dépôt principal + paquets non libres<br>\ndeb http://deb.debian.org/debian/ bullseye main contrib non-free<br>\ndeb-src http://deb.debian.org/debian/ bullseye main contrib non-free</p>\n\n<p># Debian bullseye, mises à jour \"volatiles\" + paquets non libres<br>\ndeb http://deb.debian.org/debian/ bullseye-updates main contrib non-free<br>\ndeb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free</p>\n\n<p># Debian bullseye, mises à jour de sécurité + paquets non libres<br>\ndeb http://security.debian.org/debian-security bullseye-security main contrib non-free<br>\ndeb-src http://security.debian.org/debian-security bullseye-security main contrib non-free</p>\n\n<p>deb http://deb.debian.org/debian bullseye-backports main contrib non-free</p>\n\n<p> </p>\n\n<p> </p>\n'),
(203, 5, 'article', 'title', 1, 'Upgrading Debian 10 to Debian 11'),
(204, 5, 'article', 'description', 1, 'Follow the upgrade path, don\'t FORGET to make the ULTIMATE backup of your system...'),
(205, 5, 'article', 'keywords', 1, 'debian 10  upgrading, LINUX, linux'),
(206, 5, 'article', 'content', 1, '<p><span><strong>Upgrading Debian 10 to Debian 11</strong></span></p>\n\n<p>// Check the current version of your system<br>\nlsb_release -a</p>\n\n<p>//response<br>\nNo LSB modules are available.<br>\nDistributor ID: Debian<br>\nDescription: Debian GNU/Linux 10 (buster)<br>\nRelease: 10<br>\nCodename: buster</p>\n\n<p>// Check the LINUX kernel version<br>\nuname -mrs</p>\n\n<p>// Answer<br>\nLinux 5.10.0-0.bpo.8-amd64 x86_64</p>\n\n<p>// Check the Debian version<br>\ncat /etc/debian_version</p>\n\n<p>// Answer<br>\n10.10</p>\n\n<p>// Perform the last Debian 10 update before upgrading to Debian 11</p>\n\n<p>sudo apt update<br>\nsudo apt upgrade<br>\nsudo apt full-upgrade<br>\nsudo apt autoremove --purge</p>\n\n<p>//Boot the system to take into account the latest LINUX kernel and updates<br>\nsudo systemctl reboot</p>\n\n<p>// THEN update the repositories<br>\nnano /etc/apt/sources.list</p>\n\n<p># Debian bullseye, dépôt principal + paquets non libres<br>\ndeb http://deb.debian.org/debian/ bullseye main contrib non-free<br>\ndeb-src http://deb.debian.org/debian/ bullseye main contrib non-free</p>\n\n<p># Debian bullseye, mises à jour \"volatiles\" + paquets non libres<br>\ndeb http://deb.debian.org/debian/ bullseye-updates main contrib non-free<br>\ndeb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free</p>\n\n<p># Debian bullseye, mises à jour de sécurité + paquets non libres<br>\ndeb http://security.debian.org/debian-security bullseye-security main contrib non-free<br>\ndeb-src http://security.debian.org/debian-security bullseye-security main contrib non-free</p>\n\n<p>deb http://deb.debian.org/debian bullseye-backports main contrib non-free</p>\n\n<p> </p>\n'),
(207, 1, 'menu', 'menu_name', 1, 'Presentation'),
(208, 1, 'menu', 'menu_name', 2, 'Présentation'),
(209, 3, 'menu', 'menu_name', 1, 'Other Site'),
(210, 3, 'menu', 'menu_name', 2, 'Autres Sites'),
(211, 6, 'menu', 'menu_name', 1, 'Blog'),
(212, 6, 'menu', 'menu_name', 2, 'Blog'),
(213, 7, 'menu', 'menu_name', 1, 'Developpments'),
(214, 7, 'menu', 'menu_name', 2, 'Développements'),
(215, 8, 'menu', 'menu_name', 1, 'Academy'),
(216, 8, 'menu', 'menu_name', 2, 'Academie'),
(217, 9, 'menu', 'menu_name', 1, 'Services provided'),
(218, 9, 'menu', 'menu_name', 2, 'Prestations de service'),
(219, 2, 'about_profiles', 'name', 1, 'aboutus'),
(220, 2, 'about_profiles', 'keywords', 1, 'byoos, about us'),
(221, 2, 'about_profiles', 'description', 1, ''),
(222, 2, 'about_profiles', 'content', 1, '<p>lorem surel pipo</p>\n'),
(223, 2, 'about_profiles', 'preview_description', 1, '<p>It&#39;s beautyfull</p>\n'),
(224, 2, 'about_profiles', 'name_title', 1, 'About US'),
(225, 2, 'about_profiles', 'name', 2, 'A propos de ...'),
(226, 2, 'about_profiles', 'keywords', 2, 'byoos, about us, a propose de'),
(227, 2, 'about_profiles', 'description', 2, 'c\'est vraiment beau '),
(228, 2, 'about_profiles', 'content', 2, '<p>lorem surel pipo</p>\n'),
(229, 2, 'about_profiles', 'preview_description', 2, '<p>c&#39;est beau</p>\n'),
(230, 2, 'about_profiles', 'name_title', 2, 'A propos de ...'),
(231, 1, 'pricing_tables', 'title', 1, 'Codage'),
(232, 1, 'pricing_tables', 'btn_label', 1, ''),
(233, 1, 'pricing_tables', 'title', 2, 'Codage'),
(234, 1, 'pricing_tables', 'btn_label', 2, ''),
(235, 10, 'menu', 'menu_name', 1, 'Contact'),
(236, 10, 'menu', 'menu_name', 2, 'Contact');

-- --------------------------------------------------------

--
-- Structure de la table `upload_files`
--

CREATE TABLE `upload_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `session_id` varchar(255) NOT NULL DEFAULT '0',
  `unique_cookie` varchar(255) DEFAULT NULL,
  `file_key` varchar(255) DEFAULT NULL,
  `upload_key` varchar(255) DEFAULT NULL,
  `remove_key` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_thumbnail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deadline` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `file_using` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `host` varchar(255) NOT NULL,
  `download_validation` varchar(255) NOT NULL,
  `download_password` varchar(255) DEFAULT NULL,
  `download_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_download` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `group_id` tinyint(3) DEFAULT NULL,
  `created_date` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `reset_pass_exp` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `active_register` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `active` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `active_code` varchar(255) DEFAULT NULL,
  `active_code_expired` int(10) DEFAULT NULL,
  `user_unique_key` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `google_plus` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `keep_me_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `language_id` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `fullname`, `firstname`, `lastname`, `email`, `group_id`, `created_date`, `reset_pass_exp`, `status`, `active_register`, `active`, `active_code`, `active_code_expired`, `user_unique_key`, `avatar`, `mobile`, `facebook`, `google_plus`, `linkedin`, `website`, `contact_email`, `user_agent`, `keep_me_time`, `language_id`) VALUES
(1, 'admin', '$2y$10$PK0I1kwgD3.w7k9Q3nRQMOAVOKkx/.Fvh7SJA2czxbmJUocXIj2Ve', 'BOBARD Gabriel', 'BOBARD', 'Gabriel', 'gbobard@gmail.com', 1, 1578476536, 0, 1, 0, 1, NULL, NULL, 'e594ee2d35fd01e895c78ee6b42eb987', NULL, '+237696654756', NULL, NULL, NULL, 'http://byoos.com', NULL, NULL, 0, 2),
(2, 'rescue', '$2y$10$LdcDDmyOSFjfsK4yr2gYeOyoWw/OwS9JoDOXyZiY2Qy8AOTR1lwaC', 'RESCUE ', 'RESCUE', '', 'gbobard237@gmail.com', 1, 1579257222, 0, 1, 0, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, NULL, 0, 2),
(3, 'Jamesawart', '$2y$10$n.NO78G2XKbq6kIAUzjD9O.ewIsua0yiv8tEqqyqjDIklDIl/7gNi', 'Jamesawart Jamesawart', 'Jamesawart', 'Jamesawart', 's.z.y.m.anskiashley5@gmail.com', 20, 1581140297, 1581158297, 0, 0, 0, '337f88dab7eb82c1189903bb3ed3d120', NULL, '863f55763462e82c850782d074ee6f82', NULL, '86569834948', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(4, 'Cavechapelle', '$2y$10$6HThoGf33hVh7rGPaeWXLe1pSeyZdQiwJP6cHTOTZbKfXkzhJrn.a', 'Karl Ndefo', 'Karl', 'Ndefo', 'ndef5275@gmail.com', 20, 1611406659, 1611424659, 0, 0, 1, '0befc8caddcf218deba9ca2b921d05f9', NULL, '1c8868bbc481f5ff477622cea112075e', NULL, '698612951', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(5, 'linksoom', '$2y$10$CCRcyYUgx6ojyStWTs7j3u2UtakHICXZbBdYxze5qhMvL3u2uBjFy', 'Soumahoro Mamadou', 'Soumahoro', 'Mamadou', 'linksoom@outlook.com', 20, 1613298242, 1613316242, 0, 0, 1, '52fe629b1b25822b92132ab5af9fc51b', NULL, '8a37c4e2ae3e52ee4a70b2bd6340879b', NULL, '+2250749530416', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(6, 'ThomasUnace', '$2y$10$h1TguiqN5y503EHsx2EQtOdJl0OPqX53.buzhJ4emFz83DCfmAxR2', 'ThomasUnace ThomasUnace', 'ThomasUnace', 'ThomasUnace', 'juhastieber@cheerful.com', 20, 1621269980, 1621287980, 0, 0, 1, '20ce15f113287d6fa893e6982cceb32f', NULL, '026a3a36ab2d00e18b0c8f43da9dbc26', NULL, '82835288731', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(7, 'ShaneVOIDO', '$2y$10$3FAnNzd56FIIpPALk9nKy.w62WzlNICfvafHdBMVWmowHzeLYxPR6', 'ShaneVOIDO ShaneVOIDO', 'ShaneVOIDO', 'ShaneVOIDO', 'inamhypcanar@mail.com', 20, 1628118665, 1628136665, 0, 0, 1, '44aaded5f47e7830accf00d8f47f2b6d', NULL, '569ce995f2474a0b6928e2a8816482d3', NULL, '86511541336', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(8, 'Richardcip', '$2y$10$K19Wmxr2VHtaldc276l0DuSmJVMpJ3ZwY/9bZifkuz.pwHXBPDqzO', 'Richardcip Richardcip', 'Richardcip', 'Richardcip', 'kensawerlernmi@mail.com', 20, 1628375580, 1628393580, 0, 0, 1, 'a1239c47c38a06a4778f6e56faf25d55', NULL, '2a51aa74c1f0f24fe4b7d55e594eaf11', NULL, '86132964621', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(9, 'JesseCat', '$2y$10$i4Nk29C8ZRMjLDs0Dj93u.eKNT9bqdAqRuOUdHIaBpemHffMOwn/e', 'JesseCat JesseCat', 'JesseCat', 'JesseCat', 'liolectpirocard@mail.com', 20, 1628509726, 1628527726, 0, 0, 1, '6518bf66ab2dd95a9ca77033084930b8', NULL, '921f18d9cc1365eedd1bab5732de4ce0', NULL, '89819868792', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(10, 'AnthonyGrIta', '$2y$10$exWbj0bsDibYhIvjOEbx/umMC4ZJzDnZtFdEIoqLzj7bAPNUoE//u', 'AnthonyGrIta AnthonyGrIta', 'AnthonyGrIta', 'AnthonyGrIta', 'theilaropjobspop@mail.com', 20, 1628798431, 1628816431, 0, 0, 1, 'bf3032d74298662213dff443f5dd2389', NULL, '093357e68ab4cc9328d0c4e4ec62368f', NULL, '87584239563', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `about_profiles`
--
ALTER TABLE `about_profiles`
  ADD PRIMARY KEY (`profile_id`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Index pour la table `auto_email_messages`
--
ALTER TABLE `auto_email_messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Index pour la table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Index pour la table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Index pour la table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Index pour la table `blog_posts_categories`
--
ALTER TABLE `blog_posts_categories`
  ADD PRIMARY KEY (`post_cat_id`);

--
-- Index pour la table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Index pour la table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Index pour la table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Index pour la table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Index pour la table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Index pour la table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Index pour la table `packages_dashboard`
--
ALTER TABLE `packages_dashboard`
  ADD PRIMARY KEY (`package_id`);

--
-- Index pour la table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`portfolio_id`);

--
-- Index pour la table `pricing_tables`
--
ALTER TABLE `pricing_tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Index pour la table `pricing_tables_records`
--
ALTER TABLE `pricing_tables_records`
  ADD PRIMARY KEY (`record_id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `language_idfield_name` (`language_id`,`field_name`);

--
-- Index pour la table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_id`);

--
-- Index pour la table `translates`
--
ALTER TABLE `translates`
  ADD PRIMARY KEY (`translate_id`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`translation_id`);

--
-- Index pour la table `upload_files`
--
ALTER TABLE `upload_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `about_profiles`
--
ALTER TABLE `about_profiles`
  MODIFY `profile_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `auto_email_messages`
--
ALTER TABLE `auto_email_messages`
  MODIFY `msg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `comment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `post_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `blog_posts_categories`
--
ALTER TABLE `blog_posts_categories`
  MODIFY `post_cat_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `image_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `packages_dashboard`
--
ALTER TABLE `packages_dashboard`
  MODIFY `package_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `portfolio_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pricing_tables`
--
ALTER TABLE `pricing_tables`
  MODIFY `table_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pricing_tables_records`
--
ALTER TABLE `pricing_tables_records`
  MODIFY `record_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `translates`
--
ALTER TABLE `translates`
  MODIFY `translate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT pour la table `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
