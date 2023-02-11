-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Feb 2023 pada 15.38
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anakmuslim`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anakmuslim`
--

CREATE TABLE `anakmuslim` (
  `id_pengguna` varchar(99) NOT NULL,
  `nama_pengguna` varchar(99) NOT NULL,
  `keterangan_pengguna` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anakmuslim`
--

INSERT INTO `anakmuslim` (`id_pengguna`, `nama_pengguna`, `keterangan_pengguna`) VALUES
('ID 111', 'Bima Maarschal', 'Pengguna'),
('ID 222', 'User 02', 'Pengguna'),
('ID 333', 'User 03', 'Pengguna'),
('ID 444', 'User 04', 'Pengguna');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anakmuslim`
--
ALTER TABLE `anakmuslim`
  ADD PRIMARY KEY (`id_pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
