import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Detail Tugas",
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded, color: kTextColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Desain UI/UX",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                         decoration: BoxDecoration(
                           color: Colors.orange.withOpacity(0.1),
                           borderRadius: BorderRadius.circular(8),
                         ),
                         child: const Row(
                           children: [
                             Icon(Icons.access_time_filled_rounded, color: Colors.orange, size: 14),
                             SizedBox(width: 4),
                             Text(
                               "Tenggat: Besok",
                               style: TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                       ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Tugas 01 - Wireframing & Prototyping",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Buatlah Lo-Fi Wireframe untuk aplikasi e-commerce minimal 5 halaman, lalu lanjutkan ke Hi-Fi Prototype menggunakan Figma.",
                    style: TextStyle(
                      color: kSubtitleColor,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: kOutlineColor),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, size: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Dosen Pengampu",
                            style: TextStyle(fontSize: 10, color: kSubtitleColor),
                          ),
                          Text(
                            "Bpk. Ahmad Fauzi, M.Kom",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // 2. Submission Section
            const Text(
              "Status Pengumpulan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: kOutlineColor),
              ),
              child: Column(
                children: [
                  _buildStatusRow("Status Pengumpulan", "Belum Dikumpulkan", Colors.red),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
                  _buildStatusRow("Status Penilaian", "Belum Dinilai", Colors.grey),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
                  _buildStatusRow("Waktu Tersisa", "1 Hari 5 Jam", kPrimaryColor),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // 3. Action Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  shadowColor: kPrimaryColor.withOpacity(0.4),
                ),
                child: const Text(
                  "Tambahkan Pengumpulan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: kSubtitleColor, fontSize: 13),
        ),
        Text(
          value,
          style: TextStyle(color: valueColor, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }
}
