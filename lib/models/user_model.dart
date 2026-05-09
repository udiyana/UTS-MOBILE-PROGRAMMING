/// ============================================================
/// USER MODEL - Model untuk data user yang login
/// ============================================================
/// Class ini merepresentasikan data siswa yang telah login
/// ke dalam aplikasi Sistem Akademik Sekolah
/// ============================================================
class User {
  /// Nama lengkap siswa
  /// Diambil dari input user di halaman login
  final String nama;

  /// Email siswa
  /// Digunakan untuk login dan verifikasi
  final String email;

  /// Nomor Induk Siswa Nasional (NISN)
  /// Identitas unik siswa di tingkat nasional
  final String nisn;

  /// Kelas siswa
  /// Contoh: XII IPA 1, XI IPS 2, dll
  final String kelas;

  /// Constructor untuk membuat User object
  /// Semua parameter adalah required
  User({
    required this.nama,
    required this.email,
    required this.nisn,
    required this.kelas,
  });
}
