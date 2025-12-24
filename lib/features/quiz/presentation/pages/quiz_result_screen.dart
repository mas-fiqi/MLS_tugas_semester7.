import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/quiz/presentation/pages/quiz_review_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Hasil Kuis", style: TextStyle(color: kTextColor)),
        backgroundColor: kBackgroundColor,
        foregroundColor: kTextColor,
        elevation: 0,
        automaticallyImplyLeading: false, 
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: kOutlineColor.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Score Header
            const Text(
              "Nilai Akhir Anda Untuk Kuis Ini Adalah",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "85.0 / 100.00",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                shadows: [
                  Shadow(color: kPrimaryColor.withOpacity(0.5), blurRadius: 10),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // Summary Table
            Container(
              decoration: BoxDecoration(
                color: kCardColor,
                border: Border.all(color: kOutlineColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                children: [
                  _buildSummaryRow("Status", "Selesai", isBold: true),
                  Divider(height: 1, color: kOutlineColor.withOpacity(0.1)),
                   _buildSummaryRow("Waktu", "Kamis, 24 Des 2025, 10:30"),
                  Divider(height: 1, color: kOutlineColor.withOpacity(0.1)),
                  _buildSummaryRow("Nilai", "85,0 / 100,0"),
                  Divider(height: 1, color: kOutlineColor.withOpacity(0.1)),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Review", style: TextStyle(fontWeight: FontWeight.w600, color: kSubtitleColor)),
                        GestureDetector(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const QuizReviewScreen()),
                            );
                          },
                          child: Text(
                            "Tinjau Kembali",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: kPrimaryColor,
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
                   Navigator.pop(context); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor.withOpacity(0.1),
                  foregroundColor: kPrimaryColor,
                  elevation: 0,
                  side: BorderSide(color: kPrimaryColor),
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
                  Navigator.pop(context); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kCardColor,
                  foregroundColor: kTextColor,
                  elevation: 0,
                  side: BorderSide(color: kOutlineColor.withOpacity(0.5)),
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
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: kSubtitleColor)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: kTextColor)),
        ],
      ),
    );
  }
}
