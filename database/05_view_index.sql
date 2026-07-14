-- ==========================================
-- MEMBUAT VIEW (Tabel Virtual)
-- ==========================================
-- View untuk melihat profil lengkap pegawai tanpa perlu tulis JOIN berulang kali
CREATE OR REPLACE VIEW view_profil_pegawai AS
SELECT 
    p.id_pegawai,
    p.nip, 
    p.nama_lengkap, 
    j.nama_jabatan, 
    d.nama_departemen
FROM pegawai p
LEFT JOIN jabatan j ON p.id_jabatan = j.id_jabatan
LEFT JOIN departemen d ON p.id_departemen = d.id_departemen;

-- Cara memanggil View:
SELECT * FROM view_profil_pegawai;


-- ==========================================
-- MEMBUAT INDEX (Optimasi Performa)
-- ==========================================
-- Membuat index pada kolom NIP karena kolom ini sangat sering dicari
CREATE INDEX idx_pegawai_nip ON pegawai(nip);

-- Membuat index pada tanggal absensi untuk mempercepat laporan bulanan
CREATE INDEX idx_absensi_tanggal ON absensi(tanggal);
