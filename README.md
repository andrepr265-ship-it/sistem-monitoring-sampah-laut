# Sistem Monitoring Sampah Laut
**Project Based Learning (PjBL) - Progres 1: Analisis Kebutuhan Sistem**  
**Mata Kuliah:** Sistem Basis Data  
**Dosen Pengampu:** Ferdi Chahyadi  
**Program Studi:** Sistem Basis Data  
**Tahun Akademik:** 2025/2026  
**Deadline Progres 1:** 15 Juni 2026  

---

## Anggota Kelompok 8
| No | Nama | NIM |
|:--:|:---|:---|
| 1 | Andre Zulyan Pratama | 2501020115 |
| 2 | Putra Ali Syahbana | 2501020088 |
| 3 | Rizky Akbar Hidayatullah | 2501020113 |
| 4 | M. Riquelma Zidan | 2501020110 |

---

## Daftar Isi
1. [Deskripsi Studi Kasus](#1-deskripsi-studi-kasus)
2. [Latar Belakang dan Tujuan Sistem](#2-latar-belakang-dan-tujuan-sistem)
3. [Identifikasi Aktor](#3-identifikasi-aktor)
4. [Kebutuhan Fungsional](#4-kebutuhan-fungsional)
5. [Kebutuhan Data](#5-kebutuhan-data)
6. [Diagram Proses (Use Case)](#6-diagram-proses-use-case)
7. [Pembagian Tugas Anggota](#7-pembagian-tugas-anggota)

---

## 1. Deskripsi Studi Kasus
Sampah laut merupakan salah satu permasalahan lingkungan yang serius di wilayah pesisir dan kepulauan Indonesia, termasuk di Kota Batam yang berbatasan langsung dengan jalur pelayaran internasional. Tumpukan sampah plastik, limbah rumah tangga, dan sampah dari aktivitas pelayaran sering ditemukan terdampar di pantai maupun mengapung di perairan, namun pencatatan dan pemantauan kondisi sampah laut tersebut selama ini masih dilakukan secara manual dan tidak terstruktur.

Pencatatan manual menggunakan kertas atau spreadsheet sederhana menyebabkan data lokasi, jenis, volume, dan waktu pengambilan sampah sulit diakses, mudah hilang, dan tidak dapat diolah menjadi informasi yang berguna untuk pengambilan keputusan. Akibatnya, instansi terkait kesulitan mengidentifikasi area dengan tingkat pencemaran tinggi (*hotspot*) serta mengukur efektivitas kegiatan bersih pantai (*beach clean-up*) dari waktu ke waktu.

**Sistem Monitoring Sampah Laut** dirancang sebagai sebuah basis data terstruktur yang mampu menyimpan, mengelola, dan menyajikan data hasil pemantauan sampah laut. Sesuai dengan ketentuan PjBL Mata Kuliah Sistem Basis Data, fokus utama proyek ini adalah pada perancangan basis data (ERD, normalisasi, implementasi tabel, dan query SQL), bukan pada pembuatan aplikasi atau tampilan antarmuka.

---

## 2. Latar Belakang dan Tujuan Sistem

### a. Latar Belakang
Permasalahan utama yang dihadapi dalam pengelolaan data sampah laut saat ini antara lain:
1. Pencatatan data masih dilakukan secara manual sehingga rawan kesalahan dan duplikasi.
2. Tidak ada sistem terpusat yang mengintegrasikan data dari berbagai lokasi pemantauan.
3. Sulitnya menghasilkan laporan dan analisis tren persebaran sampah secara cepat.
4. Koordinasi antara petugas lapangan, peneliti, dan pembuat kebijakan belum optimal.
5. Data historis sulit ditelusuri dan dianalisis untuk keperluan pengambilan keputusan.

### b. Tujuan Sistem
1. Merancang basis data terpusat yang mampu menyimpan seluruh data pemantauan sampah laut secara terstruktur.
2. Mengimplementasikan sistem yang memudahkan pencatatan data dari berbagai titik lokasi pemantauan.
3. Menghasilkan query SQL untuk keperluan laporan dan analisis persebaran sampah laut.
4. Mendukung pengambilan keputusan berbasis data bagi pihak terkait (pemerintah, LSM, peneliti).
5. Mengurangi redundansi data dan meningkatkan integritas data pemantauan.

---

## 3. Identifikasi Aktor
| No | Aktor | Peran | Akses Data |
|:--:|:---|:---|:---|
| 1 | **Administrator** | Mengelola seluruh sistem, pengguna, dan data master | *Full access* - semua tabel |
| 2 | **Petugas Lapangan** | Melakukan pemantauan di lokasi dan mencatat data sampah | Input data sampah, laporan pemantauan |
| 3 | **Koordinator/Supervisor** | Mengawasi kegiatan pemantauan dan memvalidasi laporan | Validasi laporan, data petugas, jadwal |
| 4 | **Peneliti/Analis** | Menganalisis data sampah untuk keperluan riset lingkungan | *Read only* - data sampah dan laporan |
| 5 | **Pemerintah/Lembaga** | Menggunakan data untuk pengambilan kebijakan lingkungan | Laporan dan statistik agregat |

---

## 4. Kebutuhan Fungsional
| No | Kode | Kebutuhan Fungsional | Aktor |
|:--:|:---|:---|:---|
| 1 | KF-01 | Sistem dapat mencatat data lokasi pemantauan (koordinat GPS, nama wilayah, jenis perairan) | Administrator, Petugas Lapangan |
| 2 | KF-02 | Sistem dapat mencatat jenis dan kategori sampah (plastik, organik, B3, dll.) | Administrator |
| 3 | KF-03 | Sistem dapat mencatat data hasil pemantauan (volume, berat, tanggal, lokasi) | Petugas Lapangan |
| 4 | KF-04 | Sistem dapat mengelola data petugas lapangan (identitas, wilayah tugas, jadwal) | Administrator, Koordinator |
| 5 | KF-05 | Sistem dapat mencatat laporan kegiatan pembersihan sampah laut | Petugas Lapangan, Koordinator |
| 6 | KF-06 | Sistem dapat menghasilkan laporan rekapitulasi sampah per lokasi dan per periode | Koordinator, Peneliti |
| 7 | KF-07 | Sistem dapat menampilkan statistik tren persebaran sampah berdasarkan wilayah dan waktu | Peneliti, Pemerintah |
| 8 | KF-08 | Sistem dapat mengelola data sumber sampah (jenis sumber: domestik, industri, kapal, dll.) | Administrator |
| 9 | KF-09 | Sistem dapat mencatat kondisi lingkungan saat pemantauan (cuaca, arus, musim) | Petugas Lapangan |
| 10 | KF-10 | Sistem dapat mengelola data alat dan peralatan pemantauan yang digunakan | Administrator, Koordinator |
| 11 | KF-11 | Sistem dapat menghasilkan peringatan (*alert*) jika volume sampah di suatu lokasi melebihi ambang batas | Koordinator, Administrator |
| 12 | KF-12 | Sistem dapat menyimpan data historis pemantauan untuk keperluan analisis jangka panjang | Peneliti, Pemerintah |

---

## 5. Kebutuhan Data
*(Catatan: Data bersifat sementara dan dapat berubah seiring perkembangan proyek)*

### a. Data Master
- **Data Lokasi Pemantauan**: ID lokasi, nama lokasi, koordinat GPS (latitude/longitude), jenis perairan, provinsi/kabupaten, deskripsi.
- **Data Jenis Sampah**: ID jenis sampah, nama jenis, kategori, tingkat bahaya, deskripsi.
- **Data Petugas**: ID petugas, nama, nomor identitas, jabatan, unit kerja, kontak, wilayah tugas.
- **Data Sumber Sampah**: ID sumber, jenis sumber, deskripsi.
- **Data Alat Pemantauan**: ID alat, nama alat, jenis, kondisi, tanggal kalibrasi terakhir.

### b. Data Transaksi
- **Data Pemantauan**: ID pemantauan, tanggal/waktu, ID lokasi, ID petugas, kondisi cuaca, kondisi arus, catatan umum.
- **Data Hasil Pemantauan Sampah**: ID hasil, ID pemantauan, ID jenis sampah, ID sumber, volume (m3), berat (kg), jumlah item, foto (path).
- **Data Pembersihan**: ID pembersihan, ID pemantauan, tanggal pelaksanaan, jumlah petugas, volume terangkut, tujuan pembuangan, catatan.

### c. Data Laporan
1. Laporan Rekapitulasi Sampah per Lokasi per Periode
2. Laporan Perbandingan Jenis Sampah Dominan
3. Laporan Tren Volume Sampah Berdasarkan Musim
4. Laporan Kinerja Kegiatan Pembersihan

---

## 6. Diagram Proses (Use Case)

> **Catatan:** Diagram ini bersifat sementara dan dapat berubah seiring berjalannya progress. Diagram menggambarkan bahwa sistem berputar di sekitar pencatatan data pemantauan (KF-03) sebagai inti.

![Diagram Use Case Sistem Monitoring Sampah Laut](assets/diagram-use-case.png)
*(Jika gambar belum diupload, silakan ganti path `assets/diagram-use-case.png` dengan lokasi file gambar Anda)*

### Penjelasan Diagram:
- **Aktor**: 5 aktor (Administrator, Petugas Lapangan, Koordinator, Peneliti, Pemerintah) sesuai peran masing-masing.
- **Use Case**: 13 use case yang merepresentasikan kebutuhan fungsional (KF-01 s.d. KF-12 + Login).
- **Relasi `<<include>>`**: Use case wajib menyertakan use case lain (contoh: *Membuat Laporan Rekapitulasi* include *Mencatat Data Hasil Pemantauan*).
- **Relasi `<<extend>>`**: Use case opsional/tambahan (contoh: *Menghasilkan Peringatan (Alert)* extend *Mencatat Data Hasil Pemantauan* jika volume melebihi ambang batas).

---

## 7. Pembagian Tugas Anggota
| Anggota (NIM) | Progres | Tugas dan Tanggung Jawab |
|:---|:---:|:---|
| **Andre Zulyan Pratama**<br>(2501020115) | 1 - 4 | Mengidentifikasi aktor & kebutuhan fungsional, Merancang ERD, Membuat script SQL DDL & constraint, Menyusun laporan akhir. |
| **Putra Ali Syahbana**<br>(2501020088) | 1 - 4 | Menentukan kebutuhan data & diagram proses, Menyusun kamus data, Membuat data uji (INSERT), Menyusun laporan akhir. |
| **Rizky Akbar Hidayatullah**<br>(2501020113) | 1 - 4 | Menyusun deskripsi studi kasus & latar belakang, Melakukan normalisasi data (UNF - 3NF), Membuat minimal 10 query SQL, Menyusun laporan akhir. |
| **M. Riquelma Zidan**<br>(2501020110) | 1 - 4 | Mengelola repository GitHub & dokumen progres, Review & revisi analisis kebutuhan, Menyusun skenario pengujian & dokumentasi, Menyusun laporan akhir & slide presentasi. |

> *Note: Pembagian tugas anggota ini bersifat sementara dan bisa berubah sesuai dinamika kelompok.*

---
*Dokumen ini disusun untuk keperluan Progres 1 Project Based Learning (PjBL) Mata Kuliah Sistem Basis Data.*
