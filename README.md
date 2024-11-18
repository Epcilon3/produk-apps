# Flutter Product App

Aplikasi manajemen produk sederhana yang dibuat dengan Flutter untuk frontend dan PHP untuk backend. Aplikasi ini memungkinkan pengguna untuk melihat daftar produk, melihat informasi produk secara rinci, dan menambahkan produk baru.

---

## Features
- Lihat daftar produk.
- Lihat detail produk.
- Tambahkan produk baru ke database.
---

## Tech Stack
- **Frontend**: Flutter (Dart)
- **Backend**: PHP (Native)

---

## Project Structure
### Flutter Files:
- `main.dart`: Halaman masuk utama aplikasi Flutter.
- `produk_page.dart`: Menampilkan daftar produk yang diambil dari backend.
- `produk_detail.dart`: Menampilkan informasi detail tentang produk tertentu.
- `produk_form.dart`: Formulir untuk menambahkan produk baru.
- `mproduk.dart`: Kelas model untuk produk.
- `api.dart`: Mengelola panggilan API ke backend.

### PHP Files:
- `konekdb.php`: Menyambungkan database dengan apps backend kita.
- `create.php`: Perintah menambahkan data produk baru.
- `list.php`: Menampilkan list data produk.
- `update.php`: Mengedit data produk untuk bagian controllernyaa.
- `delete.php`: menghapus data produk.



---

## Installation
1. **Buat Flutter Project Terlebih Dahulu**
2. **Clone the Repository**:
    ```bash
       git clone https://github.com/Epcilon3/produk-apps.git
    ```
3. **Masuk ke folder yang sudah di clone tadi dan pilih bagian pubspec.yaml lalu copy code tersebut, masukan ke dalam projectmu dan paste di file pubspec.yaml**
4. **Kemudian jalankan pub get nya**
5. **Hapus folder lib di Flutter Project mu, kemudian tempelkan folder lib yang sudah di clone ke dalam flutter projectmu**
6. **Copy folder produk yang sudah di clone kemudian paste di folder htdocs mu**
7. **Jalankan server apache dan mysql, lalu masuk ke phpmyadmin**
8. **Ekspor file database ada di folder DB**
