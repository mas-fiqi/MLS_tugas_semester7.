import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/authentication/presentation/pages/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4, // Tentang, Kelas, Notifikasi, Edit
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            // 1. Background Image
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/bg_nature.jpg',
                fit: BoxFit.cover,
              ),
            ),
            
            // 2. Overlay (Deep Navy Tint)
            Container(color: kBackgroundColor.withOpacity(0.92)),

            // 3. Main Content
            Column(
              children: [
                // Header (Transparent)
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: kTextColor),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const Text(
                              "Profil Saya",
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 48), // Spacer
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Profile Avatar
                        Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kOutlineColor, width: 3),
                                boxShadow: [
                                  BoxShadow(
                                    color: kShadowColor.withOpacity(0.3),
                                    blurRadius: 15,
                                  )
                                ],
                                image: const DecorationImage(
                                  image: NetworkImage("https://i.pravatar.cc/300"), // Placeholder
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kBackgroundColor, width: 2),
                                ),
                                child: const Icon(Icons.edit, color: Colors.black, size: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Agus Mahasiswa",
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Informatika - 2021",
                          style: TextStyle(color: kSubtitleColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 10),

                // Dark Bottom Sheet
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kCardColor, // Dark Card Color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      border: Border(
                        top: BorderSide(color: kOutlineColor, width: 1.0), // Neon Top Border
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        const TabBar(
                          isScrollable: true,
                          labelColor: kPrimaryColor,
                          unselectedLabelColor: kSubtitleColor,
                          indicatorColor: kPrimaryColor,
                          indicatorWeight: 3,
                          dividerColor: Colors.transparent,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          tabs: [
                            Tab(text: "Tentang"),
                            Tab(text: "Kelas Saya"),
                            Tab(text: "Notifikasi"),
                            Tab(text: "Edit"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _buildAboutMeTab(context),
                              _buildClassTab(),
                              _buildNotificationTab(),
                              _buildEditProfileTab(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutMeTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 110),
      children: [
        _buildInfoRow(Icons.email, "Email", "agus.mahasiswa@univ.ac.id"),
        _buildInfoRow(Icons.school, "Program Studi", "Teknik Informatika"),
        _buildInfoRow(Icons.apartment, "Fakultas", "Ilmu Komputer"),
        _buildInfoRow(Icons.history, "Login Terakhir", "Baru saja"),
        
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kErrorColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text("Log Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildClassTab() {
     // Simplified List of Classes
     final classes = ["UI/UX Desain", "Pemrograman Web", "Basis Data", "Matematika Diskrit"];
     return ListView.separated(
       padding: const EdgeInsets.fromLTRB(24, 24, 24, 110),
       itemCount: classes.length,
       separatorBuilder: (c, i) => Divider(color: kOutlineColor.withOpacity(0.1)),
       itemBuilder: (context, index) {
         return ListTile(
           leading: CircleAvatar(backgroundColor: kPrimaryColor.withOpacity(0.1), child: const Icon(Icons.book, color: kPrimaryColor)),
           title: Text(classes[index], style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor)),
           subtitle: const Text("Status: Aktif", style: TextStyle(color: kSubtitleColor)),
           trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: kSubtitleColor),
         );
       },
     );
  }

  Widget _buildNotificationTab() {
    // Moved from NotificationScreen logic
    final notifications = [
      {"title": "Tugas Baru: UI/UX", "time": "2 jam lalu", "type": "TUGAS", "color": kPrimaryColor},
      {"title": "Jadwal Ujian", "time": "5 jam lalu", "type": "INFO", "color": Colors.orangeAccent},
      {"title": "Nilai Kuis", "time": "1 hari lalu", "type": "NILAI", "color": Colors.greenAccent},
    ];

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 110),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: kShadowColor.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: kOutlineColor.withOpacity(0.1)),
          ),
          child: Row(
            children: [
               Container(
                 padding: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   color: (item['color'] as Color).withOpacity(0.1),
                   shape: BoxShape.circle,
                 ),
                 child: Icon(Icons.notifications, color: item['color'] as Color, size: 20),
               ),
               const SizedBox(width: 16),
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(item['type'] as String, style: TextStyle(color: item['color'] as Color, fontSize: 10, fontWeight: FontWeight.bold)),
                         Text(item['time'] as String, style: const TextStyle(color: kSubtitleColor, fontSize: 10)),
                       ],
                     ),
                     const SizedBox(height: 4),
                     Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kTextColor)),
                   ],
                 ),
               )
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditProfileTab() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 110),
      children: [
        _buildTextField("Nama Depan", "Agus"),
        const SizedBox(height: 16),
        _buildTextField("Nama Belakang", "Mahasiswa"),
        const SizedBox(height: 16),
        _buildTextField("Program Studi", "Informatika"),
        const SizedBox(height: 32),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            foregroundColor: Colors.black, // Dark text on active button
          ),
          onPressed: () {},
          child: const Text("Simpan Perubahan", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String initial) {
    return TextFormField(
      initialValue: initial,
      style: const TextStyle(color: kTextColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: kSubtitleColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kOutlineColor)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kOutlineColor.withOpacity(0.3))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: kPrimaryColor)),
        filled: true,
        fillColor: kBackgroundColor,
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: kPrimaryColor, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: kSubtitleColor, fontSize: 12)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kTextColor)),
            ],
          ),
        ],
      ),
    );
  }
}
