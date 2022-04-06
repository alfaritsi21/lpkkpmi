-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2022 at 10:41 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lpkkpmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `body`, `file`, `created_at`) VALUES
(2, 'Pelatihan 6', 'Berikut adalah pelatihan 6', NULL, '2022-01-12 09:57:06'),
(3, 'Pelatihan 7', 'Berikut adalah pelatihan 7', NULL, '2022-01-15 02:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `bimtek`
--

CREATE TABLE `bimtek` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bimtek`
--

INSERT INTO `bimtek` (`id`, `nama`, `tanggal`, `status`, `file`, `created_at`, `updated_at`) VALUES
(1, 'Bimtek 1', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-12 09:53:37', NULL),
(3, 'Bimtek 3', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:01:30', NULL),
(4, 'Bimtek 4', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:01:33', NULL),
(5, 'Bimtek 5', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:01:38', NULL),
(6, 'Bimtek 6', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:01:41', NULL),
(7, 'Bimtek 7', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:01:45', NULL),
(8, 'Bimtek 8', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:01:49', NULL),
(9, 'Bimtek 9', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:10:42', NULL),
(10, 'Bimtek 10', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:10:46', NULL),
(11, 'Bimtek 11', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:10:49', NULL),
(12, 'Bimtek 12', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:11:04', NULL),
(13, 'Bimtek 13', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:11:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `caption` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pelatihan`
--

CREATE TABLE `pelatihan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelatihan`
--

INSERT INTO `pelatihan` (`id`, `nama`, `tanggal`, `status`, `file`, `created_at`, `updated_at`) VALUES
(3, 'Pelatihan 3', '23 Januari 2022 - 29 Januari 2022', 'Belum terlaksana', NULL, '2022-01-12 09:19:04', '2022-01-12 09:31:27'),
(4, 'Pelatihan 3', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 04:52:09', NULL),
(5, 'Pelatihan 4', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 04:52:16', NULL),
(6, 'Pelatihan 5', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 04:52:20', NULL),
(7, 'Pelatihan 6', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 04:52:24', NULL),
(8, 'Pelatihan 7', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:05:41', NULL),
(9, 'Pelatihan 8', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:05:44', NULL),
(10, 'Pelatihan 9', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:05:47', NULL),
(11, 'Pelatihan 10', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:05:51', NULL),
(12, 'Pelatihan 11', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:05:54', NULL),
(13, 'Pelatihan 12', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:05:57', NULL),
(14, 'Pelatihan 13', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:05:59', NULL),
(15, 'Pelatihan 14', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:02', NULL),
(16, 'Pelatihan 15', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:06', NULL),
(17, 'Pelatihan 16', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:09', NULL),
(18, 'Pelatihan 17', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:12', NULL),
(19, 'Pelatihan 18', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:16', NULL),
(20, 'Pelatihan 19', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:19', NULL),
(21, 'Pelatihan 20', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:24', NULL),
(22, 'Pelatihan 21', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:27', NULL),
(23, 'Pelatihan 22', '21 Januari 2022 - 26 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:06:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2b$10$8WD4vS6IPs92D6PZBrVYsub3JJXrTXh0N/8zzmhYDaVdxukPxeZsi');

-- --------------------------------------------------------

--
-- Table structure for table `webinar`
--

CREATE TABLE `webinar` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `webinar`
--

INSERT INTO `webinar` (`id`, `nama`, `tanggal`, `status`, `file`, `created_at`, `updated_at`) VALUES
(1, 'Webinar 1', '24 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:02:41', NULL),
(2, 'Webinar 2', '24 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:02:47', NULL),
(3, 'Webinar 3', '24 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:02:50', NULL),
(4, 'Webinar 4', '24 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:02:54', NULL),
(5, 'Webinar 5', '24 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:02:58', NULL),
(6, 'Webinar 6', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:09:02', NULL),
(7, 'Webinar 7', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:09:06', NULL),
(8, 'Webinar 8', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:09:11', NULL),
(9, 'Webinar 9', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:09:14', NULL),
(10, 'Webinar 10', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:09:17', NULL),
(11, 'Webinar 11', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:09:21', NULL),
(12, 'Webinar 12', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:09:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workshop`
--

CREATE TABLE `workshop` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `workshop`
--

INSERT INTO `workshop` (`id`, `nama`, `tanggal`, `status`, `file`, `created_at`, `updated_at`) VALUES
(1, 'Workshop 1', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:03:16', NULL),
(2, 'Workshop 2', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:03:20', NULL),
(3, 'Workshop 3', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:03:24', NULL),
(4, 'Workshop 4', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:03:28', NULL),
(5, 'Workshop 5', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:03:32', NULL),
(6, 'Workshop 6', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:03:35', NULL),
(7, 'Workshop 7', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:03:38', NULL),
(8, 'Workshop 8', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:04:17', NULL),
(9, 'Workshop 9', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:04:21', NULL),
(10, 'Workshop 10', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:04:25', NULL),
(11, 'Workshop 11', '27 Januari 2022', 'Belum terlaksana', NULL, '2022-01-15 05:04:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bimtek`
--
ALTER TABLE `bimtek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelatihan`
--
ALTER TABLE `pelatihan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webinar`
--
ALTER TABLE `webinar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bimtek`
--
ALTER TABLE `bimtek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pelatihan`
--
ALTER TABLE `pelatihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `webinar`
--
ALTER TABLE `webinar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `workshop`
--
ALTER TABLE `workshop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
