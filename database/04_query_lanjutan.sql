-- 1. Menghitung jumlah pegawai di setiap departemen
SELECT 
    d.nama_departemen, 
    COUNT(p.id_pegawai) AS jumlah_pegawai
FROM departemen d
LEFT JOIN pegawai p ON d.id_departemen = p.id_departemen
GROUP BY d.nama_departemen;

-- 2. Menampilkan departemen yang memiliki lebih dari 5 pegawai
SELECT 
    d.nama_departemen, 
    COUNT(p.id_pegawai) AS jumlah_pegawai
FROM departemen d
LEFT JOIN pegawai p ON d.id_departemen = p.id_departemen
GROUP BY d.nama_departemen
HAVING COUNT(p.id_pegawai) > 5;

-- 3. Subquery: Menampilkan pegawai yang absen 'Hadir' pada hari ini
SELECT nip, nama_lengkap 
FROM pegawai 
WHERE id_pegawai IN (
    SELECT id_pegawai 
    FROM absensi 
    WHERE status_kehadiran = 'Hadir' AND tanggal = CURRENT_DATE
);
