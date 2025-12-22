import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/upload_file_screen.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas 01 - UID Android"),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instructions
            const Text(
              "Instruksi Tugas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Kerjakan tugas berikut dengan seksama. Buatlah analisis mengenai desain antarmuka pengguna pada aplikasi mobile yang Anda pilih. Jelaskan kelebihan dan kekurangan dari sisi UX. \n\nFormat pengumpulan: PDF.\nMaksimal ukuran file: 5 MB.\n\nJangan lupa sertakan screenshot aplikasi yang dianalisis.",
              style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),

            // Status Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Status Tugas",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  // Table Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildStatusRow("Status Pengumpulan", "Belum mengumpulkan", isHighlighted: true),
                        const Divider(),
                        _buildStatusRow("Status Nilai", "Belum dinilai"),
                        const Divider(),
                        _buildStatusRow("Batas Waktu", "Senin, 25 Des 2025, 23:59 WIB"),
                        const Divider(),
                        _buildStatusRow("Sisa Waktu", "2 Hari 5 Jam", isTime: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Action Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UploadFileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "Tambahkan Tugas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, {bool isHighlighted = false, bool isTime = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                color: isHighlighted
                    ? (value.contains("Belum") ? Colors.red : Colors.green)
                    : (isTime ? Colors.green[700] : Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
