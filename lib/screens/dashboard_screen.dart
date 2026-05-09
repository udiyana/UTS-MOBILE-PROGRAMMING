import 'package:flutter/material.dart';
import 'package:test/utils/constants.dart';
import 'package:test/models/user_model.dart';
import 'package:test/models/menu_akademik_model.dart';


/// HALAMAN DASHBOARD AKADEMIK
/// Halaman ini menampilkan dashboard akademik dengan fitur:
/// - Welcome message dengan data user (nama, NISN, kelas)
/// - GridView untuk menampilkan 5 menu akademik
/// - Bottom sheet dengan ListView.builder untuk detail menu
/// - Card dengan styling (shadow, rounded corner, gradient)
/// - Logout dengan dialog konfirmasi
/// - Navigasi kembali ke login setelah logout

class DashboardScreen extends StatefulWidget {
  // Parameter: menerima User object dari halaman login
  final User user;

  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // MENU DATA - Data untuk menu akademik
  late List<MenuAkademik> menuAkademik;
  late List<String> daftarNilai;
  late List<String> daftarJadwal;
  late List<String> daftarPresensi;
  late List<String> daftarTugas;
  late List<String> daftarPengumuman;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  /// ============================================================
  /// _INITIALIZE_DATA - Fungsi untuk inisialisasi data dummy
  /// ============================================================
  /// Menginisialisasi:
  /// - Menu akademik (5 item dengan warna berbeda)
  /// - Data nilai (12 item)
  /// - Data jadwal (12 item)
  /// - Data presensi (12 item)
  /// - Data tugas (12 item)
  /// - Data pengumuman (12 item)
  /// ============================================================
  void _initializeData() {
    // Menu Akademik - 5 menu akademik dengan icon dan warna berbeda
    menuAkademik = [
      MenuAkademik(
        judul: 'Nilai',
        deskripsi: 'Lihat daftar nilai mata pelajaran',
        icon: Icons.grade,
        color: const Color(0xFF5B7FDE),
      ),
      MenuAkademik(
        judul: 'Jadwal Pelajaran',
        deskripsi: 'Lihat jadwal pelajaran mingguan',
        icon: Icons.schedule,
        color: const Color(0xFF26C485),
      ),
      MenuAkademik(
        judul: 'Presensi',
        deskripsi: 'Lihat data kehadiran bulanan',
        icon: Icons.done_all,
        color: const Color(0xFFFF9500),
      ),
      MenuAkademik(
        judul: 'Tugas',
        deskripsi: 'Lihat daftar tugas dan deadline',
        icon: Icons.assignment,
        color: const Color(0xFFD32F2F),
      ),
      MenuAkademik(
        judul: 'Pengumuman',
        deskripsi: 'Baca pengumuman dari sekolah',
        icon: Icons.notifications_active,
        color: const Color(0xFF7C3AED),
      ),
    ];

    // Daftar Nilai - 12 item dummy data
    daftarNilai = [
      'Matematika: 85',
      'Bahasa Indonesia: 90',
      'Bahasa Inggris: 78',
      'IPA: 88',
      'IPS: 82',
      'Seni Budaya: 91',
      'Pendidikan Jasmani: 87',
      'TIK: 93',
      'Pendidikan Agama: 86',
      'Bahasa Daerah: 80',
      'Fisika: 84',
      'Kimia: 89',
    ];

    // Daftar Jadwal - 12 item dummy data
    daftarJadwal = [
      'Senin: Matematika (07:00-08:30)',
      'Senin: Bahasa Indonesia (08:30-10:00)',
      'Selasa: IPA (07:00-08:30)',
      'Selasa: TIK (08:30-10:00)',
      'Rabu: Bahasa Inggris (07:00-08:30)',
      'Rabu: IPS (08:30-10:00)',
      'Kamis: Seni Budaya (07:00-08:30)',
      'Kamis: Pendidikan Jasmani (08:30-10:00)',
      'Jumat: Pendidikan Agama (07:00-08:30)',
      'Jumat: Kimia (08:30-10:00)',
      'Sabtu: Fisika (07:00-08:30)',
      'Sabtu: Bahasa Daerah (08:30-10:00)',
    ];

    // Daftar Presensi - 12 item dummy data
    daftarPresensi = [
      'Minggu 1: Hadir 5 hari, Alfa 1 hari',
      'Minggu 2: Hadir 6 hari, Alfa 0 hari',
      'Minggu 3: Hadir 5 hari, Alfa 1 hari',
      'Minggu 4: Hadir 6 hari, Alfa 0 hari',
      'Minggu 5: Hadir 6 hari, Alfa 0 hari',
      'Minggu 6: Hadir 5 hari, Sakit 1 hari',
      'Minggu 7: Hadir 6 hari, Alfa 0 hari',
      'Minggu 8: Hadir 5 hari, Izin 1 hari',
      'Minggu 9: Hadir 6 hari, Alfa 0 hari',
      'Minggu 10: Hadir 6 hari, Alfa 0 hari',
      'Minggu 11: Hadir 5 hari, Sakit 1 hari',
      'Minggu 12: Hadir 6 hari, Alfa 0 hari',
    ];

    // Daftar Tugas - 12 item dummy data
    daftarTugas = [
      'Tugas Matematika: Bab 5 - Deadline 15 Mei',
      'Tugas Bahasa Indonesia: Mengarang - Deadline 16 Mei',
      'Tugas IPA: Laporan Praktikum - Deadline 17 Mei',
      'Tugas TIK: Program Sederhana - Deadline 18 Mei',
      'Tugas Bahasa Inggris: Essay - Deadline 19 Mei',
      'Tugas IPS: Makalah - Deadline 20 Mei',
      'Tugas Seni: Karya Seni - Deadline 22 Mei',
      'Tugas Jasmani: Laporan Olahraga - Deadline 23 Mei',
      'Tugas Agama: Hafalan Surah - Deadline 24 Mei',
      'Tugas Kimia: Reaksi Kimia - Deadline 25 Mei',
      'Tugas Fisika: Percobaan - Deadline 26 Mei',
      'Tugas Bahasa Daerah: Dialog - Deadline 27 Mei',
    ];

    // Daftar Pengumuman - 12 item dummy data
    daftarPengumuman = [
      'Pengumuman: Libur Nasional 17-21 Agustus',
      'Pengumuman: Ujian Akhir Semester dimulai 1 Juni',
      'Pengumuman: Perbaikan Gedung Sekolah dimulai',
      'Pengumuman: Hari Ulang Tahun Sekolah 25 Mei',
      'Pengumuman: Kegiatan Pramuka Sabtu 11 Mei',
      'Pengumuman: OSIS Meeting Hari Selasa Pukul 15:00',
      'Pengumuman: Perpanjangan Asuransi Siswa sampai 30 Juni',
      'Pengumuman: Workshop Digital Literacy 12 Mei',
      'Pengumuman: Vaksinasi Siswa Kelas XII - 8 Mei',
      'Pengumuman: Rapat Orang Tua Siswa 15 Mei',
      'Pengumuman: Pameran Karya Siswa 20 Mei',
      'Pengumuman: Pembayaran SPP Terakhir 31 Mei',
    ];
  }

  /// ============================================================
  /// _HANDLE_LOGOUT - Fungsi untuk menangani logout user
  /// ============================================================
  /// Menampilkan dialog konfirmasi sebelum logout
  /// Jika user mengkonfirmasi, kembali ke halaman login
  /// ============================================================
  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigasi ke login menggunakan pushAndRemoveUntil untuk membersihkan stack
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/login', (route) => false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logout berhasil.'),
                  backgroundColor: AppColors.success,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  /// ============================================================
  /// _SHOW_MENU_DETAIL - Fungsi untuk menampilkan detail menu
  /// ============================================================
  /// Menampilkan bottom sheet dengan ListView.builder
  /// Berisi 12 item data sesuai menu yang dipilih
  /// ============================================================
  void _showMenuDetail(BuildContext context, MenuAkademik menu) {
    // Pilih data berdasarkan menu yang diklik
    List<String> dataList = [];

    switch (menu.judul) {
      case 'Nilai':
        dataList = daftarNilai;
        break;
      case 'Jadwal Pelajaran':
        dataList = daftarJadwal;
        break;
      case 'Presensi':
        dataList = daftarPresensi;
        break;
      case 'Tugas':
        dataList = daftarTugas;
        break;
      case 'Pengumuman':
        dataList = daftarPengumuman;
        break;
    }

    // Tampilkan bottom sheet modal
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.large),
            topRight: Radius.circular(AppRadius.large),
          ),
        ),
        child: Column(
          children: [
            // ============================================================
            // BOTTOM SHEET HEADER - Header dengan warna sesuai menu
            // ============================================================
            Container(
              padding: const EdgeInsets.all(AppSpacing.medium),
              decoration: BoxDecoration(
                color: menu.color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.large),
                  topRight: Radius.circular(AppRadius.large),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(menu.icon, color: Colors.white, size: 28),
                      const SizedBox(width: AppSpacing.medium),
                      Text(
                        menu.judul,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // ============================================================
            // BOTTOM SHEET CONTENT - ListView.builder untuk menampilkan data
            // ============================================================
            // Menggunakan ListView.builder untuk efisiensi (lazy loading)
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) => ListTile(
                  // Circular avatar dengan icon menu
                  leading: CircleAvatar(
                    backgroundColor: menu.color.withAlpha((0.2 * 255).round()),
                    child: Icon(menu.icon, color: menu.color),
                  ),
                  // Title berisi data dari list
                  title: Text(dataList[index]),
                  // Subtitle berisi nomor urut item
                  subtitle: Text('Item ${index + 1}'),
                  // Icon arrow untuk menunjukkan item dapat diklik
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  // Action saat item diklik
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${dataList[index]} dipilih'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ============================================================
      // APPBAR - Header aplikasi dengan tombol logout
      // ============================================================
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          AppStrings.dashboardTitle,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // Tombol logout di AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _handleLogout,
            tooltip: AppStrings.logout,
          ),
        ],
      ),

      // ============================================================
      // BODY - Konten utama dashboard
      // ============================================================
      body: Container(
        // Gradient background
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================================================
              // WELCOME CARD - Card selamat datang dengan data user
              // ============================================================
              // Card ini menampilkan nama, NISN, dan kelas user
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.large),
                ),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.primary, AppColors.primaryDark],
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.large),
                  ),
                  padding: const EdgeInsets.all(AppSpacing.large),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text selamat datang
                                const Text(
                                  AppStrings.welcomeMessage,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.small),

                                // Nama user yang login (dari input di halaman login)
                                Text(
                                  widget.user.nama,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.small),

                                // NISN (nomor induk siswa nasional)
                                Text(
                                  'NISN: ${widget.user.nisn}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.small),

                                // Kelas siswa
                                Text(
                                  'Kelas: ${widget.user.kelas}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Icon sekolah
                          Container(
                            padding: const EdgeInsets.all(AppSpacing.medium),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(
                                (0.2 * 255).round(),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.school,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.large),

              // ============================================================
              // MENU TITLE - Judul untuk section menu akademik
              // ============================================================
              const Text(
                'Menu Akademik',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.medium),

              // ============================================================
              // MENU GRID - GridView untuk menampilkan 5 menu akademik
              // ============================================================
              // Menggunakan GridView.builder untuk efisiensi
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: AppSpacing.medium,
                  mainAxisSpacing: AppSpacing.medium,
                  childAspectRatio: 1.1,
                ),
                itemCount: menuAkademik.length,
                itemBuilder: (context, index) {
                  final menu = menuAkademik[index];
                  return GestureDetector(
                    // Action saat menu diklik
                    onTap: () => _showMenuDetail(context, menu),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.large),
                      ),
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.large),
                          // Gradient background dengan warna menu
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              menu.color.withAlpha((0.1 * 255).round()),
                              menu.color.withAlpha((0.05 * 255).round()),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(AppSpacing.medium),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon menu dengan background circular
                            Container(
                              padding: const EdgeInsets.all(AppSpacing.medium),
                              decoration: BoxDecoration(
                                color: menu.color.withAlpha(
                                  (0.2 * 255).round(),
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                menu.icon,
                                color: menu.color,
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.small),

                            // Judul menu
                            Text(
                              menu.judul,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.small),

                            // Deskripsi menu
                            Text(
                              menu.deskripsi,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.textSecondary,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.large),

              // ============================================================
              // FOOTER INFO CARD - Card informasi tentang aplikasi
              // ============================================================
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.medium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.info_outline, color: AppColors.primary),
                          SizedBox(width: AppSpacing.small),
                          Text(
                            'Informasi Aplikasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.small),
                      const Text(
                        'Klik pada setiap menu untuk melihat detail data akademik Anda. Pastikan selalu memeriksa pengumuman terbaru untuk update penting dari sekolah.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.small),
                      const Text(
                        'Versi Aplikasi: 1.0.0',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.large),
            ],
          ),
        ),
      ),
    );
  }
}
