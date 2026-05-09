import 'package:flutter/material.dart';

/// ============================================================
/// APP COLORS - Konstanta untuk semua warna yang digunakan
/// ============================================================
/// Menggunakan palet warna akademik profesional yang konsisten
/// di seluruh aplikasi
/// ============================================================
class AppColors {
  // Warna utama (primary color) - Biru akademik
  static const Color primary = Color(0xFF5B7FDE);

  // Warna utama gelap - Untuk gradien atau emphasis
  static const Color primaryDark = Color(0xFF4A6BC9);

  // Warna aksen - Orange untuk highlight dan call-to-action
  static const Color accent = Color(0xFFFF9500);

  // Warna aksen terang - Untuk background aksen
  static const Color accentLight = Color(0xFFFFB74D);

  // Warna background - Abu-abu terang
  static const Color background = Color(0xFFF5F5F5);

  // Warna surface - Putih untuk card dan surface
  static const Color surface = Colors.white;

  // Warna teks utama - Hitam gelap
  static const Color textPrimary = Color(0xFF212121);

  // Warna teks sekunder - Abu-abu untuk teks secondary
  static const Color textSecondary = Color(0xFF757575);

  // Warna error - Merah untuk pesan error
  static const Color error = Color(0xFFD32F2F);

  // Warna success - Hijau untuk pesan sukses
  static const Color success = Color(0xFF388E3C);

  // Warna warning - Orange untuk pesan warning
  static const Color warning = Color(0xFFFFA726);
}

/// ============================================================
/// APP STRINGS - Konstanta untuk semua teks yang digunakan
/// ============================================================
/// Menggunakan centralized strings untuk memudahkan
/// maintenance dan localization di masa depan
/// ============================================================
class AppStrings {
  // ============================================================
  // LOGIN SCREEN - Teks untuk halaman login
  // ============================================================
  static const String loginTitle = 'Sistem Akademik Sekolah';
  static const String loginSubtitle = 'Form Login Siswa';
  static const String emailLabel = 'Email';
  static const String emailHint = 'Masukkan Email';
  static const String passwordLabel = 'Password';
  static const String passwordHint = 'Masukkan Password';
  static const String forgotPassword = 'Lupa Password?';
  static const String loginButton = 'Login Sekarang';
  static const String loggingIn = 'Sedang Login...';

  // ============================================================
  // FORGOT PASSWORD SCREEN - Teks untuk halaman lupa password
  // ============================================================
  static const String resetPasswordTitle = 'Reset Password';
  static const String resetPasswordSubtitle =
      'Masukkan email kamu untuk reset password';
  static const String sendResetButton = 'Kirim Link Reset';
  static const String backToLogin = 'Kembali ke Login';

  // ============================================================
  // DASHBOARD SCREEN - Teks untuk halaman dashboard
  // ============================================================
  static const String dashboardTitle = 'Dashboard Akademik';
  static const String welcomeMessage = 'Selamat Datang,';
  static const String logout = 'Logout';
  static const String noData = 'Tidak ada data';
}

/// ============================================================
/// APP SPACING - Konstanta untuk jarak/spacing di seluruh app
/// ============================================================
/// Menggunakan sistem spacing yang konsisten untuk
/// menciptakan rhythm visual yang baik
/// ============================================================
class AppSpacing {
  // Jarak kecil - Untuk spacing antar elemen kecil
  static const double small = 8.0;

  // Jarak medium - Untuk spacing standar antar elemen
  static const double medium = 16.0;

  // Jarak besar - Untuk section spacing
  static const double large = 24.0;

  // Jarak extra besar - Untuk major section spacing
  static const double extraLarge = 32.0;
}

/// ============================================================
/// APP RADIUS - Konstanta untuk border radius
/// ============================================================
/// Menggunakan sistem border radius yang konsisten untuk
/// menciptakan desain yang cohesive dan modern
/// ============================================================
class AppRadius {
  // Border radius kecil - Untuk element kecil seperti button
  static const double small = 8.0;

  // Border radius medium - Untuk input field dan card
  static const double medium = 12.0;

  // Border radius besar - Untuk card utama
  static const double large = 16.0;

  // Border radius extra besar - Untuk element besar
  static const double extraLarge = 24.0;
}
