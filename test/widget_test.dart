// Widget test untuk Sistem Akademik Sekolah
//
// Test ini memverifikasi bahwa aplikasi dapat dibuild dan halaman login ditampilkan.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test/main.dart';

void main() {
  testWidgets('Sistem Akademik Sekolah - Login Screen Test', (
    WidgetTester tester,
  ) async {
    // Build aplikasi
    await tester.pumpWidget(const MyApp());

    // Verify bahwa AppBar "Sistem Akademik" ada
    expect(find.text('Sistem Akademik'), findsOneWidget);

    // Verify bahwa title "Sistem Akademik Sekolah" ada
    expect(find.text('Sistem Akademik Sekolah'), findsOneWidget);

    // Verify bahwa subtitle "Form Login Siswa" ada
    expect(find.text('Form Login Siswa'), findsOneWidget);

    // Verify bahwa email field ada
    expect(find.byType(TextFormField), findsWidgets);

    // Verify bahwa login button ada
    expect(find.text('Login Sekarang'), findsOneWidget);

    // Verify bahwa "Lupa Password?" link ada
    expect(find.text('Lupa Password?'), findsOneWidget);

    // Verify bahwa demo credentials info ditampilkan
    expect(find.text('📝 Demo Credentials (Untuk Ujian):'), findsOneWidget);
    expect(find.text('Email: admin@test.com'), findsOneWidget);
    expect(find.text('Password: Admin123'), findsOneWidget);
  });

  testWidgets('Login dengan Email Kosong - Validation Test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Cari dan tap tombol Login
    await tester.tap(find.text('Login Sekarang'));
    await tester.pumpAndSettle();

    // Verify error message untuk email kosong
    expect(find.text('Email tidak boleh kosong'), findsOneWidget);
  });

  testWidgets('Login dengan Email Invalid - Validation Test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Masukkan email invalid
    await tester.enterText(find.byType(TextFormField).first, 'invalidemail');

    // Tap login button
    await tester.tap(find.text('Login Sekarang'));
    await tester.pumpAndSettle();

    // Verify error message untuk format email
    expect(find.text('Format email tidak valid'), findsOneWidget);
  });

  testWidgets(
    'Login dengan Password Kurang dari 8 Karakter - Validation Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Masukkan email valid
      await tester.enterText(
        find.byType(TextFormField).first,
        'admin@test.com',
      );

      // Masukkan password kurang dari 8 karakter
      await tester.enterText(find.byType(TextFormField).at(1), 'abc123');

      // Tap login button
      await tester.tap(find.text('Login Sekarang'));
      await tester.pumpAndSettle();

      // Verify error message untuk password
      expect(find.text('Password minimal 8 karakter'), findsOneWidget);
    },
  );

  testWidgets('Toggle Password Visibility Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify bahwa visibility icon ada
    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);

    // Tap visibility button untuk show password
    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pumpAndSettle();

    // Verify bahwa icon berubah ke visibility
    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
  });

  testWidgets('Lupa Password Navigation Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify bahwa di login page
    expect(find.text('Form Login Siswa'), findsOneWidget);

    // Tap "Lupa Password?" link
    await tester.tap(find.text('Lupa Password?'));
    await tester.pumpAndSettle();

    // Verify bahwa kita sudah di halaman Lupa Password
    expect(find.text('Reset Password'), findsOneWidget);
    expect(
      find.text('Masukkan email kamu untuk reset password'),
      findsOneWidget,
    );
  });
}
