import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/quiz/presentation/pages/quiz_review_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hasil Kuis"),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Prevent back button to force use of provided buttons
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Score Header
            const Text(
              "Nilai Akhir Anda Untuk Kuis Ini Adalah",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "85.0 / 100.00",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 48),

            // Summary Table
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildSummaryRow("Status", "Selesai", isBold: true),
                  const Divider(height: 1),
                   _buildSummaryRow("Waktu", "Kamis, 24 Des 2025, 10:30"),
                  const Divider(height: 1),
                  _buildSummaryRow("Nilai", "85,0 / 100,0"),
                  const Divider(height: 1),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Review", style: TextStyle(fontWeight: FontWeight.w600)),
                        GestureDetector(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const QuizReviewScreen()),
                            );
                          },
                          child: const Text(
                            "Tinjau Kembali",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // Navigation Buttons
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.pop(context); // Or navigate to QuizScreen again
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Ambil Kuis Lagi"),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to course/previous screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Kembali Ke Kelas"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
