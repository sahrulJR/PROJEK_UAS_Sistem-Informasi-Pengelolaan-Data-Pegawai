<?php
include 'koneksi.php';

// Menampilkan data laporan gabungan dari tabel gaji dan pegawai (Query JOIN 2)
$report_query = "SELECT g.id_gaji, p.nama, p.nip, g.bulan_tahun, g.total_gaji 
                 FROM gaji g 
                 JOIN pegawai p ON g.id_pegawai = p.id_pegawai";
$result = mysqli_query($conn, $report_query);

// Mengambil nilai total pengeluaran perusahaan dengan fungsi AGGREGATE SUM
$total_query = mysqli_query($conn, "SELECT SUM(total_gaji) AS grand_total FROM gaji");
$total_data = mysqli_fetch_assoc($total_query);
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Laporan Rekapitulasi Gaji Pegawai</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        /* CSS khusus halaman cetak laporan */
        .total-row {
            font-weight: bold;
            background-color: #ecf0f1;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Laporan Rekapitulasi Gaji Pegawai</h2>
        <div class="nav">
            <a href="index.php" class="btn btn-back">Kembali ke Dashboard</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID Gaji</th>
                    <th>NIP</th>
                    <th>Nama Pegawai</th>
                    <th>Bulan & Tahun</th>
                    <th>Total Gaji Diterima</th>
                </tr>
            </thead>
            <tbody>
                <?php while($row = mysqli_fetch_assoc($result)) { ?>
                <tr>
                    <td><?php echo $row['id_gaji']; ?></td>
                    <td><?php echo htmlspecialchars($row['nip']); ?></td>
                    <td><?php echo htmlspecialchars($row['nama']); ?></td>
                    <td><?php echo htmlspecialchars($row['bulan_tahun']); ?></td>
                    <td>Rp <?php echo number_format($row['total_gaji'], 2, ',', '.'); ?></td>
                </tr>
                <?php } ?>
                
                <tr class="total-row">
                    <td colspan="4" style="text-align: right;">Total Kas Pengeluaran Gaji:</td>
                    <td>Rp <?php echo number_format($total_data['grand_total'] ?? 0, 2, ',', '.'); ?></td>
                </tr>
            </tbody>
        </table>
    </div>

</body>
</html>