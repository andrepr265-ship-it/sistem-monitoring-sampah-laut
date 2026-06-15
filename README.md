# PROJECT BASED LEARNING ( PjBL )
PROGRES 1 – ANALISIS KEBUTUHAN SISTEM
SISTEM MONITORING SAMPAH LAUT

Mata Kuliah: Sistem Basis Data
Dosen: Ferdi Chahyadi

Disusun oleh:
Kelompok 8

| Nama | NIM |
| --- | --- |
| Andre Zulyan Pratama | 2501020 115 |
| Putra Ali Syahbana | 2501020088 |
| Rizky Akbar Hidayatullah | 2501020113 |
| M. Riquelma Zidan | 2501020110 |

Program Studi: Sistem Basis Data
Tahun 2025/2026
Deadline Progres 1: 1 5 Juni 2026

## 1. DESKRIPSI STUDI KASUS
Sampah laut merupakan salah satu permasalahan lingkungan yang serius di wilayah pesisir dan kepulauan Indonesia, termasuk di Kota Batam yang berbatasan langsung dengan jalur pelayaran internasional. Tumpukan sampah plastik, limbah rumah tangga, dan sampah dari aktivitas pelayaran sering ditemukan terdampar di pantai maupun mengapung di perairan, namun pencatatan dan pemantauan kondisi sampah laut tersebut selama ini masih dilakukan secara manual dan tidak terstruktur.

Pencatatan manual menggunakan kertas atau spreadsheet sederhana menyebabkan data lokasi, jenis, volume, dan waktu pengambilan sampah sulit diakses, mudah hilang, dan tidak dapat diolah menjadi informasi yang berguna untuk pengambilan keputusan. Akibatnya, instansi terkait (misalnya dinas lingkungan hidup, komunitas relawan pesisir, dan peneliti) kesulitan mengidentifikasi area dengan tingkat pencemaran tinggi (hotspot) serta mengukur efektivitas kegiatan bersih pantai (beach clean-up) dari waktu ke waktu.

Sistem Monitoring Sampah Laut dirancang sebagai sebuah basis data terstruktur yang mampu menyimpan, mengelola, dan menyajikan data hasil pemantauan sampah laut. Sistem ini mencatat data lokasi pemantauan, jenis dan kategori sampah, volume/berat sampah yang ditemukan, petugas atau relawan yang melakukan pencatatan, kegiatan pembersihan yang dilakukan, serta laporan rekapitulasi periodik. Sesuai dengan ketentuan PjBL Mata Kuliah Sistem Basis Data, fokus utama proyek ini adalah pada perancangan basis data (ERD, normalisasi, implementasi tabel, dan query SQL), bukan pada pembuatan aplikasi atau tampilan antarmuka.

## 2. LATAR BELAKANG DAN TUJUAN SISTEM
### 1. Latar Belakang
Pencemaran sampah laut merupakan salah satu isu lingkungan paling mendesak di dunia. Indonesia sebagai negara kepulauan dengan garis pantai terpanjang kedua di dunia menghadapi tantangan besar dalam pengelolaan sampah laut. Data dari berbagai lembaga menunjukkan bahwa ribuan ton sampah masuk ke lautan setiap tahunnya.

Permasalahan utama yang dihadapi dalam pengelolaan data sampah laut saat ini antara lain:
1. Pencatatan data masih dilakukan secara manual sehingga rawan kesalahan dan duplikasi .
2. Tidak ada sistem terpusat yang mengintegrasikan data dari berbagai lokasi pemantauan .
3. Sulitnya menghasilkan laporan dan analisis tren persebaran sampah secara cepat .
4. Koordinasi antara petugas lapangan, peneliti, dan pembuat kebijakan belum optimal.
5. Data historis sulit ditelusuri dan dianalisis untuk keperluan pengambilan keputusan .

### 2. Tujuan Sistem
1. Merancang basis data terpusat yang mampu menyimpan seluruh data pemantauan sampah laut secara terstruktur .
2. Mengimplementasikan sistem yang memudahkan pencatatan data dari berbagai titik lokasi pemantauan.
3. Menghasilkan query SQL untuk keperluan laporan dan analisis persebaran sampah laut .
4. Mendukung pengambilan keputusan berbasis data bagi pihak terkait ( pemerintah , LSM, peneliti ).
5. Mengurangi redundansi data dan meningkatkan integritas data pemantauan

## 1. IDENTIFIKASI AKTOR
Berikut adalah aktor-aktor yang terlibat dalam Sistem Monitoring Sampah Laut:

| No | Aktor | Peran | Akses Data |
| --- | --- | --- | --- |
| 1 | Administrator | Mengelola seluruh sistem , pengguna , dan data master | Full access - semua tabel |
| 2 | Petugas Lapangan | Melakukan pemantauan di lokasi dan mencatat data sampah | Input data sampah , laporan pemantauan |
| 3 | Koordinator /Supervisor | Mengawasi kegiatan pemantauan dan memvalidasi laporan | Validasi laporan , data petugas , jadwal |
| 4 | Peneliti /Analis | Menganalisis data sampah untuk keperluan riset lingkungan | Read only - data sampah dan laporan |
| 5 | Pemerintah /Lembaga | Menggunakan data untuk pengambilan kebijakan lingkungan | Laporan dan statistik agregat |

## 2. KEBUTUHAN FUNGSIONAL
Berikut minimal 10 kebutuhan fungsional Sistem Monitoring Sampah Laut:

| N0 | Kode | Kebutuhan Fungsional | Aktor |
| --- | --- | --- | --- |
| 1 | KF-01 | Sistem dapat mencatat data lokasi pemantauan (koordinat GPS, nama wilayah, jenis perairan) | Administrator, Petugas Lapangan |
| 2 | KF-02 | Sistem dapat mencatat jenis dan kategori sampah (plastik, organik, B3, dll.) | Administrator |
| 3 | KF-03 | Sistem dapat mencatat data hasil pemantauan (volume, berat , tanggal , lokasi ) | Petugas Lapangan |
| 4 | KF-04 | Sistem dapat mengelola data petugas lapangan ( identitas , wilayah tugas , jadwal ) | Administrator, Koordinator |
| 5 | KF-05 | Sistem dapat mencatat laporan kegiatan pembersihan sampah laut | Petugas Lapangan, Koordinator |
| 6 | KF-06 | Sistem dapat menghasilkan laporan rekapitulasi sampah per lokasi dan per periode | Koordinator , Peneliti |
| 7 | KF-07 | Sistem dapat menampilkan statistik tren persebaran sampah berdasarkan wilayah dan waktu | Peneliti , Pemerintah |
| 8 | KF-08 | Sistem dapat mengelola data sumber sampah ( jenis sumber : domestik , industri , kapal , dll.) | Administrator |
| 9 | KF-09 | Sistem dapat mencatat kondisi lingkungan saat pemantauan ( cuaca , arus , musim ) | Petugas Lapangan |
| 10 | KF-10 | Sistem dapat mengelola data alat dan peralatan pemantauan yang digunakan | Administrator, Koordinator |
| 11 | KF-11 | Sistem dapat menghasilkan peringatan (alert) jika volume sampah di suatu lokasi melebihi ambang batas | Koordinator , Administrator |
| 12 | KF-12 | Sistem dapat menyimpan data historis pemantauan untuk keperluan analisis jangka panjang | Peneliti , Pemerintah |

## 3. KEBUTUHAN DATA
Berikut adalah data-data yang perlu dikelola dalam sistem ( datanya bersifat sementara , artinya bisa berubah kapan aja ) :

### 1. Data Master
1. Data Lokasi Pemantauan : ID lokasi , nama lokasi , koordinat GPS (latitude/longitude), jenis perairan ( laut terbuka , pesisir , muara ), provinsi / kabupaten , deskripsi .
2. Data Jenis Sampah: ID jenis sampah , nama jenis ( plastik , kaca , logam , organik , B3, lainnya ), kategori , tingkat bahaya , deskripsi .
3. Data Petugas : ID petugas , nama, nomor identitas , jabatan , unit kerja , kontak , wilayah tugas .
4. Data Sumber Sampah : ID sumber , jenis sumber ( domestik , industri , kapal , pariwisata , tidak teridentifikasi ), deskripsi .
5. Data Alat Pemantauan : ID alat , nama alat , jenis , kondisi , tanggal kalibrasi terakhir .

### 2. Data Transaksi
1. Data Pemantauan : ID pemantauan , tanggal / waktu , ID lokasi , ID petugas , kondisi cuaca , kondisi arus , catatan umum .
2. Data Hasil Pemantauan Sampah: ID hasil , ID pemantauan , ID jenis sampah , ID sumber , volume (m3), berat (kg), jumlah item, foto (path).
3. Data Pembersihan : ID pembersihan , ID pemantauan , tanggal pelaksanaan , jumlah petugas , volume terangkut , tujuan pembuangan , catatan .

### 3. Data Laporan
1. Laporan Rekapitulasi Sampah per Lokasi per Periode
2. Laporan Perbandingan Jenis Sampah Dominan
3. Laporan Tren Volume Sampah Berdasarkan Musim
4. Laporan Kinerja Kegiatan Pembersihan

## 1. D IAGRAM PROSES
![Gambar 1 Diagram Use Case Sistem Monitoring Sampah Laut](diagram-usecase.png)

Gambar 1 Diagram Use Case Sistem Monitoring Sampah Laut, menggambarkan interaksi aktor (Administrator, Petugas Lapangan, Koordinator /Supervisor, Peneliti /Analis, dan Pemerintah /Lembaga) dengan 13 use case yang merepresentasikan kebutuhan fungsional KF-01 s.d. K . ( Note: data bersifat sementara dan bisa berubah )

### 1. Aktor (Actor)
Ada 5 aktor yang berinteraksi dengan sistem, sesuai tabel Identifikasi Aktor:
1. Administrator - punya akses penuh ke seluruh data master sistem .
2. Petugas Lapangan - mencatat data langsung dari lokasi pemantauan.
3. Koordinator /Supervisor - mengawasi , memvalidasi , dan mengelola jadwal / petugas .
4. Peneliti /Analis - membaca data untuk keperluan analisis (read only).
5. Pemerintah /Lembaga - menerima laporan dan statistik agregat untuk kebijakan .

### 2. Use Case (di dalam kotak " Sistem Monitoring Sampah Laut")
Setiap use case mewakili satu kebutuhan fungsional (KF):
1. Login/ Autentikasi Pengguna - pintu masuk semua aktor sebelum mengakses fitur lain.
2. Mengelola Data Lokasi Pemantauan (KF-01)
3. Mengelola Data Jenis Sampah (KF-02)
4. Mencatat Data Hasil Pemantauan (KF-03)
5. Mengelola Data Petugas Lapangan (KF-04)
6. Mencatat Laporan Kegiatan Pembersihan (KF-05)
7. Membuat Laporan Rekapitulasi (KF-06)
8. Menampilkan Statistik Tren Persebaran Sampah (KF-07)
9. Mengelola Data Sumber Sampah (KF-08)
10. Mencatat Kondisi Lingkungan (KF-09)
11. Mengelola Data Alat Pemantauan (KF-10)
12. Menghasilkan Peringatan (Alert) Volume (KF-11)
13. Menyimpan & Mengakses Data Historis (KF-12)

### 3. Hubungan Aktor dengan Use Case (garis lurus abu-abu )
1. Administrator : terhubung ke hampir semua fitur pengelolaan data master - lokasi , jenis sampah , petugas , sumber sampah , alat , serta pengaturan alert - karena perannya "full access".
2. Petugas Lapangan : terhubung ke pencatatan data lokasi , hasil pemantauan , kegiatan pembersihan , dan kondisi lingkungan - sesuai tugasnya di lapangan .
3. Koordinator /Supervisor : terhubung ke validasi data petugas , validasi laporan pembersihan , pembuatan laporan rekapitulasi , pengelolaan alat , dan pengaturan alert - sesuai peran pengawasan .
4. Peneliti /Analis : hanya terhubung ke laporan rekapitulasi , statistik tren , dan data historis - karena aksesnya read only untuk riset .
5. Pemerintah /Lembaga : hanya terhubung ke statistik tren dan data historis — sesuai kebutuhan untuk pengambilan kebijakan .

Semua aktor juga terhubung ke use case Login, menandakan setiap pengguna harus melalui autentikasi.

### 4. Relasi antar Use Case (garis putus-putus )
1. <<include>> ( merah ) - use case " wajib " menyertakan use case lain:
2. Membuat Laporan Rekapitulasi include Mencatat Data Hasil Pemantauan ( rekap dibuat dari data hasil pemantauan ).
3. Menampilkan Statistik Tren include Membuat Laporan Rekapitulasi (statistik diturunkan dari rekap).
4. Menyimpan & Mengakses Data Historis include Mengelola Data Lokasi Pemantauan (data historis mencakup data lokasi ).
5. <<extend>> ( ungu ) — use case opsional / tambahan :
6. Menghasilkan Peringatan (Alert) extend Mencatat Data Hasil Pemantauan — alert hanya muncul jika volume sampah pada saat pencatatan melebihi ambang batas ( sesuai KF-11), jadi bersifat kondisional / tambahan , bukan langkah wajib .

Secara keseluruhan, diagram ini bersifat sementara ( dapat berubah seiring berjalannya progress) dan diagram ini menggambarkan bahwa sistem berputar di sekitar pencatatan data pemantauan (KF-03) sebagai inti, yang kemudian diolah menjadi laporan , statistik , dan peringatan , dengan setiap aktor memiliki cakupan akses sesuai perannya masing-masing .

## 2. PEMBAGIAN TUGAS ANGGOTA

| Anggota (NIM) | Progres (1-4) | Tugas dan Tanggung Jawab |
| --- | --- | --- |
| Andre Zulyan Pratama (2501020115) | Progres 1 Progres 2 Progres 3 Progres 4 | Mengidentifikasi aktor sistem dan menyusun kebutuhan fungsional Merancang ERD dan menyusun penjelasan entitas-relasi Membuat script SQL DDL (CREATE DATABASE, CREATE TABLE) dan constraint Menyusun laporan akhir |
| Putra Ali Syahbana (2501020088) | Progres 1 Progres 2 Progres 3 Progres 4 | Menentukan kebutuhan data dan menyusun diagram proses ( use case ) Menyusun kamus data (data dictionary) Membuat data uji (INSERT) untuk seluruh tabel Menyusun laporan akhir |
| Rizky Akbar Hidayatulah (2501020113) | Progres 1 Progres 2 Progres 3 Progres 4 | Menyusun deskripsi studi kasus, latar belakang, dan tujuan sistem Melakukan normalisasi data (UNF - 1NF - 2NF - 3NF) Membuat minimal 10 query SQL operasional dan laporan Menyusun laporan akhir |
| M. Riquelma Zidan (2501020110) | Progres 1 Progres 2 Progres 3 Progres 4 | Mengelola repository GitHub dan menyusun dokumen progres Mereview dan merevisi hasil analisis kebutuhan ( jika ada perubahan ) Menyusun skenario pengujian dan dokumentasi screenshot hasil implementasi Menyusun laporan akhir , lampiran , dan slide presentasi |

Note: Pembagian tugas anggota ini bersifat sementara dan bisa berubah

## 1. L INK REPOSITORY GitHub

| Keterangan | Detail |
| --- | --- |
| Link Repository | https://github.com/andrepr265-ship-it/sistem-monitoring-sampah-laut |
| Nama Repository | sistem -monitoring-sampah -laut |
| Visibility | Public |
| Branch Utama | main |
