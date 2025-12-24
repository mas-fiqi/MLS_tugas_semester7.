import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/upload_file_screen.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        title: const Text("Tugas 01 - UID Android", style: TextStyle(color: kTextColor)),
        backgroundColor: Colors.transparent,
        foregroundColor: kTextColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 1. Background Image
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bg_nature.jpg',
              fit: BoxFit.cover,
            ),
          ),
          
          // 2. Dark Overlay
          Container(
            color: kBackgroundColor.withOpacity(0.92),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
          ),

          // 3. Content in Floating Bottom Sheet
          Column(
            children: [
              SizedBox(height: kToolbarHeight + 40), // Spacer for AppBar
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor, // Dark Theme
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, -5))],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Instructions Title
                        Row(
                          children: [
                            const Icon(Icons.description_outlined, color: kPrimaryColor),
                            const SizedBox(width: 10),
                            const Text(
                              "Instruksi Tugas",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Kerjakan tugas berikut dengan seksama. Buatlah analisis mengenai desain antarmuka pengguna pada aplikasi mobile yang Anda pilih. Jelaskan kelebihan dan kekurangan dari sisi UX. \n\nFormat pengumpulan: PDF.\nMaksimal ukuran file: 5 MB.\n\nJangan lupa sertakan screenshot aplikasi yang dianalisis.",
                          style: TextStyle(fontSize: 14, height: 1.6, color: kSubtitleColor),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 32),

                        // Status Section
                        Container(
                          decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: kOutlineColor.withOpacity(0.2)),
                          ),
                          child: Column(
                            children: [
                              // Header
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.1),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  "Status Tugas",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              // Table Content
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    _buildStatusRow("Status Pengumpulan", "Belum mengumpulkan", isHighlighted: true),
                                    const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(color: kOutlineColor)),
                                    _buildStatusRow("Status Nilai", "Belum dinilai"),
                                    const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(color: kOutlineColor)),
                                    _buildStatusRow("Batas Waktu", "Senin, 25 Des 2025, 23:59 WIB"),
                                    const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(color: kOutlineColor)),
                                    _buildStatusRow("Sisa Waktu", "2 Hari 5 Jam", isTime: true),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Action Button (Refined)
                        SizedBox(
                          width: double.infinity,
                          height: 48, // Reduced from 56
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const UploadFileScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: const Text(
                              "Tambahkan Tugas",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, {bool isHighlighted = false, bool isTime = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, color: kSubtitleColor, fontSize: 13),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
              color: isHighlighted
                  ? (value.contains("Belum") ? kErrorColor : Colors.green)
                  : (isTime ? kPrimaryColor : kTextColor),
            ),
          ),
        ),
      ],
    );
  }
}
