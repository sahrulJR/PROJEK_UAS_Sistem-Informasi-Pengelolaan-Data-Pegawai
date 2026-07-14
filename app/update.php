<?php
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_pegawai = $_POST['id_pegawai'];
    $nip = $_POST['nip'];
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $tanggal_lahir = $_POST['tanggal_lahir'];
    $id_jabatan = $_POST['id_jabatan'];
    $id_departemen = $_POST['id_departemen'];

    if (empty($nip) || empty($nama) || empty($email)) {
        echo "<script>alert('Kolom utama tidak boleh kosong!'); window.history.back();</script>";
        exit;
    }

    $nip = mysqli_real_escape_string($conn, $nip);
    $nama = mysqli_real_escape_string($conn, $nama);
    $email = mysqli_real_escape_string($conn, $email);

    $query = "UPDATE pegawai SET 
                nip = '$nip', 
                nama = '$nama', 
                email = '$email', 
                tanggal_lahir = '$tanggal_lahir', 
                id_jabatan = '$id_jabatan', 
                id_departemen = '$id_departemen' 
              WHERE id_pegawai = '$id_pegawai'";

    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Data pegawai berhasil diperbarui!'); window.location='index.php';</script>";
    } else {
        echo "Gagal memperbarui data: " . mysqli_error($conn);
    }
}
?>