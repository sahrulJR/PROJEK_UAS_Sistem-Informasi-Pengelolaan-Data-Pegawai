-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2026 at 02:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: db_kepegawaian
--
CREATE DATABASE IF NOT EXISTS db_kepegawaian DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE db_kepegawaian;

-- --------------------------------------------------------

--
-- Table structure for table departemen
--

CREATE TABLE departemen (
  id_departemen int(11) NOT NULL,
  nama_departemen varchar(100) NOT NULL,
  lokasi varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table gaji
--

CREATE TABLE gaji (
  id_gaji int(11) NOT NULL,
  id_pegawai int(11) DEFAULT NULL,
  bulan_tahun varchar(20) NOT NULL,
  tunjangan decimal(10,2) DEFAULT 0.00,
  potongan decimal(10,2) DEFAULT 0.00,
  total_gaji decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table jabatan
--

CREATE TABLE jabatan (
  id_jabatan int(11) NOT NULL,
  nama_jabatan varchar(100) NOT NULL,
  gaji_pokok decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table pegawai
--

CREATE TABLE pegawai (
  id_pegawai int(11) NOT NULL,
  nip varchar(20) NOT NULL,
  nama varchar(150) NOT NULL,
  email varchar(100) NOT NULL,
  tanggal_lahir date NOT NULL,
  id_jabatan int(11) DEFAULT NULL,
  id_departemen int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table pengguna
--

CREATE TABLE pengguna (
  id_user int(11) NOT NULL,
  username varchar(50) NOT NULL,
  password varchar(255) NOT NULL,
  role varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table departemen
--
ALTER TABLE departemen
  ADD PRIMARY KEY (id_departemen);

--
-- Indexes for table gaji
--
ALTER TABLE gaji
  ADD PRIMARY KEY (id_gaji),
  ADD KEY id_pegawai (id_pegawai),
  ADD KEY idx_gaji_bulan (bulan_tahun);

--
-- Indexes for table jabatan
--
ALTER TABLE jabatan
  ADD PRIMARY KEY (id_jabatan);

--
-- Indexes for table pegawai
--
ALTER TABLE pegawai
  ADD PRIMARY KEY (id_pegawai),
  ADD UNIQUE KEY nip (nip),
  ADD KEY id_jabatan (id_jabatan),
  ADD KEY id_departemen (id_departemen),
  ADD KEY idx_pegawai_nama (nama);

--
-- Indexes for table pengguna
--
ALTER TABLE pengguna
  ADD PRIMARY KEY (id_user),
  ADD UNIQUE KEY username (username);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table departemen
--
ALTER TABLE departemen
  MODIFY id_departemen int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table gaji
--
ALTER TABLE gaji
  MODIFY id_gaji int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table jabatan
--
ALTER TABLE jabatan
  MODIFY id_jabatan int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table pegawai
--
ALTER TABLE pegawai
  MODIFY id_pegawai int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table pengguna
--
ALTER TABLE pengguna
  MODIFY id_user int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table gaji
--
ALTER TABLE gaji
  ADD CONSTRAINT gaji_ibfk_1 FOREIGN KEY (id_pegawai) REFERENCES pegawai (id_pegawai) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table pegawai
--
ALTER TABLE pegawai
  ADD CONSTRAINT pegawai_ibfk_1 FOREIGN KEY (id_jabatan) REFERENCES jabatan (id_jabatan) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT pegawai_ibfk_2 FOREIGN KEY (id_departemen) REFERENCES departemen (id_departemen) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
