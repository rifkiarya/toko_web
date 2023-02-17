-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2021 at 02:12 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id` int(15) NOT NULL,
  `kodepembayaran` varchar(15) NOT NULL,
  `buktipembayaran` varchar(45) NOT NULL,
  `statuskonfirmasi` varchar(19) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`id`, `kodepembayaran`, `buktipembayaran`, `statuskonfirmasi`, `created_at`) VALUES
(38, 'UmAVahwMR07pg36', '168-UmAVahwMR07pg36.jpg', 'Terkonfirmasi', '2021-08-06 12:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `kodepembayaran` varchar(15) NOT NULL,
  `id` int(5) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telpon` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `namaproduk` text NOT NULL,
  `totalpembayaran` int(9) NOT NULL,
  `statuspembayaran` varchar(20) DEFAULT NULL,
  `statuspengiriman` varchar(15) NOT NULL,
  `statusorder` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_penolakan` varchar(255) DEFAULT NULL,
  `no_resi` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`kodepembayaran`, `id`, `nama`, `alamat`, `no_telpon`, `email`, `namaproduk`, `totalpembayaran`, `statuspembayaran`, `statuspengiriman`, `statusorder`, `created_at`, `status_penolakan`, `no_resi`) VALUES
('6IghXfJVyDjtBde', 166, 'Muhammad Kasyfi Assegaf', 'Jl Radar Auri', '231321', 'muhammad1257@gmail.com', 'RanggiChips Coklat | jumlah : 2\r\n', 20000, 'Lunas', 'Terkirim', 'Selesai', '2021-07-27 13:09:47', NULL, 'JNE - 12345678'),
('UmAVahwMR07pg36', 168, 'rifki', 'Jl Radar Auri', '08128816476', 'muhammad1257@gmail.com', 'GAME GTA | jumlah : 1\r\nUji coba produk22 | jumlah : 1\r\n', 54545, 'Lunas', 'Terkirim', 'Selesai', '2021-08-06 12:03:10', NULL, 'JNE - 12345465');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(10) NOT NULL,
  `namaproduk` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaproduk` int(8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stokproduk` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `namaproduk`, `gambar`, `hargaproduk`, `created_at`, `updated_at`, `stokproduk`) VALUES
(15, 'Uji coba produk22', 'Uji coba produk22.png', 44545, '2021-03-25 06:36:53', NULL, '4'),
(16, 'GAME GTA', 'GAME GTA.jpg', 10000, '2021-08-06 06:57:15', NULL, '3');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'kasfi', 'admin@gmail.com', '5f2ac94f36bf71821f2eb6e6359420c9', NULL),
(2, 'onta', 'onta@gmail.com', '5f2ac94f36bf71821f2eb6e6359420c9', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kodepembayaran` (`kodepembayaran`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`,`kodepembayaran`) USING BTREE,
  ADD KEY `kodepembayaran` (`kodepembayaran`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `konfirmasi_ibfk_1` FOREIGN KEY (`kodepembayaran`) REFERENCES `pemesanan` (`kodepembayaran`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
