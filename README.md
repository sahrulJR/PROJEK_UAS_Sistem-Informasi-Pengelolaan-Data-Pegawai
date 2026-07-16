# Sistem Informasi Pengelolaan Data Pegawai

## Deskripsi
Sistem Informasi Pengelolaan Data Pegawai adalah aplikasi berbasis web yang dirancang untuk mengotomatisasi manajemen administrasi data karyawan serta rekapitulasi finansial gaji bulanan pada sebuah instansi atau perusahaan. Aplikasi ini mempermudah pencatatan personalia secara digital, meminimalisir kesalahan input, dan mempercepat pembuatan laporan keuangan pengeluaran kas operasional.

## Anggota Kelompok
1. muh. sahrul ibrahim - IK2511011
2. Anggota 2 - 
3. Anggota 3 - 
4. Anggota 4 -

## pembagian tugas
|nama|tugas|
|muh. sahrul ibrahim| membuat code php, databese, dan README|
|rahel|membuat laporan|
|alda|membuat laporan|
|sinta|membuat ERD dan laporan|

## 🚀 Fitur Aplikasi

### 1. Manajemen Data Utama (CRUD Engine)
* **Dashboard Utama (`index.php`):** Menyajikan ringkasan tabel seluruh personel aktif dengan optimasi beban server melalui pembacaan data objek virtual *VIEW*.
* **Pendaftaran Personel (`tambah.php` & `simpan.php`):** Modul input pegawai baru yang dilengkapi elemen pilihan dinamis (*Dynamic Select-Option*) yang ditarik langsung dari data master entitas `jabatan` dan `departemen`.
* **Modifikasi Rekam Data (`edit.php` & `update.php`):** Mengambil rekam data lama secara otomatis berbasis parameter `GET['id']` (*Populating Form Fields*) untuk memperbarui baris data relasional secara instan.
* **Penghapusan Data Aman (`hapus.php`):** Mekanisme membuang baris data terintegrasi yang terlindungi oleh sistem relasi *Foreign Key* agar tidak merusak struktur tabel anak.

### 2. Rekapitulasi & Agregasi Finansial
* **Pelaporan Gaji Terintegrasi (`laporan.php`):** Menyusun lembar slip rekapitulasi finansial bulanan gabungan dengan menggabungkan tabel `gaji` dan `pegawai` memanfaatkan query `INNER JOIN`.
* **Kalkulasi Akumulatif Otomatis:** Menghitung total pengeluaran dana kas upah perusahaan secara real-time pada baris penutup tabel (*Footer Row*) menggunakan fungsi agregat SQL `SUM()`.

### 3. Validasi & Proteksi Keamanan Sistem
* **Validasi Sisi Klien (*Client-Side Validation*):** Penerapan instruksi atribut `required` pada HTML5 dan penangkap *event click* dialog konfirmasi JavaScript untuk mencegah terbuangnya data penting akibat ketidaksengajaan.
* **Validasi Sisi Server (*Server-Side Validation*):** Pengecekan struktural klausa `empty()` pada backend PHP untuk menolak penyimpanan string kosong ke dalam memori basis data.
* **Penangkal Serangan Siber (*Vulnerability Protection*):** Mengimplementasikan fungsi `mysqli_real_escape_string()` untuk membersihkan karakter asing berbahaya guna menangkal celah *SQL Injection*, serta penanganan *Cross-Site Scripting* (XSS) menggunakan `htmlspecialchars()`.

### 4. Optimasi & Fitur Basis Data Tingkat Lanjut (SQL Level)
* **Virtual Data View (`view_resume_pegawai`):** Memangkas beban eksekusi query gabungan berulang di web browser untuk mempercepat pemuatan halaman depan.
* **Database Indexing (`idx_pegawai_nama` & `idx_gaji_bulan`):** Mempercepat durasi pencarian baris data pegawai berskala besar berdasarkan kolom nama dan bulan penggajian.
* **Data Control Language (DCL):** Pengaturan hak akses database terbatas tingkat *Read-Only* khusus untuk user pimpinan (`pimpinan_apps`).
* **Database Transaction Control:** Menjamin keamanan proses eksekusi query ganda yang saling terikat secara mutlak menggunakan mekanisme kontrol `START TRANSACTION`, `COMMIT`, dan `ROLLBACK`.

---

##  Struktur Database & Tabel

Sistem ini menerapkan basis data relasional tingkat **3rd Normal Form (3NF)** dengan mesin penyimpanan InnoDB untuk menjamin integritas referensial data (*On Delete Cascade / Set Null*).

### Skema Tabel Fisik:
1. **`departemen`**: Mencatat informasi unit atau divisi kerja penempatan pegawai (`id_departemen`, `nama_departemen`, `lokasi`).
2. **`jabatan`**: Mencatat master posisi pekerjaan beserta standar nilai gaji pokok (`id_jabatan`, `nama_jabatan`, `gaji_pokok`).
3. **`pengguna`**: Mengelola kredensial hak akses operator untuk masuk ke sistem (`id_user`, `username`, `password`, `role`).
4. **`pegawai`**: Mengelola identitas inti personalia pegawai (`id_pegawai`, `nip`, `nama`, `email`, `tanggal_lahir`, `id_jabatan`, `id_departemen`).
5. **`gaji`**: Mencatat riwayat slip transaksi penggajian bulanan pegawai (`id_gaji`, `id_pegawai`, `bulan_tahun`, `tunjangan`, `potongan`, `total_gaji`).

---

##  Teknologi yang Digunakan
* **PHP Native** (Logika Backend & Pemrosesan Data)
* **MySQL / MariaDB** (Sistem Manajemen Basis Data Relasional)
* **HTML5** (Struktur Kerangka Halaman Web)
* **CSS3** (Tata Letak Desain & Estetika Visual)
* **JavaScript** (Interaktivitas Klien & Jendela Konfirmasi Dialog)
* **XAMPP v3.x** (Paket Server Lokal HTTP Apache & MySQL)
* **GitHub** (Manajemen Versi Berkas & Kolaborator Proyek)

---

##  Cara Menjalankan Aplikasi

### Prerequisites (Persiapan Awal):
* Pastikan komputer Anda telah terpasang aplikasi **XAMPP Control Panel**.

### Langkah Penginstalan:
1. **Unduh Proyek:** Kloning repositori ini atau unduh file ZIP dan ekstrak ke dalam direktori server lokal Anda:
   ```bash
   C:/xampp/htdocs/nama-proyek/
Aktifkan Server: Buka XAMPP Control Panel, kemudian klik tombol Start pada modul Apache dan MySQL .

Impor Basis Data:

Buka penguncian web dan akses http://localhost/phpmyadmin/.

Buat database baru bernama db_kepegawaian.

Masuk ke tab Impor , pilih file SQL berurutan mulai dari 01_create_database.sqlhingga 03_insert_data.sqlyang berada di dalam folder database/, lalu klik Go/Kirim .

Jalankan Aplikasi: Buka tab baru di browser Anda dan ketik tautan url berikut:

Teks biasa
http://localhost/nama-proyek/app/
## Contoh Implementasi Query SQL (Agregasi, View, Transaksi & DCL)
Berikut adalah baris query tingkat lebih lanjut dari implementasi database kami:

A. Penggunaan Agregasi
SQL
-- Menghitung total pengeluaran gaji perusahaan
SELECT SUM(total_gaji) AS total_pengeluaran_gaji_perusahaan FROM gaji;

-- Menghitung rata-rata gaji pokok jabatan
SELECT AVG(gaji_pokok) AS rata_rata_gaji_pokok FROM jabatan;
B. Tampilan Basis Data Pembuatan
SQL
CREATE OR REPLACE VIEW view_resume_pegawai AS
SELECT p.id_pegawai, p.nip, p.nama, p.email, j.nama_jabatan, d.nama_departemen
FROM pegawai p
LEFT JOIN jabatan j ON p.id_jabatan = j.id_jabatan
LEFT JOIN departemen d ON p.id_departemen = d.id_departemen;
C. Kontrol Transaksi Basis Data
SQL
START TRANSACTION;
INSERT INTO pegawai (nip, nama, email, tanggal_lahir, id_jabatan, id_departemen) 
VALUES ('202601004', 'Deni Dermawan', 'deni@perusahaan.com', '1994-02-15', 3, 3);

INSERT INTO gaji (id_pegawai, bulan_tahun, tunjangan, potongan, total_gaji) 
VALUES (LAST_INSERT_ID(), 'Juli 2026', 400000.00, 50000.00, 5850000.00);
COMMIT;
D. Bahasa Kontrol Data (DCL)
SQL
CREATE USER IF NOT EXISTS 'pimpinan_apps'@'localhost' IDENTIFIED BY 'PasswordPimpinan123';
GRANT SELECT ON db_kepegawaian.* TO 'pimpinan_apps'@'localhost';
FLUSH PRIVILEGES;
## Struktur Folder
Susunan direktori berkas dikumpulkan secara rapi berdasarkan fungsi manajemen file berikut:
nama-proyek/
│
├── database/
│ ├── 01_create_database.sql
│ ├── 02_create_tables.sql
│ ├── 03_insert_data.sql
│ ├── 04_query_lanjutan.sql
│ ├── 05_view_index.sql
│ ├── 06_dcl.sql
│ └── 07_transaction.sql
│
├── app/
│ ├── index.php
│ ├── koneksi.php
│ ├── tambah.php
│ ├── simpan.php
│ ├── edit.php
│ ├── update.php
│ ├── hapus.php
│ ├── laporan.php
│ └── assets/
│ ├── css/
│ ├── js/
│ └── img/
│
├── docs/
│ ├── laporan_uas.pdf
│ ├── erd.png
│ └── normalisasi.pdf
