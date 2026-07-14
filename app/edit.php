<?php
include 'koneksi.php';

$id = $_GET['id'] ?? null;
if (!$id) { header("Location: index.php"); exit; }

$pegawai_query = mysqli_query($conn, "SELECT * FROM pegawai WHERE id_pegawai = '$id'");
$p_data = mysqli_fetch_assoc($pegawai_query);

$jabatan_opt = mysqli_query($conn, "SELECT * FROM jabatan");
$dept_opt = mysqli_query($conn, "SELECT * FROM departemen");
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Data Pegawai</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

    <div class="container">
        <h2>Form Edit Data Pegawai</h2>
        <div class="nav">
            <a href="index.php" class="btn btn-back">Batal</a>
        </div>

        <form action="update.php" method="POST">
            <input type="hidden" name="id_pegawai" value="<?php echo $p_data['id_pegawai']; ?>">

            <div class="form-group">
                <label>NIP</label>
                <input type="text" name="nip" value="<?php echo htmlspecialchars($p_data['nip']); ?>" required>
            </div>
            <div class="form-group">
                <label>Nama Lengkap</label>
                <input type="text" name="nama" value="<?php echo htmlspecialchars($p_data['nama']); ?>" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" value="<?php echo htmlspecialchars($p_data['email']); ?>" required>
            </div>
            <div class="form-group">
                <label>Tanggal Lahir</label>
                <input type="date" name="tanggal_lahir" value="<?php echo $p_data['tanggal_lahir']; ?>" required>
            </div>
            <div class="form-group">
                <label>Jabatan</label>
                <select name="id_jabatan" required>
                    <?php while($j = mysqli_fetch_assoc($jabatan_opt)) { 
                        $selected = ($j['id_jabatan'] == $p_data['id_jabatan']) ? 'selected' : '';
                        echo "<option value='".$j['id_jabatan']."' $selected>".$j['nama_jabatan']."</option>";
                    } ?>
                </select>
            </div>
            <div class="form-group">
                <label>Departemen</label>
                <select name="id_departemen" required>
                    <?php while($d = mysqli_fetch_assoc($dept_opt)) { 
                        $selected = ($d['id_departemen'] == $p_data['id_departemen']) ? 'selected' : '';
                        echo "<option value='".$d['id_departemen']."' $selected>".$d['nama_departemen']."</option>";
                    } ?>
                </select>
            </div>
            <button type="submit" class="btn btn-edit">Perbarui Data Pegawai</button>
        </form>
    </div>

</body>
</html>