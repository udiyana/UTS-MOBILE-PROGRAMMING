import 'package:flutter/material.dart';
import 'package:test/utils/validators.dart';
import 'package:test/utils/constants.dart';
import 'package:test/models/user_model.dart';

// ============================================================
// LOGIN SCREEN - HALAMAN LOGIN SISWA
// ============================================================
// Halaman ini menampilkan form login untuk siswa dengan fitur:
// - Input Nama Siswa
// - Input Email dengan validasi format
// - Input Password dengan toggle show/hide
// - Validasi form menggunakan GlobalKey<FormState>
// - Loading indicator saat sedang login
// - Link "Lupa Password?" untuk reset password
// - Snackbar untuk pesan error/success
// ============================================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ============================================================
  // FORM KEY - Untuk mengontrol validasi form
  // ============================================================
  final _formKey = GlobalKey<FormState>();

  // ============================================================
  // TEXT EDITING CONTROLLERS - Untuk menangkap input dari user
  // ============================================================
  // Controller untuk input nama siswa
  final _namaController = TextEditingController();

  // Controller untuk input email siswa
  final _emailController = TextEditingController();

  // Controller untuk input password siswa
  final _passwordController = TextEditingController();

  // ============================================================
  // STATE VARIABLES - Untuk mengatur state aplikasi
  // ============================================================
  // Variable untuk menampilkan loading indicator saat login
  bool _isLoading = false;

  // Variable untuk toggle show/hide password
  bool _isPasswordVisible = false;

  // Variable untuk menyimpan pesan error
  String? _errorMessage;

  // Hardcoded credentials untuk keperluan ujian
  // Kredensial valid: admin@test.com / Admin123
  static const String _validEmail = 'admin@test.com';
  static const String _validPassword = 'Admin123';

  /// ============================================================
  /// DISPOSE - Membersihkan resources saat widget dihancurkan
  /// ============================================================
  /// Penting untuk melepaskan TextEditingController agar tidak
  /// terjadi memory leak
  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// ============================================================
  /// _HANDLE_LOGIN - Fungsi untuk memproses login
  /// ============================================================
  /// Tahapan proses:
  /// 1. Kosongkan pesan error sebelumnya
  /// 2. Validasi form (nama, email, password)
  /// 3. Set loading state menjadi true
  /// 4. Simulasi network request (delay 2 detik)
  /// 5. Cek kredensial email dan password
  /// 6. Jika valid: buat User object dan navigasi ke dashboard
  /// 7. Jika tidak valid: tampilkan error message
  /// ============================================================
  Future<void> _handleLogin() async {
    // Langkah 1: Kosongkan pesan error sebelumnya
    setState(() {
      _errorMessage = null;
    });

    // Langkah 2: Validasi form
    // Jika form tidak valid (ada field yang kosong atau error), stop proses
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Langkah 3: Set loading state menjadi true untuk menampilkan loading indicator
    setState(() {
      _isLoading = true;
    });

    // Langkah 4: Simulasi network request (delay 2 detik)
    // Dalam aplikasi real, ini akan diganti dengan API call
    await Future.delayed(const Duration(seconds: 2));

    // Pastikan widget masih mounted setelah async gap
    if (!mounted) return;

    // Ambil nilai dari text controller
    final nama = _namaController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // Langkah 5: Cek kredensial
    // Untuk keperluan ujian, email dan password harus sesuai kredensial yang sudah ditentukan
    if (email == _validEmail && password == _validPassword) {
      // ============================================================
      // LOGIN SUKSES
      // ============================================================
      // Set loading state menjadi false
      setState(() {
        _isLoading = false;
      });

      // Cek apakah widget masih mounted (masih ditampilkan)
      if (!mounted) return;

      // Langkah 6: Buat User object dengan data dari form
      // Data nama diambil dari input user di field nama
      final user = User(
        nama: nama, // Nama yang diinput oleh user di halaman login
        email: email,
        nisn: '0012345678',
        kelas: 'XII IPA 1',
      );

      // Navigasi ke dashboard dengan membawa user object
      Navigator.of(context).pushReplacementNamed('/dashboard', arguments: user);

      // Tampilkan snackbar pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login berhasil! Selamat datang, $nama.'),
          backgroundColor: AppColors.success,
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      // ============================================================
      // LOGIN GAGAL
      // ============================================================
      // Langkah 7: Tampilkan error message
      setState(() {
        _isLoading = false;
        _errorMessage = 'Email atau password salah!';
      });

      // Tampilkan snackbar pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage!),
          backgroundColor: AppColors.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ============================================================
      // APPBAR - Header aplikasi
      // ============================================================
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          'Sistem Akademik',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // ============================================================
      // BODY - Konten utama halaman login
      // ============================================================
      body: SafeArea(
        child: Container(
          // Tambahkan gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary.withAlpha((0.1 * 255).round()),
                AppColors.background,
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.large),

                // ============================================================
                // HEADER - Logo dan judul halaman
                // ============================================================
                Container(
                  padding: const EdgeInsets.all(AppSpacing.medium),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.large),
                  ),
                  child: Column(
                    children: [
                      // Icon sekolah
                      Icon(
                        Icons.school,
                        size: 60,
                        color: Colors.white.withAlpha((0.9 * 255).round()),
                      ),
                      const SizedBox(height: AppSpacing.small),

                      // Judul aplikasi
                      const Text(
                        AppStrings.loginTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSpacing.small),

                      // Subtitle halaman
                      const Text(
                        AppStrings.loginSubtitle,
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.extraLarge),

                // ============================================================
                // FORM CARD - Card yang berisi form login
                // ============================================================
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.large),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.large),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ============================================================
                          // NAMA FIELD - Input nama siswa
                          // ============================================================
                          TextFormField(
                            controller: _namaController,
                            keyboardType: TextInputType.text,
                            enabled: !_isLoading,
                            // Validasi nama menggunakan Validators.validateName
                            validator: Validators.validateName,
                            decoration: InputDecoration(
                              labelText: 'Nama Lengkap',
                              hintText: 'Masukkan Nama Lengkap Anda',
                              prefixIcon: const Icon(Icons.person_outline),
                              prefixIconColor: AppColors.primary,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                                borderSide: const BorderSide(
                                  color: AppColors.error,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.medium),

                          // ============================================================
                          // EMAIL FIELD - Input email siswa
                          // ============================================================
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            enabled: !_isLoading,
                            // Validasi email menggunakan Validators.validateEmail
                            validator: Validators.validateEmail,
                            decoration: InputDecoration(
                              labelText: AppStrings.emailLabel,
                              hintText: AppStrings.emailHint,
                              prefixIcon: const Icon(Icons.email_outlined),
                              prefixIconColor: AppColors.primary,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                                borderSide: const BorderSide(
                                  color: AppColors.error,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.medium),

                          // ============================================================
                          // PASSWORD FIELD - Input password siswa
                          // ============================================================
                          TextFormField(
                            controller: _passwordController,
                            // Toggle antara obscureText true/false untuk show/hide password
                            obscureText: !_isPasswordVisible,
                            enabled: !_isLoading,
                            // Validasi password menggunakan Validators.validatePassword
                            validator: Validators.validatePassword,
                            decoration: InputDecoration(
                              labelText: AppStrings.passwordLabel,
                              hintText: AppStrings.passwordHint,
                              prefixIcon: const Icon(Icons.lock_outlined),
                              prefixIconColor: AppColors.primary,
                              // Tombol untuk toggle show/hide password
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                                onPressed: () {
                                  // Toggle state _isPasswordVisible
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                                borderSide: const BorderSide(
                                  color: AppColors.error,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.small),

                          // ============================================================
                          // LUPA PASSWORD LINK - Link untuk navigasi ke halaman lupa password
                          // ============================================================
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: _isLoading
                                  ? null
                                  : () {
                                      // Navigasi ke halaman Lupa Password menggunakan named route
                                      Navigator.of(
                                        context,
                                      ).pushNamed('/forgot-password');
                                    },
                              child: const Text(
                                AppStrings.forgotPassword,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.medium),

                          // ============================================================
                          // LOGIN BUTTON - Tombol untuk submit login
                          // ============================================================
                          FilledButton.tonal(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.medium,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                              ),
                            ),
                            child: _isLoading
                                // Tampilkan loading indicator saat sedang login
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                        ),
                                      ),
                                      const SizedBox(width: AppSpacing.small),
                                      const Text(AppStrings.loggingIn),
                                    ],
                                  )
                                // Tampilkan text normal jika tidak sedang loading
                                : const Text(
                                    AppStrings.loginButton,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.large),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
