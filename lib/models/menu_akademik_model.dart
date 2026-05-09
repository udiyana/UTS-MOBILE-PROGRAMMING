import 'package:flutter/material.dart';

/// ============================================================
/// MENU AKADEMIK MODEL - Model untuk menu akademik
/// ============================================================
/// Class ini merepresentasikan setiap menu akademik
/// yang ditampilkan di halaman dashboard
/// ============================================================
class MenuAkademik {
  /// Judul menu akademik
  /// Contoh: Nilai, Jadwal Pelajaran, Presensi, dll
  final String judul;

  /// Deskripsi singkat menu
  /// Penjelasan tentang apa yang bisa dilihat di menu tersebut
  final String deskripsi;

  /// Icon yang ditampilkan untuk menu
  /// Menggunakan Material Icons dari Flutter
  final IconData icon;

  /// Warna untuk menu
  /// Setiap menu memiliki warna unik untuk visual distinction
  final Color color;

  /// Constructor untuk membuat MenuAkademik object
  /// Semua parameter adalah required
  MenuAkademik({
    required this.judul,
    required this.deskripsi,
    required this.icon,
    required this.color,
  });
}
