-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sistem_monitoring_sampah_laut
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alat_pemantauan`
--

DROP TABLE IF EXISTS `alat_pemantauan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alat_pemantauan` (
  `id_alat` int(11) NOT NULL AUTO_INCREMENT,
  `nama_alat` varchar(50) NOT NULL,
  `jenis_alat` varchar(30) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `tanggal_kalibrasi` date DEFAULT NULL,
  PRIMARY KEY (`id_alat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alat_pemantauan`
--

LOCK TABLES `alat_pemantauan` WRITE;
/*!40000 ALTER TABLE `alat_pemantauan` DISABLE KEYS */;
INSERT INTO `alat_pemantauan` VALUES (1,'GPS Map 78s','Navigasi','Baik','2026-01-15'),(2,'Drone DJI Mavic','Pemetaan Udara','Perlu Perawatan',NULL),(3,'Water Quality Meter','Pengukur Kualitas Air','Perlu Kalibrasi','2025-06-01');
/*!40000 ALTER TABLE `alat_pemantauan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hasil_pemantauan`
--

DROP TABLE IF EXISTS `hasil_pemantauan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hasil_pemantauan` (
  `id_hasil` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemantauan` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_sumber` int(11) DEFAULT NULL,
  `volume_m3` decimal(8,2) DEFAULT NULL,
  `berat_kg` decimal(8,2) DEFAULT NULL,
  `jumlah_item` int(11) DEFAULT NULL,
  `foto_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hasil`),
  KEY `id_pemantauan` (`id_pemantauan`),
  KEY `id_jenis` (`id_jenis`),
  KEY `id_sumber` (`id_sumber`),
  CONSTRAINT `hasil_pemantauan_ibfk_1` FOREIGN KEY (`id_pemantauan`) REFERENCES `pemantauan` (`id_pemantauan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hasil_pemantauan_ibfk_2` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_sampah` (`id_jenis`) ON UPDATE CASCADE,
  CONSTRAINT `hasil_pemantauan_ibfk_3` FOREIGN KEY (`id_sumber`) REFERENCES `sumber_sampah` (`id_sumber`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasil_pemantauan`
--

LOCK TABLES `hasil_pemantauan` WRITE;
/*!40000 ALTER TABLE `hasil_pemantauan` DISABLE KEYS */;
INSERT INTO `hasil_pemantauan` VALUES (1,1,1,2,15.00,22.50,150,'/foto/nongsa_plastik.jpg'),(2,1,2,2,8.00,10.00,50,'/foto/nongsa_organik.jpg'),(3,2,1,1,25.00,35.00,200,'/foto/trikora_plastik.jpg'),(4,2,4,1,2.00,5.00,15,'/foto/trikora_kaca.jpg');
/*!40000 ALTER TABLE `hasil_pemantauan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_sampah`
--

DROP TABLE IF EXISTS `jenis_sampah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_sampah` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(50) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `tingkat_bahaya` varchar(20) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_sampah`
--

LOCK TABLES `jenis_sampah` WRITE;
/*!40000 ALTER TABLE `jenis_sampah` DISABLE KEYS */;
INSERT INTO `jenis_sampah` VALUES (1,'Botol Plastik','Anorganik','Sedang','Botol minuman berbahan plastik'),(2,'Sisa Makanan','Organik','Rendah','Sisa makanan rumah tangga/wisatawan'),(3,'Minyak Hitam','B3','Tinggi','Limbah minyak dari kapal'),(4,'Pecahan Kaca','Anorganik','Tinggi','Pecahan botol atau kaca tajam');
/*!40000 ALTER TABLE `jenis_sampah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokasi`
--

DROP TABLE IF EXISTS `lokasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lokasi` varchar(100) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `jenis_perairan` varchar(30) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`id_lokasi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokasi`
--

LOCK TABLES `lokasi` WRITE;
/*!40000 ALTER TABLE `lokasi` DISABLE KEYS */;
INSERT INTO `lokasi` VALUES (1,'Pantai Nongsa',1.150000,104.083000,'Pesisir','Kepulauan Riau','Batam','Area pantai dekat resort'),(2,'Pantai Trikora',1.210000,104.250000,'Pesisir','Kepulauan Riau','Batam','Area wisata pantai timur'),(3,'Perairan Selat Malaka',1.300000,103.900000,'Laut Terbuka','Kepulauan Riau','Batam','Jalur pelayaran internasional');
/*!40000 ALTER TABLE `lokasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemantauan`
--

DROP TABLE IF EXISTS `pemantauan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemantauan` (
  `id_pemantauan` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_waktu` datetime NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `kondisi_cuaca` varchar(30) DEFAULT NULL,
  `kondisi_arus` varchar(30) DEFAULT NULL,
  `catatan_umum` text DEFAULT NULL,
  PRIMARY KEY (`id_pemantauan`),
  KEY `id_lokasi` (`id_lokasi`),
  CONSTRAINT `pemantauan_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemantauan`
--

LOCK TABLES `pemantauan` WRITE;
/*!40000 ALTER TABLE `pemantauan` DISABLE KEYS */;
INSERT INTO `pemantauan` VALUES (1,'2026-06-14 08:00:00',1,'Cerah','Lambat','Pemantauan rutin pagi hari, ditemukan banyak sampah plastik domestik.'),(2,'2026-06-15 09:30:00',2,'Berawan','Sedang','Banyak sampah pasca akhir pekan');
/*!40000 ALTER TABLE `pemantauan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemantauan_alat`
--

DROP TABLE IF EXISTS `pemantauan_alat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemantauan_alat` (
  `id_pemantauan` int(11) NOT NULL,
  `id_alat` int(11) NOT NULL,
  `kondisi_pakai` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pemantauan`,`id_alat`),
  KEY `id_alat` (`id_alat`),
  CONSTRAINT `pemantauan_alat_ibfk_1` FOREIGN KEY (`id_pemantauan`) REFERENCES `pemantauan` (`id_pemantauan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemantauan_alat_ibfk_2` FOREIGN KEY (`id_alat`) REFERENCES `alat_pemantauan` (`id_alat`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemantauan_alat`
--

LOCK TABLES `pemantauan_alat` WRITE;
/*!40000 ALTER TABLE `pemantauan_alat` DISABLE KEYS */;
INSERT INTO `pemantauan_alat` VALUES (1,1,'Baik'),(1,2,'Baik'),(2,1,'Baik'),(2,2,'Baik');
/*!40000 ALTER TABLE `pemantauan_alat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemantauan_petugas`
--

DROP TABLE IF EXISTS `pemantauan_petugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemantauan_petugas` (
  `id_pemantauan` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `peran_dalam_pemantauan` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_pemantauan`,`id_petugas`),
  KEY `id_petugas` (`id_petugas`),
  CONSTRAINT `pemantauan_petugas_ibfk_1` FOREIGN KEY (`id_pemantauan`) REFERENCES `pemantauan` (`id_pemantauan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pemantauan_petugas_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemantauan_petugas`
--

LOCK TABLES `pemantauan_petugas` WRITE;
/*!40000 ALTER TABLE `pemantauan_petugas` DISABLE KEYS */;
INSERT INTO `pemantauan_petugas` VALUES (1,1,'Ketua Tim'),(1,2,'Pencatat'),(2,1,'Ketua Tim'),(2,3,'Fotografer');
/*!40000 ALTER TABLE `pemantauan_petugas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembersihan`
--

DROP TABLE IF EXISTS `pembersihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembersihan` (
  `id_pembersihan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemantauan` int(11) NOT NULL,
  `tanggal_pelaksanaan` date NOT NULL,
  `volume_terangkut` decimal(8,2) DEFAULT NULL,
  `tujuan_pembuangan` varchar(100) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  PRIMARY KEY (`id_pembersihan`),
  KEY `id_pemantauan` (`id_pemantauan`),
  CONSTRAINT `pembersihan_ibfk_1` FOREIGN KEY (`id_pemantauan`) REFERENCES `pemantauan` (`id_pemantauan`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembersihan`
--

LOCK TABLES `pembersihan` WRITE;
/*!40000 ALTER TABLE `pembersihan` DISABLE KEYS */;
INSERT INTO `pembersihan` VALUES (1,1,'2026-06-14',20.00,'TPA Batu Ampar','Pembersihan sore hari');
/*!40000 ALTER TABLE `pembersihan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembersihan_petugas`
--

DROP TABLE IF EXISTS `pembersihan_petugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembersihan_petugas` (
  `id_pembersihan` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `peran_petugas` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_pembersihan`,`id_petugas`),
  KEY `id_petugas` (`id_petugas`),
  CONSTRAINT `pembersihan_petugas_ibfk_1` FOREIGN KEY (`id_pembersihan`) REFERENCES `pembersihan` (`id_pembersihan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pembersihan_petugas_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembersihan_petugas`
--

LOCK TABLES `pembersihan_petugas` WRITE;
/*!40000 ALTER TABLE `pembersihan_petugas` DISABLE KEYS */;
INSERT INTO `pembersihan_petugas` VALUES (1,1,'Koordinator'),(1,2,'Pengangkut');
/*!40000 ALTER TABLE `pembersihan_petugas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petugas`
--

DROP TABLE IF EXISTS `petugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `no_identitas` varchar(20) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `unit_kerja` varchar(100) NOT NULL,
  `kontak` varchar(20) DEFAULT NULL,
  `wilayah_tugas` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_petugas`),
  UNIQUE KEY `no_identitas` (`no_identitas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petugas`
--

LOCK TABLES `petugas` WRITE;
/*!40000 ALTER TABLE `petugas` DISABLE KEYS */;
INSERT INTO `petugas` VALUES (1,'Andre Zulyan Pratama','PTG-001','Ketua Tim','DLH Batam','081234567890','Batam Timur'),(2,'Putra Ali Syahbana','PTG-002','Anggota','Relawan Pesisir','081234567891','Batam Timur'),(3,'Rizky Akbar Hidayatullah','PTG-003','Analis Data','DLH Batam','081234567892','Batam Utara'),(5,'M. Riquelma Zidan','PTG-004','Relawan','Komunitas Laut Bersih','081234567893','Barelang');
/*!40000 ALTER TABLE `petugas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sumber_sampah`
--

DROP TABLE IF EXISTS `sumber_sampah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sumber_sampah` (
  `id_sumber` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_sumber` varchar(30) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`id_sumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sumber_sampah`
--

LOCK TABLES `sumber_sampah` WRITE;
/*!40000 ALTER TABLE `sumber_sampah` DISABLE KEYS */;
INSERT INTO `sumber_sampah` VALUES (1,'Domestik','Sampah dari aktivitas rumah tangga/pantai'),(2,'Pariwisata','Sampah dari pengunjung wisata pantai'),(3,'Kapal','Limbah dari aktivitas pelayaran/kapal');
/*!40000 ALTER TABLE `sumber_sampah` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-27 21:23:04
