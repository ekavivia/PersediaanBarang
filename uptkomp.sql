-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 22 Jan 2019 pada 16.45
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `uptkomp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode_barang` varchar(10) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `stok` int(5) NOT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama`, `jenis`, `stok`) VALUES
('B001', 'Keyboard', 'USB', 99),
('B002', 'Keyboard', 'PS2', 98),
('B003', 'Mouse', 'USB', 100),
('B004', 'Mouse', 'PS2', 100),
('B005', 'Kabel Power', '-', 10),
('B006', 'Kabel VGA', '-', 9),
('B007', 'Power Supply', '-', 10),
('B008', 'Mouse Pad', '-', 9),
('B009', 'CMOS', '-', 10),
('B010', 'Screen Guard', '-', 0),
('B011', 'Kabel Satta', '-', 1),
('B012', 'Label', '-', 0),
('B013', 'RAM', '4GB', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE IF NOT EXISTS `barang_keluar` (
  `kode_detail_keluar` int(10) NOT NULL AUTO_INCREMENT,
  `kode_brg_keluar` varchar(10) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(5) NOT NULL,
  `keterangan` varchar(25) NOT NULL,
  PRIMARY KEY (`kode_detail_keluar`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`kode_detail_keluar`, `kode_brg_keluar`, `kode_barang`, `tanggal`, `jumlah`, `keterangan`) VALUES
(11, 'P001', 'B001', '2019-01-18', 1, 'LAB 1'),
(12, 'P001', 'B002', '2019-01-18', 1, 'LAB 2'),
(13, 'P002', 'B006', '2019-01-18', 1, 'LAB 6'),
(14, 'P002', 'B008', '2019-01-18', 1, 'LAB 4'),
(15, 'P002', 'B002', '2019-01-18', 1, 'LAB 1'),
(16, 'P003', 'B013', '2019-01-18', 3, 'LAB 3');

--
-- Trigger `barang_keluar`
--
DROP TRIGGER IF EXISTS `TG_KELUAR`;
DELIMITER //
CREATE TRIGGER `TG_KELUAR` AFTER INSERT ON `barang_keluar`
 FOR EACH ROW begin
update barang set stok=stok-NEW.jumlah
where kode_barang=NEW.kode_barang;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE IF NOT EXISTS `barang_masuk` (
  `kode_detail_masuk` int(10) NOT NULL AUTO_INCREMENT,
  `kode_brg_masuk` varchar(10) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(5) NOT NULL,
  PRIMARY KEY (`kode_detail_masuk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`kode_detail_masuk`, `kode_brg_masuk`, `kode_barang`, `tanggal`, `jumlah`) VALUES
(34, 'P001', 'B001', '2019-01-18', 100),
(35, 'P001', 'B002', '2019-01-18', 100),
(36, 'P001', 'B003', '2019-01-18', 100),
(37, 'P001', 'B004', '2019-01-18', 100),
(38, 'P002', 'B005', '2019-01-18', 10),
(39, 'P002', 'B006', '2019-01-18', 10),
(40, 'P002', 'B007', '2019-01-18', 10),
(41, 'P002', 'B008', '2019-01-18', 10),
(42, 'P002', 'B009', '2019-01-18', 10),
(43, 'P003', 'B011', '2019-01-18', 1),
(44, 'P004', 'B013', '2019-01-18', 10);

--
-- Trigger `barang_masuk`
--
DROP TRIGGER IF EXISTS `TG_MASUK`;
DELIMITER //
CREATE TRIGGER `TG_MASUK` AFTER INSERT ON `barang_masuk`
 FOR EACH ROW begin
update barang set stok=stok+NEW.jumlah
where kode_barang=NEW.kode_barang;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `status`) VALUES
('admin', '202cb962ac59075b964b07152d234b70', ''),
('vivi', '202cb962ac59075b964b07152d234b70', ''),
('eka', '202cb962ac59075b964b07152d234b70', ''),
('evir', '202cb962ac59075b964b07152d234b70', ''),
('kijeong', '202cb962ac59075b964b07152d234b70', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
