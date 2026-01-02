-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jan 2026 pada 17.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud_flask`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `fakultas` varchar(100) NOT NULL,
  `prodi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `fakultas`, `prodi`) VALUES
(14, '235520110001', 'Adit Pratama', 'Ilmu Komputer', 'Informatika'),
(15, '235520110002', 'Bima Saputra', 'Ilmu Komputer', 'Informatika'),
(16, '235520110003', 'Cahya Lestari', 'Ilmu Komputer', 'Informatika'),
(17, '235520120004', 'Dina Maharani', 'Ilmu Komputer', 'Sistem Informasi'),
(18, '235520120005', 'Eka Ramadhan', 'Ilmu Komputer', 'Sistem Informasi'),
(19, '235520130006', 'Fajar Nugroho', 'Ilmu Komputer', 'Teknologi Informasi'),
(20, '235520130007', 'Gita Anggraini', 'Ilmu Komputer', 'Teknologi Informasi'),
(21, '235520140008', 'Hendra Wijaya', 'Ilmu Komputer', 'Informatika Medis'),
(22, '235520140009', 'Intan Permata', 'Ilmu Komputer', 'Informatika Medis'),
(23, '235520110010', 'Jihan Putri', 'Ilmu Komputer', 'Informatika'),
(24, '235520120011', 'Krisna Aditya', 'Ilmu Komputer', 'Sistem Informasi'),
(25, '235520130012', 'Lukman Hakim', 'Ilmu Komputer', 'Teknologi Informasi'),
(26, '235520140013', 'Maya Salsabila', 'Ilmu Komputer', 'Informatika Medis'),
(27, '235520110014', 'Nanda Kurniawan', 'Ilmu Komputer', 'Informatika'),
(28, '235520120015', 'Oktavia Zahra', 'Ilmu Komputer', 'Sistem Informasi'),
(29, '235520130016', 'Rizky Maulana', 'Ilmu Komputer', 'Teknologi Informasi'),
(30, '235313010017', 'Satria Prabowo', 'Teknik', 'Teknik Sipil'),
(31, '235313010018', 'Tania Febriani', 'Teknik', 'Teknik Sipil'),
(32, '235313020019', 'Umar Faruq', 'Teknik', 'Teknik Arsitektur'),
(33, '235313020020', 'Vina Putri', 'Teknik', 'Teknik Arsitektur'),
(34, '235313030021', 'Wahyu Hidayat', 'Teknik', 'Teknik Elektro'),
(35, '235313030022', 'Yolanda Kirana', 'Teknik', 'Teknik Elektro'),
(36, '235313040023', 'Zaki Ramadhan', 'Teknik', 'Teknik Mesin'),
(37, '235313040024', 'Alvina Nabila', 'Teknik', 'Teknik Mesin'),
(38, '235313050025', 'Bagas Pratama', 'Teknik', 'Teknik Industri'),
(39, '235313050026', 'Cindy Amelia', 'Teknik', 'Teknik Industri'),
(40, '235313010027', 'Daffa Saputra', 'Teknik', 'Teknik Sipil'),
(41, '235313020028', 'Erlangga Putra', 'Teknik', 'Teknik Arsitektur'),
(42, '235313030029', 'Farah Azzahra', 'Teknik', 'Teknik Elektro'),
(43, '235313040030', 'Galih Prakoso', 'Teknik', 'Teknik Mesin'),
(44, '235313050031', 'Hanin Syakira', 'Teknik', 'Teknik Industri'),
(45, '235313010032', 'Iqbal Firmansyah', 'Teknik', 'Teknik Sipil'),
(46, '235111010033', 'Joko Santoso', 'FKIP', 'Pendidikan Matematika'),
(47, '235111010034', 'Kezia Nirmala', 'FKIP', 'Pendidikan Matematika'),
(48, '235111020035', 'Laila Khairunnisa', 'FKIP', 'Pendidikan Bahasa Inggris'),
(49, '235111020036', 'Miko Pratama', 'FKIP', 'Pendidikan Bahasa Inggris'),
(50, '235111030037', 'Nisa Ramadhani', 'FKIP', 'Pendidikan Biologi'),
(51, '235111030038', 'Omar Alfarizi', 'FKIP', 'Pendidikan Biologi'),
(52, '235111040039', 'Putri Ayuningtyas', 'FKIP', 'Pendidikan Bahasa Indonesia'),
(53, '235111040040', 'Qori Aulia', 'FKIP', 'Pendidikan Bahasa Indonesia'),
(54, '235111010041', 'Rafi Pratama', 'FKIP', 'Pendidikan Matematika'),
(55, '235111020042', 'Salsa Nabila', 'FKIP', 'Pendidikan Bahasa Inggris'),
(56, '235111030043', 'Teguh Saputra', 'FKIP', 'Pendidikan Biologi'),
(57, '235111040044', 'Ulfa Rahmawati', 'FKIP', 'Pendidikan Bahasa Indonesia'),
(58, '235111010045', 'Vito Prakoso', 'FKIP', 'Pendidikan Matematika'),
(59, '235111020046', 'Winda Maharani', 'FKIP', 'Pendidikan Bahasa Inggris'),
(60, '235212010047', 'Yusuf Hidayat', 'Ekonomi', 'Akuntansi'),
(61, '235212010048', 'Zahra Annisa', 'Ekonomi', 'Akuntansi'),
(62, '235212020049', 'Aulia Putri', 'Ekonomi', 'Manajemen'),
(63, '235212020050', 'Benedicta Sari', 'Ekonomi', 'Manajemen'),
(64, '235212030051', 'Citra Anggita', 'Ekonomi', 'Ekonomi Pembangunan'),
(65, '235212030052', 'Doni Kurniawan', 'Ekonomi', 'Ekonomi Pembangunan'),
(66, '235212040053', 'Elsa Permata', 'Ekonomi', 'Kewirausahaan'),
(67, '235212040054', 'Fikri Maulana', 'Ekonomi', 'Kewirausahaan'),
(68, '235212010055', 'Gilang Ramadhan', 'Ekonomi', 'Akuntansi'),
(69, '235212020056', 'Hana Salsabila', 'Ekonomi', 'Manajemen'),
(70, '235212030057', 'Ilham Pratama', 'Ekonomi', 'Ekonomi Pembangunan'),
(71, '235212040058', 'Jasmine Putri', 'Ekonomi', 'Kewirausahaan'),
(72, '235212010059', 'Kevin Aditya', 'Ekonomi', 'Akuntansi'),
(73, '235212020060', 'Lina Maharani', 'Ekonomi', 'Manajemen'),
(74, '235414010061', 'Mira Azzahra', 'Pertanian', 'Teknik Pertanian'),
(75, '235414010062', 'Naufal Hakim', 'Pertanian', 'Teknik Pertanian'),
(76, '235414020063', 'Olin Anggraini', 'Pertanian', 'Agroteknologi'),
(77, '235414020064', 'Pandu Prakoso', 'Pertanian', 'Agroteknologi'),
(78, '235414030065', 'Qaisar Ramadhan', 'Pertanian', 'Agribisnis'),
(79, '235414030066', 'Rani Kharisma', 'Pertanian', 'Agribisnis'),
(80, '235414040067', 'Seno Wijaya', 'Pertanian', 'Teknologi Pangan'),
(81, '235414040068', 'Tika Lestari', 'Pertanian', 'Teknologi Pangan'),
(82, '235414010069', 'Ujang Firmansyah', 'Pertanian', 'Teknik Pertanian'),
(83, '235414020070', 'Vania Putri', 'Pertanian', 'Agroteknologi'),
(84, '235414030071', 'Wulan Rahma', 'Pertanian', 'Agribisnis'),
(85, '235414040072', 'Yoga Pratama', 'Pertanian', 'Teknologi Pangan'),
(86, '235414010073', 'Zidan Saputra', 'Pertanian', 'Teknik Pertanian'),
(87, '235414020074', 'Aisyah Nabila', 'Pertanian', 'Agroteknologi'),
(88, '235622010075', 'Baginda Prakoso', 'Kesehatan', 'Kebidanan'),
(89, '235622010076', 'Celine Maharani', 'Kesehatan', 'Kebidanan'),
(90, '235622020077', 'Dewi Anggraini', 'Kesehatan', 'Keperawatan'),
(91, '235622020078', 'Evan Pratama', 'Kesehatan', 'Keperawatan'),
(92, '235622030079', 'Fina Salsabila', 'Kesehatan', 'Kesehatan Masyarakat'),
(93, '235622030080', 'Garry Wijaya', 'Kesehatan', 'Kesehatan Masyarakat'),
(94, '235622040081', 'Hilda Permata', 'Kesehatan', 'Gizi'),
(95, '235622040082', 'Irfan Maulana', 'Kesehatan', 'Gizi'),
(96, '235622010083', 'Jasmin Aulia', 'Kesehatan', 'Kebidanan'),
(97, '235622020084', 'Kamal Hakim', 'Kesehatan', 'Keperawatan'),
(98, '235622030085', 'Larasati Putri', 'Kesehatan', 'Kesehatan Masyarakat'),
(99, '235622040086', 'Miftah Ramadhan', 'Kesehatan', 'Gizi'),
(100, '235622020087', 'Nayla Zahra', 'Kesehatan', 'Keperawatan'),
(101, '235723010088', 'Oki Prabowo', 'Ilmu Sosial & Politik', 'Hubungan Internasional'),
(102, '235723010089', 'Putra Wirawan', 'Ilmu Sosial & Politik', 'Hubungan Internasional'),
(103, '235723020090', 'Qonita Maharani', 'Ilmu Sosial & Politik', 'Ilmu Komunikasi'),
(104, '235723020091', 'Rendi Saputra', 'Ilmu Sosial & Politik', 'Ilmu Komunikasi'),
(105, '235723030092', 'Siska Lestari', 'Ilmu Sosial & Politik', 'Administrasi Publik'),
(106, '235723030093', 'Taufik Hidayat', 'Ilmu Sosial & Politik', 'Administrasi Publik'),
(107, '235723040094', 'Uli Rahmawati', 'Ilmu Sosial & Politik', 'Sosiologi'),
(108, '235723040095', 'Vega Anggraini', 'Ilmu Sosial & Politik', 'Sosiologi'),
(109, '235723010096', 'Wira Prakoso', 'Ilmu Sosial & Politik', 'Hubungan Internasional'),
(110, '235723020097', 'Xenia Putri', 'Ilmu Sosial & Politik', 'Ilmu Komunikasi'),
(111, '235723030098', 'Yayan Firmansyah', 'Ilmu Sosial & Politik', 'Administrasi Publik'),
(112, '235723040099', 'Zivana Aulia', 'Ilmu Sosial & Politik', 'Sosiologi'),
(113, '235723020100', 'Aldo Ramadhan', 'Ilmu Sosial & Politik', 'Ilmu Komunikasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `created_at`) VALUES
(1, 'admin', 'scrypt:32768:8:1$sIuKspB7htvuqF8O$2e16b23fb08baecd1f0d919fef0e8bcc612fd10c324ab01907c363e70d84b3721025b4732e91102c75c0f3dc0dd8db3f9622cb3b9e7d866be8cad91ff4be1f73', 'admin', '2026-01-02 10:34:19'),
(2, 'user', 'scrypt:32768:8:1$bAXUUgwLaW4j94Ud$55b30044815301d76de4492b24761bffac481c02d5bb7c04a4fbdb7d2f7f526b213ee40a58566a6e0e0b41c658bb7856732e79c31d9abe7ab83b0614c2767492', 'user', '2026-01-02 11:27:05');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
