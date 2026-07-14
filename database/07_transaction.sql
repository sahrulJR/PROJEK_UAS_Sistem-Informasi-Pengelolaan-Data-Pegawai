-- Memulai transaksi data
START TRANSACTION;

-- Skenario: Menambahkan pegawai baru sekaligus mencatat absensi pertamanya hari ini
INSERT INTO pegawai (id_pegawai, nip, nama_lengkap, id_jabatan, id_departemen) 
VALUES (99, '12399', 'Karyawan Baru', 'J02', 'D01');

INSERT INTO absensi (tanggal, id_pegawai, status_kehadiran) 
VALUES (CURRENT_DATE, 99, 'Hadir');

-- Pilihan A: Jika tidak ada error dan semua data valid, simpan permanen
COMMIT;

-- Pilihan B: JIKA terjadi error/salah input di tengah jalan, batalkan semua perintah di atas:
-- ROLLBACK;
