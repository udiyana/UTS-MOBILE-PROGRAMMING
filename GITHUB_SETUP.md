# Panduan Upload ke GitHub dan Menambahkan Screenshots

## LANGKAH 1: Siapkan Folder Screenshots

1. Buat folder baru di project root dengan nama `screenshots` atau `docs/screenshots`
   ```
   d:\UTS MOBILE\test\screenshots\
   ```

2. Buat 3 file gambar screenshot dari aplikasi Anda:
   - `1_login_screen.png` - Screenshot halaman login
   - `2_forgot_password_screen.png` - Screenshot halaman lupa password
   - `3_dashboard_screen.png` - Screenshot halaman dashboard

### Cara Mengambil Screenshot:
- **Dari Emulator Android**: Tekan `Ctrl+Shift+S` atau gunakan menu emulator
- **Dari Device Fisik**: Tekan tombol Power + Volume Down
- **Dari VS Code**: Gunakan `flutter screenshot` di terminal

Simpan semua gambar di folder `screenshots/`

---

## LANGKAH 2: Update README.md dengan Screenshots

Tambahkan section "Screenshots" di README.md. Tambahkan code ini sebelum "Dibuat oleh":

```markdown
Screenshots

Halaman Login
Halaman login dengan validasi form dan toggle show/hide password.
![Login Screen](screenshots/1_login_screen.png)

Halaman Lupa Password
Halaman untuk reset password dengan validasi email.
![Forgot Password Screen](screenshots/2_forgot_password_screen.png)

Halaman Dashboard
Halaman dashboard menampilkan menu akademik dengan GridView dan ListView.
![Dashboard Screen](screenshots/3_dashboard_screen.png)
```

---

## LANGKAH 3: Setup Git di Project

Buka PowerShell dan jalankan command berikut di folder project:

```bash
cd "d:\UTS MOBILE\test"

# 1. Initialize git repository (hanya sekali saja)
git init

# 2. Konfigurasi git (ganti dengan data Anda)
git config user.name "Nama Anda"
git config user.email "email@example.com"

# 3. Tambahkan semua file
git add .

# 4. Buat commit pertama
git commit -m "Initial commit: Setup project structure"

# 5. Buat commit untuk README dan screenshots
git add README.md screenshots/
git commit -m "Add comprehensive README and screenshots"

# 6. Lihat log untuk verifikasi
git log
```

---

## LANGKAH 4: Buat Repository di GitHub

1. Buka https://github.com/new
2. Masukkan nama repository: `uts-mobile-programming` atau `sistem-akademik-flutter`
3. Pilih Public (agar dosen bisa akses)
4. Jangan centang "Initialize this repository with a README" (karena sudah punya)
5. Klik "Create repository"

---

## LANGKAH 5: Push ke GitHub

Setelah repository dibuat, copy command yang muncul di GitHub. Biasanya seperti ini:

```bash
cd "d:\UTS MOBILE\test"

# Set remote URL (ganti USERNAME dan REPO_NAME dengan milik Anda)
git remote add origin https://github.com/USERNAME/REPO_NAME.git

# Rename branch ke main (jika perlu)
git branch -M main

# Push ke GitHub
git push -u origin main
```

---

## LANGKAH 6: Buat Commit Tambahan (Minimum 5 Commit)

Soal membutuhkan minimum 5 commit yang menunjukkan progress. Lakukan ini:

```bash
# Commit 1 (sudah ada)
git commit -m "Initial commit: Setup project structure"

# Commit 2
git add lib/screens/login_screen.dart
git commit -m "Add login screen with form validation"

# Commit 3
git add lib/screens/forgot_password_screen.dart
git commit -m "Add forgot password screen"

# Commit 4
git add lib/screens/dashboard_screen.dart
git commit -m "Add dashboard screen with GridView and ListView"

# Commit 5
git add README.md screenshots/
git commit -m "Add README documentation and screenshots"

# Commit 6 (bonus)
git add lib/models/ lib/utils/
git commit -m "Add models and validators"

# Push semua commit ke GitHub
git push -u origin main
```

---

## LANGKAH 7: Verifikasi di GitHub

1. Buka https://github.com/USERNAME/REPO_NAME
2. Verifikasi:
   - Ada 5+ commits di tab "Commits"
   - README.md ditampilkan dengan screenshots
   - Semua file project ada
   - Status: Public

---

## Format Screenshot di README.md Lengkap

Buka README.md Anda dan tambahkan di bagian akhir sebelum "Dibuat oleh":

```
Screenshots

Login Screen
Halaman login dengan validasi form email, password (min 8 karakter dengan huruf dan angka), dan nama (min 3 karakter). Dilengkapi toggle show/hide password dan loading indicator.
![Login Screen](screenshots/1_login_screen.png)

Forgot Password Screen
Halaman untuk reset password. User memasukkan email dan klik "Kirim Link Reset". Sistem menampilkan feedback melalui Snackbar.
![Forgot Password Screen](screenshots/2_forgot_password_screen.png)

Dashboard Screen
Halaman dashboard menampilkan nama user yang login, GridView dengan 5 menu akademik (Nilai, Jadwal, Presensi, Tugas, Pengumuman), dan ListView.builder di BottomSheet untuk detail menu.
![Dashboard Screen](screenshots/3_dashboard_screen.png)
```

---

## Tips Penting

1. **Ukuran file gambar**: Kurangi ukuran jika terlalu besar (gunakan Photoshop, Paint, atau online tools)
2. **Format gambar**: Gunakan .png atau .jpg
3. **Nama file**: Hindari spasi, gunakan underscore atau dash
4. **Path gambar**: Harus relative path `screenshots/nama_file.png` bukan absolute path
5. **Commit message**: Gunakan present tense ("Add" bukan "Added")
6. **Private atau Public**: Harus Public agar dosen bisa akses

---

## Troubleshooting

### Error: "fatal: not a git repository"
```bash
cd "d:\UTS MOBILE\test"
git init
```

### Error: "remote already exists"
```bash
git remote remove origin
git remote add origin https://github.com/USERNAME/REPO_NAME.git
```

### Git tidak recognize di PowerShell
Install Git dari: https://git-scm.com/download/win

### Screenshot tidak muncul di README
- Cek path sudah benar: `screenshots/nama_file.png`
- Commit dan push dulu sebelum screenshot bisa tampil
- Repository harus Public

---

## Command Cepat untuk Copy-Paste

```bash
cd "d:\UTS MOBILE\test"
git init
git config user.name "Nama Anda"
git config user.email "email@example.com"
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/USERNAME/REPO_NAME.git
git branch -M main
git push -u origin main
```

Selesai! Repository Anda sudah online di GitHub dengan README lengkap dan screenshots.
