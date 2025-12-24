import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Review Jawaban", style: TextStyle(color: kTextColor)),
        backgroundColor: kBackgroundColor,
        foregroundColor: kTextColor,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: kOutlineColor.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: Column(
        children: [
          // Header Info
          Container(
            padding: const EdgeInsets.all(16),
            color: kCardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeaderInfo("Di Mulai Pada", "24/12/2025 10:00"),
                _buildHeaderInfo("Status", "Selesai"),
                _buildHeaderInfo("Nilai", "85 / 100"),
              ],
            ),
          ),
          
          // Question List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 15, // Dummy 15 questions
              separatorBuilder: (context, index) => Divider(color: kOutlineColor.withOpacity(0.1)),
              itemBuilder: (context, index) {
                return _buildReviewItem(context, index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: kSubtitleColor)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: kTextColor)),
      ],
    );
  }

  Widget _buildReviewItem(BuildContext context, int number) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Number
          SizedBox(
            width: 80,
            child: Text(
              "Pertanyaan $number",
              style: const TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
          ),
          
          // Question Preview Box
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kOutlineColor.withOpacity(0.2)),
                  ),
                  child: const Text(
                    "Apa yang dimaksud dengan Usability dalam konteks User Interface Design? ...",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: kSubtitleColor),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Jawaban Tersimpan",
                  style: TextStyle(fontSize: 11, color: kSubtitleColor.withOpacity(0.5), fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          
          // Action Link
          GestureDetector(
            onTap: () {
               // Navigation to detail (can be added later or reuse logic)
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text("Melihat detail soal no $number")),
               );
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Lihat Soal",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
