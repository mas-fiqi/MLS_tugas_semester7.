import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/home/presentation/widgets/course_card.dart';
import 'package:learning_management_system/features/profile/presentation/pages/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSurfaceColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hallo, Mahasiswa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                      ),
                      Text(
                        "Selamat datang kembali!",
                        style: TextStyle(
                          fontSize: 14,
                          color: kTextLightColor,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 2. Kartu Tugas (Red Card)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tugas Prioritas",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Desain Antarmuka Pengguna",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Lebih besar
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Tugas 01 - Wireframing",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Waktu Pengumpulan: Besok, 23:59",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 3. Pengumuman
              const Text(
                "Pengumuman Terakhir",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                  // image: DecorationImage(image: AssetImage('assets/images/banner.png'), fit: BoxFit.cover),
                ),
                child: const Center(
                  child: Icon(Icons.campaign, size: 40, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),

              // 4. Progres Kelas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Progres Kelas",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  Text(
                    "Lihat Semua",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // List Mata Kuliah Dummy
              const CourseCard(
                courseName: "Pemrograman Mobile",
                lecturerCode: "Dsn-001",
                progress: 0.75,
                iconColor: Colors.blue,
              ),
              const CourseCard(
                courseName: "Basis Data Lanjut",
                lecturerCode: "Dsn-002",
                progress: 0.40,
                iconColor: Colors.orange,
              ),
              const CourseCard(
                courseName: "Bahasa Inggris",
                lecturerCode: "Dsn-003",
                progress: 0.90,
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
