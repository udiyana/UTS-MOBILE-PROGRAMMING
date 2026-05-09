import 'package:flutter/material.dart';
import 'package:test/screens/login_screen.dart';
import 'package:test/screens/forgot_password_screen.dart';
import 'package:test/screens/dashboard_screen.dart';
import 'package:test/models/user_model.dart';
import 'package:test/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Akademik Sekolah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/dashboard': (context) {
          // Get user from arguments
          final user = ModalRoute.of(context)?.settings.arguments as User?;
          return DashboardScreen(
            user:
                user ??
                User(
                  nama: 'User',
                  email: 'user@test.com',
                  nisn: '0000000000',
                  kelas: 'XII',
                ),
          );
        },
      },
    );
  }
}
