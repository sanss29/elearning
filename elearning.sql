-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2023 at 05:08 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `analisis`
--

CREATE TABLE `analisis` (
  `id_analisis` int(100) NOT NULL,
  `id_ujian` int(100) NOT NULL,
  `id_soal` int(100) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `jawaban` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `analisis`
--

INSERT INTO `analisis` (`id_analisis`, `id_ujian`, `id_soal`, `id_siswa`, `jawaban`) VALUES
(11, 15, 113, 26, '1'),
(12, 15, 114, 26, '2'),
(13, 15, 115, 26, '0'),
(14, 15, 116, 26, '4'),
(15, 15, 117, 26, '5');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_tugas`
--

CREATE TABLE `kelas_tugas` (
  `id_klstugas` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kelas_tugas`
--

INSERT INTO `kelas_tugas` (`id_klstugas`, `id_tugas`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(13, 10, 13, 8, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujian`
--

CREATE TABLE `kelas_ujian` (
  `id_klsujian` int(11) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_klsujian`, `id_ujian`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(26, 15, 13, 8, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujianessay`
--

CREATE TABLE `kelas_ujianessay` (
  `id_klsessay` int(11) NOT NULL,
  `id_ujianessay` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_ujian` varchar(100) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `jml_benar` int(5) NOT NULL,
  `jml_kosong` int(5) NOT NULL,
  `jml_salah` int(5) NOT NULL,
  `nilai` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `waktu_selesai`, `jml_benar`, `jml_kosong`, `jml_salah`, `nilai`) VALUES
(14, 26, '15', '116,115,113,114,117', '4,0,1,2,5', '02:05:00', '18:57:24', 3, 1, 1, '60');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(10) NOT NULL,
  `id_pengirim` varchar(30) NOT NULL,
  `id_penerima` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `isi_pesan` longtext NOT NULL,
  `sudah_dibaca` enum('belum','sudah') NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_pengirim`, `id_penerima`, `tanggal`, `isi_pesan`, `sudah_dibaca`, `id_kelas`, `id_jurusan`) VALUES
(11, '1222', '123456', '2023-07-27', 'Tulis Pesan AA', 'sudah', 13, 8),
(12, '123456', '', '2023-07-27', '<p>Apa</p>\r\n', 'belum', 0, 0),
(13, '123456', '', '2023-07-27', '<p>Tulis Pesan okk</p>\r\n', 'belum', 13, 8),
(14, '123456', '1222', '2023-07-27', 'Re: <p>Tulis Pesan qqqq</p>\r\n', 'belum', 13, 8);

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(5) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_1` text NOT NULL,
  `pilihan_2` text NOT NULL,
  `pilihan_3` text NOT NULL,
  `pilihan_4` text NOT NULL,
  `pilihan_5` text NOT NULL,
  `kunci` int(2) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `pilihan_5`, `kunci`, `status`) VALUES
(113, 15, '<p>1+1 =&nbsp;</p>\r\n', '<p>2</p>\r\n', '<p>3</p>\r\n', '<p>4</p>\r\n', '<p>5</p>\r\n', '<p>6</p>\r\n', 1, 'Y'),
(114, 15, '<p>2+2 =</p>\r\n', '<p>4</p>\r\n', '<p>5</p>\r\n', '<p>6</p>\r\n', '<p>2</p>\r\n', '<p>1</p>\r\n', 1, 'Y'),
(115, 15, '<p>9+0=</p>\r\n', '<p>1</p>\r\n', '<p>2</p>\r\n', '<p>3</p>\r\n', '<p>4</p>\r\n', '<p>9</p>\r\n', 5, 'Y'),
(116, 15, '<p>5=</p>\r\n', '<p>2</p>\r\n', '<p>3</p>\r\n', '<p>4</p>\r\n', '<p>5</p>\r\n', '<p>6</p>\r\n', 4, 'Y'),
(117, 15, '<p>1</p>\r\n', '<p>2</p>\r\n', '<p>3</p>\r\n', '<p>4</p>\r\n', '<p>5</p>\r\n', '<p>1</p>\r\n', 5, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `aktif` varchar(5) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `username`, `password`, `aktif`, `foto`) VALUES
(1, 'Adminweb', 'admin', 'f865b53623b121fd34ee5426c792e5c33af8c227', 'Y', '512x512.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama_guru` varchar(120) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` varchar(5) NOT NULL,
  `date_created` date NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nik`, `nama_guru`, `email`, `password`, `foto`, `status`, `date_created`, `confirm`) VALUES
(14, '123456', 'Guruku', 'guru@guru.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1690450886-2.png', 'Y', '2023-07-27', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisperangkat`
--

CREATE TABLE `tb_jenisperangkat` (
  `id_jenisperangkat` int(11) NOT NULL,
  `jenis_perangkat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_jenisperangkat`
--

INSERT INTO `tb_jenisperangkat` (`id_jenisperangkat`, `jenis_perangkat`) VALUES
(6, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenistugas`
--

CREATE TABLE `tb_jenistugas` (
  `id_jenistugas` int(11) NOT NULL,
  `jenis_tugas` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_jenistugas`
--

INSERT INTO `tb_jenistugas` (`id_jenistugas`, `jenis_tugas`) VALUES
(1, 'INDIVIDU'),
(2, 'KELOMPOK');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisujian`
--

CREATE TABLE `tb_jenisujian` (
  `id_jenis` int(11) NOT NULL,
  `jenis_ujian` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_jenisujian`
--

INSERT INTO `tb_jenisujian` (`id_jenis`, `jenis_ujian`) VALUES
(4, 'UTS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_jurusan`
--

CREATE TABLE `tb_master_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_master_jurusan`
--

INSERT INTO `tb_master_jurusan` (`id_jurusan`, `jurusan`) VALUES
(8, 'RPL');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_kelas`
--

CREATE TABLE `tb_master_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_master_kelas`
--

INSERT INTO `tb_master_kelas` (`id_kelas`, `kelas`) VALUES
(13, 'XA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_mapel`
--

CREATE TABLE `tb_master_mapel` (
  `id_mapel` int(11) NOT NULL,
  `mapel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_master_mapel`
--

INSERT INTO `tb_master_mapel` (`id_mapel`, `mapel`) VALUES
(12, 'RPL');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_semester`
--

CREATE TABLE `tb_master_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_master_semester`
--

INSERT INTO `tb_master_semester` (`id_semester`, `semester`) VALUES
(5, 'Semester 1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `judul_materi` varchar(120) NOT NULL,
  `materi` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_entry` date NOT NULL,
  `id_roleguru` int(11) NOT NULL,
  `public` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_materi`
--

INSERT INTO `tb_materi` (`id_materi`, `judul_materi`, `materi`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `tgl_entry`, `id_roleguru`, `public`) VALUES
(6, 'Pertemuan 1', '<p>Tugas di kerjakan</p>\r\n', '1690451163', 'text', '0', '--', '2023-07-27', 8, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_perangkat`
--

CREATE TABLE `tb_perangkat` (
  `id_perangkat` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `isi_perangkat` text NOT NULL,
  `id_jenisperangkat` int(11) NOT NULL,
  `tgl_entry` date NOT NULL,
  `publish` int(11) NOT NULL,
  `id_roleguru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_perangkat`
--

INSERT INTO `tb_perangkat` (`id_perangkat`, `judul`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `isi_perangkat`, `id_jenisperangkat`, `tgl_entry`, `publish`, `id_roleguru`) VALUES
(2, 'JUDUL PERANGKAT', '1690451127', 'text', 'File', '--', '<p>JUDUL PERANGKAT&nbsp;JUDUL PERANGKAT&nbsp;JUDUL PERANGKAT</p>\r\n', 6, '2023-07-27', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tb_roleguru`
--

CREATE TABLE `tb_roleguru` (
  `id_roleguru` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_roleguru`
--

INSERT INTO `tb_roleguru` (`id_roleguru`, `id_guru`, `id_kelas`, `id_mapel`, `id_semester`, `id_jurusan`) VALUES
(8, 14, 13, 12, 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sekolah`
--

CREATE TABLE `tb_sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `nama_sekolah` varchar(120) NOT NULL,
  `kepsek` varchar(120) NOT NULL,
  `textlogo` varchar(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_sekolah`
--

INSERT INTO `tb_sekolah` (`id_sekolah`, `nama_sekolah`, `kepsek`, `textlogo`, `logo`, `copyright`) VALUES
(1, 'Brazzer High School', 'Shigeo Tokuda', 'e-learning', 'e_png_428941.png', ' Copyright @ 2021 <b>e-learning</b>. All rights reserved');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nama_siswa` varchar(120) NOT NULL,
  `jk` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `aktif` varchar(30) NOT NULL,
  `tingkat` varchar(20) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `jk`, `password`, `status`, `aktif`, `tingkat`, `foto`, `id_kelas`, `id_jurusan`, `confirm`) VALUES
(26, '1222', 'Nama Siswa', 'L', '5aab0703d8e504fd68b829dcfed270c59f51e23f', 'selesai', 'Y', '0', '1690450911-android-icon-72x72.png', 13, 8, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tugas`
--

CREATE TABLE `tb_tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_jenistugas` int(11) NOT NULL,
  `judul_tugas` varchar(100) NOT NULL,
  `isi_tugas` text NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(30) NOT NULL,
  `jml_anggota` int(30) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_tugas`
--

INSERT INTO `tb_tugas` (`id_tugas`, `id_jenistugas`, `judul_tugas`, `isi_tugas`, `tanggal`, `waktu`, `jml_anggota`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(10, 1, 'Tugas Individu', '<p>Dijawab ?</p>\r\n', '2023-07-27', 3, 0, 14, 12, 5),
(11, 2, 'Kelompok', '<p>5 Orang buat penjumlahan ?&nbsp;</p>\r\n', '2023-07-27', 3, 0, 14, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tugas_siswa`
--

CREATE TABLE `tugas_siswa` (
  `id_tgssiswa` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `subjek` varchar(120) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kelompok` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(30) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_upload` date NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `jml_soal` int(30) NOT NULL,
  `acak` varchar(100) NOT NULL,
  `tipe` int(1) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `tanggal`, `waktu`, `jml_soal`, `acak`, `tipe`, `id_jenis`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(15, 'UJIAN 1', '2023-07-27', '02:05:00', 5, 'acak', 0, 4, 14, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ujian_essay`
--

CREATE TABLE `ujian_essay` (
  `id_ujianessay` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jml_soal` int(30) NOT NULL,
  `soal_essay` text NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`id_analisis`);

--
-- Indexes for table `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  ADD PRIMARY KEY (`id_klstugas`);

--
-- Indexes for table `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  ADD PRIMARY KEY (`id_klsujian`);

--
-- Indexes for table `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  ADD PRIMARY KEY (`id_klsessay`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  ADD PRIMARY KEY (`id_jenisperangkat`);

--
-- Indexes for table `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  ADD PRIMARY KEY (`id_jenistugas`);

--
-- Indexes for table `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indexes for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD PRIMARY KEY (`id_perangkat`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indexes for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD PRIMARY KEY (`id_roleguru`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_semester` (`id_semester`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `tb_tugas`
--
ALTER TABLE `tb_tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  ADD PRIMARY KEY (`id_tgssiswa`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- Indexes for table `ujian_essay`
--
ALTER TABLE `ujian_essay`
  ADD PRIMARY KEY (`id_ujianessay`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analisis`
--
ALTER TABLE `analisis`
  MODIFY `id_analisis` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  MODIFY `id_klstugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  MODIFY `id_klsujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  MODIFY `id_klsessay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  MODIFY `id_jenisperangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  MODIFY `id_jenistugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  MODIFY `id_perangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  MODIFY `id_roleguru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_tugas`
--
ALTER TABLE `tb_tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  MODIFY `id_tgssiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ujian_essay`
--
ALTER TABLE `ujian_essay`
  MODIFY `id_ujianessay` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD CONSTRAINT `tb_materi_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD CONSTRAINT `tb_perangkat_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD CONSTRAINT `tb_roleguru_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_master_jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `tb_master_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_4` FOREIGN KEY (`id_mapel`) REFERENCES `tb_master_mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_5` FOREIGN KEY (`id_semester`) REFERENCES `tb_master_semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
