<?php
include 'koneksi.php';

$id = $_GET['id'] ?? null;

if ($id) {
    $id = mysqli_real_escape_string($conn, $id);
    $query = "DELETE FROM pegawai WHERE id_pegawai = '$id'";
    
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Data pegawai berhasil dihapus!'); window.location='index.php';</script>";
    } else {
        echo "Gagal menghapus data: " . mysqli_error($conn);
    }
} else {
    header("Location: index.php");
}
?>