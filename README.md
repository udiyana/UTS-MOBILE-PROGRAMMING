UTS Mobile Programming
Aplikasi Sistem Akademik Sekolah

Getting Started

Proyek ini adalah titik awal untuk aplikasi Flutter yang dibuat untuk memenuhi tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Seluler.

Aplikasi ini adalah purwarupa sistem akademik sekolah sederhana yang memiliki fitur utama:

Halaman Login: Dilengkapi dengan validasi form (pengecekan format email, password minimal 8 karakter dengan kombinasi huruf dan angka, serta nama minimal 3 karakter) menggunakan Form dan GlobalKey<FormState>. Fitur toggle show/hide password dan loading indicator saat login.

Halaman Lupa Password: Simulasi pengiriman tautan reset ke email dengan validasi format email dan loading state.

Halaman Dashboard: Menampilkan data user yang login (nama, NISN, kelas), menu akademik dengan GridView.builder (5 menu), dan detail menu menggunakan ListView.builder di BottomSheet (12 item per menu). Dilengkapi dengan logout menggunakan AlertDialog dan Navigator.pushAndRemoveUntil() untuk clear navigation stack.

Fitur Pendukung:
- State Management: isLoading, errorMessage, isPasswordVisible
- Navigation: 3 named routes (/login, /forgot-password, /dashboard)
- Card dengan styling (shadow, rounded corner, gradient background)
- Snackbar untuk feedback user
- Hardcoded credential: admin@test.com / Admin123

Teknologi yang Digunakan:
- Flutter SDK 3.8.1
- Dart with Null Safety
- Material Design 3
- Tidak menggunakan external dependency

Struktur Folder:
lib/
  ├── main.dart
  ├── screens/
  │   ├── login_screen.dart
  │   ├── forgot_password_screen.dart
  │   └── dashboard_screen.dart
  ├── models/
  │   ├── user_model.dart
  │   └── menu_akademik_model.dart
  ├── utils/
  │   ├── constants.dart
  │   └── validators.dart
  └── widgets/

Cara Menjalankan Aplikasi:

flutter pub get
flutter run

Akses dengan kredensial:
Email: admin@test.com
Password: Admin123

Resources:

Lab: Write your first Flutter app
Cookbook: Useful Flutter samples
Flutter Documentation

Screenshots

Halaman Login
Halaman login dengan validasi form email, password minimal 8 karakter dengan kombinasi huruf dan angka, dan nama minimal 3 karakter. Dilengkapi toggle show/hide password dan loading indicator saat login.
![Login Screen](/lib/image/login_screen.jpg)

Halaman Lupa Password
Halaman untuk reset password. User memasukkan email yang sudah terdaftar dan klik tombol "Kirim Link Reset". Sistem menampilkan feedback melalui Snackbar.
![Forgot Password Screen](/lib/image/forgot_password_screen.jpg)

Halaman Dashboard
Halaman dashboard menampilkan data user yang berhasil login (nama, NISN, kelas), GridView dengan 5 menu akademik (Nilai, Jadwal Pelajaran, Presensi, Tugas, Pengumuman), dan ListView.builder di BottomSheet untuk menampilkan detail menu dengan 12 item per kategori.
![Dashboard Screen](/lib/image/dashboard_screen.jpg)

Update login feature documentation.

Dibuat oleh: I Putu Gede Udiyana Putra NIM: 2401010072 Kelas: M Program Studi: S1 Teknik Informatika - INSTIKI