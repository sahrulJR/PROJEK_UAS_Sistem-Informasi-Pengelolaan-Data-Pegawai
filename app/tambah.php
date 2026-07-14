<?php 
include 'koneksi.php';
$jabatan_opt = mysqli_query($conn, "SELECT * FROM jabatan");
$dept_opt = mysqli_query($conn, "SELECT * FROM departemen");
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Pegawai Baru</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

    <div class="container">
        <h2>Form Tambah Pegawai Baru</h2>
        <div class="nav">
            <a href="index.php" class="btn btn-back">Kembali ke Dashboard</a>
        </div>

        <form action="simpan.php" method="POST">
            <div class="form-group">
                <label>NIP (Nomor Induk Pegawai)</label>
                <input type="text" name="nip" placeholder="Masukkan NIP" required>
            </div>
            <div class="form-group">
                <label>Nama Lengkap</label>
                <input type="text" name="nama" placeholder="Masukkan Nama Lengkap" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" placeholder="contoh@perusahaan.com" required>
            </div>
            <div class="form-group">
                <label>Tanggal Lahir</label>
                <input type="date" name="tanggal_lahir" required>
            </div>
            <div class="form-group">
                <label>Jabatan</label>
                <select name="id_jabatan" required>
                    <option value="">-- Pilih Jabatan --</option>
                    <?php while($j = mysqli_fetch_assoc($jabatan_opt)) { ?>
                        <option value="<?php echo $j['id_jabatan']; ?>"><?php echo $j['nama_jabatan']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group">
                <label>Departemen</label>
                <select name="id_departemen" required>
                    <option value="">-- Pilih Departemen --</option>
                    <?php while($d = mysqli_fetch_assoc($dept_opt)) { ?>
                        <option value="<?php echo $d['id_departemen']; ?>"><?php echo $d['nama_departemen']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <button type="submit" class="btn btn-add">Simpan Data Pegawai</button>
        </form>
    </div>

</body>
</html>