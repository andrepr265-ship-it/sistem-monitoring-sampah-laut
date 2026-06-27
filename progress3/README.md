# PROJECT BASED LEARNING (PjBL)
## PROGRES 3 – PERANCANGAN BASIS DATA
## SISTEM MONITORING SAMPAH LAUT



Mata Kuliah: Sistem Basis Data
Dosen: Ferdi Chahyadi M.Kom
Disusun oleh:
Kelompok 8
| Nama | NIM |
| --- | --- |
| Andre Zulyan Pratama | 2501020115 |
| Putra Ali Syahbana | 2501020088 |
| Rizky Akbar Hidayatullah | 2501020113 |
| M. Riquelma Zidan | 2501020110 |

Program Studi: Sistem Basis Data
Tahun 2025/2026
Deadline Progres 3: 28 Juni 2026

SCRIPT SQL DDL (CREATE DATABASE & CREATE TABLE)
Berikut adalah script Data Definition Language (DDL) untuk membuat database dan seluruh tabel berdasarkan Kamus Data pada Progres 2.

### Pembuatan Database
CREATE DATABASE sistem_monitoring_sampah_laut;
USE sistem_monitoring_sampah_laut;

Tabel lokasi
CREATE TABLE lokasi (
id_lokasi INT AUTO_INCREMENT PRIMARY KEY,
nama_lokasi VARCHAR(100) NOT NULL,
latitude DECIMAL(9,6) NOT NULL,
longitude DECIMAL(9,6) NOT NULL,
jenis_perairan VARCHAR(30) NOT NULL,
provinsi VARCHAR(50) NOT NULL,
kabupaten VARCHAR(50) NOT NULL,
deskripsi TEXT NULL
);
Tabel jenis_sampah
CREATE TABLE jenis_sampah (
id_jenis INT AUTO_INCREMENT PRIMARY KEY,
nama_jenis VARCHAR(50) NOT NULL,
kategori VARCHAR(30) NOT NULL,
tingkat_bahaya VARCHAR(20) NOT NULL,
deskripsi TEXT NULL
);
Tabel petugas
CREATE TABLE petugas (
id_petugas INT AUTO_INCREMENT PRIMARY KEY,
nama VARCHAR(100) NOT NULL,
no_identitas VARCHAR(20) UNIQUE NOT NULL,
jabatan VARCHAR(50) NOT NULL,
unit_kerja VARCHAR(100) NOT NULL,
kontak VARCHAR(20) NULL,
wilayah_tugas VARCHAR(100) NULL
);
Tabel sumber_sampah
CREATE TABLE sumber_sampah (
id_sumber INT AUTO_INCREMENT PRIMARY KEY,
jenis_sumber VARCHAR(30) NOT NULL,
deskripsi TEXT NULL
);
Tabel alat_pemantauan
CREATE TABLE alat_pemantauan (
id_alat INT AUTO_INCREMENT PRIMARY KEY,
nama_alat VARCHAR(50) NOT NULL,
jenis_alat VARCHAR(30) NOT NULL,
kondisi VARCHAR(20) NOT NULL,
tanggal_kalibrasi DATE NULL
);
Tabel pemantauan
CREATE TABLE pemantauan (
id_pemantauan INT AUTO_INCREMENT PRIMARY KEY,
tanggal_waktu DATETIME NOT NULL,
id_lokasi INT NOT NULL,
kondisi_cuaca VARCHAR(30) NULL,
kondisi_arus VARCHAR(30) NULL,
catatan_umum TEXT NULL,
FOREIGN KEY (id_lokasi) REFERENCES lokasi(id_lokasi) ON DELETE RESTRICT ON UPDATE CASCADE
);
Tabel hasil_pemantauan
CREATE TABLE hasil_pemantauan (
id_hasil INT AUTO_INCREMENT PRIMARY KEY,
id_pemantauan INT NOT NULL,
id_jenis INT NOT NULL,
id_sumber INT NULL,
volume_m3 DECIMAL(8,2) NULL,
berat_kg DECIMAL(8,2) NULL,
jumlah_item INT NULL,
foto_path VARCHAR(255) NULL,
FOREIGN KEY (id_pemantauan) REFERENCES pemantauan(id_pemantauan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_jenis) REFERENCES jenis_sampah(id_jenis) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_sumber) REFERENCES sumber_sampah(id_sumber) ON DELETE SET NULL ON UPDATE CASCADE
);
Tabel pembersihan
CREATE TABLE pembersihan (
id_pembersihan INT AUTO_INCREMENT PRIMARY KEY,
id_pemantauan INT NOT NULL,
tanggal_pelaksanaan DATE NOT NULL,
volume_terangkut DECIMAL(8,2) NULL,
tujuan_pembuangan VARCHAR(100) NULL,
catatan TEXT NULL,
FOREIGN KEY (id_pemantauan) REFERENCES pemantauan(id_pemantauan) ON DELETE RESTRICT ON UPDATE CASCADE
);
Tabel pemantauan_alat (Junction)
CREATE TABLE pemantauan_alat (
id_pemantauan INT NOT NULL,
id_alat INT NOT NULL,
kondisi_pakai VARCHAR(20) NULL,
PRIMARY KEY (id_pemantauan, id_alat),
FOREIGN KEY (id_pemantauan) REFERENCES pemantauan(id_pemantauan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_alat) REFERENCES alat_pemantauan(id_alat) ON DELETE RESTRICT ON UPDATE CASCADE
);
Tabel pembersihan_petugas (Junction)
CREATE TABLE pembersihan_petugas (
id_pembersihan INT NOT NULL,
id_petugas INT NOT NULL,
peran_petugas VARCHAR(30) NULL,
PRIMARY KEY (id_pembersihan, id_petugas),
FOREIGN KEY (id_pembersihan) REFERENCES pembersihan(id_pembersihan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas) ON DELETE RESTRICT ON UPDATE CASCADE
);
Tabel pemantauan_petugas (Junction)
CREATE TABLE pemantauan_petugas (
id_pemantauan INT NOT NULL,
id_petugas INT NOT NULL,
peran_dalam_pemantauan VARCHAR(30) NULL,
PRIMARY KEY (id_pemantauan, id_petugas),
FOREIGN KEY (id_pemantauan) REFERENCES pemantauan(id_pemantauan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas) ON DELETE RESTRICT ON UPDATE CASCADE
);

CONSTRAINT (PK, FK, UNIQUE, NOT NULL)

Penerapan constraint telah diintegrasikan langsung ke dalam script DDL di atas. Berikut adalah ringkasan pemetaannya untuk memastikan integritas data:
PRIMARY KEY (PK): AUTO_INCREMENT diterapkan pada seluruh tabel master dan transaksi untuk memastikan setiap baris memiliki identitas unik. Tabel junction menggunakan Composite Primary Key.
FOREIGN KEY (FK): Menerapkan referential integrity. Menggunakan ON DELETE CASCADE untuk data turunan (seperti hasil_pemantauan jika pemantauan dihapus), dan ON DELETE RESTRICT untuk data master agar tidak terhapus jika masih direferensikan.
UNIQUE: Diterapkan pada no_identitas di tabel petugas untuk mencegah duplikasi nomor induk/NIK petugas.
NOT NULL: Diterapkan pada atribut-atribut vital (seperti nama_lokasi, tanggal_waktu, id_lokasi pada pemantauan) untuk mencegah data kosong yang dapat merusak analisis.


DATA UJI (INSERT)

### Insert Data Master
INSERT INTO lokasi (nama_lokasi, latitude, longitude, jenis_perairan, provinsi, kabupaten, deskripsi) VALUES
('Pantai Nongsa', 1.150000, 104.083000, 'Pesisir', 'Kepulauan Riau', 'Batam', 'Area pantai dekat resort'),
('Pantai Trikora', 1.210000, 104.250000, 'Pesisir', 'Kepulauan Riau', 'Batam', 'Area wisata pantai timur'),
('Perairan Selat Malaka', 1.300000, 103.900000, 'Laut Terbuka', 'Kepulauan Riau', 'Batam', 'Jalur pelayaran internasional');

INSERT INTO jenis_sampah (nama_jenis, kategori, tingkat_bahaya, deskripsi) VALUES
('Botol Plastik', 'Anorganik', 'Sedang', 'Botol minuman berbahan plastik'),
('Sisa Makanan', 'Organik', 'Rendah', 'Sisa makanan rumah tangga/wisatawan'),
('Minyak Hitam', 'B3', 'Tinggi', 'Limbah minyak dari kapal'),
('Pecahan Kaca', 'Anorganik', 'Tinggi', 'Pecahan botol atau kaca tajam');

INSERT INTO petugas (nama, no_identitas, jabatan, unit_kerja, kontak, wilayah_tugas) VALUES
('Andre Zulyan Pratama', 'PTG-001', 'Ketua Tim', 'DLH Batam', '081234567890', 'Batam Timur'),
('Putra Ali Syahbana', 'PTG-002', 'Anggota', 'Relawan Pesisir', '081234567891', 'Batam Timur'),
('Rizky Akbar Hidayatullah', 'PTG-003', 'Analis Data', 'DLH Batam', '081234567892', 'Batam Utara');

INSERT INTO sumber_sampah (jenis_sumber, deskripsi) VALUES
('Domestik', 'Sampah dari aktivitas rumah tangga/pantai'),
('Pariwisata', 'Sampah dari pengunjung wisata pantai'),
('Kapal', 'Limbah dari aktivitas pelayaran/kapal');

INSERT INTO alat_pemantauan (nama_alat, jenis_alat, kondisi, tanggal_kalibrasi) VALUES
('GPS Map 78s', 'Navigasi', 'Baik', '2026-01-15'),
('Drone DJI Mavic', 'Pemetaan Udara', 'Baik', '2026-02-10'),
('Water Quality Meter', 'Pengukur Kualitas Air', 'Perlu Kalibrasi', '2025-06-01');

### Insert Data Transaksi
INSERT INTO pemantauan (tanggal_waktu, id_lokasi, kondisi_cuaca, kondisi_arus, catatan_umum) VALUES
('2026-06-14 08:00:00', 1, 'Cerah', 'Lambat', 'Pemantauan rutin pagi hari'),
('2026-06-15 09:30:00', 2, 'Berawan', 'Sedang', 'Banyak sampah pasca akhir pekan'),
('2026-06-16 07:00:00', 3, 'Cerah', 'Cepat', 'Ditemukan tumpahan minyak');

INSERT INTO hasil_pemantauan (id_pemantauan, id_jenis, id_sumber, volume_m3, berat_kg, jumlah_item, foto_path) VALUES
(1, 1, 2, 15.0, 22.5, 150, '/foto/nongsa_plastik.jpg'),
(1, 2, 2, 8.0, 10.0, 50, '/foto/nongsa_organik.jpg'),
(2, 1, 1, 25.0, 35.0, 200, '/foto/trikora_plastik.jpg'),
(2, 4, 1, 2.0, 5.0, 15, '/foto/trikora_kaca.jpg'),
(3, 3, 3, 50.0, 45.0, 1, '/foto/malaka_minyak.jpg');

INSERT INTO pembersihan (id_pemantauan, tanggal_pelaksanaan, volume_terangkut, tujuan_pembuangan, catatan) VALUES
(1, '2026-06-14 14:00:00', 20.0, 'TPA Batu Ampar', 'Pembersihan sore hari'),
(2, '2026-06-16 08:00:00', 25.0, 'TPA Batu Ampar', 'Kaca dipisahkan dengan aman');

### Insert Data Junction (Relasi N:M)
INSERT INTO pemantauan_petugas (id_pemantauan, id_petugas, peran_dalam_pemantauan) VALUES
(1, 1, 'Ketua Tim'), (1, 2, 'Pencatat'),
(2, 1, 'Ketua Tim'), (2, 3, 'Fotografer'),
(3, 3, 'Analis Lapangan');

INSERT INTO pemantauan_alat (id_pemantauan, id_alat, kondisi_pakai) VALUES
(1, 1, 'Baik'), (1, 2, 'Baik'),
(2, 1, 'Baik'), (2, 2, 'Baik'),
(3, 3, 'Baik');

INSERT INTO pembersihan_petugas (id_pembersihan, id_petugas, peran_petugas) VALUES
(1, 1, 'Koordinator'), (1, 2, 'Pengangkut'),
(2, 1, 'Koordinator'), (2, 3, 'Pengangkut');

QUERY SQL
Berikut adalah 15 query yang mencakup operasi dasar, JOIN, Agregasi, Subquery, dan Modifikasi Data.
#### Query 1: Menampilkan seluruh data lokasi pemantauan
SELECT id_lokasi, nama_lokasi, jenis_perairan, kabupaten FROM lokasi;
#### Query 2: Menampilkan jenis sampah dengan tingkat bahaya 'Tinggi'
SELECT nama_jenis, kategori, tingkat_bahaya FROM jenis_sampah WHERE tingkat_bahaya = 'Tinggi';
#### Query 3: JOIN - Menampilkan hasil pemantauan lengkap dengan nama lokasi dan jenis sampah
SELECT p.tanggal_waktu, l.nama_lokasi, js.nama_jenis, hp.berat_kg 
FROM hasil_pemantauan hp
JOIN pemantauan p ON hp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi
JOIN jenis_sampah js ON hp.id_jenis = js.id_jenis;
#### Query 4: JOIN 3 Tabel - Menampilkan petugas yang terlibat dalam suatu sesi pemantauan beserta lokasinya
SELECT pt.nama AS nama_petugas, pp.peran_dalam_pemantauan, l.nama_lokasi, p.tanggal_waktu
FROM pemantauan_petugas pp
JOIN petugas pt ON pp.id_petugas = pt.id_petugas
JOIN pemantauan p ON pp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi;
#### Query 5: Agregasi - Menghitung total berat sampah (kg) berdasarkan jenis sampah
SELECT js.nama_jenis, SUM(hp.berat_kg) AS total_berat_kg
FROM hasil_pemantauan hp
JOIN jenis_sampah js ON hp.id_jenis = js.id_jenis
GROUP BY js.nama_jenis
ORDER BY total_berat_kg DESC;
#### Query 6: Agregasi & HAVING - Menampilkan lokasi dengan total volume sampah > 20 m3
SELECT l.nama_lokasi, SUM(hp.volume_m3) AS total_volume_m3
FROM hasil_pemantauan hp
JOIN pemantauan p ON hp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi
GROUP BY l.nama_lokasi
HAVING total_volume_m3 > 20;
#### Query 7: Subquery - Menampilkan data petugas yang pernah terlibat dalam kegiatan pembersihan
SELECT nama, jabatan, unit_kerja 
FROM petugas 
WHERE id_petugas IN (SELECT DISTINCT id_petugas FROM pembersihan_petugas);
#### Query 8: LEFT JOIN - Menampilkan lokasi dan jumlah kegiatan pembersihannya (termasuk yang belum pernah dibersihkan)
SELECT l.nama_lokasi, COUNT(pb.id_pembersihan) AS jumlah_kegiatan_bersih
FROM lokasi l
LEFT JOIN pemantauan p ON l.id_lokasi = p.id_lokasi
LEFT JOIN pembersihan pb ON p.id_pemantauan = pb.id_pemantauan
GROUP BY l.nama_lokasi;
#### Query 9: Filter Tanggal - Menampilkan pemantauan yang dilakukan pada bulan Juni 2026
SELECT id_pemantauan, tanggal_waktu, kondisi_cuaca 
FROM pemantauan 
WHERE MONTH(tanggal_waktu) = 6 AND YEAR(tanggal_waktu) = 2026;
#### Query 10: Complex JOIN - Laporan Rekapitulasi Sampah per Sumber
SELECT ss.jenis_sumber, js.nama_jenis, SUM(hp.jumlah_item) AS total_item, SUM(hp.berat_kg) AS total_berat
FROM hasil_pemantauan hp
JOIN sumber_sampah ss ON hp.id_sumber = ss.id_sumber
JOIN jenis_sampah js ON hp.id_jenis = js.id_jenis
GROUP BY ss.jenis_sumber, js.nama_jenis
ORDER BY ss.jenis_sumber;
#### Query 11: UPDATE - Mengubah kondisi alat pemantauan setelah digunakan
UPDATE alat_pemantauan 
SET kondisi = 'Perlu Perawatan', tanggal_kalibrasi = NULL 
WHERE id_alat = 2;
#### Query 12: UPDATE - Menambahkan catatan umum pada sesi pemantauan
UPDATE pemantauan 
SET catatan_umum = 'Pemantauan rutin pagi hari, ditemukan banyak sampah plastik domestik.' 
WHERE id_pemantauan = 1;
#### Query 13: DELETE - Menghapus data uji pembersihan (Skenario pembatalan kegiatan)
DELETE FROM pembersihan WHERE id_pembersihan = 2;
-- Catatan: Karena menggunakan ON DELETE CASCADE, data di pembersihan_petugas dengan id_pembersihan=2 akan otomatis terhapus.
#### Query 14: Agregasi - Rata-rata berat sampah per sesi pemantauan
SELECT p.id_pemantauan, l.nama_lokasi, AVG(hp.berat_kg) AS rata_rata_berat_per_jenis
FROM hasil_pemantauan hp
JOIN pemantauan p ON hp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi
GROUP BY p.id_pemantauan, l.nama_lokasi;
#### Query 15: INSERT - Menambahkan data petugas baru (Operasional)
INSERT INTO petugas (nama, no_identitas, jabatan, unit_kerja, kontak, wilayah_tugas) 
VALUES ('M. Riquelma Zidan', 'PTG-004', 'Relawan', 'Komunitas Laut Bersih', '081234567893', 'Batam Selatan');

SKENARIO PENGUJIAN
#### Skenario 1: Uji Constraint UNIQUE
Tujuan: Membuktikan bahwa kolom no_identitas di tabel petugas tidak boleh ada yang sama (duplikat). Query yang dijalankan:

-- Mencoba insert petugas baru dengan no_identitas 'PTG-001' yang sudah ada di data uji
INSERT INTO petugas (nama, no_identitas, jabatan, unit_kerja, kontak, wilayah_tugas) 
VALUES ('Petugas Test', 'PTG-001', 'Tester', 'Unit Test', '08111111111', 'Test');

#### Skenario 2: Uji Constraint FOREIGN KEY
Tujuan: Membuktikan bahwa data anak (hasil_pemantauan) tidak bisa di-insert jika data induk (pemantauan) tidak ada. Query yang dijalankan:

-- Mencoba insert hasil pemantauan dengan id_pemantauan = 99 (padahal di tabel pemantauan hanya ada id 1, 2, 3)
INSERT INTO hasil_pemantauan (id_pemantauan, id_jenis, id_sumber, volume_m3, berat_kg, jumlah_item) 
VALUES (99, 1, 1, 10.0, 15.0, 50);


#### Skenario 3: Uji CASCADE DELETE
Tujuan: Membuktikan bahwa jika data induk (pemantauan) dihapus, data anak yang berelasi akan otomatis terhapus. Query yang dijalankan:

-- 1. Cek data hasil pemantauan untuk id 3 sebelum dihapus (sebagai bukti awal)
SELECT * FROM hasil_pemantauan WHERE id_pemantauan = 3;

-- 2. Eksekusi Hapus data pemantauan id 3
DELETE FROM pemantauan WHERE id_pemantauan = 3;

-- 3. Cek kembali data hasil pemantauan untuk id 3 (harusnya hasilnya kosong/0 rows)
SELECT * FROM hasil_pemantauan WHERE id_pemantauan = 3;

#### Skenario 4: Uji RESTRICT DELETE
Tujuan: Membuktikan bahwa data induk (lokasi) tidak bisa dihapus jika masih digunakan oleh data anak (pemantauan). Query yang dijalankan:

-- Mencoba menghapus lokasi id 1 (Pantai Nongsa), padahal masih direferensikan oleh pemantauan id 1
DELETE FROM lokasi WHERE id_lokasi = 1;

#### Skenario 5: Uji Query Laporan (JOIN & Agregasi)
Tujuan: Membuktikan query untuk laporan rekapitulasi berjalan dengan benar. Query yang dijalankan: (Ini adalah Query 5 dan Query 6 dari daftar 15 query)
Query 5 (Total Berat per Jenis):

SELECT js.nama_jenis, SUM(hp.berat_kg) AS total_berat_kg
FROM hasil_pemantauan hp
JOIN jenis_sampah js ON hp.id_jenis = js.id_jenis
GROUP BY js.nama_jenis
ORDER BY total_berat_kg DESC;

Query 6 (Lokasi dengan Volume > 20 m3):

SELECT l.nama_lokasi, SUM(hp.volume_m3) AS total_volume_m3
FROM hasil_pemantauan hp
JOIN pemantauan p ON hp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi
GROUP BY l.nama_lokasi
HAVING total_volume_m3 > 20;

#### Skenario 6: Uji Query Modifikasi (UPDATE)
Tujuan: Membuktikan bahwa data di database dapat diperbarui (update) dengan benar. Query yang dijalankan: (Ini adalah Query 11 dari daftar 15 query)

-- 1. Cek kondisi alat id 3 sebelum diupdate
SELECT id_alat, nama_alat, kondisi FROM alat_pemantauan WHERE id_alat = 2;

-- 2. Eksekusi Update
UPDATE alat_pemantuan 
SET kondisi = 'Perlu Perawatan', tanggal_kalibrasi = NULL 
WHERE id_alat = 3;

-- 3. Cek kondisi alat id 3 sesudah diupdate (untuk membuktikan perubahan)
SELECT id_alat, nama_alat, kondisi, tanggal_kalibrasi FROM alat_pemantauan WHERE id_alat = 2;

SCREENSHOT HASIL IMPLEMENTASI DAN QUERY






Struktur Database dan Tabel
Daftar Database yang Dibuat 
Gambar 6.1. Database sistem_monitoring_sampah_laut Berhasil Dibuat











Tabel dan Struktur

Gambar 6.2. Tabel lokasi dan struktur 


Gambar 6.3. Tabel jenis_sampah dan struktur


Gambar 6.4. Tabel petugas dan struktur


Gambar 6.5. Tabel sumber_sampah struktur


Gambar 6.6. Tabel alat_pemantauan dan struktur


Gambar 6.7. Tabel hasil_pemantauan dan struktur


Gambar 6.8. Tabel pembersihan dan struktur


Gambar 6.9. Tabel pembersihan dan struktur


Gambar 6.10. Tabel alat_pemantauan_alat dan struktur


Gambar 6.11. Tabel pembersihan_petugas dan struktur


Gambar 6.12. Tabel pemantauan_petugas dan struktur

Bukti Data Uji (INSERT) Berhasil Dimasukkan
Data Master 
Gambar 6.13. Data Tabel Lokasi (3 Record)

Gambar 6.14. Data Tabel Jenis Sampah (4 Record)

Gambar 6.15. Data Tabel Petugas (3 Record)
Gambar 6.16. Data Tabel Sumber Sampah (3 Record)

Gambar 6.27. Data Tabel Alat Pemantauan (3 Record)

Data Transaksi 
Gambar 6.18. Data Tabel Pemantauan (3 Record)
Gambar 6.19. Data Tabel Hasil Pemantauan (5 Record)

Gambar 6.20. Data Tabel Pembersihan (2 Record)

Gambar 6.21. Data Tabel Pemantauan Petugas (5 Record)
Gambar 6.22. Data Tabel Pemantauan Alat (5 Record)

Gambar 6.23. Data Tabel Pembersihan Petugas (4 Record)

Bukti Skenario Pengujian Constraint
Skenario 1 – Uji Constraint UNIQUE 
Gambar 6.24. Hasil Uji Constraint UNIQUE – Error Duplicate Entry

Skenario 2 – Uji Constraint FOREIGN KEY 
Gambar 6.25. Hasil Uji Constraint FOREIGN KEY – Error Child Row








Skenario 3 – Uji CASCADE DELETE 
Gambar 6.26. Hasil Uji ON DELETE CASCADE – Data Anak Otomatis Terhapus

Skenario 4 – Uji RESTRICT DELETE 
Gambar 6.27. Hasil Uji ON DELETE RESTRICT – Data Indak Tidak Bisa Dihapus

Skenario 5 – Uji Query JOIN dan Agregasi
Query 5 – Total Berat Sampah per Jenis:

Gambar 6.28. Output Query 5 – Total Berat Sampah per Jenis

Query 6 – Lokasi dengan Volume > 20 m³:

Gambar 6.29. Output Query 6 – Lokasi dengan Volume Sampah > 20 m³






Skenario 6 – Uji Query UPDATE
Query 11 – UPDATE Kondisi Alat:

Gambar 6.30. Output Query 11 – Pembuktian UPDATE Data Alat

Hasil Eksekusi 15 Query SQL
Query 1 – Menampilkan Seluruh Data Lokasi 
Gambar 6.31. Output Query 1 – Daftar Lokasi Pemantauan

Query 2 – Filter Jenis Sampah Berbahaya Tinggi 
Gambar 6.32. Output Query 2 – Jenis Sampah Tingkat Bahaya Tinggi

Query 3 – JOIN Tabel Hasil Pemantauan dengan Lokasi & Jenis Sampah 
Gambar 6.33. Output Query 3 – Laporan Hasil Pemantauan Lengkap

Query 4 – JOIN 4 Tabel Petugas dalam Pemantauan 
Gambar 6.34. Output Query 4 – Petugas yang Terlibat dalam Pemantauan

Query 5 – Agregasi Total Berat Sampah per Jenis 
Gambar 6.35. Output Query 5 – Total Berat Sampah per Jenis

Query 6 – Agregasi dengan HAVING (Volume > 20 m³) 
Gambar 6.36. Output Query 6 – Lokasi dengan Volume Sampah > 20 m³

Query 7 – Subquery Petugas yang Pernah Pembersihan 

Gambar 6.37. Output Query 7 – Petugas Aktif dalam Pembersihan


Query 8 – LEFT JOIN Lokasi dan Jumlah Pembersihan 
Gambar 6.38. Output Query 8 – Status Pembersihan per Lokasi

Query 9 – Filter Tanggal Pemantauan (Juni 2026) 

Gambar 6.39. Output Query 9 – Pemantauan Bulan Juni 2026

Query 10 – Complex JOIN Rekapitulasi per Sumber & Jenis 
Gambar 6.40. Output Query 10 – Rekapitulasi Sampah per Sumber dan Jenis

Query 11 – UPDATE Kondisi Alat 
Gambar 6.41. Output Query 11 – Pembuktian UPDATE Data Alat
Query 12 – UPDATE Catatan Umum Pemantauan 
Gambar 6.42. Output Query 12 – Update Catatan Pemantauan

Query 13 – DELETE Pembersihan (Uji CASCADE Sekunder) 
Gambar 6.43. Output Query 13 – Pembuktian DELETE dengan CASCADE

Query 14 – Agregasi Rata-rata Berat per Sesi Pemantauan 
Gambar 6.44. Output Query 14 – Rata-rata Berat Sampah per Sesi
Query 15 – INSERT Petugas Baru 
Gambar 6.45. Output Query 15 – Pembuktian INSERT Petugas Baru
