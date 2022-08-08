-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 01 août 2022 à 11:09
-- Version du serveur : 10.5.15-MariaDB-0+deb11u1-log
-- Version de PHP : 8.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `v2022_nodcms_v3-2-2c-main_github`
--

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
(2, 'french', 'French', 'fr', 1, 0, 2, 1578844033, 1, 'upload_file/lang/fr.png');

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
(1, 0, 'firstname', 'Gabriel'),
(2, 0, 'lastname', 'BOBARD'),
(3, 0, 'company', 'Byoosdigital'),
(4, 0, 'email', 'gbobard@gmail.com'),
(5, 0, 'timezone', 'Africa/Douala'),
(6, 0, 'date_format', 'd.m.Y'),
(7, 0, 'time_format', 'H:i'),
(8, 0, 'sent_email', 'gbobard@gmail.com');

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
  `reset_password_tries` int(10) UNSIGNED DEFAULT 0,
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
  `language_id` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `auth` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `fullname`, `firstname`, `lastname`, `email`, `group_id`, `created_date`, `reset_pass_exp`, `status`, `active_register`, `active`, `active_code`, `active_code_expired`, `reset_password_tries`, `user_unique_key`, `avatar`, `mobile`, `facebook`, `google_plus`, `linkedin`, `website`, `contact_email`, `user_agent`, `keep_me_time`, `language_id`, `auth`) VALUES
(1, 'admin', '$2y$10$iazi1a1T6SKyOm741/o/q.WaSJjOe/fTUFOaBTPJPVry5Yu/JaQwy', 'Gabriel BOBARD', 'Gabriel', 'BOBARD', 'gbobard@gmail.com', 1, 1659342980, 0, 1, 0, 1, NULL, NULL, 0, '8fe49e29a6c0a0d79354d69759426060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 'HASH');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auto_email_messages`
--
ALTER TABLE `auto_email_messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Index pour la table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

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
-- AUTO_INCREMENT pour la table `auto_email_messages`
--
ALTER TABLE `auto_email_messages`
  MODIFY `msg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `packages_dashboard`
--
ALTER TABLE `packages_dashboard`
  MODIFY `package_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `translates`
--
ALTER TABLE `translates`
  MODIFY `translate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
