<?php
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nip = $_POST['nip'];
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $tanggal_lahir = $_POST['tanggal_lahir'];
    $id_jabatan = $_POST['id_jabatan'];
    $id_departemen = $_POST['id_departemen'];

    // [VALIDASI INPUT KOSONG]
    if (empty($nip) || empty($nama) || empty($email) || empty($tanggal_lahir) || empty($id_jabatan) || empty($id_departemen)) {
        echo "<script>alert('Semua kolom form wajib diisi!'); window.history.back();</script>";
        exit;
    }

    // Mencegah SQL Injection
    $nip = mysqli_real_escape_string($conn, $nip);
    $nama = mysqli_real_escape_string($conn, $nama);
    $email = mysqli_real_escape_string($conn, $email);

    $query = "INSERT INTO pegawai (nip, nama, email, tanggal_lahir, id_jabatan, id_departemen) 
              VALUES ('$nip', '$nama', '$email', '$tanggal_lahir', '$id_jabatan', '$id_departemen')";

    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Data pegawai berhasil ditambahkan!'); window.location='index.php';</script>";
    } else {
        echo "Gagal menambahkan data: " . mysqli_error($conn);
    }
}
?>