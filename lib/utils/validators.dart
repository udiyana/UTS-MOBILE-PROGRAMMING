class Validators {
  /// ============================================================
  /// VALIDASI EMAIL
  /// ============================================================
  /// Fungsi ini melakukan validasi terhadap input email
  /// Kriteria:
  /// - Email tidak boleh kosong
  /// - Email harus sesuai dengan format email standar (menggunakan regex)
  /// ============================================================
  static String? validateEmail(String? value) {
    // Cek apakah email kosong
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }

    // Regex untuk validasi format email
    // Format: username@domain.extension
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Cek apakah email sesuai dengan format regex
    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }

    // Jika semua validasi lolos, return null (tidak ada error)
    return null;
  }

  /// ============================================================
  /// VALIDASI PASSWORD
  /// ============================================================
  /// Fungsi ini melakukan validasi terhadap input password
  /// Kriteria:
  /// - Password tidak boleh kosong
  /// - Password minimal 8 karakter
  /// - Password harus mengandung huruf (a-z, A-Z)
  /// - Password harus mengandung angka (0-9)
  /// ============================================================
  static String? validatePassword(String? value) {
    // Cek apakah password kosong
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }

    // Cek panjang password minimal 8 karakter
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }

    // Cek apakah password mengandung huruf (a-z atau A-Z)
    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return 'Password harus mengandung huruf';
    }

    // Cek apakah password mengandung angka (0-9)
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password harus mengandung angka';
    }

    // Jika semua validasi lolos, return null (tidak ada error)
    return null;
  }

  /// ============================================================
  /// VALIDASI NAMA
  /// ============================================================
  /// Fungsi ini melakukan validasi terhadap input nama siswa
  /// Kriteria:
  /// - Nama tidak boleh kosong
  /// - Nama minimal 3 karakter
  /// ============================================================
  static String? validateName(String? value) {
    // Cek apakah nama kosong
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }

    // Cek panjang nama minimal 3 karakter
    if (value.length < 3) {
      return 'Nama minimal 3 karakter';
    }

    // Jika semua validasi lolos, return null (tidak ada error)
    return null;
  }
}
