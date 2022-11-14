-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 14 nov. 2022 à 14:01
-- Version du serveur : 10.5.15-MariaDB-0+deb11u1
-- Version de PHP : 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `exo`
--

-- --------------------------------------------------------

--
-- Structure de la table `CI`
--

CREATE TABLE `CI` (
  `id` int(11) NOT NULL,
  `Num_eleve` varchar(25) NOT NULL,
  `Nom_eleve` varchar(100) NOT NULL,
  `Code_Epreuve` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`id`, `nom`) VALUES
(1, 'SIO'),
(2, 'Tourisme');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `coefficient` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id`, `note`, `coefficient`, `id_eleve`) VALUES
(1, 12, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `NRC`
--

CREATE TABLE `NRC` (
  `id` int(11) NOT NULL,
  `Num_eleve` varchar(25) NOT NULL,
  `Nom_eleve` varchar(100) NOT NULL,
  `Code_Epreuve` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sio`
--

CREATE TABLE `sio` (
  `id` int(11) NOT NULL,
  `Num_eleve` varchar(25) NOT NULL,
  `Nom_eleve` varchar(100) NOT NULL,
  `Code_Epreuve` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `testt`
--

CREATE TABLE `testt` (
  `id` int(11) NOT NULL,
  `nom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `login` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `perm` int(11) NOT NULL DEFAULT 0,
  `classeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `date`, `nom`, `prenom`, `login`, `pass`, `perm`, `classeid`) VALUES
(1, '2022-10-20 17:51:51', 'r', 'r', 'rasnetjouary', '4b43b0aee35624cd95b910189b3dc231', 0, 1),
(2, '2022-10-20 18:07:11', 'rrr', 'rrr', 'rrr', '44f437ced647ec3f40fa0841041871cd', 0, 2),
(3, '2022-10-20 17:51:56', 'rt', 'rt', 'rt', '822050d9ae3c47f54bee71b85fce1487', 0, 1),
(4, '2022-10-20 17:54:46', 'tr', 'tr', 'tr', 'e7d707a26e7f7b6ff52c489c60e429b1', 1, 2),
(5, '2022-10-20 17:51:59', 'rr', 'rr', 'rr', '514f1b439f404f86f77090fa9edc96ce', 0, 2),
(6, '2022-10-20 17:52:02', 'Antoine', 'Jouary', 'Antoinej', 'ab4f63f9ac65152575886860dde480a1', 0, 1),
(7, '2022-10-20 20:05:57', 'test', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', 0, 0),
(8, '2022-11-07 12:56:57', 'er', 'er', 'er', '818f9c45cfa30eeff277ef38bcbe9910', 0, 0),
(9, '2022-11-07 16:06:09', 'arthur', 'arthur', 'arthur', '68830aef4dbfad181162f9251a1da51b', 0, 0),
(10, '2022-11-07 16:06:53', 'Robert', 'Titit', 'titi', '5d933eef19aee7da192608de61b6c23d', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `perm` varchar(25) NOT NULL DEFAULT 'utilisateur',
  `Num_eleve` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `mail`, `password`, `perm`, `Num_eleve`) VALUES
(1, 'mail@test.fr', 'test', 'utilisateur', '1'),
(2, 'jj@jj.fr', 'jj@jj.fr', 'utilisateur', '4');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `CI`
--
ALTER TABLE `CI`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `NRC`
--
ALTER TABLE `NRC`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sio`
--
ALTER TABLE `sio`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `testt`
--
ALTER TABLE `testt`
  ADD PRIMARY KEY (`nom`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `CI`
--
ALTER TABLE `CI`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `NRC`
--
ALTER TABLE `NRC`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sio`
--
ALTER TABLE `sio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
