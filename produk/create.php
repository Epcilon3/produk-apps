<?php
header('Content-Type: application/json');
include "konekdb.php";

// Mendapatkan data dari form (POST request)
$kode_produk = $_POST['kode_produk'];
$nama_produk = $_POST['nama_produk'];
$harga = $_POST['harga'];

// Menyiapkan query untuk insert data produk
$stmt = $db->prepare("INSERT INTO produk (kode_produk, nama_produk, harga) 
                        VALUES (?, ?, ?)");

// Menjalankan query dengan data yang diterima dari form
$result = $stmt->execute([$kode_produk, $nama_produk, $harga]);

// Menampilkan hasil response dalam format JSON
echo json_encode([
    'success' => $result
]);
?>
