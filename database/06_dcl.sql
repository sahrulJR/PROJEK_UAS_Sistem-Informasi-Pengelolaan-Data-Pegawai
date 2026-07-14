-- 1. Membuat user baru untuk staff HRD (Contoh di MySQL)
CREATE USER 'staff_hrd'@'localhost' IDENTIFIED BY 'PasswordHRD123!';

-- 2. GRANT: Memberikan izin ke staff_hrd untuk membaca & menambah data di tabel pegawai & absensi
GRANT SELECT, INSERT, UPDATE ON direktori_db.pegawai TO 'staff_hrd'@'localhost';
GRANT SELECT, INSERT, UPDATE ON direktori_db.absensi TO 'staff_hrd'@'localhost';

-- Izin tambahan untuk melihat View yang tadi dibuat
GRANT SELECT ON direktori_db.view_profil_pegawai TO 'staff_hrd'@'localhost';

-- 3. REVOKE: Mencabut izin HAPUS (DELETE) data agar staff_hrd tidak bisa menghapus record
REVOKE DELETE ON direktori_db.pegawai FROM 'staff_hrd'@'localhost';
REVOKE DELETE ON direktori_db.absensi FROM 'staff_hrd'@'localhost';

-- Menerapkan perubahan hak akses
FLUSH PRIVILEGES;
