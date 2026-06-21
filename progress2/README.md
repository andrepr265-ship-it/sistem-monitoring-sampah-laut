PROJECT BASED LEARNING (PjBL)
PROGRES 2 – PERANCANGAN BASIS DATA
SISTEM MONITORING SAMPAH LAUT

<img width="472" height="472" alt="image" src="https://github.com/user-attachments/assets/6cb50b96-5ab9-48fd-91c1-86f66fb7ad14" />


Mata Kuliah: Sistem Basis Data
Dosen: Ferdi Chahyadi M.Kom
Disusun oleh:
Kelompok 8

| Nama | NIM |
|---|---|
| Andre Zulyan Pratama | 2501020115 |
| Putra Ali Syahbana | 2501020088 |
| Rizky Akbar Hidayatullah | 2501020113 |
| M. Riquelma Zidan | 2501020110 |

Program Studi: Sistem Basis Data
Tahun 2025/2026
Deadline Progres 2: 21 Juni 2026

## 1. ERD (ENTITY RELATIONSHIP DIAGRAM) LENGKAP
<img width="1971" height="1241" alt="Diagram ERD_Progress2_Kelompok 8" src="https://github.com/user-attachments/assets/2475f50b-3e94-4825-af3f-563534e0b91e" />

## 2. PENJELASAN ENTITAS DAN RELASI
### a. Penjelasan Entitas
Berdasarkan hasil perancangan ERD, terdapat 11 (sebelas) entitas yang digunakan dalam Sistem Monitoring Sampah Laut, terdiri dari 5 entitas master, 3 entitas transaksi, dan 3 tabel penghubung (junction table) untuk merepresentasikan relasi many-to-many. Rincian entitas adalah sebagai berikut:

| No | Nama Entitas | Jenis | Deskripsi |
|---|---|---|---|
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

### b. Penjelasan Relasi Antar Entitas
Relasi antar entitas pada ERD di atas dapat dijelaskan sebagai berikut:
1) lokasi - pemantauan (1:N) — Satu lokasi dapat memiliki banyak sesi pemantauan pada waktu yang berbeda, namun setiap sesi pemantauan hanya berlangsung di satu lokasi.
2) petugas - pemantauan (N:M, melalui pemantauan_petugas) — Satu petugas dapat melaksanakan banyak sesi pemantauan, dan satu sesi pemantauan dapat dilaksanakan oleh beberapa petugas/tim secara bersama-sama. Relasi ini diuraikan melalui tabel penghubung pemantauan_petugas.
3) pemantauan - hasil_pemantauan (1:N) — Satu sesi pemantauan dapat menghasilkan banyak data temuan sampah (untuk berbagai jenis dan sumber sampah yang ditemukan), namun setiap data hasil pemantauan hanya berasal dari satu sesi pemantauan.
4) jenis_sampah - hasil_pemantauan (1:N) — Satu jenis sampah dapat tercatat pada banyak data hasil pemantauan, namun setiap data hasil pemantauan hanya mengacu pada satu jenis sampah.
5) sumber_sampah - hasil_pemantauan (1:N) — Satu sumber sampah dapat menjadi asal dari banyak data hasil pemantauan, namun setiap data hasil pemantauan hanya mengacu pada satu sumber sampah.
6) pemantauan - pembersihan (1:N) — Satu sesi pemantauan dapat menghasilkan/memicu banyak kegiatan pembersihan (beach clean-up) lanjutan, namun setiap kegiatan pembersihan terkait dengan satu sesi pemantauan.
7) pemantauan - alat_pemantauan (N:M, melalui pemantauan_alat) — Satu sesi pemantauan dapat menggunakan beberapa alat, dan satu alat dapat digunakan pada beberapa sesi pemantauan yang berbeda. Relasi ini diuraikan melalui tabel penghubung pemantauan_alat.
8) pembersihan - petugas (N:M, melalui pembersihan_petugas) — Satu kegiatan pembersihan dapat melibatkan beberapa petugas/relawan, dan satu petugas dapat terlibat dalam beberapa kegiatan pembersihan yang berbeda. Relasi ini diuraikan melalui tabel penghubung pembersihan_petugas.

## 3. KAMUS DATA (DATA DICTIONARY)
Kamus data berikut menjelaskan secara rinci setiap field/atribut pada masing-masing tabel, meliputi nama field, tipe data, panjang data, constraint, dan keterangan/fungsi field tersebut.

### Tabel 1. lokasi
Menyimpan data lokasi/titik pemantauan sampah laut.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_lokasi | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik lokasi pemantauan |
| nama_lokasi | VARCHAR | 100 | NOT NULL | Nama lokasi pemantauan |
| latitude | DECIMAL | 9,6 | NOT NULL | Koordinat lintang lokasi |
| longitude | DECIMAL | 9,6 | NOT NULL | Koordinat bujur lokasi |
| jenis_perairan | VARCHAR | 30 | NOT NULL | Jenis perairan (laut terbuka/pesisir/muara) |
| provinsi | VARCHAR | 50 | NOT NULL | Provinsi lokasi pemantauan |
| kabupaten | VARCHAR | 50 | NOT NULL | Kabupaten/kota lokasi pemantauan |
| deskripsi | TEXT | - | NULL | Deskripsi tambahan mengenai lokasi |

### Tabel 2. jenis_sampah
Menyimpan data klasifikasi jenis dan kategori sampah.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_jenis | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik jenis sampah |
| nama_jenis | VARCHAR | 50 | NOT NULL | Nama jenis sampah (plastik, kaca, logam, organik, B3, dll.) |
| kategori | VARCHAR | 30 | NOT NULL | Kategori sampah |
| tingkat_bahaya | VARCHAR | 20 | NOT NULL | Tingkat bahaya sampah (rendah/sedang/tinggi) |
| deskripsi | TEXT | - | NULL | Deskripsi tambahan jenis sampah |

### Tabel 3. petugas
Menyimpan data petugas lapangan, koordinator, dan relawan.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_petugas | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik petugas |
| nama | VARCHAR | 100 | NOT NULL | Nama lengkap petugas |
| no_identitas | VARCHAR | 20 | UNIQUE, NOT NULL | Nomor identitas/induk petugas |
| jabatan | VARCHAR | 50 | NOT NULL | Jabatan/peran petugas |
| unit_kerja | VARCHAR | 100 | NOT NULL | Unit kerja/instansi petugas |
| kontak | VARCHAR | 20 | NULL | Nomor kontak petugas |
| wilayah_tugas | VARCHAR | 100 | NULL | Wilayah tugas petugas |

### Tabel 4. sumber_sampah
Menyimpan data klasifikasi sumber asal sampah.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_sumber | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik sumber sampah |
| jenis_sumber | VARCHAR | 30 | NOT NULL | Jenis sumber sampah (domestik, industri, kapal, pariwisata, tidak teridentifikasi) |
| deskripsi | TEXT | - | NULL | Deskripsi tambahan sumber sampah |

### Tabel 5. alat_pemantauan
Menyimpan data alat/peralatan yang digunakan saat pemantauan.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_alat | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik alat pemantauan |
| nama_alat | VARCHAR | 50 | NOT NULL | Nama alat pemantauan |
| jenis_alat | VARCHAR | 30 | NOT NULL | Jenis/kategori alat |
| kondisi | VARCHAR | 20 | NOT NULL | Kondisi alat (baik/rusak/perlu kalibrasi) |
| tanggal_kalibrasi | DATE | - | NULL | Tanggal kalibrasi terakhir |

### Tabel 6. pemantauan
Menyimpan data kegiatan/sesi pemantauan yang dilakukan di suatu lokasi.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_pemantauan | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik sesi pemantauan |
| tanggal_waktu | DATETIME | - | NOT NULL | Tanggal dan waktu pelaksanaan pemantauan |
| id_lokasi (FK) | INT | - | FOREIGN KEY -> lokasi.id_lokasi, NOT NULL | Referensi lokasi pemantauan |
| kondisi_cuaca | VARCHAR | 30 | NULL | Kondisi cuaca saat pemantauan |
| kondisi_arus | VARCHAR | 30 | NULL | Kondisi arus saat pemantauan |
| catatan_umum | TEXT | - | NULL | Catatan umum hasil pemantauan |

### Tabel 7. hasil_pemantauan
Menyimpan rincian temuan sampah pada setiap sesi pemantauan.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_hasil | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik data hasil pemantauan |
| id_pemantauan (FK) | INT | - | FOREIGN KEY -> pemantauan.id_pemantauan, NOT NULL | Referensi sesi pemantauan |
| id_jenis (FK) | INT | - | FOREIGN KEY -> jenis_sampah.id_jenis, NOT NULL | Referensi jenis sampah yang ditemukan |
| id_sumber (FK) | INT | - | FOREIGN KEY -> sumber_sampah.id_sumber, NULL | Referensi sumber sampah |
| volume_m3 | DECIMAL | 8,2 | NULL | Volume sampah yang ditemukan (m3) |
| berat_kg | DECIMAL | 8,2 | NULL | Berat sampah yang ditemukan (kg) |
| jumlah_item | INT | - | NULL | Jumlah item sampah yang ditemukan |
| foto_path | VARCHAR | 255 | NULL | Path/tautan foto dokumentasi |

### Tabel 8. pembersihan
Menyimpan data kegiatan pembersihan (beach clean-up) lanjutan dari suatu pemantauan.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_pembersihan | INT | - | PRIMARY KEY, AUTO_INCREMENT | Identitas unik kegiatan pembersihan |
| id_pemantauan (FK) | INT | - | FOREIGN KEY -> pemantauan.id_pemantauan, NOT NULL | Referensi sesi pemantauan terkait |
| tanggal_pelaksanaan | DATE | - | NOT NULL | Tanggal pelaksanaan pembersihan |
| volume_terangkut | DECIMAL | 8,2 | NULL | Total volume sampah yang terangkut |
| tujuan_pembuangan | VARCHAR | 100 | NULL | Lokasi/tujuan pembuangan akhir sampah |
| catatan | TEXT | - | NULL | Catatan tambahan kegiatan pembersihan |

### Tabel 9. pemantauan_alat
Tabel penghubung (junction table) untuk relasi many-to-many antara pemantauan dan alat_pemantauan.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_pemantauan (FK) | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> pemantauan.id_pemantauan | Referensi sesi pemantauan |
| id_alat (FK) | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> alat_pemantauan.id_alat | Referensi alat yang digunakan |
| kondisi_pakai | VARCHAR | 20 | NULL | Kondisi alat saat digunakan dalam sesi tersebut |

### Tabel 10. pembersihan_petugas
Tabel penghubung (junction table) untuk relasi many-to-many antara pembersihan dan petugas.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_pembersihan (FK) | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> pembersihan.id_pembersihan | Referensi kegiatan pembersihan |
| id_petugas (FK) | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> petugas.id_petugas | Referensi petugas yang terlibat |
| peran_petugas | VARCHAR | 30 | NULL | Peran petugas dalam kegiatan pembersihan |

### Tabel 11. pemantauan_petugas
Tabel penghubung (junction table) untuk relasi many-to-many antara pemantauan dan petugas.
| Nama Field | Tipe Data | Panjang | Constraint | Keterangan |
|---|---|---|---|---|
| id_pemantauan (FK) | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> pemantauan.id_pemantauan | Referensi sesi pemantauan |
| id_petugas (FK) | INT | - | PRIMARY KEY (komposit), FOREIGN KEY -> petugas.id_petugas | Referensi petugas yang terlibat |
| peran_dalam_pemantauan | VARCHAR | 30 | NULL | Peran petugas dalam sesi pemantauan (misal: ketua tim, pencatat, fotografer) |

## 4. NORMALISASI DATA (UNF → 1NF → 2NF → 3NF)
Proses normalisasi dilakukan terhadap data pencatatan hasil pemantauan sampah laut, yang pada praktiknya dicatat dalam satu formulir pemantauan yang memuat data lokasi, petugas, dan rincian beberapa jenis sampah yang ditemukan dalam satu sesi pemantauan (data berulang/repeating group).

### a. Bentuk Tidak Normal (Unnormalized Form / UNF)
Pada bentuk tidak normal, satu sesi pemantauan dapat memuat lebih dari satu temuan jenis sampah dalam satu baris data yang sama (kelompok data berulang), sehingga atribut nama_jenis_sampah, kategori, volume_m3, berat_kg, dan nama_sumber bersifat multivalue/berulang untuk satu id_pemantauan. Bentuk UNF dapat dituliskan sebagai:
LAPORAN_PEMANTAUAN = {id_pemantauan, tanggal_waktu, nama_lokasi, latitude, longitude, jenis_perairan, kondisi_cuaca, kondisi_arus, catatan_umum, {nama_petugas, no_identitas, jabatan, peran_dalam_pemantauan}, {nama_jenis_sampah, kategori, tingkat_bahaya, volume_m3, berat_kg, jumlah_item, nama_sumber}, {nama_alat, jenis_alat}, {tanggal_pelaksanaan_bersih, volume_terangkut, tujuan_pembuangan, nama_petugas_bersih}}
Tanda kurung kurawal { } pada bagian akhir menunjukkan kelompok atribut yang dapat berulang (repeating group) untuk satu id_pemantauan yang sama. Contoh ilustrasi data (disederhanakan, hanya menampilkan kelompok data sampah) ditampilkan pada tabel berikut, di mana sel yang menyatu (merge) menunjukkan nilai yang sama/berulang untuk satu sesi pemantauan:
Tabel 11. Ilustrasi Data Bentuk Tidak Normal (UNF)
| id_ pemantauan | tanggal_waktu / lokasi | petugas | nama_jenis _sampah | kategori | volume _m3 | berat _kg | nama _sumber |
|---|---|---|---|---|---|---|---|
| P001 | 14/06/2026 - Pantai Nongsa | Andre Z. Pratama | Plastik | Anorganik | 15.0 | 22.5 | Domestik |
| P001 | 14/06/2026 - Pantai Nongsa | Andre Z. Pratama | Organik | Organik | 8.0 | 10.0 | Pariwisata |
| P002 | 15/06/2026 - Pantai Trikora | Rizky A. Hidayatullah | Kaca | Anorganik | 3.0 | 9.0 | Kapal |

### b. Bentuk Normal Pertama (1NF)
Untuk mencapai 1NF, kelompok data berulang (repeating group) pada UNF dipecah sehingga setiap baris hanya memuat satu nilai atomik (tidak ada lagi multivalue/sel bermerge). Setiap kombinasi pemantauan dan jenis sampah dituliskan dalam barisnya sendiri, seperti pada tabel berikut:
Tabel 12. Hasil Transformasi ke Bentuk Normal Pertama (1NF)
| id_pemantauan | tanggal_waktu / lokasi | petugas | nama_ jenis_ sampah | kategori | volume_ m3 | berat_ kg | nama_ sumber |
|---|---|---|---|---|---|---|---|
| P001 | 14/06/2026 - Pantai Nongsa | Andre Z. Pratama | Plastik | Anorganik | 15.0 | 22.5 | Domestik |
| P001 | 14/06/2026 - Pantai Nongsa | Andre Z. Pratama | Organik | Organik | 8.0 | 10.0 | Pariwisata |
| P002 | 15/06/2026 - Pantai Trikora | Rizky A. Hidayatullah | Kaca | Anorganik | 3.0 | 9.0 | Kapal |

Tabel pada 1NF di atas sudah tidak memiliki kelompok data berulang, namun masih terjadi redundansi data: atribut tanggal_waktu, nama_lokasi, dan data petugas berulang pada setiap baris untuk id_pemantauan yang sama. Hal ini menunjukkan adanya dependensi parsial (partial dependency) terhadap kunci kandidat komposit, sehingga perlu dilanjutkan ke 2NF.

### c. Bentuk Normal Kedua (2NF)
Pada 1NF, kunci kandidat bersifat komposit (gabungan id_pemantauan dan jenis sampah yang ditemukan). Atribut seperti nama_lokasi, latitude, longitude, dan jenis_perairan hanya bergantung pada lokasi (bukan pada keseluruhan kunci komposit), sehingga termasuk dependensi parsial. Untuk menghilangkan dependensi parsial tersebut, atribut-atribut yang hanya bergantung pada sebagian kunci dipisahkan ke dalam entitas tersendiri yang memiliki primary key sendiri:
- lokasi (id_lokasi, nama_lokasi, latitude, longitude, jenis_perairan, provinsi, kabupaten, deskripsi) — dipisahkan karena seluruh atributnya hanya bergantung pada id_lokasi.
- petugas (id_petugas, nama, no_identitas, jabatan, unit_kerja, kontak, wilayah_tugas) — dipisahkan karena hanya bergantung pada id_petugas.
- jenis_sampah (id_jenis, nama_jenis, kategori, tingkat_bahaya, deskripsi) — dipisahkan karena hanya bergantung pada id_jenis.
- sumber_sampah (id_sumber, jenis_sumber, deskripsi) — dipisahkan karena hanya bergantung pada id_sumber.
- alat_pemantauan (id_alat, nama_alat, jenis_alat, kondisi, tanggal_kalibrasi) — dipisahkan karena hanya bergantung pada id_alat.
Setelah pemisahan tersebut, tabel transaksi yang tersisa hanya menyimpan atribut yang bergantung penuh pada kunci utamanya masing-masing, yaitu pemantauan (id_pemantauan, tanggal_waktu, id_lokasi, kondisi_cuaca, kondisi_arus, catatan_umum) dan hasil_pemantauan (id_hasil, id_pemantauan, id_jenis, id_sumber, volume_m3, berat_kg, jumlah_item, foto_path). Karena satu sesi pemantauan melibatkan beberapa petugas sekaligus (tim), relasi petugas-pemantauan bersifat N:M sehingga direpresentasikan melalui tabel penghubung pemantauan_petugas (id_pemantauan, id_petugas, peran_dalam_pemantauan) — atribut id_petugas tidak lagi menjadi FK langsung di tabel pemantauan. Dengan demikian seluruh atribut non-kunci pada setiap tabel telah bergantung penuh pada primary key tabel tersebut (functional dependency penuh), sehingga struktur ini telah memenuhi 2NF.

### d. Bentuk Normal Ketiga (3NF)
Tahap akhir 3NF memeriksa apakah masih terdapat dependensi transitif, yaitu atribut non-kunci yang bergantung pada atribut non-kunci lain (bukan pada primary key secara langsung). Pemeriksaan dilakukan pada setiap tabel hasil 2NF:
- Pada tabel jenis_sampah, atribut tingkat_bahaya sekilas tampak bergantung pada kategori (misalnya kategori B3 cenderung berbahaya tinggi). Namun pada kenyataannya tingkat bahaya dapat berbeda meskipun kategori sama (contoh: kategori plastik dapat berstatus rendah maupun tinggi tergantung jenis spesifiknya), sehingga tingkat_bahaya tetap merupakan atribut yang bergantung langsung pada id_jenis, bukan dependensi transitif melalui kategori.
- Pada tabel lokasi, atribut provinsi dan kabupaten disimpan sebagai atribut langsung dari id_lokasi (bukan diturunkan dari atribut lain) sehingga tidak menimbulkan dependensi transitif.
- Pada tabel petugas, atribut unit_kerja dan wilayah_tugas masing-masing bergantung langsung pada id_petugas dan tidak diturunkan dari atribut non-kunci lainnya.
Karena tidak ditemukan dependensi transitif pada seluruh tabel, maka struktur data telah memenuhi Bentuk Normal Ketiga (3NF). Untuk mengakomodasi relasi many-to-many yang teridentifikasi selama proses analisis (pemantauan dengan alat_pemantauan, pembersihan dengan petugas, serta pemantauan dengan petugas), ditambahkan tiga tabel penghubung, yaitu pemantauan_alat, pembersihan_petugas, dan pemantauan_petugas. Hasil akhir normalisasi ini menghasilkan 11 (sebelas) tabel sebagaimana digambarkan pada ERD di Bagian 1 dan dirinci pada Kamus Data di Bagian 3.

## 5. REVISI ANALISIS KEBUTUHAN (JIKA ADA)
Selama proses perancangan ERD, normalisasi, dan penyusunan kamus data pada Progres 2, ditemukan beberapa hal pada hasil analisis kebutuhan Progres 1 yang perlu disempurnakan agar struktur basis data lebih akurat, konsisten, dan bebas dari redundansi maupun anomali data. Ringkasan revisi adalah sebagai berikut:

| No | Bagian yang Direvisi | Progres 1 | Progres 2 (Revisi) | Alasan |
|---|---|---|---|---|
| 1 | Relasi Pemantauan - Pembersihan | Belum dirinci secara eksplisit; kegiatan pembersihan disebut sebagai bagian dari laporan pemantauan. | Ditetapkan sebagai relasi 1:N — satu sesi pemantauan dapat memicu beberapa kegiatan pembersihan lanjutan. | Pada praktiknya, satu titik pemantauan dapat dibersihkan lebih dari satu kali pada waktu yang berbeda. |
| 2 | Penggunaan Alat Pemantauan | Data alat pemantauan hanya disebutkan sebagai data master tanpa relasi eksplisit ke kegiatan pemantauan. | Ditambahkan tabel penghubung pemantauan_alat untuk merepresentasikan relasi many-to-many antara pemantauan dan alat. | Satu sesi pemantauan dapat menggunakan beberapa alat sekaligus, dan satu alat dapat dipakai pada beberapa sesi pemantauan berbeda. |
| 3 | Jumlah Petugas pada Pembersihan | Disimpan sebagai atribut tunggal "jumlah_petugas" pada data pembersihan. | Diubah menjadi tabel penghubung pembersihan_petugas yang mencatat identitas masing-masing petugas yang terlibat. | Atribut agregat "jumlah_petugas" tidak dapat melacak identitas individu dan berisiko menimbulkan anomali saat pembaruan data. |
| 4 | Relasi Petugas - Pemantauan | Ditetapkan sebagai relasi 1:N — satu petugas dapat memimpin banyak sesi pemantauan, dengan FK id_petugas di tabel pemantauan. | Diubah menjadi relasi N:M — ditambahkan tabel penghubung pemantauan_petugas (id_pemantauan, id_petugas, peran_dalam_pemantauan). FK id_petugas dihapus dari tabel pemantauan. | Pada praktiknya, satu sesi pemantauan lapangan dilakukan oleh tim/beberapa petugas bersama-sama. Menyimpan hanya satu id_petugas (penanggung jawab) berisiko kehilangan data kontributor lain dan menimbulkan anomali pembaruan. |
| 5 | Kebutuhan Fungsional (KF-01 s.d. KF-12) | Bersifat sementara dan dapat berubah. | Tidak ada perubahan signifikan; seluruh KF-01 s.d. KF-12 telah terakomodasi dalam struktur ERD dan kamus data Progres 2. | Hasil analisis kebutuhan pada Progres 1 telah memadai untuk dijadikan dasar perancangan basis data. |

Secara umum, revisi yang dilakukan tidak mengubah deskripsi studi kasus, latar belakang, tujuan sistem, maupun aktor yang telah ditetapkan pada Progres 1, melainkan hanya memperjelas relasi antar data agar dapat diimplementasikan sebagai basis data yang relasional dan ternormalisasi dengan baik. Penambahan tabel penghubung pemantauan_petugas pada Progres 2 merupakan perubahan paling signifikan karena mengubah kardinalitas relasi inti dari 1:N menjadi N:M, mencerminkan realita lapangan di mana setiap sesi pemantauan selalu dilakukan secara tim.
