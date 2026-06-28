# LAPORAN PROJECT BASED LEARNING
## SISTEM MONITORING SAMPAH LAUT
 
<img width="472" height="472" alt="image" src="https://github.com/user-attachments/assets/7bbc037f-23ac-4a5e-a1d3-d99fd06a4189" />
 
**Mata Kuliah:** Sistem Basis Data
 
**Dosen:** Ferdi Chahyadi M.Kom
 
**Disusun oleh:**
 
Kelompok 8
 
| **Nama** | **NIM** |
| --- | --- |
| Andre Zulyan Pratama | 2501020115 |
| Putra Ali Syahbana | 2501020088 |
| Rizky Akbar Hidayatullah | 2501020113 |
| M. Riquelma Zidan | 2501020110 |
 
**Program Studi:** Teknik Informatika
 
**Tahun 2025/2026**
 
| Tanjungpinang, 27 Juni 2026 |
| --- |
| Dosen Pengampu |
|  |
| Ferdi Cahyadi M,Kom. |
 
---
 
## KATA PENGANTAR
 
Puji syukur ke hadirat Tuhan Yang Maha Esa atas segala rahmat dan karunia-Nya sehingga kami dapat menyelesaikan Laporan Akhir Mata Kuliah Sistem Basis Data dengan baik. Laporan ini disusun sebagai salah satu syarat untuk memenuhi tugas akhir mata kuliah Sistem Basis Data. Laporan ini mengangkat studi kasus Sistem Monitoring Sampah Laut, yang bertujuan untuk merancang dan mengimplementasikan sistem basis data yang mampu mendukung proses pengelolaan, penyimpanan, dan pemantauan data sampah laut secara efektif dan efisien. Diharapkan hasil dari perancangan sistem ini dapat memberikan gambaran mengenai penerapan konsep-konsep basis data dalam menyelesaikan permasalahan nyata di bidang lingkungan. Penulis mengucapkan terima kasih yang sebesar-besarnya kepada Bapak Ferdi Cahyadi, M.Kom. selaku dosen pengampu Mata Kuliah Sistem Basis Data yang telah memberikan bimbingan, arahan, serta ilmu selama proses perkuliahan hingga penyusunan laporan ini. Ucapan terima kasih juga penulis sampaikan kepada semua pihak yang telah memberikan dukungan, bantuan, dan motivasi sehingga laporan ini dapat diselesaikan. Kami menyadari bahwa laporan ini masih memiliki kekurangan. Oleh karena itu, penulis mengharapkan kritik dan saran yang membangun demi penyempurnaan laporan ini di masa yang akan datang. Semoga laporan ini dapat memberikan manfaat bagi pembaca serta menjadi referensi dalam memahami penerapan sistem basis data pada studi kasus sistem monitoring sampah laut.
 
---
 
## DAFTAR ISI
 
- [KATA PENGANTAR](#kata-pengantar)
- [BAB I – PENDAHULUAN](#bab-i--pendahuluan)
  - [1.1 Latar Belakang](#11-latar-belakang)
  - [1.2 Rumusan Masalah](#12-rumusan-masalah)
  - [1.3 Tujuan](#13-tujuan)
  - [1.4 Batasan Masalah](#14-batasan-masalah)
- [BAB II – LANDASAN TEORI](#bab-ii--landasan-teori)
- [BAB III – ANALISIS DAN PERANCANGAN SISTEM](#bab-iii--analisis-dan-perancangan-sistem)
  - [3.1 Analisis Kebutuhan](#31-analisis-kebutuhan)
    - [3.1.1 Aktor Sistem](#311-aktor-sistem)
    - [3.1.2 Kebutuhan Data](#312-kebutuhan-data)
    - [3.1.3 Proses Bisnis](#313-proses-bisnis)
  - [3.2 ERD (Entity Relationship Diagram)](#32-erd-entity-relationship-diagram)
    - [3.2.1 Penjelasan Entitas](#321-penjelasan-entitas)
- [BAB IV – IMPLEMENTASI](#bab-iv--implementasi)
  - [4.1 Desain Tabel](#41-desain-tabel)
  - [4.2 SQL DDL](#42-sql-ddl)
  - [4.3 SQL DML (Data)](#43-sql-dml-data)
- [BAB V – PENGUJIAN DAN QUERY](#bab-v--pengujian-dan-query)
  - [5.1 Skenario Pengujian](#51-skenario-pengujian)
  - [5.2 Query SQL (minimal 10 query)](#52-query-sql-minimal-10-query)
  - [5.3 Hasil Pengujian](#53-hasil-pengujian)
    - [5.3.1 Bukti Skenario Pengujian Constraint](#531-bukti-skenario-pengujian-constraint)
    - [5.3.2 Hasil Eksekusi 15 Query SQL](#532-hasil-eksekusi-15-query-sql)
- [BAB VI – PENUTUP](#bab-vi--penutup)
  - [6.1 Kesimpulan](#61-kesimpulan)
  - [6.2 Saran](#62-saran)
- [LAMPIRAN](#lampiran)
---
 
## DAFTAR GAMBAR
 
- Gambar 1 Use Case Diagram – Sistem Monitoring Sampah Laut
- Gambar 2 ERD (Entity Relationship Diagram)
- Gambar 3 Hasil Uji Constraint UNIQUE – Error Duplicate Entry
- Gambar 4 Hasil Uji Constraint FOREIGN KEY – Error Child Row
- Gambar 5 Hasil Uji ON DELETE CASCADE – Data Anak Otomatis Terhapus
- Gambar 6 Hasil Uji ON DELETE RESTRICT – Data Indak Tidak Bisa Dihapus
- Gambar 7 Output Query 5 – Total Berat Sampah per Jenis
- Gambar 8 Output Query 6 – Lokasi dengan Volume Sampah > 20 m³
- Gambar 9 Output Query 11 – Pembuktian UPDATE Data Alat
- Gambar 10 Output Query 1 – Daftar Lokasi Pemantauan
- Gambar 11 Output Query 2 – Jenis Sampah Tingkat Bahaya Tinggi
- Gambar 12 Output Query 3 – Laporan Hasil Pemantauan Lengkap
- Gambar 13 Output Query 4 – Petugas yang Terlibat dalam Pemantauan
- Gambar 14 Output Query 5 – Total Berat Sampah per Jenis
- Gambar 15 Output Query 6 – Lokasi dengan Volume Sampah > 20 m³
- Gambar 16 Output Query 7 – Petugas Aktif dalam Pembersihan
- Gambar 17 Output Query 8 – Status Pembersihan per Lokasi
- Gambar 18 Output Query 9 – Pemantauan Bulan Juni 2026
- Gambar 19 Output Query 10 – Rekapitulasi Sampah per Sumber dan Jenis
- Gambar 20 Output Query 11 – Pembuktian UPDATE Data Alat
- Gambar 21 Output Query 12 – Update Catatan Pemantauan
- Gambar 22 Output Query 13 – Pembuktian DELETE dengan CASCADE
- Gambar 23 Output Query 14 – Rata-rata Berat Sampah per Sesi
- Gambar 24 Output Query 15 – Pembuktian INSERT Petugas Baru
- Gambar 25 ERD Sistem Monitoring Sampah Laut (Ukuran Penuh)
- Gambar 26 Database sistem_monitoring_sampah_laut Berhasil Dibuat
- Gambar 27 Struktur Tabel lokasi
- Gambar 28 Struktur Tabel jenis_sampah
- Gambar 29 Struktur Tabel petugas
- Gambar 30 Struktur Tabel sumber_sampah
- Gambar 31 Struktur Tabel alat_pemantauan
- Gambar 32 Struktur Tabel pemantauan
- Gambar 33 Struktur Tabel hasil_pemantauan
- Gambar 34 Struktur Tabel pembersihan
- Gambar 35 Struktur Tabel pemantauan_alat (Junction)
- Gambar 36 Struktur Tabel pembersihan_petugas (Junction)
- Gambar 37 Struktur Tabel pemantauan_petugas (Junction)
- Gambar 38 Data Tabel Lokasi (3 Record)
- Gambar 39 Data Tabel Jenis Sampah (4 Record)
- Gambar 40 Data Tabel Petugas (3 Record)
- Gambar 41 Data Tabel Sumber Sampah (3 Record)
- Gambar 42 Data Tabel Alat Pemantauan (3 Record)
- Gambar 43 Data Tabel Pemantauan (3 Record)
- Gambar 44 Data Tabel Hasil Pemantauan (5 Record)
- Gambar 45 Data Tabel Pembersihan (2 Record)
- Gambar 46 Data Tabel Pemantauan Petugas (5 Record)
- Gambar 47 Data Tabel Pemantauan Alat (5 Record)
- Gambar 48 Data Tabel Pembersihan Petugas (4 Record)
---
 
## DAFTAR TABEL
 
- Tabel 1 Aktor Sistem
- Tabel 2 Kebutuhan Fungsional (Dasar Seluruh Use Case)
- Tabel 3 Rincian entitas
- Tabel 4 Bentuk Tidak Normal (Unnormalized Form / UNF)
- Tabel 5 Bentuk Normal Pertama (1NF)
- Tabel 6 Hasil Dekomposisi 2NF — Tabel pemantauan
- Tabel 7 Hasil Dekomposisi 2NF — Tabel hasil_pemantauan (atribut non-kunci bergantung penuh pada id_hasil)
- Tabel 8 Pengecekan pada seluruh tabel hasil 2NF
- Tabel 9 lokasi
- Tabel 10 jenis_sampah
- Tabel 11 petugas
- Tabel 12 sumber_sampah
- Tabel 13 alat_pemantauan
- Tabel 14 pemantauan
- Tabel 15 hasil_pemantauan
- Tabel 16 pembersihan
- Tabel 17 pemantauan_alat
- Tabel 18 pembersihan_petugas
- Tabel 19 pemantauan_petugas
- Tabel 20 Hasil Eksekusi 15 Query SQL (Gambar 7 sampai Gambar 24)
- Tabel 21 Link Repository GitHub
---
 
## BAB I – PENDAHULUAN
 
### 1.1 Latar Belakang
 
Permasalahan sampah laut merupakan salah satu isu lingkungan yang semakin serius di berbagai wilayah pesisir Indonesia. Sampah yang berasal dari aktivitas rumah tangga, industri, pariwisata, maupun perikanan sering kali terbawa aliran sungai hingga bermuara ke laut. Penumpukan sampah laut tidak hanya merusak keindahan lingkungan, tetapi juga mengancam ekosistem laut, mengganggu kehidupan biota, serta berdampak pada sektor perikanan, pariwisata, dan kesehatan masyarakat. Proses pemantauan kondisi sampah laut di banyak daerah masih dilakukan secara manual, seperti melalui patroli lapangan atau laporan dari masyarakat. Cara tersebut memerlukan waktu yang cukup lama, membutuhkan banyak tenaga, dan sering kali menghasilkan data yang kurang akurat serta sulit diperbarui secara berkala. Akibatnya, pengambilan keputusan dalam penanganan sampah laut menjadi kurang efektif karena keterlambatan memperoleh informasi. Perkembangan teknologi informasi, khususnya sistem basis data, memberikan peluang untuk mengatasi permasalahan tersebut melalui pembangunan Sistem Monitoring Sampah Laut. Sistem ini berfungsi untuk mencatat, menyimpan, mengelola, dan menampilkan data mengenai lokasi, jenis, jumlah, waktu pelaporan, serta status penanganan sampah laut secara terstruktur. Dengan adanya basis data yang terintegrasi, informasi dapat diakses dengan lebih cepat, akurat, dan mudah oleh pihak-pihak yang berkepentingan. Oleh karena itu, pada mata kuliah Sistem Basis Data dikembangkan studi kasus berupa Sistem Monitoring Sampah Laut sebagai implementasi penerapan konsep basis data dalam menyelesaikan permasalahan nyata. Sistem ini diharapkan mampu membantu instansi terkait maupun masyarakat dalam melakukan pemantauan kondisi sampah laut secara lebih efektif, meningkatkan efisiensi pengelolaan data, serta mendukung pengambilan keputusan yang tepat dalam upaya menjaga kebersihan dan kelestarian lingkungan laut.
 
### 1.2 Rumusan Masalah
 
- Bagaimana merancang basis data terpusat yang mampu menyimpan seluruh data pemantauan sampah laut secara terstruktur dan mudah dikelola?
- Bagaimana mengimplementasikan sistem yang dapat memudahkan proses pencatatan data sampah laut dari berbagai titik lokasi pemantauan secara efektif dan efisien?
- Bagaimana memanfaatkan query SQL untuk menghasilkan laporan dan analisis mengenai persebaran sampah laut secara akurat?
- Bagaimana sistem basis data dapat mendukung pengambilan keputusan berbasis data bagi pemerintah, lembaga swadaya masyarakat (LSM), dan peneliti dalam upaya penanganan sampah laut?
- Bagaimana sistem basis data dapat mengurangi redundansi data serta meningkatkan integritas dan konsistensi data pemantauan sampah laut.
### 1.3 Tujuan
 
- Merancang basis data terpusat yang mampu menyimpan seluruh data pemantauan sampah laut secara terstruktur.
- Mengimplementasikan sistem yang memudahkan pencatatan data dari berbagai titik lokasi pemantauan.
- Menghasilkan query SQL untuk keperluan laporan dan analisis persebaran sampah laut.
- Mendukung pengambilan keputusan berbasis data bagi pihak terkait (pemerintah, LSM, peneliti).
- Mengurangi redundansi data dan meningkatkan integritas data pemantauan
### 1.4 Batasan Masalah
 
- Sistem hanya berfokus pada perancangan dan implementasi basis data untuk menyimpan serta mengelola data monitoring sampah laut.
- Data yang dikelola meliputi data lokasi pemantauan, jenis sampah, jumlah sampah, petugas, waktu pemantauan, dan status penanganan.
- Sistem hanya mengimplementasikan operasi basis data Create, Read, Update, Delete (CRUD) serta query SQL untuk pengolahan dan pencarian data.
- Sistem tidak membahas teknologi pengumpulan data secara otomatis, seperti sensor, drone, atau Internet of Things (IoT); seluruh data dimasukkan secara manual oleh pengguna.
- Sistem menghasilkan laporan berdasarkan data yang tersimpan di dalam basis data sebagai informasi pendukung monitoring, tanpa membahas proses penanganan atau pengolahan sampah di lapangan.
---
 
## BAB II – LANDASAN TEORI
 
Basis data merupakan sekumpulan data yang saling berhubungan dan disusun secara sistematis sehingga dapat dikelola, disimpan, serta diakses dengan mudah. Basis data memiliki peranan penting dalam suatu sistem informasi karena digunakan untuk menyimpan berbagai informasi yang diperlukan oleh pengguna maupun sistem. Penggunaan basis data bertujuan untuk mengurangi terjadinya redundansi atau pengulangan data, menjaga konsistensi data, meningkatkan keamanan informasi, serta mempermudah proses pengolahan data. Dengan adanya basis data, proses pencarian, pengubahan, dan pengelolaan informasi dapat dilakukan secara lebih cepat dan efisien. Saat ini, penggunaan basis data telah banyak diterapkan dalam berbagai bidang seperti pendidikan, kesehatan, bisnis, pemerintahan, dan teknologi informasi.
 
Entity Relationship Diagram (ERD) merupakan suatu diagram yang digunakan untuk menggambarkan hubungan antarentitas dalam sebuah sistem basis data. ERD digunakan sebagai alat bantu dalam proses perancangan database agar struktur data yang dibuat lebih terorganisasi dan mudah dipahami. Dalam ERD terdapat beberapa komponen utama yaitu entitas, atribut, dan relasi. Entitas merupakan objek atau sesuatu yang datanya akan disimpan, atribut merupakan karakteristik atau informasi yang dimiliki oleh entitas, sedangkan relasi merupakan hubungan antarentitas yang saling berkaitan. Dengan menggunakan ERD, pengembang sistem dapat memahami alur data yang akan digunakan sehingga mempermudah proses perancangan dan implementasi database.
 
Normalisasi merupakan proses pengorganisasian data ke dalam tabel-tabel tertentu untuk mengurangi terjadinya pengulangan data serta menghindari anomali dalam basis data. Anomali dapat berupa kesalahan yang terjadi saat proses penambahan, pengubahan, maupun penghapusan data. Tujuan utama normalisasi adalah menciptakan struktur basis data yang lebih efektif, efisien, dan mudah dikelola. Proses normalisasi dilakukan melalui beberapa tahapan yang disebut bentuk normal, seperti First Normal Form (1NF), Second Normal Form (2NF), dan Third Normal Form (3NF). Dengan menerapkan normalisasi, penyimpanan data dapat dilakukan dengan lebih baik sehingga meningkatkan kualitas dan konsistensi data dalam sistem.
 
SQL atau Structured Query Language merupakan bahasa standar yang digunakan untuk mengelola dan mengakses basis data relasional. SQL digunakan untuk melakukan berbagai operasi dalam database seperti membuat tabel, menambahkan data, mengubah data, menghapus data, dan menampilkan data yang tersimpan. SQL memiliki beberapa perintah utama seperti Data Definition Language (DDL) yang digunakan untuk membuat dan mengubah struktur database, Data Manipulation Language (DML) yang digunakan untuk mengelola isi data, serta Data Query Language (DQL) yang digunakan untuk mengambil data dari database. Penggunaan SQL sangat penting dalam pengembangan sistem informasi karena membantu pengguna dalam mengelola data secara efektif dan efisien.
 
---
 
## BAB III – ANALISIS DAN PERANCANGAN SISTEM
 
### 3.1 Analisis Kebutuhan
 
Analisis kebutuhan pada bagian ini disusun berdasarkan hasil identifikasi pada Progres 1, disempurnakan melalui hasil perancangan ERD dan normalisasi data pada Progres 2, divalidasi melalui implementasi basis data dan pengujian pada Progres 3, serta diselaraskan dengan Use Case Diagram pada Gambar 3.1. Analisis ini mencakup tiga aspek utama, yaitu aktor sistem, kebutuhan data, dan proses bisnis yang berjalan dalam Sistem Monitoring Sampah Laut.
 
#### 3.1.1 Aktor Sistem
 
| **No** | **Aktor** | **Peran** | **Akses Data** |
| --- | --- | --- | --- |
| 1 | Administrator | Mengelola seluruh sistem, pengguna, dan data master | Full access - semua tabel |
| 2 | Petugas Lapangan | Melakukan pemantauan di lokasi dan mencatat data sampah | Input data sampah, laporan pemantauan |
| 3 | Koordinator/Supervisor | Mengawasi kegiatan pemantauan dan memvalidasi laporan | Validasi laporan, data petugas, jadwal |
| 4 | Peneliti/Analis | Menganalisis data sampah untuk keperluan riset lingkungan | Read only - data sampah dan laporan |
| 5 | Pemerintah/Lembaga | Menggunakan data untuk pengambilan kebijakan lingkungan | Laporan dan statistik agregat |
 
**Tabel 1 Aktor Sistem**
 
#### 3.1.2 Kebutuhan Data
 
Kebutuhan data diturunkan dari 12 kebutuhan fungsional (KF) yang menjadi dasar seluruh use case pada Gambar 3.1, kemudian dikelompokkan menjadi data master, data transaksi, data relasi (penghubung), dan data laporan.
 
**Kebutuhan Fungsional (Dasar Seluruh Use Case)**
 
| **N0** | **Kode** | **Kebutuhan Fungsional** | **Aktor** |
| --- | --- | --- | --- |
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
| 11 | KF-11 | Sistem dapat menghasilkan peringatan (alert) jika volume sampah di suatu lokasi melebihi ambang batas | Koordinator, Administrator |
| 12 | KF-12 | Sistem dapat menyimpan data historis pemantauan untuk keperluan analisis jangka panjang | Peneliti, Pemerintah |
 
**Tabel 2 Kebutuhan Fungsional (Dasar Seluruh Use Case)**
 
**Data Master**
 
- Data Lokasi Pemantauan: ID lokasi, nama lokasi, koordinat GPS (latitude/longitude), jenis perairan (laut terbuka, pesisir, muara), provinsi/kabupaten, deskripsi.
- Data Jenis Sampah: ID jenis sampah, nama jenis (plastik, kaca, logam, organik, B3, lainnya), kategori, tingkat bahaya, deskripsi.
- Data Petugas: ID petugas, nama, nomor identitas, jabatan, unit kerja, kontak, wilayah tugas.
- Data Sumber Sampah: ID sumber, jenis sumber (domestik, industri, kapal, pariwisata, tidak teridentifikasi), deskripsi.
- Data Alat Pemantauan: ID alat, nama alat, jenis, kondisi, tanggal kalibrasi terakhir.
**Data Transaksi**
 
- Data Pemantauan: ID pemantauan, tanggal/waktu, ID lokasi, ID petugas, kondisi cuaca, kondisi arus, catatan umum.
- Data Hasil Pemantauan Sampah: ID hasil, ID pemantauan, ID jenis sampah, ID sumber, volume (m3), berat (kg), jumlah item, foto (path).
- Data Pembersihan: ID pembersihan, ID pemantauan, tanggal pelaksanaan, jumlah petugas, volume terangkut, tujuan pembuangan, catatan.
**Data Relasi (Penghubung) – hasil revisi Progres 2**
 
- Tim pemantauan (pemantauan_petugas) – petugas yang terlibat & perannya dalam satu sesi pemantauan (N:M).
- Penggunaan alat (pemantauan_alat) – alat yang digunakan & kondisi pakainya dalam satu sesi pemantauan (N:M).
- Tim pembersihan (pembersihan_petugas) – petugas/relawan yang terlibat & perannya dalam satu kegiatan pembersihan (N:M).
**Data Laporan / Output**
 
- Laporan rekapitulasi sampah per lokasi dan per periode.
- Laporan perbandingan jenis sampah dominan.
- Laporan tren volume sampah berdasarkan musim.
- Laporan kinerja kegiatan pembersihan (beach clean-up).
#### 3.1.3 Proses Bisnis
 
Proses bisnis sistem digambarkan melalui Use Case Diagram pada Gambar 3.1 berikut, yang menunjukkan interaksi 5 aktor dengan 13 use case beserta relasi <<include>> (use case wajib menyertakan use case lain) dan <<extend>> (use case opsional yang memperluas use case dasar).
 
**Gambar 1 Use Case Diagram – Sistem Monitoring Sampah Laut**
 
<img width="1098" height="1236" alt="image" src="https://github.com/user-attachments/assets/53287057-e168-4374-b7c6-8bf95af098d5" />
 
Berdasarkan diagram tersebut, proses bisnis berjalan dalam tahapan berikut:
 
- **Autentikasi –** seluruh aktor (Administrator, Petugas Lapangan, Koordinator/Supervisor, Peneliti/Analis, Pemerintah/Lembaga) wajib login terlebih dahulu sebelum mengakses use case lain.
- **Setup data master –** Administrator mengisi data lokasi (KF-01), jenis sampah (KF-02), sumber sampah (KF-08), dan alat pemantauan (KF-10); Koordinator turut mengelola data petugas (KF-04) dan data alat (KF-10).
- **Pemantauan lapangan –** tim Petugas Lapangan turun ke lokasi, mencatat kondisi lingkungan (KF-09), lalu mencatat data hasil pemantauan sampah (KF-03) – use case ini menjadi pusat dari sebagian besar relasi include pada diagram.
- **<<extend>> Peringatan volume –** use case Menghasilkan Peringatan/Alert (KF-11) bersifat opsional, hanya aktif memperluas KF-03 apabila volume sampah pada saat pencatatan melebihi ambang batas; ditujukan kepada Koordinator dan Administrator.
- **Tindak lanjut pembersihan –** Petugas Lapangan bersama Koordinator mencatat Laporan Kegiatan Pembersihan (KF-05) sebagai aksi lanjutan dari hasil pemantauan.
- **<<include>> Rekapitulasi –** use case Membuat Laporan Rekapitulasi (KF-06) wajib menyertakan data dari Mencatat Data Hasil Pemantauan (KF-03), karena rekap tidak dapat dibuat tanpa data temuan; dikerjakan oleh Koordinator dan Peneliti.
- **<<include>> Statistik tren –** use case Menampilkan Statistik Tren (KF-07) wajib menyertakan Membuat Laporan Rekapitulasi (KF-06), karena statistik diturunkan dari hasil rekap; dimanfaatkan oleh Peneliti dan Pemerintah/Lembaga.
- **<<include>> Data historis –** use case Menyimpan & Mengakses Data Historis (KF-12) wajib menyertakan Mengelola Data Lokasi Pemantauan (KF-01), karena data historis mencakup data lokasi; juga diakses Peneliti dan Pemerintah/Lembaga.
- **Pengambilan kebijakan –** Pemerintah/Lembaga dan Peneliti memanfaatkan hasil KF-06, KF-07, dan KF-12 secara read only untuk mengidentifikasi area rawan pencemaran (hotspot) dan mengevaluasi efektivitas program beach clean-up.
### 3.2 ERD (Entity Relationship Diagram)
 
**Gambar 2 ERD (Entity Relationship Diagram)**
 
<img width="1120" height="705" alt="image" src="https://github.com/user-attachments/assets/e033a408-6fd4-4c35-aa67-0cc1930178a1" />
 
#### 3.2.1 Penjelasan Entitas
 
Berdasarkan hasil perancangan ERD, terdapat 11 (sebelas) entitas yang digunakan dalam Sistem Monitoring Sampah Laut, terdiri dari 5 entitas master, 3 entitas transaksi, dan 3 tabel penghubung (junction table) untuk merepresentasikan relasi many-to-many. Rincian entitas adalah sebagai berikut:
 
| **No** | **Nama Entitas** | **Jenis** | **Deskripsi** |
| --- | --- | --- | --- |
| 1 | lokasi | Master | Menyimpan data lokasi/titik pemantauan sampah laut. |
| 2 | jenis_sampah | Master | Menyimpan data klasifikasi jenis dan kategori sampah. |
| 3 | petugas | Master | Menyimpan data petugas lapangan, koordinator, dan relawan. |
| 4 | sumber_sampah | Master | Menyimpan data klasifikasi sumber asal sampah. |
| 5 | alat_pemantauan | Master | Menyimpan data alat/peralatan yang digunakan saat pemantauan. |
| 6 | pemantauan | Transaksi | Menyimpan data kegiatan/sesi pemantauan yang dilakukan di suatu lokasi. |
| 7 | hasil_pemantauan | Transaksi | Menyimpan rincian temuan sampah pada setiap sesi pemantauan. |
| 8 | pembersihan | Transaksi | Menyimpan data kegiatan pembersihan (beach clean-up) lanjutan dari suatu pemantauan. |
| 9 | pemantauan_alat | Penghubung | Tabel penghubung (junction table) untuk relasi many-to-many antara pemantauan dan alat_pemantauan. |
| 10 | pembersihan_petugas | Penghubung | Tabel penghubung (junction table) untuk relasi many-to-many antara pembersihan dan petugas. |
| 11 | pemantauan_petugas | Penghubung | Tabel penghubung (junction table) untuk relasi many-to-many antara pemantauan dan petugas (satu sesi pemantauan dilakukan oleh beberapa petugas/tim). |
 
**Tabel 3 Rincian entitas**
 
**Penjelasan Relasi Antar Entitas**
 
Relasi antar entitas pada ERD di atas dapat dijelaskan sebagai berikut:
 
- **lokasi - pemantauan (1:N) —** Satu lokasi dapat memiliki banyak sesi pemantauan pada waktu yang berbeda, namun setiap sesi pemantauan hanya berlangsung di satu lokasi.
- **petugas - pemantauan (N:M, melalui pemantauan_petugas) —** Satu petugas dapat melaksanakan banyak sesi pemantauan, dan satu sesi pemantauan dapat dilaksanakan oleh beberapa petugas/tim secara bersama-sama. Relasi ini diuraikan melalui tabel penghubung pemantauan_petugas.
- **pemantauan - hasil_pemantauan (1:N) —** Satu sesi pemantauan dapat menghasilkan banyak data temuan sampah (untuk berbagai jenis dan sumber sampah yang ditemukan), namun setiap data hasil pemantauan hanya berasal dari satu sesi pemantauan.
- **jenis_sampah - hasil_pemantauan (1:N) —** Satu jenis sampah dapat tercatat pada banyak data hasil pemantauan, namun setiap data hasil pemantauan hanya mengacu pada satu jenis sampah.
- **sumber_sampah - hasil_pemantauan (1:N) —** Satu sumber sampah dapat menjadi asal dari banyak data hasil pemantauan, namun setiap data hasil pemantauan hanya mengacu pada satu sumber sampah.
- **pemantauan - pembersihan (1:N) —** Satu sesi pemantauan dapat menghasilkan/memicu banyak kegiatan pembersihan (beach clean-up) lanjutan, namun setiap kegiatan pembersihan terkait dengan satu sesi pemantauan.
- **pemantauan - alat_pemantauan (N:M, melalui pemantauan_alat) —** Satu sesi pemantauan dapat menggunakan beberapa alat, dan satu alat dapat digunakan pada beberapa sesi pemantauan yang berbeda. Relasi ini diuraikan melalui tabel penghubung pemantauan_alat.
- **pembersihan - petugas (N:M, melalui pembersihan_petugas) —** Satu kegiatan pembersihan dapat melibatkan beberapa petugas/relawan, dan satu petugas dapat terlibat dalam beberapa kegiatan pembersihan yang berbeda. Relasi ini diuraikan melalui tabel penghubung pembersihan_petugas.
**Normalisasi Data**
 
Proses normalisasi dilakukan terhadap data pencatatan hasil pemantauan sampah laut, yang pada praktiknya dicatat dalam satu formulir pemantauan yang memuat data lokasi, petugas, dan rincian beberapa jenis sampah yang ditemukan dalam satu sesi pemantauan (data berulang/repeating group).
 
**Bentuk Tidak Normal (Unnormalized Form / UNF)**
 
Pada bentuk tidak normal, satu sesi pemantauan dapat memuat lebih dari satu temuan jenis sampah dalam satu baris data yang sama (kelompok data berulang), sehingga atribut nama_jenis_sampah, kategori, volume_m3, berat_kg, dan nama_sumber bersifat multivalue/berulang untuk satu id_pemantauan. Contoh ilustrasi data (disederhanakan, hanya menampilkan kelompok data sampah) ditampilkan pada tabel berikut, di mana sel yang menyatu (merge) menunjukkan nilai yang sama/berulang untuk satu sesi pemantauan:
 
| **id_pemantauan** | **tanggal_waktu / lokasi** | **petugas** | **nama_jenis_sampah** | **kategori** | **volume_m3** | **berat_kg** | **nama_sumber** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| P001 | 14/06/2026 - Pantai Nongsa | Andre Z. Pratama | Plastik | Anorganik | 15.0 | 22.5 | Domestik |
|  |  |  | Organik | Organik | 8.0 | 10.0 | Pariwisata |
| P002 | 15/06/2026 - Pantai Trikora | Rizky A. Hidayatullah | Kaca | Anorganik | 3.0 | 9.0 | Kapal |
 
**Tabel 4 Bentuk Tidak Normal (Unnormalized Form / UNF)**
 
**Bentuk Normal Pertama (1NF)**
 
Untuk mencapai 1NF, kelompok data berulang (repeating group) pada UNF dipecah sehingga setiap baris hanya memuat satu nilai atomik (tidak ada lagi multivalue/sel bermerge). Setiap kombinasi pemantauan dan jenis sampah dituliskan dalam barisnya sendiri, seperti pada tabel berikut:
 
| **id_pemantauan** | **tanggal_waktu / lokasi** | **petugas** | **nama_jenis_sampah** | **kategori** | **volume_m3** | **berat_kg** | **nama_sumber** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| P001 | 14/06/2026 - Pantai Nongsa | Andre Z. Pratama | Plastik | Anorganik | 15.0 | 22.5 | Domestik |
| P001 | 14/06/2026 - Pantai Nongsa | Andre Z. Pratama | Organik | Organik | 8.0 | 10.0 | Pariwisata |
| P002 | 15/06/2026 - Pantai Trikora | Rizky A. Hidayatullah | Kaca | Anorganik | 3.0 | 9.0 | Kapal |
 
**Tabel 5 Bentuk Normal Pertama (1NF)**
 
Tabel pada 1NF di atas sudah tidak memiliki kelompok data berulang, namun masih terjadi redundansi data: atribut tanggal_waktu, nama_lokasi, dan data petugas berulang pada setiap baris untuk id_pemantauan yang sama. Hal ini menunjukkan adanya dependensi parsial (partial dependency) terhadap kunci kandidat komposit, sehingga perlu dilanjutkan ke 2NF.
 
**Bentuk Normal Kedua (2NF)**
 
Untuk menghilangkan dependensi parsial, setiap kelompok atribut yang **hanya bergantung pada sebagian kunci** dipisahkan menjadi entitas mandiri dengan primary key-nya sendiri:
 
- **lokasi** (id_lokasi, nama_lokasi, latitude, longitude, jenis_perairan, provinsi, kabupaten, deskripsi) — karena seluruh atributnya hanya bergantung pada id_lokasi.
- **petugas** (id_petugas, nama, no_identitas, jabatan, unit_kerja, kontak, wilayah_tugas) — hanya bergantung pada id_petugas.
- **jenis_sampah** (id_jenis, nama_jenis, kategori, tingkat_bahaya, deskripsi) — hanya bergantung pada id_jenis.
- **sumber_sampah** (id_sumber, jenis_sumber, deskripsi) — hanya bergantung pada id_sumber.
- **alat_pemantauan** (id_alat, nama_alat, jenis_alat, kondisi, tanggal_kalibrasi) — hanya bergantung pada id_alat.
Setelah pemisahan ini, tabel transaksi yang tersisa hanya menyimpan atribut yang bergantung **penuh** pada kunci utamanya masing-masing:
 
- **pemantauan** (id_pemantauan, tanggal_waktu, id_lokasi, kondisi_cuaca, kondisi_arus, catatan_umum) — dibuktikan lewat Tabel 3, contoh P001 (14/06/2026 08:00, lokasi L001, Cerah, Tenang) dan P002 (15/06/2026 09:30, lokasi L002, Berawan, Sedang, "Area padat").
- **hasil_pemantauan** (id_hasil, id_pemantauan, id_jenis, id_sumber, volume_m3, berat_kg, jumlah_item, foto_path) — dibuktikan lewat Tabel 4, contoh H001 (P001, J001, S001, 15.0, 22.5), H002 (P001, J002, S003, 8.0, 10.0), H003 (P002, J003, S002, 3.0, 9.0).
| **id_pemantauan** | **tanggal_waktu** | **id_lokasi (FK)** | **Kondisi_cuaca** | **kondisi_arus** | **catatan_umum** |
| --- | --- | --- | --- | --- | --- |
| P001 | 14/06/2026 08:00 | L001 | Cerah | Tenang | - |
| P002 | 15/06/2026 09:30 | L002 | Berawan | Sedang | Area padat |
 
**Tabel 6 Hasil Dekomposisi 2NF — Tabel pemantauan**
 
| **id_hasil** | **id_pemantauan (FK)** | **id_jenis (FK)** | **id_sumber (FK)** | **volume_m3** | **berat_kg** |
| --- | --- | --- | --- | --- | --- |
| H001 | P001 | J001 | S001 | 15.0 | 22.5 |
| H002 | P001 | J002 | S003 | 8.0 | 10.0 |
| H003 | P002 | J003 | S002 | 3.0 | 9.0 |
 
**Tabel 7 Hasil Dekomposisi 2NF — Tabel hasil_pemantauan (atribut non-kunci bergantung penuh pada id_hasil)**
 
Keterangan: Pada tabel pemantauan, seluruh atribut (tanggal_waktu, id_lokasi, kondisi_cuaca, kondisi_arus, catatan_umum) bergantung penuh pada id_pemantauan. Pada tabel hasil_pemantauan, seluruh atribut bergantung penuh pada id_hasil. Referensi ke entitas lain menggunakan FK sehingga tidak ada lagi redundansi data nama lokasi, nama jenis sampah, atau nama sumber yang berulang di setiap baris.
 
**Bentuk Normal Ketiga (3NF)**
 
Tahap terakhir memeriksa **dependensi transitif**, yaitu apakah ada atribut non-kunci yang bergantung pada atribut non-kunci lain (bukan langsung pada primary key). Pengecekan dilakukan pada seluruh tabel hasil 2NF, dan hasilnya tidak ditemukan satu pun dependensi transitif:
 
| **Tabel** | **Primary Key** | **Dependensi Transitif?** | **Status 3NF** |
| --- | --- | --- | --- |
| lokasi | id_lokasi | Tidak. provinsi dan kabupaten bergantung langsung pada id_lokasi, bukan diturunkan dari atribut non-kunci lainnya. | ✓ Memenuhi 3NF |
| jenis_sampah | id_jenis | Tidak. tingkat_bahaya tampak bergantung pada kategori, namun pada praktiknya tingkat bahaya tetap ditentukan per id_jenis, bukan per kategori. | ✓ Memenuhi 3NF |
| petugas | id_petugas | Tidak. unit_kerja dan wilayah_tugas masing-masing bergantung langsung pada id_petugas. | ✓ Memenuhi 3NF |
| sumber_sampah | id_sumber | Tidak. Hanya dua atribut non-kunci (jenis_sumber, deskripsi), keduanya bergantung langsung pada id_sumber. | ✓ Memenuhi 3NF |
| alat_pemantauan | id_alat | Tidak. nama_alat, jenis_alat, kondisi, tanggal_kalibrasi semuanya bergantung langsung pada id_alat. | ✓ Memenuhi 3NF |
| pemantauan | id_pemantauan | Tidak. kondisi_cuaca, kondisi_arus, catatan_umum tidak diturunkan dari atribut lain; id_lokasi adalah FK bukan atribut non-kunci independen. | ✓ Memenuhi 3NF |
| hasil_pemantauan | id_hasil | Tidak. volume_m3, berat_kg, jumlah_item, foto_path bergantung langsung pada id_hasil. FK hanya sebagai referensi, bukan atribut non-kunci derivatif. | ✓ Memenuhi 3NF |
| pembersihan | id_pembersihan | Tidak. tanggal_pelaksanaan, volume_terangkut, tujuan_pembuangan, catatan semuanya bergantung langsung pada id_pembersihan. | ✓ Memenuhi 3NF |
| Tabel Junction (3 tabel) | PK Komposit | Tidak. Setiap atribut tambahan (kondisi_pakai, peran_petugas, peran_dalam_pemantauan) bergantung langsung pada PK komposit masing-masing tabel. | ✓ Memenuhi 3NF |
 
**Tabel 8 Pengecekan pada seluruh tabel hasil 2NF**
 
Karena seluruh tabel terbukti **memenuhi 3NF**, untuk mengakomodasi relasi many-to-many lain yang ditemukan selama analisis (pemantauan dengan alat, pembersihan dengan petugas), ditambahkan dua tabel penghubung lagi: **pemantauan_alat** dan **pembersihan_petugas** (selain pemantauan_petugas yang sudah dibuat di tahap 2NF).
 
---
 
## BAB IV – IMPLEMENTASI
 
### 4.1 Desain Tabel
 
**Tabel 1. lokasi**
 
*Menyimpan data lokasi/titik pemantauan sampah laut.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| id_lokasi | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik lokasi pemantauan |
| nama_lokasi | VARCHAR | 100 | NOT NULL | Nama lokasi pemantauan |
| latitude | DECIMAL | 9,6 | NOT NULL | Koordinat lintang lokasi |
| longitude | DECIMAL | 9,6 | NOT NULL | Koordinat bujur lokasi |
| jenis_perairan | VARCHAR | 30 | NOT NULL | Jenis perairan (laut terbuka/pesisir/muara) |
| provinsi | VARCHAR | 50 | NOT NULL | Provinsi lokasi pemantauan |
| kabupaten | VARCHAR | 50 | NOT NULL | Kabupaten/kota lokasi pemantauan |
| deskripsi | TEXT | - | NULL | Deskripsi tambahan mengenai lokasi |
 
**Tabel 9 lokasi**
 
**Tabel 2. jenis_sampah**
 
*Menyimpan data klasifikasi jenis dan kategori sampah.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| id_jenis | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik jenis sampah |
| nama_jenis | VARCHAR | 50 | NOT NULL | Nama jenis sampah (plastik, kaca, logam, organik, B3, dll.) |
| kategori | VARCHAR | 30 | NOT NULL | Kategori sampah |
| tingkat_bahaya | VARCHAR | 20 | NOT NULL | Tingkat bahaya sampah (rendah/sedang/tinggi) |
| deskripsi | TEXT | - | NULL | Deskripsi tambahan jenis sampah |
 
**Tabel 10 jenis_sampah**
 
**Tabel 3. petugas**
 
*Menyimpan data petugas lapangan, koordinator, dan relawan.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| id_petugas | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik petugas |
| nama | VARCHAR | 100 | NOT NULL | Nama lengkap petugas |
| no_identitas | VARCHAR | 20 | UNIQUE, NOT NULL | Nomor identitas/induk petugas |
| jabatan | VARCHAR | 50 | NOT NULL | Jabatan/peran petugas |
| unit_kerja | VARCHAR | 100 | NOT NULL | Unit kerja/instansi petugas |
| kontak | VARCHAR | 20 | NULL | Nomor kontak petugas |
| wilayah_tugas | VARCHAR | 100 | NULL | Wilayah tugas petugas |
 
**Tabel 11 petugas**
 
**Tabel 4. sumber_sampah**
 
*Menyimpan data klasifikasi sumber asal sampah.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| id_sumber | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik sumber sampah |
| jenis_sumber | VARCHAR | 30 | NOT NULL | Jenis sumber sampah (domestik, industri, kapal, pariwisata, tidak teridentifikasi) |
| deskripsi | TEXT | - | NULL | Deskripsi tambahan sumber sampah |
 
**Tabel 12 sumber_sampah**
 
**Tabel 5. alat_pemantauan**
 
*Menyimpan data alat/peralatan yang digunakan saat pemantauan.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| id_alat | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik alat pemantauan |
| nama_alat | VARCHAR | 50 | NOT NULL | Nama alat pemantauan |
| jenis_alat | VARCHAR | 30 | NOT NULL | Jenis/kategori alat |
| kondisi | VARCHAR | 20 | NOT NULL | Kondisi alat (baik/rusak/perlu kalibrasi) |
| tanggal_kalibrasi | DATE | - | NULL | Tanggal kalibrasi terakhir |
 
**Tabel 13 alat_pemantauan**
 
**Tabel 6. pemantauan**
 
*Menyimpan data kegiatan/sesi pemantauan yang dilakukan di suatu lokasi.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| id_pemantauan | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik sesi pemantauan |
| tanggal_waktu | DATETIME | - | NOT NULL | Tanggal dan waktu pelaksanaan pemantauan |
| *id_lokasi (FK)* | INT | - | FOREIGN KEY -> lokasi.id_lokasi, NOT NULL | Referensi lokasi pemantauan |
| kondisi_cuaca | VARCHAR | 30 | NULL | Kondisi cuaca saat pemantauan |
| kondisi_arus | VARCHAR | 30 | NULL | Kondisi arus saat pemantauan |
| catatan_umum | TEXT | - | NULL | Catatan umum hasil pemantauan |
 
**Tabel 14 pemantauan**
 
**Tabel 7. hasil_pemantauan**
 
*Menyimpan rincian temuan sampah pada setiap sesi pemantauan.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| id_hasil | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik data hasil pemantauan |
| *id_pemantauan (FK)* | INT | - | FOREIGN KEY -> pemantauan.id_pemantauan, NOT NULL | Referensi sesi pemantauan |
| *id_jenis (FK)* | INT | - | FOREIGN KEY -> jenis_sampah.id_jenis, NOT NULL | Referensi jenis sampah yang ditemukan |
| *id_sumber (FK)* | INT | - | FOREIGN KEY -> sumber_sampah.id_sumber, NULL | Referensi sumber sampah |
| volume_m3 | DECIMAL | 8,2 | NULL | Volume sampah yang ditemukan (m3) |
| berat_kg | DECIMAL | 8,2 | NULL | Berat sampah yang ditemukan (kg) |
| jumlah_item | INT | - | NULL | Jumlah item sampah yang ditemukan |
| foto_path | VARCHAR | 255 | NULL | Path/tautan foto dokumentasi |
 
**Tabel 15 hasil_pemantauan**
 
**Tabel 8. pembersihan**
 
*Menyimpan data kegiatan pembersihan (beach clean-up) lanjutan dari suatu pemantauan.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| id_pembersihan | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik kegiatan pembersihan |
| *id_pemantauan (FK)* | INT | - | FOREIGN KEY -> pemantauan.id_pemantauan, NOT NULL | Referensi sesi pemantauan terkait |
| tanggal_pelaksanaan | DATE | - | NOT NULL | Tanggal pelaksanaan pembersihan |
| volume_terangkut | DECIMAL | 8,2 | NULL | Total volume sampah yang terangkut |
| tujuan_pembuangan | VARCHAR | 100 | NULL | Lokasi/tujuan pembuangan akhir sampah |
| catatan | TEXT | - | NULL | Catatan tambahan kegiatan pembersihan |
 
**Tabel 16 pembersihan**
 
**Tabel 9. pemantauan_alat**
 
*Tabel penghubung (junction table) untuk relasi many-to-many antara pemantauan dan alat_pemantauan.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| *id_pemantauan (FK)* | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> pemantauan.id_pemantauan | Referensi sesi pemantauan |
| *id_alat (FK)* | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> alat_pemantauan.id_alat | Referensi alat yang digunakan |
| kondisi_pakai | VARCHAR | 20 | NULL | Kondisi alat saat digunakan dalam sesi tersebut |
 
**Tabel 17 pemantauan_alat**
 
**Tabel 10. pembersihan_petugas**
 
*Tabel penghubung (junction table) untuk relasi many-to-many antara pembersihan dan petugas.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| *id_pembersihan (FK)* | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> pembersihan.id_pembersihan | Referensi kegiatan pembersihan |
| *id_petugas (FK)* | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> petugas.id_petugas | Referensi petugas yang terlibat |
| peran_petugas | VARCHAR | 30 | NULL | Peran petugas dalam kegiatan pembersihan |
 
**Tabel 18 pembersihan_petugas**
 
**Tabel 11. pemantauan_petugas**
 
*Tabel penghubung (junction table) untuk relasi many-to-many antara pemantauan dan petugas.*
 
| **Nama Field** | **Tipe Data** | **Panjang** | **Constraint** | **Keterangan** |
| --- | --- | --- | --- | --- |
| *id_pemantauan (FK)* | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> pemantauan.id_pemantauan | Referensi sesi pemantauan |
| *id_petugas (FK)* | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> petugas.id_petugas | Referensi petugas yang terlibat |
| peran_dalam_pemantauan | VARCHAR | 30 | NULL | Peran petugas dalam sesi pemantauan (misal: ketua tim, pencatat, fotografer) |
 
**Tabel 19 pemantauan_petugas**
 
### 4.2 SQL DDL
 
Berikut adalah script Data Definition Language (DDL) untuk membuat database dan seluruh tabel berdasarkan Kamus Data pada Progres 2.
 
**Pembuatan Database**
 
```sql
CREATE DATABASE sistem_monitoring_sampah_laut;
 
USE sistem_monitoring_sampah_laut;
```
 
**Tabel lokasi**
 
```sql
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
```
 
**Tabel jenis_sampah**
 
```sql
CREATE TABLE jenis_sampah (
id_jenis INT AUTO_INCREMENT PRIMARY KEY,
nama_jenis VARCHAR(50) NOT NULL,
kategori VARCHAR(30) NOT NULL,
tingkat_bahaya VARCHAR(20) NOT NULL,
deskripsi TEXT NULL
);
```
 
**Tabel petugas**
 
```sql
CREATE TABLE petugas (
id_petugas INT AUTO_INCREMENT PRIMARY KEY,
nama VARCHAR(100) NOT NULL,
no_identitas VARCHAR(20) UNIQUE NOT NULL,
jabatan VARCHAR(50) NOT NULL,
unit_kerja VARCHAR(100) NOT NULL,
kontak VARCHAR(20) NULL,
wilayah_tugas VARCHAR(100) NULL
);
```
 
**Tabel sumber_sampah**
 
```sql
CREATE TABLE sumber_sampah (
id_sumber INT AUTO_INCREMENT PRIMARY KEY,
jenis_sumber VARCHAR(30) NOT NULL,
deskripsi TEXT NULL
);
```
 
**Tabel alat_pemantauan**
 
```sql
CREATE TABLE alat_pemantauan (
id_alat INT AUTO_INCREMENT PRIMARY KEY,
nama_alat VARCHAR(50) NOT NULL,
jenis_alat VARCHAR(30) NOT NULL,
kondisi VARCHAR(20) NOT NULL,
tanggal_kalibrasi DATE NULL
);
```
 
**Tabel pemantauan**
 
```sql
CREATE TABLE pemantauan (
id_pemantauan INT AUTO_INCREMENT PRIMARY KEY,
tanggal_waktu DATETIME NOT NULL,
id_lokasi INT NOT NULL,
kondisi_cuaca VARCHAR(30) NULL,
kondisi_arus VARCHAR(30) NULL,
catatan_umum TEXT NULL,
FOREIGN KEY (id_lokasi) REFERENCES lokasi(id_lokasi) ON DELETE RESTRICT ON UPDATE CASCADE
);
```
 
**Tabel hasil_pemantauan**
 
```sql
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
```
 
**Tabel pembersihan**
 
```sql
CREATE TABLE pembersihan (
id_pembersihan INT AUTO_INCREMENT PRIMARY KEY,
id_pemantauan INT NOT NULL,
tanggal_pelaksanaan DATE NOT NULL,
volume_terangkut DECIMAL(8,2) NULL,
tujuan_pembuangan VARCHAR(100) NULL,
catatan TEXT NULL,
FOREIGN KEY (id_pemantauan) REFERENCES pemantauan(id_pemantauan) ON DELETE RESTRICT ON UPDATE CASCADE
);
```
 
**Tabel pemantauan_alat (Junction)**
 
```sql
CREATE TABLE pemantauan_alat (
id_pemantauan INT NOT NULL,
id_alat INT NOT NULL,
kondisi_pakai VARCHAR(20) NULL,
PRIMARY KEY (id_pemantauan, id_alat),
FOREIGN KEY (id_pemantauan) REFERENCES pemantauan(id_pemantauan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_alat) REFERENCES alat_pemantauan(id_alat) ON DELETE RESTRICT ON UPDATE CASCADE
);
```
 
**Tabel pembersihan_petugas (Junction)**
 
```sql
CREATE TABLE pembersihan_petugas (
id_pembersihan INT NOT NULL,
id_petugas INT NOT NULL,
peran_petugas VARCHAR(30) NULL,
PRIMARY KEY (id_pembersihan, id_petugas),
FOREIGN KEY (id_pembersihan) REFERENCES pembersihan(id_pembersihan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas) ON DELETE RESTRICT ON UPDATE CASCADE
);
```
 
**Tabel pemantauan_petugas (Junction)**
 
```sql
CREATE TABLE pemantauan_petugas (
id_pemantauan INT NOT NULL,
id_petugas INT NOT NULL,
peran_dalam_pemantauan VARCHAR(30) NULL,
PRIMARY KEY (id_pemantauan, id_petugas),
FOREIGN KEY (id_pemantauan) REFERENCES pemantauan(id_pemantauan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas) ON DELETE RESTRICT ON UPDATE CASCADE
);
```
 
### 4.3 SQL DML (Data)
 
**Insert Data Master**
 
```sql
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
```
 
**Insert Data Transaksi**
 
```sql
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
```
 
**Insert Data Junction (Relasi N:M)**
 
```sql
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
```
 
---
 
## BAB V – PENGUJIAN DAN QUERY
 
### 5.1 Skenario Pengujian

note: foto bisa dilihat pada file "Laporan Akhir PjBL.docx"

**Skenario 1: Uji Constraint UNIQUE**
 
**Tujuan:** Membuktikan bahwa kolom no_identitas di tabel petugas tidak boleh ada yang sama (duplikat). **Query yang dijalankan:**
 
```sql
-- Mencoba insert petugas baru dengan no_identitas 'PTG-001' yang sudah ada di data uji
INSERT INTO petugas (nama, no_identitas, jabatan, unit_kerja, kontak, wilayah_tugas) 
VALUES ('Petugas Test', 'PTG-001', 'Tester', 'Unit Test', '08111111111', 'Test');
```
 
**Skenario 2: Uji Constraint FOREIGN KEY**
 
**Tujuan:** Membuktikan bahwa data anak (hasil_pemantauan) tidak bisa di-insert jika data induk (pemantauan) tidak ada. **Query yang dijalankan:**
 
```sql
-- Mencoba insert hasil pemantauan dengan id_pemantauan = 99 (padahal di tabel pemantauan hanya ada id 1, 2, 3)
INSERT INTO hasil_pemantauan (id_pemantauan, id_jenis, id_sumber, volume_m3, berat_kg, jumlah_item) 
VALUES (99, 1, 1, 10.0, 15.0, 50);
```
 
**Skenario 3: Uji CASCADE DELETE**
 
**Tujuan:** Membuktikan bahwa jika data induk (pemantauan) dihapus, data anak yang berelasi akan otomatis terhapus. **Query yang dijalankan:**
 
```sql
-- 1. Cek data hasil pemantauan untuk id 3 sebelum dihapus (sebagai bukti awal)
SELECT * FROM hasil_pemantauan WHERE id_pemantauan = 3;
 
-- 2. Eksekusi Hapus data pemantauan id 3
DELETE FROM pemantauan WHERE id_pemantauan = 3;
 
-- 3. Cek kembali data hasil pemantauan untuk id 3 (harusnya hasilnya kosong/0 rows)
SELECT * FROM hasil_pemantauan WHERE id_pemantauan = 3;
```
 
**Skenario 4: Uji RESTRICT DELETE**
 
**Tujuan:** Membuktikan bahwa data induk (lokasi) tidak bisa dihapus jika masih digunakan oleh data anak (pemantauan). **Query yang dijalankan:**
 
```sql
-- Mencoba menghapus lokasi id 1 (Pantai Nongsa), padahal masih direferensikan oleh pemantauan id 1
DELETE FROM lokasi WHERE id_lokasi = 1;
```
 
**Skenario 5: Uji Query Laporan (JOIN & Agregasi)**
 
**Tujuan:** Membuktikan query untuk laporan rekapitulasi berjalan dengan benar. **Query yang dijalankan:** (Ini adalah **Query 5** dan **Query 6** dari daftar 15 query)
 
**Query 5 (Total Berat per Jenis):**
 
```sql
SELECT js.nama_jenis, SUM(hp.berat_kg) AS total_berat_kg
FROM hasil_pemantauan hp
JOIN jenis_sampah js ON hp.id_jenis = js.id_jenis
GROUP BY js.nama_jenis
ORDER BY total_berat_kg DESC;
```
 
**Query 6 (Lokasi dengan Volume > 20 m3):**
 
```sql
SELECT l.nama_lokasi, SUM(hp.volume_m3) AS total_volume_m3
FROM hasil_pemantauan hp
JOIN pemantauan p ON hp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi
GROUP BY l.nama_lokasi
HAVING total_volume_m3 > 20;
```
 
**Skenario 6: Uji Query Modifikasi (UPDATE)**
 
**Tujuan:** Membuktikan bahwa data di database dapat diperbarui (update) dengan benar. **Query yang dijalankan:** (Ini adalah **Query 11** dari daftar 15 query)
 
```sql
-- 1. Cek kondisi alat id 3 sebelum diupdate
SELECT id_alat, nama_alat, kondisi FROM alat_pemantauan WHERE id_alat = 2;
 
-- 2. Eksekusi Update
UPDATE alat_pemantuan 
SET kondisi = 'Perlu Perawatan', tanggal_kalibrasi = NULL 
WHERE id_alat = 3;
 
-- 3. Cek kondisi alat id 3 sesudah diupdate (untuk membuktikan perubahan)
SELECT id_alat, nama_alat, kondisi, tanggal_kalibrasi FROM alat_pemantauan WHERE id_alat = 2;
```
 
### 5.2 Query SQL (minimal 10 query)
 
Berikut adalah 15 query yang mencakup operasi dasar, JOIN, Agregasi, Subquery, dan Modifikasi Data.
 
**Query 1: Menampilkan seluruh data lokasi pemantauan**
 
```sql
SELECT id_lokasi, nama_lokasi, jenis_perairan, kabupaten FROM lokasi;
```
 
**Query 2: Menampilkan jenis sampah dengan tingkat bahaya 'Tinggi'**
 
```sql
SELECT nama_jenis, kategori, tingkat_bahaya FROM jenis_sampah WHERE tingkat_bahaya = 'Tinggi';
```
 
**Query 3: JOIN - Menampilkan hasil pemantauan lengkap dengan nama lokasi dan jenis sampah**
 
```sql
SELECT p.tanggal_waktu, l.nama_lokasi, js.nama_jenis, hp.berat_kg 
FROM hasil_pemantauan hp
JOIN pemantauan p ON hp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi
JOIN jenis_sampah js ON hp.id_jenis = js.id_jenis;
```
 
**Query 4: JOIN 3 Tabel - Menampilkan petugas yang terlibat dalam suatu sesi pemantauan beserta lokasinya**
 
```sql
SELECT pt.nama AS nama_petugas, pp.peran_dalam_pemantauan, l.nama_lokasi, p.tanggal_waktu
FROM pemantauan_petugas pp
JOIN petugas pt ON pp.id_petugas = pt.id_petugas
JOIN pemantauan p ON pp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi;
```
 
**Query 5: Agregasi - Menghitung total berat sampah (kg) berdasarkan jenis sampah**
 
```sql
SELECT js.nama_jenis, SUM(hp.berat_kg) AS total_berat_kg
FROM hasil_pemantauan hp
JOIN jenis_sampah js ON hp.id_jenis = js.id_jenis
GROUP BY js.nama_jenis
ORDER BY total_berat_kg DESC;
```
 
**Query 6: Agregasi & HAVING - Menampilkan lokasi dengan total volume sampah > 20 m3**
 
```sql
SELECT l.nama_lokasi, SUM(hp.volume_m3) AS total_volume_m3
FROM hasil_pemantauan hp
JOIN pemantauan p ON hp.id_pemantauan = p.id_pemantauan
JOIN lokasi l ON p.id_lokasi = l.id_lokasi
GROUP BY l.nama_lokasi
HAVING total_volume_m3 > 20;
```
 
**Query 7: Subquery - Menampilkan data petugas yang pernah terlibat dalam kegiatan pembersihan**
 
```sql
SELECT nama, jabatan, unit_kerja 
FROM petugas 
WHERE id_petugas IN (SELECT DISTINCT id_petugas FROM pembersihan_petugas);
```
 
**Query 8: LEFT JOIN - Menampilkan lokasi dan jumlah kegiatan pembersihannya (termasuk yang belum pernah dibersihkan)**
 
```sql
SELECT l.nama_lokasi, COUNT(pb.id_pembersihan) AS jumlah_kegiatan_bersih
FROM lokasi l
LEFT JOIN pemantauan p ON l.id_lokasi = p.id_lokasi
LEFT JOIN pembersihan pb ON p.id_pemantauan = pb.id_pemantauan
GROUP BY l.nama_lokasi;
```
 
**Query 9: Filter Tanggal - Menampilkan pemantauan yang dilakukan pada bulan Juni 2026**
 
```sql
SELECT id_pemantauan, tanggal_waktu, kondisi_cuaca 
FROM pemantauan 
WHERE MONTH(tanggal_waktu) = 6 AND YEAR(tanggal_waktu) = 2026;
```
 
**Query 10: Complex JOIN - Laporan Rekapitulasi Sampah per Sumber**
 
```sql
SELECT ss.jenis_sumber, js.nama_jenis, SUM(hp.jumlah_item) AS total_item, SUM(hp.berat_kg) AS total_berat
FROM hasil_pemantauan hp
JOIN sumber_sampah ss ON hp.id_sumber = ss.id_sumber
JOIN jenis_sampah js ON hp.id_jenis = js.id_jenis
GROUP BY ss.jenis_sumber, js.nama_jenis
ORDER BY ss.jenis_sumber;
```
 
**Query 11: UPDATE - Mengubah kondisi alat pemantauan setelah digunakan**
 
```sql
UPDATE alat_pemantauan 
SET kondisi = 'Perlu Perawatan', tanggal_kalibrasi = NULL 
WHERE id_alat = 2;
```
 
**Query 12: UPDATE - Menambahkan catatan umum pada sesi pemantauan**
 
```sql
UPDATE pemantauan 
SET catatan_umum = 'Pemantauan rutin pagi hari, ditemukan banyak sampah plastik domestik.' 
WHERE id_pemantauan = 1;
```
 
**Query 13: DELETE - Menghapus data uji pembersihan (Skenario pembatalan kegiatan)**
 
```sql
DELETE FROM pembersihan WHERE id_pembersihan = 2;
 
-- Catatan: Karena menggunakan ON DELETE CASCADE, data di pembersihan_petugas dengan id_pembersihan=2 akan otomatis terhapus.
```
 
### 5.3 Hasil Pengujian
 
#### 5.3.1 Bukti Skenario Pengujian Constraint
 
**Skenario 1 – Uji Constraint UNIQUE**
 
**Gambar 3 Hasil Uji Constraint UNIQUE – Error Duplicate Entry**
 
![Gambar 3 Hasil Uji Constraint UNIQUE – Error Duplicate Entry](images/image4.png)
 
**Skenario 2 – Uji Constraint FOREIGN KEY**
 
**Gambar 4 Hasil Uji Constraint FOREIGN KEY – Error Child Row**
 
![Gambar 4 Hasil Uji Constraint FOREIGN KEY – Error Child Row](images/image5.png)
 
**Skenario 3 – Uji CASCADE DELETE**
 
**Gambar 5 Hasil Uji ON DELETE CASCADE – Data Anak Otomatis Terhapus**
 
![Gambar 5 Hasil Uji ON DELETE CASCADE – Data Anak Otomatis Terhapus](images/image6.png)
 
**Skenario 4 – Uji RESTRICT DELETE**
 
**Gambar 6 Hasil Uji ON DELETE RESTRICT – Data Indak Tidak Bisa Dihapus**
 
![Gambar 6 Hasil Uji ON DELETE RESTRICT – Data Indak Tidak Bisa Dihapus](images/image7.png)
 
**Skenario 5 – Uji Query JOIN dan Agregasi**
 
**Query 5 – Total Berat Sampah per Jenis:**
 
**Gambar 7 Output Query 5 – Total Berat Sampah per Jenis**
 
![Gambar 7 Output Query 5 – Total Berat Sampah per Jenis](images/image8.png)
 
**Query 6 – Lokasi dengan Volume > 20 m³:**
 
**Gambar 8 Output Query 6 – Lokasi dengan Volume Sampah > 20 m³**
 
![Gambar 8 Output Query 6 – Lokasi dengan Volume Sampah > 20 m³](images/image9.png)
 
**Skenario 6 – Uji Query UPDATE**
 
**Query 11 – UPDATE Kondisi Alat:**
 
**Gambar 9 Output Query 11 – Pembuktian UPDATE Data Alat**
 
![Gambar 9 Output Query 11 – Pembuktian UPDATE Data Alat](images/image10.png)
 
#### 5.3.2 Hasil Eksekusi 15 Query SQL
 
**Query 1 – Menampilkan Seluruh Data Lokasi**
 
**Gambar 10 Output Query 1 – Daftar Lokasi Pemantauan**
 
![Gambar 10 Output Query 1 – Daftar Lokasi Pemantauan](images/image11.png)
 
**Query 2 – Filter Jenis Sampah Berbahaya Tinggi**
 
**Gambar 11 Output Query 2 – Jenis Sampah Tingkat Bahaya Tinggi**
 
![Gambar 11 Output Query 2 – Jenis Sampah Tingkat Bahaya Tinggi](images/image12.png)
 
**Query 3 – JOIN Tabel Hasil Pemantauan dengan Lokasi & Jenis Sampah**
 
**Gambar 12 Output Query 3 – Laporan Hasil Pemantauan Lengkap**
 
![Gambar 12 Output Query 3 – Laporan Hasil Pemantauan Lengkap](images/image13.png)
 
**Query 4 – JOIN 4 Tabel Petugas dalam Pemantauan**
 
**Gambar 13 Output Query 4 – Petugas yang Terlibat dalam Pemantauan**
 
![Gambar 13 Output Query 4 – Petugas yang Terlibat dalam Pemantauan](images/image14.png)
 
**Query 5 – Agregasi Total Berat Sampah per Jenis**
 
**Gambar 14 Output Query 5 – Total Berat Sampah per Jenis**
 
![Gambar 14 Output Query 5 – Total Berat Sampah per Jenis](images/image15.png)
 
**Query 6 – Agregasi dengan HAVING (Volume > 20 m³)**
 
**Gambar 15 Output Query 6 – Lokasi dengan Volume Sampah > 20 m³**
 
![Gambar 15 Output Query 6 – Lokasi dengan Volume Sampah > 20 m³](images/image16.png)
 
**Query 7 – Subquery Petugas yang Pernah Pembersihan**
 
**Gambar 16 Output Query 7 – Petugas Aktif dalam Pembersihan**
 
![Gambar 16 Output Query 7 – Petugas Aktif dalam Pembersihan](images/image17.png)
 
**Query 8 – LEFT JOIN Lokasi dan Jumlah Pembersihan**
 
**Gambar 17 Output Query 8 – Status Pembersihan per Lokasi**
 
![Gambar 17 Output Query 8 – Status Pembersihan per Lokasi](images/image18.png)
 
**Query 9 – Filter Tanggal Pemantauan (Juni 2026)**
 
**Gambar 18 Output Query 9 – Pemantauan Bulan Juni 2026**
 
![Gambar 18 Output Query 9 – Pemantauan Bulan Juni 2026](images/image19.png)
 
**Query 10 – Complex JOIN Rekapitulasi per Sumber & Jenis**
 
**Gambar 19 Output Query 10 – Rekapitulasi Sampah per Sumber dan Jenis**
 
![Gambar 19 Output Query 10 – Rekapitulasi Sampah per Sumber dan Jenis](images/image20.png)
 
**Query 11 – UPDATE Kondisi Alat**
 
**Gambar 20 Output Query 11 – Pembuktian UPDATE Data Alat**
 
![Gambar 20 Output Query 11 – Pembuktian UPDATE Data Alat](images/image21.png)
 
**Query 12 – UPDATE Catatan Umum Pemantauan**
 
**Gambar 21 Output Query 12 – Update Catatan Pemantauan**
 
![Gambar 21 Output Query 12 – Update Catatan Pemantauan](images/image22.png)
 
**Query 13 – DELETE Pembersihan (Uji CASCADE Sekunder)**
 
**Gambar 22 Output Query 13 – Pembuktian DELETE dengan CASCADE**
 
![Gambar 22 Output Query 13 – Pembuktian DELETE dengan CASCADE](images/image24.png)
 
**Query 14 – Agregasi Rata-rata Berat per Sesi Pemantauan**
 
**Gambar 23 Output Query 14 – Rata-rata Berat Sampah per Sesi**
 
![Gambar 23 Output Query 14 – Rata-rata Berat Sampah per Sesi](images/image25.png)
 
**Query 15 – INSERT Petugas Baru**
 
**Gambar 24 Output Query 15 – Pembuktian INSERT Petugas Baru**
 
![Gambar 24 Output Query 15 – Pembuktian INSERT Petugas Baru](images/image26.png)
 
---
 
## BAB VI – PENUTUP
 
### 6.1 Kesimpulan
 
Berdasarkan hasil pelaksanaan proyek PjBL Sistem Monitoring Sampah Laut, dapat disimpulkan bahwa:
 
- **Analisis kebutuhan sistem** berhasil diidentifikasi secara menyeluruh, mencakup 5 aktor (Administrator, Petugas Lapangan, Koordinator/Supervisor, Peneliti/Analis, dan Pemerintah/Lembaga) serta 12 kebutuhan fungsional yang merepresentasikan proses bisnis pemantauan sampah laut.
- **Perancangan basis data** menghasilkan ERD dengan 11 entitas (5 entitas master, 3 transaksi, dan 3 junction table) yang mampu merepresentasikan seluruh kebutuhan data sistem, termasuk penanganan relasi *many-to-many* melalui tabel penghubung.
- **Implementasi database** berhasil dilakukan menggunakan MySQL, mencakup pembuatan seluruh tabel dengan constraint yang tepat (Primary Key, Foreign Key, Unique, Not Null), data uji (*dummy data*), serta minimal 10 query SQL operasional dan laporan.
- Sistem basis data yang dirancang mampu menggantikan pencatatan manual yang selama ini digunakan, sehingga data lokasi, jenis sampah, volume, dan kegiatan pembersihan dapat dikelola secara terstruktur, konsisten, dan mudah dianalisis.
### 6.2 Saran
 
Untuk pengembangan sistem ke depan, beberapa hal yang menurut kami dapat ditingkatkan antara lain:
 
- **Pengembangan antarmuka aplikasi** — basis data yang telah dirancang dapat diintegrasikan dengan aplikasi web atau mobile agar lebih mudah digunakan oleh petugas lapangan secara langsung.
- **Penambahan fitur geospasial** — kolom koordinat GPS yang sudah tersedia dapat dimanfaatkan dengan mengintegrasikan library peta (seperti Leaflet atau Google Maps API) untuk visualisasi persebaran titik pemantauan secara real-time.
- **Optimasi query dan indexing** — seiring bertambahnya volume data historis, perlu ditambahkan indeks pada kolom-kolom yang sering digunakan dalam filter dan join (seperti id_lokasi, tanggal_waktu) untuk menjaga performa query.
- **Penambahan manajemen pengguna** — sistem dapat dikembangkan dengan tabel user dan mekanisme autentikasi agar hak akses setiap aktor dapat dikontrol langsung di tingkat aplikasi.
- **Backup dan keamanan data** — perlu diterapkan prosedur backup berkala dan enkripsi data sensitif, mengingat data pemantauan lingkungan bersifat krusial untuk pengambilan kebijakan jangka panjang.
---
 
## LAMPIRAN
 
### Lampiran 1 : ERD (Entity Relationship Diagram)
 
Berikut adalah Entity Relationship Diagram (ERD) Sistem Monitoring Sampah Laut dalam ukuran penuh, menggambarkan seluruh entitas, atribut, dan relasi antar tabel yang telah dirancang pada Progres 2 dan diimplementasikan pada Progres 3.
 
**Gambar 25 ERD Sistem Monitoring Sampah Laut (Ukuran Penuh)**
 
![Gambar 25 ERD Sistem Monitoring Sampah Laut (Ukuran Penuh)](images/image27.png)
 
### Lampiran 2 : File SQL Lengkap (DDL, Data Uji, dan Query)
 
Bagian ini menyajikan keseluruhan script SQL proyek secara utuh dan berurutan, mulai dari pembuatan database dan tabel (DDL), pengisian data uji (DML/INSERT), hingga seluruh query SQL operasional dan laporan yang telah diuji pada Progres 3.
 
### Lampiran 3 : Screenshot Implementasi Database
 
Bagian ini menampilkan dokumentasi visual hasil implementasi database sistem_monitoring_sampah_laut langsung pada DBMS (MySQL), sebagai bukti pendukung Bab IV – Implementasi dan Bab V – Pengujian dan Query.
 
**a. Struktur Database dan Tabel**
 
**Gambar 26 Database sistem_monitoring_sampah_laut Berhasil Dibuat**
 
![Gambar 26 Database sistem_monitoring_sampah_laut Berhasil Dibuat](images/image28.png)
 
**Gambar 27 Struktur Tabel lokasi**
 
![Gambar 27 Struktur Tabel lokasi](images/image29.png)
 
**Gambar 28 Struktur Tabel jenis_sampah**
 
![Gambar 28 Struktur Tabel jenis_sampah](images/image30.png)
 
**Gambar 29 Struktur Tabel petugas**
 
![Gambar 29 Struktur Tabel petugas](images/image31.png)
 
**Gambar 30 Struktur Tabel sumber_sampah**
 
![Gambar 30 Struktur Tabel sumber_sampah](images/image32.png)
 
**Gambar 31 Struktur Tabel alat_pemantauan**
 
![Gambar 31 Struktur Tabel alat_pemantauan](images/image33.png)
 
**Gambar 32 Struktur Tabel pemantauan**
 
![Gambar 32 Struktur Tabel pemantauan](images/image34.png)
 
**Gambar 33 Struktur Tabel hasil_pemantauan**
 
![Gambar 33 Struktur Tabel hasil_pemantauan](images/image35.png)
 
**Gambar 34 Struktur Tabel pembersihan**
 
![Gambar 34 Struktur Tabel pembersihan](images/image36.png)
 
**Gambar 35 Struktur Tabel pemantauan_alat (Junction)**
 
![Gambar 35 Struktur Tabel pemantauan_alat (Junction)](images/image37.png)
 
**Gambar 36 Struktur Tabel pembersihan_petugas (Junction)**
 
![Gambar 36 Struktur Tabel pembersihan_petugas (Junction)](images/image38.png)
 
**Gambar 37 Struktur Tabel pemantauan_petugas (Junction)**
 
![Gambar 37 Struktur Tabel pemantauan_petugas (Junction)](images/image39.png)
 
**b. Bukti Data Uji (INSERT) Tersimpan di Database**
 
**Gambar 38 Data Tabel Lokasi (3 Record)**
 
![Gambar 38 Data Tabel Lokasi (3 Record)](images/image40.png)
 
**Gambar 39 Data Tabel Jenis Sampah (4 Record)**
 
![Gambar 39 Data Tabel Jenis Sampah (4 Record)](images/image41.png)
 
**Gambar 40 Data Tabel Petugas (3 Record)**
 
![Gambar 40 Data Tabel Petugas (3 Record)](images/image42.png)
 
**Gambar 41 Data Tabel Sumber Sampah (3 Record)**
 
![Gambar 41 Data Tabel Sumber Sampah (3 Record)](images/image43.png)
 
**Gambar 42 Data Tabel Alat Pemantauan (3 Record)**
 
![Gambar 42 Data Tabel Alat Pemantauan (3 Record)](images/image44.png)
 
**Gambar 43 Data Tabel Pemantauan (3 Record)**
 
![Gambar 43 Data Tabel Pemantauan (3 Record)](images/image45.png)
 
**Gambar 44 Data Tabel Hasil Pemantauan (5 Record)**
 
![Gambar 44 Data Tabel Hasil Pemantauan (5 Record)](images/image46.png)
 
**Gambar 45 Data Tabel Pembersihan (2 Record)**
 
![Gambar 45 Data Tabel Pembersihan (2 Record)](images/image2.png)
 
**Gambar 46 Data Tabel Pemantauan Petugas (5 Record)**
 
![Gambar 46 Data Tabel Pemantauan Petugas (5 Record)](images/image3.png)
 
**Gambar 47 Data Tabel Pemantauan Alat (5 Record)**
 
![Gambar 47 Data Tabel Pemantauan Alat (5 Record)](images/image4.png)
 
**Gambar 48 Data Tabel Pembersihan Petugas (4 Record)**
 
![Gambar 48 Data Tabel Pembersihan Petugas (4 Record)](images/image5.png)
 
### Lampiran 4 : Screenshot Hasil Eksekusi Query SQL
 
Seluruh screenshot pembuktian hasil eksekusi 15 query SQL telah ditampilkan secara lengkap pada Bab V – Pengujian dan Query, Sub-bab Hasil Eksekusi 15 Query SQL (Gambar 7 sampai Gambar 24). Tabel berikut merupakan indeks/rekapitulasi referensi gambar untuk memudahkan pencarian, sehingga hasil pengujian query tidak ditampilkan dua kali pada laporan ini.
 
| **No.** | **Query SQL** | **Referensi Gambar (Bab V)** |
| --- | --- | --- |
| 1 | Query 1 – Menampilkan seluruh data lokasi pemantauan | Gambar 10 |
| 2 | Query 2 – Filter jenis sampah dengan tingkat bahaya 'Tinggi' | Gambar 11 |
| 3 | Query 3 – JOIN – hasil pemantauan lengkap dengan lokasi & jenis sampah | Gambar 12 |
| 4 | Query 4 – JOIN 3 tabel – petugas yang terlibat dalam pemantauan | Gambar 13 |
| 5 | Query 5 – Agregasi – total berat sampah per jenis | Gambar 14 |
| 6 | Query 6 – Agregasi & HAVING – lokasi dengan volume > 20 m³ | Gambar 15 |
| 7 | Query 7 – Subquery – petugas yang pernah ikut pembersihan | Gambar 16 |
| 8 | Query 8 – LEFT JOIN – lokasi dan jumlah pembersihan | Gambar 17 |
| 9 | Query 9 – Filter tanggal – pemantauan bulan Juni 2026 | Gambar 18 |
| 10 | Query 10 – Complex JOIN – rekapitulasi sampah per sumber & jenis | Gambar 19 |
| 11 | Query 11 – UPDATE – kondisi alat pemantauan | Gambar 20 |
| 12 | Query 12 – UPDATE – catatan umum pemantauan | Gambar 21 |
| 13 | Query 13 – DELETE – data pembersihan (uji CASCADE) | Gambar 22 |
| 14 | Query 14 – Agregasi – rata-rata berat sampah per sesi | Gambar 23 |
| 15 | Query 15 – INSERT – penambahan data petugas baru | Gambar 24 |
 
**Tabel 20 Hasil Eksekusi 15 Query SQL (Gambar 7 sampai Gambar 24)**
 
Selain itu, bukti pengujian constraint (UNIQUE, FOREIGN KEY, ON DELETE CASCADE, dan ON DELETE RESTRICT) juga telah ditampilkan pada Bab V (Gambar 3 sampai Gambar 6).
 
### Lampiran 5 : Link Repository GitHub
 
Seluruh progress 1-4 ini dikelola dan didokumentasikan secara lengkap pada repository GitHub kelompok berikut:
 
| Nama Repository | sistem-monitoring-sampah-laut |
| --- | --- |
| Link Repository | https://github.com/andrepr265-ship-it/sistem-monitoring-sampah-laut |
 
**Tabel 21 Link Repository GitHub**
