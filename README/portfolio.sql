-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 20 sep. 2020 à 14:04
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `portfolio`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(1, 'symfony', 'symfony'),
(2, 'c#', 'csharp'),
(3, 'Web-Design', 'webdesign');

-- --------------------------------------------------------

--
-- Structure de la table `cv`
--

DROP TABLE IF EXISTS `cv`;
CREATE TABLE IF NOT EXISTS `cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cv`
--

INSERT INTO `cv` (`id`, `texte`) VALUES
(2, 'Bonjour, je m\'appelle Mathias!\r\nJe suis actuellement en formation BTS SIO au lycée Paul Claudel de Laon.');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200521141148', '2020-08-18 18:43:46'),
('20200521143330', '2020-08-18 18:43:46'),
('20200521155353', '2020-08-18 18:43:46'),
('20200528122505', '2020-08-18 18:43:47'),
('20200528123817', '2020-08-18 18:43:47'),
('20200528130313', '2020-08-18 18:43:47'),
('20200528131331', '2020-08-18 18:43:47'),
('20200528131825', '2020-08-18 18:43:47');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  `stage` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `thumbnail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8D12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `category_id`, `name`, `slug`, `content`, `debut`, `fin`, `stage`, `created_at`, `updated_at`, `thumbnail`) VALUES
(2, 3, 'ChatApp', 'chatapp', 'Suite a une formation en ligne sur le design-web et webflow j\'ai réalisé le design d\'un site vitrine d\'une application de A a Z ( en passant par le maquettage du site sur figma, puis de la creation réel du site sur webflow )', '2020-06-07', '2020-06-13', 0, '2020-09-19 14:25:35', '2020-09-19 14:26:54', 'Chatapp-screen (2).png'),
(3, 3, 'L\'AFCE', 'afce', 'Réalisation du site de l\'AFCE. Un site qui vous met en relation avec ses adhérents, vendeurs de chevaux, pour faciliter votre achat et vous permettre de trouver le cheval qui vous convient.', '2019-01-06', '2019-02-06', 1, '2020-09-19 20:39:39', '2020-09-19 20:39:39', 'afce.png'),
(4, 3, 'IFSI - Centre Hospitalier de Laon', 'ifsi', 'Suite a mon stage de 2ème année de BTS j\'ai eu la chance de travailler sur l\'interface étudiante de l\'IFSI de Laon.', '2020-01-01', '2020-02-07', 1, '2020-09-20 10:01:12', '2020-09-20 10:01:12', 'ifsi (2).png');

-- --------------------------------------------------------

--
-- Structure de la table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE IF NOT EXISTS `post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_5ACE3AF04B89032C` (`post_id`),
  KEY `IDX_5ACE3AF0BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(3, 1),
(3, 2),
(4, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `situation`
--

DROP TABLE IF EXISTS `situation`;
CREATE TABLE IF NOT EXISTS `situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `situation`
--

INSERT INTO `situation` (`id`, `nom`, `texte`, `debut`, `fin`) VALUES
(1, 'Station F - Factomos, La facturation en ligne', 'Stage en développement de logiciels', '2018-05-05', '2018-06-07'),
(2, 'Startup Weekend E-santé', 'Co-développeur d\'un projet de géolocalisation de toilettes pour personnes à mobilité réduite', '2017-03-24', '2017-03-26'),
(3, 'Station F - Factomos, La facturation en ligne', 'Stage en développement de logiciels', '2019-01-01', '2019-02-01');

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tag`
--

INSERT INTO `tag` (`id`, `name`, `slug`) VALUES
(1, 'HTML', 'html'),
(2, 'CSS', 'css');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(4, 'admin@admin.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZmxSYVltZXBkSWJLQ2swcQ$z9YSCcETf90TKf8Aut9tmwNviuSWpjAzjRoxcAs3UgM');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `FK_5ACE3AF04B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5ACE3AF0BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
