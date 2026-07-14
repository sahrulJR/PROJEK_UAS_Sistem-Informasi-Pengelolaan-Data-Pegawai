-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2026 at 02:41 PM
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

--
-- Dumping data for table departemen
--

INSERT INTO departemen (id_departemen, nama_departemen, lokasi) VALUES
(1, 'IT Support', 'Gedung A Lantai 3'),
(2, 'Human Resources', 'Gedung B Lantai 1'),
(3, 'Finance', 'Gedung A Lantai 2');

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

--
-- Dumping data for table gaji
--

INSERT INTO gaji (id_gaji, id_pegawai, bulan_tahun, tunjangan, potongan, total_gaji) VALUES
(1, 1, 'Juli 2026', 1500000.00, 200000.00, 13300000.00),
(2, 2, 'Juli 2026', 500000.00, 100000.00, 6400000.00),
(3, 3, 'Juli 2026', 400000.00, 150000.00, 5750000.00),
(4, 4, 'Juli 2026', 400000.00, 50000.00, 5850000.00);

-- --------------------------------------------------------

--
-- Table structure for table jabatan
--

CREATE TABLE jabatan (
  id_jabatan int(11) NOT NULL,
  nama_jabatan varchar(100) NOT NULL,
  gaji_pokok decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table jabatan
--

INSERT INTO jabatan (id_jabatan, nama_jabatan, gaji_pokok) VALUES
(1, 'Senior Developer', 12000000.00),
(2, 'HR Officer', 6000000.00),
(3, 'Finance Staff', 5500000.00);

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

--
-- Dumping data for table pegawai
--

INSERT INTO pegawai (id_pegawai, nip, nama, email, tanggal_lahir, id_jabatan, id_departemen) VALUES
(1, '202601001', 'Aris Setiawan', 'aris@perusahaan.com', '1995-04-12', 1, 1),
(2, '202601002', 'Berlian Putri', 'berlian@perusahaan.com', '1998-08-22', 2, 2),
(3, '202601003', 'Citra Lestari', 'citra@perusahaan.com', '1996-11-02', 3, 3),
(4, '202601004', 'Deni Dermawan', 'deni@perusahaan.com', '1994-02-15', 3, 3);

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
-- Dumping data for table pengguna
--

INSERT INTO pengguna (id_user, username, password, role) VALUES
(1, 'admin', 'admin123', 'Admin'),
(2, 'manager', 'manager123', 'Viewer');

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
