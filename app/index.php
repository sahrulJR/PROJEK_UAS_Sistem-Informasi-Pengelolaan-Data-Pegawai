<?php 
include 'koneksi.php'; 
// Mengambil data dari VIEW 'view_resume_pegawai'
$query = "SELECT * FROM view_resume_pegawai";
$result = mysqli_query($conn, $query);
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Sistem Informasi Pengelolaan Data Pegawai</title>
    <link rel="stylesheet" href="assets/css/style.css">
    
    <!-- TAMBAHAN CSS BIAR TABEL DAN TOMBOL MUNCUL BAGUS -->
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 30px; background-color: #f8f9fa; }
        .container { max-width: 1100px; margin: auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); }
        h2 { color: #333; margin-top: 0; }
        .nav { margin-bottom: 20px; }
        
        /* Desain Tombol */
        .btn { padding: 8px 14px; text-decoration: none; border-radius: 4px; display: inline-block; font-size: 14px; font-weight: 500; }
        .btn-add { background-color: #28a745; color: white; margin-right: 10px; }
        .btn-report { background-color: #17a2b8; color: white; }
        .btn-edit { background-color: #ffc107; color: #212529; margin-right: 5px; }
        .btn-delete { background-color: #dc3545; color: white; }
        .btn:hover { opacity: 0.9; }
        
        /* Desain Garis Tabel */
        table { width: 100%; border-collapse: collapse; margin-top: 15px; background: #fff; }
        th, td { border: 1px solid #dee2e6; padding: 12px; text-align: left; }
        th { background-color: #f1f3f5; color: #495057; font-weight: 600; }
        tr:nth-child(even) { background-color: #f8f9fa; }
        tr:hover { background-color: #f1f3f5; }
    </style>
</head>
<body>

    <div class="container">
        <h2>Dashboard Data Pegawai</h2>
        
        <div class="nav">
            <a href="tambah.php" class="btn btn-add">Tambah Pegawai Baru</a>
            <a href="laporan.php" class="btn btn-report">Lihat Laporan Gaji</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>NIP</th>
                    <th>Nama Pegawai</th>
                    <th>Jabatan</th>
                    <th>Departemen</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php while($row = mysqli_fetch_assoc($result)) { ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['nip']); ?></td>
                    <td><?php echo htmlspecialchars($row['nama']); ?></td>
                    <td><?php echo htmlspecialchars($row['nama_jabatan'] ?? 'Belum Diatur'); ?></td>
                    <td><?php echo htmlspecialchars($row['nama_departemen'] ?? 'Belum Diatur'); ?></td>
                    <td>
                        <a href="edit.php?id=<?php echo $row['id_pegawai']; ?>" class="btn btn-edit">Edit</a>
                        <a href="hapus.php?id=<?php echo $row['id_pegawai']; ?>" class="btn btn-delete" onclick="return konfirmasiHapus('<?php echo htmlspecialchars($row['nama']); ?>')">Hapus</a>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>

    <script src="assets/js/main.js"></script>
</body>
</html>