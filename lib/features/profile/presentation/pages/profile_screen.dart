import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/authentication/presentation/pages/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            // 1. Red Background Header (Top 35%)
            Container(
              height: size.height * 0.35,
              width: double.infinity,
              color: kPrimaryColor,
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        "Profil Saya",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 48), // Spacer to center title
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Profile Picture
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Agus Mahasiswa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Informatika - 2021",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            // 2. Overlapping White Card (Body)
            Container(
              margin: EdgeInsets.only(top: size.height * 0.30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Tabs
                  const TabBar(
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: kPrimaryColor,
                    indicatorWeight: 3,
                    tabs: [
                      Tab(text: "About Me"),
                      Tab(text: "Kelas"),
                      Tab(text: "Edit Profile"),
                    ],
                  ),
                  
                  // Content
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Tab 1: About Me
                        _buildAboutMeTab(context),
                        
                        // Tab 2: Kelas (Reuse logic or placeholder)
                        const Center(child: Text("Daftar Kelas (Lihat Menu Kelas Saya)")),
                        
                        // Tab 3: Edit Profile
                        _buildEditProfileTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutMeTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildInfoRow("Email Address", "agus.mahasiswa@univ.ac.id"),
          _buildInfoRow("Program Studi", "Teknik Informatika"),
          _buildInfoRow("Fakultas", "Ilmu Komputer"),
          _buildInfoRow("Aktivitas Login", "Baru saja"),
          
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Logout Logic -> Back to Login
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text("Log Out"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfileTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const TextField(decoration: InputDecoration(labelText: "Nama Depan")),
        const SizedBox(height: 16),
        const TextField(decoration: InputDecoration(labelText: "Nama Belakang")),
        const SizedBox(height: 16),
        const TextField(decoration: InputDecoration(labelText: "Bio Singkat")),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Simpan Perubahan"),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
