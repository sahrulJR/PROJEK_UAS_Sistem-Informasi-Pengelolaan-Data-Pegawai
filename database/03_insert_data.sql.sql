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

--
-- Dumping data for table departemen
--

INSERT INTO departemen (id_departemen, nama_departemen, lokasi) VALUES
(1, 'IT Support', 'Gedung A Lantai 3'),
(2, 'Human Resources', 'Gedung B Lantai 1'),
(3, 'Finance', 'Gedung A Lantai 2');

--
-- Dumping data for table gaji
--

INSERT INTO gaji (id_gaji, id_pegawai, bulan_tahun, tunjangan, potongan, total_gaji) VALUES
(1, 1, 'Juli 2026', 1500000.00, 200000.00, 13300000.00),
(2, 2, 'Juli 2026', 500000.00, 100000.00, 6400000.00),
(3, 3, 'Juli 2026', 400000.00, 150000.00, 5750000.00),
(4, 4, 'Juli 2026', 400000.00, 50000.00, 5850000.00);

--
-- Dumping data for table jabatan
--

INSERT INTO jabatan (id_jabatan, nama_jabatan, gaji_pokok) VALUES
(1, 'Senior Developer', 12000000.00),
(2, 'HR Officer', 6000000.00),
(3, 'Finance Staff', 5500000.00);

--
-- Dumping data for table pegawai
--

INSERT INTO pegawai (id_pegawai, nip, nama, email, tanggal_lahir, id_jabatan, id_departemen) VALUES
(1, '202601001', 'Aris Setiawan', 'aris@perusahaan.com', '1995-04-12', 1, 1),
(2, '202601002', 'Berlian Putri', 'berlian@perusahaan.com', '1998-08-22', 2, 2),
(3, '202601003', 'Citra Lestari', 'citra@perusahaan.com', '1996-11-02', 3, 3),
(4, '202601004', 'Deni Dermawan', 'deni@perusahaan.com', '1994-02-15', 3, 3);

--
-- Dumping data for table pengguna
--

INSERT INTO pengguna (id_user, username, password, role) VALUES
(1, 'admin', 'admin123', 'Admin'),
(2, 'manager', 'manager123', 'Viewer');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
