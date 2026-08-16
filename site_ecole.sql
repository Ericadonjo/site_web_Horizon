-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 16 août 2026 à 18:58
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `site_ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `Article`
--

CREATE TABLE `Article` (
  `idArticle` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  `imageCouverture` varchar(255) DEFAULT NULL,
  `datePublication` datetime DEFAULT current_timestamp(),
  `estPublie` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Article`
--

INSERT INTO `Article` (`idArticle`, `titre`, `slug`, `contenu`, `imageCouverture`, `datePublication`, `estPublie`) VALUES
(1, 'Rentrée Scolaire 2026-2027', 'rentree-scolaire-2026-2027', 'Les inscriptions sont ouvertes pour l année académique. Découvrez nos infrastructures modernisées.', 'blog/rentree2026.jpg', '2026-08-15 22:38:53', 1),
(2, 'Inauguration de la Salle d Informatique', 'inauguration-salle-informatique', 'Un nouvel espace équipé de ordinateurs récents pour l initiation dès le primaire.', 'blog/informatique.jpg', '2026-08-15 22:38:53', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Avis`
--

CREATE TABLE `Avis` (
  `idAvis` int(11) NOT NULL,
  `nomAuteur` varchar(100) NOT NULL,
  `emailAuteur` varchar(150) NOT NULL,
  `texte` text NOT NULL,
  `note` int(11) DEFAULT NULL CHECK (`note` between 1 and 5),
  `statut` varchar(20) DEFAULT 'EN_ATTENTE',
  `datePublication` datetime DEFAULT current_timestamp(),
  `idParent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Avis`
--

INSERT INTO `Avis` (`idAvis`, `nomAuteur`, `emailAuteur`, `texte`, `note`, `statut`, `datePublication`, `idParent`) VALUES
(1, 'Jean-Paul KOUAM', 'jp.kouam@gmail.com', 'Excellente école, mes enfants ont progressé de manière spectaculaire cette année !', 5, 'VALIDE', '2026-08-15 22:38:53', 1),
(2, 'Christine MBALLA', 'c.mballa@yahoo.fr', 'Encadrement rigoureux et environnement très propre.', 5, 'VALIDE', '2026-08-15 22:38:53', 2),
(3, 'Alain NGEN', 'alain.ngen@outlook.com', 'Je souhaiterais savoir si le transport scolaire couvre la zone de Bastos.', 4, 'EN_ATTENTE', '2026-08-15 22:38:53', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Classe`
--

CREATE TABLE `Classe` (
  `idClasse` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `niveau` varchar(50) NOT NULL,
  `descriptionCourte` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Classe`
--

INSERT INTO `Classe` (`idClasse`, `nom`, `niveau`, `descriptionCourte`) VALUES
(1, 'Petite Section (PS)', 'Maternelle', 'Espace d éveil et d sociabilisation pour les tout-petits.'),
(2, 'Grande Section (GS)', 'Maternelle', 'Préparation active à la lecture et à l écriture.'),
(3, 'SIL', 'Primaire', 'Cours d initiation à la lecture et calcul de base.'),
(4, 'CE2', 'Primaire', 'Consolidation des compétences fondamentales en français et mathématiques.'),
(5, 'CM2', 'Primaire', 'Classe d examen préparatoire au CEP et au Concours d entrée en 6ème.'),
(6, 'Nursery 1', 'Nursery', 'Early childhood development and interactive learning.'),
(7, 'Nursery 2', 'Nursery', 'Pre-primary educational foundation and literacy development.'),
(8, 'Class 1', 'Primary', 'Basic reading, writing, and arithmetic skills.'),
(9, 'Class 3', 'Primary', 'Intermediate primary school curriculum.'),
(10, 'Class 6', 'Primary', 'Final preparation for the First School Leaving Certificate (FSLC).'),
(11, 'Petite Section (PS)', 'Maternelle', 'Espace d éveil et d sociabilisation pour les tout-petits.'),
(12, 'Grande Section (GS)', 'Maternelle', 'Préparation active à la lecture et à l écriture.'),
(13, 'SIL', 'Primaire', 'Cours d initiation à la lecture et calcul de base.'),
(14, 'CE2', 'Primaire', 'Consolidation des compétences fondamentales en français et mathématiques.'),
(15, 'CM2', 'Primaire', 'Classe d examen préparatoire au CEP et au Concours d entrée en 6ème.'),
(16, 'Nursery 1', 'Nursery', 'Early childhood development and interactive learning.'),
(17, 'Nursery 2', 'Nursery', 'Pre-primary educational foundation and literacy development.'),
(18, 'Class 1', 'Primary', 'Basic reading, writing, and arithmetic skills.'),
(19, 'Class 3', 'Primary', 'Intermediate primary school curriculum.'),
(20, 'Class 6', 'Primary', 'Final preparation for the First School Leaving Certificate (FSLC).'),
(21, 'Petite Section (PS)', 'Maternelle', 'Espace d éveil et d sociabilisation pour les tout-petits.'),
(22, 'Grande Section (GS)', 'Maternelle', 'Préparation active à la lecture et à l écriture.'),
(23, 'SIL', 'Primaire', 'Cours d initiation à la lecture et calcul de base.'),
(24, 'CE2', 'Primaire', 'Consolidation des compétences fondamentales en français et mathématiques.'),
(25, 'CM2', 'Primaire', 'Classe d examen préparatoire au CEP et au Concours d entrée en 6ème.'),
(26, 'Nursery 1', 'Nursery', 'Early childhood development and interactive learning.'),
(27, 'Nursery 2', 'Nursery', 'Pre-primary educational foundation and literacy development.'),
(28, 'Class 1', 'Primary', 'Basic reading, writing, and arithmetic skills.'),
(29, 'Class 3', 'Primary', 'Intermediate primary school curriculum.'),
(30, 'Class 6', 'Primary', 'Final preparation for the First School Leaving Certificate (FSLC).'),
(31, 'Petite Section (PS)', 'Maternelle', 'Espace d éveil et d sociabilisation pour les tout-petits.'),
(32, 'Grande Section (GS)', 'Maternelle', 'Préparation active à la lecture et à l écriture.'),
(33, 'SIL', 'Primaire', 'Cours d initiation à la lecture et calcul de base.'),
(34, 'CE2', 'Primaire', 'Consolidation des compétences fondamentales en français et mathématiques.'),
(35, 'CM2', 'Primaire', 'Classe d examen préparatoire au CEP et au Concours d entrée en 6ème.'),
(36, 'Nursery 1', 'Nursery', 'Early childhood development and interactive learning.'),
(37, 'Nursery 2', 'Nursery', 'Pre-primary educational foundation and literacy development.'),
(38, 'Class 1', 'Primary', 'Basic reading, writing, and arithmetic skills.'),
(39, 'Class 3', 'Primary', 'Intermediate primary school curriculum.'),
(40, 'Class 6', 'Primary', 'Final preparation for the First School Leaving Certificate (FSLC).');

-- --------------------------------------------------------

--
-- Structure de la table `Eleve`
--

CREATE TABLE `Eleve` (
  `matEleve` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sexe` varchar(10) DEFAULT NULL,
  `idClasse` int(11) DEFAULT NULL,
  `idParent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Eleve`
--

INSERT INTO `Eleve` (`matEleve`, `nom`, `prenom`, `age`, `sexe`, `idClasse`, `idParent`) VALUES
(2026001, 'KOUAM', 'Arthur', 3, 'M', 1, 1),
(2026002, 'MBALLA', 'Sarah', 3, 'F', 1, 2),
(2026003, 'NKE', 'Lia', 3, 'F', 1, 3),
(2026004, 'TANYI', 'Lucas', 3, 'M', 1, 4),
(2026005, 'FOTSO', 'Nathan', 3, 'M', 1, 5),
(2026006, 'BESSONG', 'Emma', 3, 'F', 1, 6),
(2026007, 'NKOLO', 'David', 3, 'M', 1, 7),
(2026008, 'AGBOR', 'Chloe', 3, 'F', 1, 8),
(2026009, 'BILOA', 'Enzo', 3, 'M', 1, 9),
(2026010, 'EWOANE', 'Ines', 3, 'F', 1, 10),
(2026011, 'MENGUE', 'Yvan', 3, 'M', 1, 2),
(2026012, 'BINA', 'Syntyche', 3, 'F', 1, 3),
(2026013, 'DONFACK', 'Loris', 3, 'M', 1, 5),
(2026014, 'ZAMBO', 'Elsa', 3, 'F', 1, 7),
(2026015, 'EYENGA', 'Loic', 3, 'M', 1, 9),
(2026016, 'KENFACK', 'Julia', 3, 'F', 1, 1),
(2026017, 'DJOMOU', 'Gabriel', 3, 'M', 1, 4),
(2026018, 'ASSOUOU', 'Alice', 3, 'F', 1, 6),
(2026019, 'SOP', 'Rayan', 3, 'M', 1, 8),
(2026020, 'METOU', 'Léa', 3, 'F', 1, 10),
(2026021, 'KOUAM', 'Bastien', 5, 'M', 2, 1),
(2026022, 'MBALLA', 'Noemie', 5, 'F', 2, 2),
(2026023, 'NKE', 'Samuel', 5, 'M', 2, 3),
(2026024, 'TANYI', 'Grace', 5, 'F', 2, 4),
(2026025, 'FOTSO', 'Axel', 5, 'M', 2, 5),
(2026026, 'BESSONG', 'Maya', 5, 'F', 2, 6),
(2026027, 'NKOLO', 'Ethan', 5, 'M', 2, 7),
(2026028, 'AGBOR', 'Zoe', 5, 'F', 2, 8),
(2026029, 'BILOA', 'Nael', 5, 'M', 2, 9),
(2026030, 'EWOANE', 'Jade', 5, 'F', 2, 10),
(2026031, 'SOH', 'Thierry', 5, 'M', 2, 1),
(2026032, 'ABESSOLO', 'Manon', 5, 'F', 2, 3),
(2026033, 'TSAGO', 'Dylan', 5, 'M', 2, 5),
(2026034, 'OWONA', 'Sonia', 5, 'F', 2, 7),
(2026035, 'NJOYA', 'Kevine', 5, 'M', 2, 9),
(2026036, 'MEKONTCHOU', 'Anais', 5, 'F', 2, 2),
(2026037, 'BAPPA', 'Yann', 5, 'M', 2, 4),
(2026038, 'MOUKOKO', 'Diane', 5, 'F', 2, 6),
(2026039, 'TCHATO', 'Joel', 5, 'M', 2, 8),
(2026040, 'ATEBA', 'Victoire', 5, 'F', 2, 10),
(2026041, 'KOUAM', 'Daniel', 6, 'M', 3, 1),
(2026042, 'MBALLA', 'Clara', 6, 'F', 3, 2),
(2026043, 'NKE', 'Jules', 6, 'M', 3, 3),
(2026044, 'TANYI', 'Eva', 6, 'F', 3, 4),
(2026045, 'FOTSO', 'Hugo', 6, 'M', 3, 5),
(2026046, 'BESSONG', 'Lina', 6, 'F', 3, 6),
(2026047, 'NKOLO', 'Leo', 6, 'M', 3, 7),
(2026048, 'AGBOR', 'Rose', 6, 'F', 3, 8),
(2026049, 'BILOA', 'Tom', 6, 'M', 3, 9),
(2026050, 'EWOANE', 'Nina', 6, 'F', 3, 10),
(2026051, 'BIYA', 'Cédric', 6, 'M', 3, 2),
(2026052, 'MAPTO', 'Arianne', 6, 'F', 3, 4),
(2026053, 'NONO', 'Franck', 6, 'M', 3, 6),
(2026054, 'ENGAMA', 'Carole', 6, 'F', 3, 8),
(2026055, 'MVONDO', 'Aurel', 6, 'M', 3, 10),
(2026056, 'TAGNE', 'Audrey', 6, 'F', 3, 1),
(2026057, 'KAPCHE', 'Boris', 6, 'M', 3, 3),
(2026058, 'MBOA', 'Priscille', 6, 'F', 3, 5),
(2026059, 'NGOUANOM', 'Ulrich', 6, 'M', 3, 7),
(2026060, 'ANDELA', 'Dora', 6, 'F', 3, 9),
(2026061, 'KOUAM', 'Emmanuel', 8, 'M', 4, 1),
(2026062, 'MBALLA', 'Fiona', 8, 'F', 4, 2),
(2026063, 'NKE', 'Gilles', 8, 'M', 4, 3),
(2026064, 'TANYI', 'Helene', 8, 'F', 4, 4),
(2026065, 'FOTSO', 'Isaac', 8, 'M', 4, 5),
(2026066, 'BESSONG', 'Joyce', 8, 'F', 4, 6),
(2026067, 'NKOLO', 'Kevin', 8, 'M', 4, 7),
(2026068, 'AGBOR', 'Laura', 8, 'F', 4, 8),
(2026069, 'BILOA', 'Marc', 8, 'M', 4, 9),
(2026070, 'EWOANE', 'Nora', 8, 'F', 4, 10),
(2026071, 'FOFANA', 'Ibrahim', 8, 'M', 4, 1),
(2026072, 'SALA', 'Béatrice', 8, 'F', 4, 3),
(2026073, 'ONANA', 'Stephane', 8, 'M', 4, 5),
(2026074, 'MAMIA', 'Esther', 8, 'F', 4, 7),
(2026075, 'POUA', 'Wilfried', 8, 'M', 4, 9),
(2026076, 'KOAGNE', 'Vanessa', 8, 'F', 4, 2),
(2026077, 'WAFO', 'Arnaud', 8, 'M', 4, 4),
(2026078, 'BILONG', 'Giselle', 8, 'F', 4, 6),
(2026079, 'EKODO', 'Patrick', 8, 'M', 4, 8),
(2026080, 'EDOU', 'Solange', 8, 'F', 4, 10),
(2026081, 'KOUAM', 'Oliver', 10, 'M', 5, 1),
(2026082, 'MBALLA', 'Pauline', 10, 'F', 5, 2),
(2026083, 'NKE', 'Quentin', 10, 'M', 5, 3),
(2026084, 'TANYI', 'Rachel', 10, 'F', 5, 4),
(2026085, 'FOTSO', 'Simon', 10, 'M', 5, 5),
(2026086, 'BESSONG', 'Tatiana', 10, 'F', 5, 6),
(2026087, 'NKOLO', 'Urbain', 10, 'M', 5, 7),
(2026088, 'AGBOR', 'Valerie', 10, 'F', 5, 8),
(2026089, 'BILOA', 'William', 10, 'M', 5, 9),
(2026090, 'EWOANE', 'Xaverie', 10, 'F', 5, 10),
(2026091, 'TAMBA', 'Xavier', 10, 'M', 5, 2),
(2026092, 'NYANGON', 'Yolande', 10, 'F', 5, 4),
(2026093, 'EKANI', 'Zacharie', 10, 'M', 5, 6),
(2026094, 'MOUANGUE', 'Bernadette', 10, 'F', 5, 8),
(2026095, 'FEUGANG', 'Christian', 10, 'M', 5, 10),
(2026096, 'KANA', 'Daniele', 10, 'F', 5, 1),
(2026097, 'LEKOU', 'Fabrice', 10, 'M', 5, 3),
(2026098, 'BATOURI', 'Honorine', 10, 'F', 5, 5),
(2026099, 'NGATE', 'Justin', 10, 'M', 5, 7),
(2026100, 'ZOCK', 'Katia', 10, 'F', 5, 9),
(2026101, 'TANYI', 'Aiden', 3, 'M', 6, 4),
(2026102, 'BESSONG', 'Bella', 3, 'F', 6, 6),
(2026103, 'AGBOR', 'Caleb', 3, 'M', 6, 8),
(2026104, 'KOUAM', 'Daisy', 3, 'F', 6, 1),
(2026105, 'MBALLA', 'Ethan', 3, 'M', 6, 2),
(2026106, 'NKE', 'Fiona', 3, 'F', 6, 3),
(2026107, 'FOTSO', 'Gavin', 3, 'M', 6, 5),
(2026108, 'NKOLO', 'Hannah', 3, 'F', 6, 7),
(2026109, 'BILOA', 'Ian', 3, 'M', 6, 9),
(2026110, 'EWOANE', 'Jasmine', 3, 'F', 6, 10),
(2026111, 'EBOT', 'Kevin', 3, 'M', 6, 8),
(2026112, 'ETTA', 'Lily', 3, 'F', 6, 4),
(2026113, 'TABE', 'Mason', 3, 'M', 6, 6),
(2026114, 'NJIE', 'Nora', 3, 'F', 6, 10),
(2026115, 'EBAI', 'Oliver', 3, 'M', 6, 2),
(2026116, 'MBI', 'Penelope', 3, 'F', 6, 3),
(2026117, 'NKEY', 'Quinn', 3, 'M', 6, 5),
(2026118, 'OTU', 'Ruby', 3, 'F', 6, 7),
(2026119, 'SANG', 'Samuel', 3, 'M', 6, 9),
(2026120, 'BAKWERI', 'Tina', 3, 'F', 6, 1),
(2026121, 'TANYI', 'Alex', 5, 'M', 7, 4),
(2026122, 'BESSONG', 'Brianna', 5, 'F', 7, 6),
(2026123, 'AGBOR', 'Chris', 5, 'M', 7, 8),
(2026124, 'KOUAM', 'Diana', 5, 'F', 7, 1),
(2026125, 'MBALLA', 'Eric', 5, 'M', 7, 2),
(2026126, 'NKE', 'Faith', 5, 'F', 7, 3),
(2026127, 'FOTSO', 'George', 5, 'M', 7, 5),
(2026128, 'NKOLO', 'Hazel', 5, 'F', 7, 7),
(2026129, 'BILOA', 'Ivan', 5, 'M', 7, 9),
(2026130, 'EWOANE', 'Joy', 5, 'F', 7, 10),
(2026131, 'MANYI', 'Kenneth', 5, 'M', 7, 8),
(2026132, 'EPIE', 'Laura', 5, 'F', 7, 6),
(2026133, 'FON', 'Michael', 5, 'M', 7, 4),
(2026134, 'ACHU', 'Nancy', 5, 'F', 7, 2),
(2026135, 'AYUK', 'Oscar', 5, 'M', 7, 10),
(2026136, 'EGBE', 'Pamela', 5, 'F', 7, 1),
(2026137, 'SOPPO', 'Ryan', 5, 'M', 7, 3),
(2026138, 'TITA', 'Stella', 5, 'F', 7, 5),
(2026139, 'WOFACK', 'Trevor', 5, 'M', 7, 7),
(2026140, 'YUH', 'Ursula', 5, 'F', 7, 9),
(2026141, 'TANYI', 'Brian', 6, 'M', 8, 4),
(2026142, 'BESSONG', 'Catherine', 6, 'F', 8, 6),
(2026143, 'AGBOR', 'Dylan', 6, 'M', 8, 8),
(2026144, 'KOUAM', 'Emily', 6, 'F', 8, 1),
(2026145, 'MBALLA', 'Felix', 6, 'M', 8, 2),
(2026146, 'NKE', 'Gemma', 6, 'F', 8, 3),
(2026147, 'FOTSO', 'Harry', 6, 'M', 8, 5),
(2026148, 'NKOLO', 'Isla', 6, 'F', 8, 7),
(2026149, 'BILOA', 'Jack', 6, 'M', 8, 9),
(2026150, 'EWOANE', 'Kate', 6, 'F', 8, 10),
(2026151, 'BANG', 'Liam', 6, 'M', 8, 8),
(2026152, 'FONGOH', 'Mia', 6, 'F', 8, 6),
(2026153, 'TUM', 'Noah', 6, 'M', 8, 4),
(2026154, 'JUA', 'Olivia', 6, 'F', 8, 2),
(2026155, 'MBANG', 'Peter', 6, 'M', 8, 10),
(2026156, 'NGUM', 'Queen', 6, 'F', 8, 1),
(2026157, 'SHIYNSE', 'Richard', 6, 'M', 8, 3),
(2026158, 'WANG', 'Sophia', 6, 'F', 8, 5),
(2026159, 'YEN', 'Thomas', 6, 'M', 8, 7),
(2026160, 'BATE', 'Victoria', 6, 'F', 8, 9),
(2026161, 'TANYI', 'Charles', 8, 'M', 9, 4),
(2026162, 'BESSONG', 'Debra', 8, 'F', 9, 6),
(2026163, 'AGBOR', 'Edward', 8, 'M', 9, 8),
(2026164, 'KOUAM', 'Florence', 8, 'F', 9, 1),
(2026165, 'MBALLA', 'George', 8, 'M', 9, 2),
(2026166, 'NKE', 'Helen', 8, 'F', 9, 3),
(2026167, 'FOTSO', 'Ian', 8, 'M', 9, 5),
(2026168, 'NKOLO', 'Jessica', 8, 'F', 9, 7),
(2026169, 'BILOA', 'Karl', 8, 'M', 9, 9),
(2026170, 'EWOANE', 'Linda', 8, 'F', 9, 10),
(2026171, 'CHI', 'Matthew', 8, 'M', 9, 8),
(2026172, 'KWENI', 'Naomi', 8, 'F', 9, 6),
(2026173, 'NDI', 'Patrick', 8, 'M', 9, 4),
(2026174, 'NFORBA', 'Ruth', 8, 'F', 9, 2),
(2026175, 'TAKOR', 'Steven', 8, 'M', 9, 10),
(2026176, 'WAIN', 'Teresa', 8, 'F', 9, 1),
(2026177, 'SAMBA', 'Victor', 8, 'M', 9, 3),
(2026178, 'NEBA', 'Wendy', 8, 'F', 9, 5),
(2026179, 'FRU', 'Xavier', 8, 'M', 9, 7),
(2026180, 'SUH', 'Yvonne', 8, 'F', 9, 9),
(2026181, 'TANYI', 'David', 11, 'M', 10, 4),
(2026182, 'BESSONG', 'Evelyn', 11, 'F', 10, 6),
(2026183, 'AGBOR', 'Frank', 11, 'M', 10, 8),
(2026184, 'KOUAM', 'Grace', 11, 'F', 10, 1),
(2026185, 'MBALLA', 'Henry', 11, 'M', 10, 2),
(2026186, 'NKE', 'Irene', 11, 'F', 10, 3),
(2026187, 'FOTSO', 'James', 11, 'M', 10, 5),
(2026188, 'NKOLO', 'Karen', 11, 'F', 10, 7),
(2026189, 'BILOA', 'Louis', 11, 'M', 10, 9),
(2026190, 'EWOANE', 'Maria', 11, 'F', 10, 10),
(2026191, 'TAMBE', 'Nelson', 11, 'M', 10, 8),
(2026192, 'NTEM', 'Patricia', 11, 'F', 10, 6),
(2026193, 'AKO', 'Robert', 11, 'M', 10, 4),
(2026194, 'ETENGENENG', 'Sandra', 11, 'F', 10, 2),
(2026195, 'NKWENTI', 'Timothy', 11, 'M', 10, 10),
(2026196, 'ASOH', 'Vanessa', 11, 'F', 10, 1),
(2026197, 'MOMOH', 'Walter', 11, 'M', 10, 3),
(2026198, 'BAWA', 'Zoe', 11, 'F', 10, 5),
(2026199, 'NJOH', 'Bernard', 11, 'M', 10, 7),
(2026200, 'NTUI', 'Catherine', 11, 'F', 10, 9);

-- --------------------------------------------------------

--
-- Structure de la table `Enseignant`
--

CREATE TABLE `Enseignant` (
  `matEnseignant` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Enseignant`
--

INSERT INTO `Enseignant` (`matEnseignant`, `nom`, `prenom`, `email`, `photo`) VALUES
(1001, 'MBIDA', 'Chantal', 'chantal.mbida@ecole-excellence.cm', 'teachers/mbida.jpg'),
(1002, 'TCHAMDA', 'Pierre', 'pierre.tchamda@ecole-excellence.cm', 'teachers/tchamda.jpg'),
(1003, 'EBOA', 'Marie', 'marie.eboa@ecole-excellence.cm', 'teachers/eboa.jpg'),
(1004, 'NDONGO', 'Joseph', 'joseph.ndongo@ecole-excellence.cm', 'teachers/ndongo.jpg'),
(1005, 'KAMGA', 'Alain', 'alain.kamga@ecole-excellence.cm', 'teachers/kamga.jpg'),
(1006, 'FORBAH', 'Grace', 'grace.forbah@ecole-excellence.cm', 'teachers/forbah.jpg'),
(1007, 'TANGWAN', 'John', 'john.tangwan@ecole-excellence.cm', 'teachers/tangwan.jpg'),
(1008, 'EKO', 'Sarah', 'sarah.eko@ecole-excellence.cm', 'teachers/eko.jpg'),
(1009, 'NFOR', 'Samuel', 'samuel.nfor@ecole-excellence.cm', 'teachers/nfor.jpg'),
(1010, 'ASHU', 'Beshong', 'beshong.ashu@ecole-excellence.cm', 'teachers/ashu.jpg'),
(1011, 'BASSONG', 'Henriette', 'henriette.bassong@ecole-excellence.cm', NULL),
(1012, 'MENGUE', 'Pascal', 'pascal.mengue@ecole-excellence.cm', NULL),
(1013, 'NGOUMOU', 'Luc', 'luc.ngoumou@ecole-excellence.cm', NULL),
(1014, 'FOPA', 'Célestin', 'celestin.fopa@ecole-excellence.cm', NULL),
(1015, 'BIKOKO', 'Jeanne', 'jeanne.bikoko@ecole-excellence.cm', NULL),
(1016, 'NTAMACK', 'Paul', 'paul.ntamack@ecole-excellence.cm', NULL),
(1017, 'TABI', 'Emmanuel', 'emmanuel.tabi@ecole-excellence.cm', NULL),
(1018, 'KENGNE', 'Berthe', 'berthe.kengne@ecole-excellence.cm', NULL),
(1019, 'SIMO', 'Thierry', 'thierry.simo@ecole-excellence.cm', NULL),
(1020, 'SONG', 'Blessing', 'blessing.song@ecole-excellence.cm', NULL),
(1021, 'AMBE', 'Peter', 'peter.ambe@ecole-excellence.cm', NULL),
(1022, 'CHE', 'Divine', 'divine.che@ecole-excellence.cm', NULL),
(1023, 'NDUM', 'Mercy', 'mercy.ndum@ecole-excellence.cm', NULL),
(1024, 'NGWA', 'Solomon', 'solomon.ngwa@ecole-excellence.cm', NULL),
(1025, 'MBALLA', 'Antoine', 'antoine.mballa@ecole-excellence.cm', NULL),
(1026, 'NGAH', 'Brigitte', 'brigitte.ngah@ecole-excellence.cm', NULL),
(1027, 'ATANGANA', 'Serge', 'serge.atangana@ecole-excellence.cm', NULL),
(1028, 'TSALA', 'Véronique', 'veronique.tsala@ecole-excellence.cm', NULL),
(1029, 'EBONG', 'Roland', 'roland.ebong@ecole-excellence.cm', NULL),
(1030, 'ENOW', 'David', 'david.enow@ecole-excellence.cm', NULL),
(1031, 'TAKANG', 'Agnes', 'agnes.takang@ecole-excellence.cm', NULL),
(1032, 'ABENA', 'Colette', 'colette.abena@ecole-excellence.cm', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Enseignement`
--

CREATE TABLE `Enseignement` (
  `matEnseignant` int(11) NOT NULL,
  `idMat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Enseignement`
--

INSERT INTO `Enseignement` (`matEnseignant`, `idMat`) VALUES
(1001, 1),
(1001, 6),
(1002, 2),
(1002, 7),
(1003, 3),
(1003, 8),
(1004, 4),
(1005, 5),
(1006, 9),
(1006, 14),
(1007, 10),
(1007, 15),
(1008, 11),
(1008, 16),
(1009, 12),
(1010, 13);

-- --------------------------------------------------------

--
-- Structure de la table `Matiere`
--

CREATE TABLE `Matiere` (
  `idMat` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `idClasse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Matiere`
--

INSERT INTO `Matiere` (`idMat`, `nom`, `idClasse`) VALUES
(1, 'Éveil Langagier & Graphisme', 1),
(2, 'Initiation à la Lecture', 2),
(3, 'Français & Mathématiques de Base', 3),
(4, 'Mathématiques & Sciences', 4),
(5, 'Français & Dictée', 4),
(6, 'Mathématiques Avancées', 5),
(7, 'Langue Française', 5),
(8, 'Histoire-Géographie & ECM', 5),
(9, 'Basic English & Phonics', 6),
(10, 'Early Numeracy', 7),
(11, 'English Language & Mathematics', 8),
(12, 'Mathematics & Science', 9),
(13, 'English Language & Literature', 9),
(14, 'Mathematics Practice', 10),
(15, 'English Language', 10),
(16, 'General Science & Social Studies', 10),
(17, 'Éveil Langagier & Graphisme', 1),
(18, 'Initiation à la Lecture', 2),
(19, 'Français & Mathématiques de Base', 3),
(20, 'Mathématiques & Sciences', 4),
(21, 'Français & Dictée', 4),
(22, 'Mathématiques Avancées', 5),
(23, 'Langue Française', 5),
(24, 'Histoire-Géographie & ECM', 5),
(25, 'Basic English & Phonics', 6),
(26, 'Early Numeracy', 7),
(27, 'English Language & Mathematics', 8),
(28, 'Mathematics & Science', 9),
(29, 'English Language & Literature', 9),
(30, 'Mathematics Practice', 10),
(31, 'English Language', 10),
(32, 'General Science & Social Studies', 10),
(33, 'Éveil Langagier & Graphisme', 1),
(34, 'Initiation à la Lecture', 2),
(35, 'Français & Mathématiques de Base', 3),
(36, 'Mathématiques & Sciences', 4),
(37, 'Français & Dictée', 4),
(38, 'Mathématiques Avancées', 5),
(39, 'Langue Française', 5),
(40, 'Histoire-Géographie & ECM', 5),
(41, 'Basic English & Phonics', 6),
(42, 'Early Numeracy', 7),
(43, 'English Language & Mathematics', 8),
(44, 'Mathematics & Science', 9),
(45, 'English Language & Literature', 9),
(46, 'Mathematics Practice', 10),
(47, 'English Language', 10),
(48, 'General Science & Social Studies', 10),
(49, 'Éveil Langagier & Graphisme', 1),
(50, 'Initiation à la Lecture', 2),
(51, 'Français & Mathématiques de Base', 3),
(52, 'Mathématiques & Sciences', 4),
(53, 'Français & Dictée', 4),
(54, 'Mathématiques Avancées', 5),
(55, 'Langue Française', 5),
(56, 'Histoire-Géographie & ECM', 5),
(57, 'Basic English & Phonics', 6),
(58, 'Early Numeracy', 7),
(59, 'English Language & Mathematics', 8),
(60, 'Mathematics & Science', 9),
(61, 'English Language & Literature', 9),
(62, 'Mathematics Practice', 10),
(63, 'English Language', 10),
(64, 'General Science & Social Studies', 10);

-- --------------------------------------------------------

--
-- Structure de la table `Message`
--

CREATE TABLE `Message` (
  `idMessage` int(11) NOT NULL,
  `nomExpediteur` varchar(100) NOT NULL,
  `emailExpediteur` varchar(150) NOT NULL,
  `telephoneExpediteur` varchar(20) DEFAULT NULL,
  `typeMessage` varchar(50) DEFAULT 'Information générale',
  `contenuMessage` text NOT NULL,
  `dateEnvoi` datetime DEFAULT current_timestamp(),
  `statut` varchar(20) DEFAULT 'NON_LU'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Message`
--

INSERT INTO `Message` (`idMessage`, `nomExpediteur`, `emailExpediteur`, `telephoneExpediteur`, `typeMessage`, `contenuMessage`, `dateEnvoi`, `statut`) VALUES
(1, 'Henri BINDZI', 'h.bindzi@gmail.com', '+237699001122', 'Inscription', 'Bonjour, quelles sont les pièces à fournir pour une inscription en SIL ?', '2026-08-15 22:38:53', 'NON_LU'),
(2, 'Grace TCHOUTA', 'grace.tchouta@yahoo.com', '+237677889900', 'Tarifs', 'Pouvez-vous m envoyer la grille tarifaire complète pour la section anglophone (Nursery) ?', '2026-08-15 22:38:53', 'TRAITE');

-- --------------------------------------------------------

--
-- Structure de la table `Parent`
--

CREATE TABLE `Parent` (
  `idParent` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `numTel` varchar(20) DEFAULT NULL,
  `sexe` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Parent`
--

INSERT INTO `Parent` (`idParent`, `nom`, `prenom`, `email`, `numTel`, `sexe`) VALUES
(1, 'KOUAM', 'Jean-Paul', 'jp.kouam@gmail.com', '+237699112233', 'M'),
(2, 'MBALLA', 'Christine', 'c.mballa@yahoo.fr', '+237677445566', 'F'),
(3, 'NKE', 'Rodrigue', 'rodrigue.nke@outlook.com', '+237655889900', 'M'),
(4, 'TANYI', 'Patrick', 'p.tanyi@gmail.com', '+237690123456', 'M'),
(5, 'FOTSO', 'Sandrine', 'sandrine.fotso@gmail.com', '+237671234567', 'F'),
(6, 'BESSONG', 'Erick', 'erick.bessong@yahoo.com', '+237650987654', 'M'),
(7, 'NKOLO', 'Françoise', 'f.nkolo@gmail.com', '+237694321098', 'F'),
(8, 'AGBOR', 'Charles', 'charles.agbor@gmail.com', '+237678112233', 'M'),
(9, 'BILO A', 'Carine', 'carine.biloa@yahoo.fr', '+237651334455', 'F'),
(10, 'EWOANE', 'Marc', 'marc.ewoane@gmail.com', '+237696778899', 'M');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Article`
--
ALTER TABLE `Article`
  ADD PRIMARY KEY (`idArticle`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Index pour la table `Avis`
--
ALTER TABLE `Avis`
  ADD PRIMARY KEY (`idAvis`),
  ADD KEY `idParent` (`idParent`);

--
-- Index pour la table `Classe`
--
ALTER TABLE `Classe`
  ADD PRIMARY KEY (`idClasse`);

--
-- Index pour la table `Eleve`
--
ALTER TABLE `Eleve`
  ADD PRIMARY KEY (`matEleve`),
  ADD KEY `idClasse` (`idClasse`),
  ADD KEY `idParent` (`idParent`);

--
-- Index pour la table `Enseignant`
--
ALTER TABLE `Enseignant`
  ADD PRIMARY KEY (`matEnseignant`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `Enseignement`
--
ALTER TABLE `Enseignement`
  ADD PRIMARY KEY (`matEnseignant`,`idMat`),
  ADD KEY `idMat` (`idMat`);

--
-- Index pour la table `Matiere`
--
ALTER TABLE `Matiere`
  ADD PRIMARY KEY (`idMat`),
  ADD KEY `idClasse` (`idClasse`);

--
-- Index pour la table `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`idMessage`);

--
-- Index pour la table `Parent`
--
ALTER TABLE `Parent`
  ADD PRIMARY KEY (`idParent`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Article`
--
ALTER TABLE `Article`
  MODIFY `idArticle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Avis`
--
ALTER TABLE `Avis`
  MODIFY `idAvis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Classe`
--
ALTER TABLE `Classe`
  MODIFY `idClasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `Matiere`
--
ALTER TABLE `Matiere`
  MODIFY `idMat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `Message`
--
ALTER TABLE `Message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Parent`
--
ALTER TABLE `Parent`
  MODIFY `idParent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Avis`
--
ALTER TABLE `Avis`
  ADD CONSTRAINT `Avis_ibfk_1` FOREIGN KEY (`idParent`) REFERENCES `Parent` (`idParent`) ON DELETE SET NULL;

--
-- Contraintes pour la table `Eleve`
--
ALTER TABLE `Eleve`
  ADD CONSTRAINT `Eleve_ibfk_1` FOREIGN KEY (`idClasse`) REFERENCES `Classe` (`idClasse`) ON DELETE SET NULL,
  ADD CONSTRAINT `Eleve_ibfk_2` FOREIGN KEY (`idParent`) REFERENCES `Parent` (`idParent`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Enseignement`
--
ALTER TABLE `Enseignement`
  ADD CONSTRAINT `Enseignement_ibfk_1` FOREIGN KEY (`matEnseignant`) REFERENCES `Enseignant` (`matEnseignant`) ON DELETE CASCADE,
  ADD CONSTRAINT `Enseignement_ibfk_2` FOREIGN KEY (`idMat`) REFERENCES `Matiere` (`idMat`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Matiere`
--
ALTER TABLE `Matiere`
  ADD CONSTRAINT `Matiere_ibfk_1` FOREIGN KEY (`idClasse`) REFERENCES `Classe` (`idClasse`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
