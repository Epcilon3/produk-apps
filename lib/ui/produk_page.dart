import 'package:produk/ui/produk_detail.dart';
import 'package:produk/ui/produk_form.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; // Untuk decode JSON
import 'package:http/http.dart' as http; // Untuk HTTP request
import 'package:produk/models/api.dart'; // Pastikan ini diimpor untuk URL API

class ProdukPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  List produkList = []; // List untuk menyimpan produk yang diterima

  // Fungsi untuk mengambil data produk dari API
  Future<List> fetchProduk() async {
    final response = await http.get(Uri.parse(BaseUrl.data)); // URL API

    if (response.statusCode == 200) {
      // Jika server merespons dengan status 200 (OK), ambil data produk
      return json.decode(response.body); // Decode JSON menjadi List
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    // Ambil data produk saat pertama kali halaman dimuat
    fetchProduk().then((data) {
      setState(() {
        produkList = data; // Menyimpan produk yang diterima
      });
    });
  }

  // Fungsi untuk menambah produk baru
  void addProduk(Map newProduk) {
    setState(() {
      produkList.add(newProduk); // Menambahkan produk baru ke dalam list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Data Produk'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              // Navigasi ke halaman form dan tunggu data yang kembali
              var result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdukForm()),
              );
              if (result != null) {
                // Jika data diterima, tambahkan ke list produk
                addProduk(result);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: produkList.length,
        itemBuilder: (context, index) {
          var produk = produkList[index];
          return ItemProduk(
            kodeProduk: produk['kode_produk'],
            namaProduk: produk['nama_produk'],
            harga: produk['harga'],
          );
        },
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ItemProduk({Key? key, this.kodeProduk, this.namaProduk, this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Kode Produk dan Nama Produk
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kode: ${kodeProduk ?? 'N/A'}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    namaProduk ?? 'Nama Produk',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Harga Produk
              Text(
                'Rp ${harga?.toString() ?? '0'}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              kodeProduk: kodeProduk,
              namaProduk: namaProduk,
              harga: harga,
            ),
          ),
        );
      },
    );
  }
}
