import 'package:flutter/material.dart';
import 'package:test/utils/validators.dart';
import 'package:test/utils/constants.dart';

/// ============================================================
/// FORGOT PASSWORD SCREEN - HALAMAN LUPA PASSWORD
/// ============================================================
/// Halaman ini menampilkan form untuk reset password dengan fitur:
/// - Input Email dengan validasi format
/// - Tombol "Kirim Link Reset" dengan loading state
/// - Feedback visual berupa Snackbar
/// - Tombol "Kembali ke Login"
/// - Layout responsive menggunakan Column, Padding, SizedBox, SafeArea
/// ============================================================
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // ============================================================
  // FORM KEY - Untuk mengontrol validasi form
  // ============================================================
  final _formKey = GlobalKey<FormState>();

  // ============================================================
  // TEXT EDITING CONTROLLER - Untuk menangkap input email
  // ============================================================
  final _emailController = TextEditingController();

  // ============================================================
  // STATE VARIABLES - Untuk mengatur state aplikasi
  // ============================================================
  // Variable untuk menampilkan loading indicator saat submit
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  /// ============================================================
  /// _HANDLE_SEND_RESET - Fungsi untuk mengirim reset password link
  /// ============================================================
  /// Tahapan proses:
  /// 1. Validasi form email
  /// 2. Set loading state menjadi true
  /// 3. Simulasi network request (delay 2 detik)
  /// 4. Tampilkan snackbar pesan sukses
  /// 5. Clear email field
  /// 6. Kembali ke halaman login setelah 2 detik
  /// ============================================================
  Future<void> _handleSendReset() async {
    // Langkah 1: Validasi form
    // Jika form tidak valid (email kosong atau format salah), stop proses
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Langkah 2: Set loading state menjadi true untuk menampilkan loading indicator
    setState(() {
      _isLoading = true;
    });

    // Langkah 3: Simulasi network request (delay 2 detik)
    // Dalam aplikasi real, ini akan diganti dengan API call ke server
    await Future.delayed(const Duration(seconds: 2));

    // Ambil email dari text controller
    final email = _emailController.text.trim();

    // Set loading state menjadi false
    setState(() {
      _isLoading = false;
    });

    // Cek apakah widget masih mounted (masih ditampilkan)
    if (!mounted) return;

    // Langkah 4: Tampilkan snackbar pesan sukses
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Link reset telah dikirim ke $email'),
        backgroundColor: AppColors.success,
        duration: const Duration(seconds: 3),
      ),
    );

    // Langkah 5: Clear email field (kosongkan input)
    _emailController.clear();

    // Langkah 6: Kembali ke halaman login setelah 2 detik
    // Ini untuk memberikan waktu kepada user untuk membaca pesan sukses
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
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
          AppStrings.resetPasswordTitle,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // Tombol back untuk kembali ke halaman sebelumnya
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      // ============================================================
      // BODY - Konten utama halaman lupa password
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
                // HEADER ICON - Icon untuk halaman reset password
                // ============================================================
                Container(
                  padding: const EdgeInsets.all(AppSpacing.medium),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.vpn_key_outlined,
                    size: 50,
                    color: Colors.white.withAlpha((0.9 * 255).round()),
                  ),
                ),
                const SizedBox(height: AppSpacing.large),

                // ============================================================
                // TITLE - Judul halaman
                // ============================================================
                const Text(
                  AppStrings.resetPasswordTitle,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.small),

                // ============================================================
                // SUBTITLE - Penjelasan halaman
                // ============================================================
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                  child: Text(
                    AppStrings.resetPasswordSubtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: AppSpacing.extraLarge),

                // ============================================================
                // FORM CARD - Card yang berisi form reset password
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
                          // EMAIL FIELD - Input email untuk reset password
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
                          const SizedBox(height: AppSpacing.large),

                          // ============================================================
                          // SEND RESET BUTTON - Tombol untuk mengirim link reset
                          // ============================================================
                          FilledButton.tonal(
                            onPressed: _isLoading ? null : _handleSendReset,
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.success,
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
                                // Tampilkan loading indicator saat sedang submit
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
                                      const Text('Sedang Mengirim...'),
                                    ],
                                  )
                                // Tampilkan text normal jika tidak sedang loading
                                : const Text(
                                    AppStrings.sendResetButton,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                          const SizedBox(height: AppSpacing.medium),

                          // ============================================================
                          // BACK TO LOGIN BUTTON - Tombol untuk kembali ke halaman login
                          // ============================================================
                          OutlinedButton(
                            onPressed: _isLoading
                                ? null
                                : () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.medium,
                              ),
                              side: const BorderSide(
                                color: AppColors.primary,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.medium,
                                ),
                              ),
                            ),
                            child: const Text(
                              AppStrings.backToLogin,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),

                          // ============================================================
                          // INFO TEXT - Informasi tambahan untuk user
                          // ============================================================
                          const SizedBox(height: AppSpacing.large),
                          Container(
                            padding: const EdgeInsets.all(AppSpacing.medium),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(
                                (0.1 * 255).round(),
                              ),
                              borderRadius: BorderRadius.circular(
                                AppRadius.medium,
                              ),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              'Kami akan mengirimkan link reset password ke email Anda. Silakan cek inbox atau folder spam.',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
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
