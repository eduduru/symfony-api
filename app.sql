-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 13, 2024 at 08:45 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240711211430', '2024-07-11 21:15:54', 46),
('DoctrineMigrations\\Version20240711235103', '2024-07-11 23:51:35', 4),
('DoctrineMigrations\\Version20240712001700', '2024-07-12 00:17:13', 2),
('DoctrineMigrations\\Version20240712082603', '2024-07-12 08:26:41', 4),
('DoctrineMigrations\\Version20240713112044', '2024-07-13 11:21:16', 5);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`) VALUES
(1, 'Rice', '2000', 'Local rice with sauce'),
(2, 'Beanssss', '300', 'Testing'),
(3, 'BeansU', '300', 'Testing'),
(4, 'Yam', '300', 'Testing'),
(5, 'Yam', '300', 'Testing'),
(6, 'Yam', '300', 'Testing'),
(9, 'Yam', '300', 'Testing'),
(10, 'Yam', '300', 'Testing');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'ROLE_ADMIN',
  `password` varchar(255) NOT NULL,
  `username` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(1, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$tOHOF304d8SxZ/JquK3I2A$JQKmOFjjMCg4SfHhk5I9ql7l0ZEZGMU7QAjIzh+GB1c', 'Yam'),
(2, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$70SuP6YlDwnebfcpIsqDCw$gNBr0+aRqBOIFde+6pW38BRgTvDM7n7N442sXLNDcy8', 'Yam2'),
(3, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$zn2re9Ap55vH8FCSrfgmeA$vV/GUdUPmyJPyao8NTqYM/WgEq3PQ6LcZAZgnGFFMQc', 'Yam2'),
(4, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$p7oekDz3N/BXG5AvgOsyjA$lr53u3GKcT04tzRh49ZZVA3NYjpS6rWlKHx0yJSL0q4', 'Yam2'),
(5, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$L6JoOXEsbM60fCTnToxgOA$hqaswvaKmR+reEo7B9LkR8ljIWML6drc3Fgipe4xSIA', 'Yam2'),
(6, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$/78ck7BVulL01uim2t1KGA$X3ywdG6UqnWT2/qZo3WDOy+uU7jMtAaIOeVQEhzLB+E', 'Chinedu'),
(7, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$8CJ8MYjbGGIqEgihnKiy+w$/csZMqRVggmkuwaWE+sPXfkOZ4sKUgf/CU8y7NDJEtA', 'Chinedu'),
(8, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$8XOVZzzkQyPC7rV2imC6/w$x2bHUHz9Uyq5zly3ruYLT3e0R3cFj1Z3Cs9KmOk85d0', 'Chinedu'),
(9, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$KOt9SikpubMZCW2plwXuzg$HvrUDV7LhTNkIKBBHCpSscgf6Y5RVstnH/oTJZzcXks', 'Chinedu'),
(10, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$TfOY3LestT5HcR1xm2A5/w$Urx9ipG02Fn1/fxzjxUyh7WDYQjuMatO1p1cBcguC5o', 'Chinedu'),
(11, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$qC1qAIGhC6F9JeuNpXQa1Q$Y7kNmfHCSV7J6VALFBxPtH41oItQtdxEkHuB7MfYPIs', 'Chinedu'),
(12, NULL, 'ROLE_ADMIN', '$argon2id$v=19$m=65536,t=4,p=1$+YHqesorvpvPHlRsEXTtIw$B8x7CmowSe7IU1IN3JM+k260f83BQTya1C2xIDOxB24', 'Chinedu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
