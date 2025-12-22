import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/quiz/presentation/pages/quiz_screen.dart';

class QuizInfoScreen extends StatelessWidget {
  const QuizInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Review 1"),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Silahkan kerjakan kuis ini dengan jujur dan teliti. Pastikan koneksi internet stabil.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            
            // Info Container
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  InfoRow(label: "Batas Waktu", value: "15 Menit"),
                  SizedBox(height: 8),
                  InfoRow(label: "Jumlah Soal", value: "15 Soal"),
                  SizedBox(height: 8),
                  InfoRow(label: "Metode Penilaian", value: "Nilai Tertinggi"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // History Table (Optional Placeholder)
            const Text(
              "Riwayat Percobaan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.grey[300]!),
              children: const [
                TableRow(
                  decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                  children: [
                    Padding(padding: EdgeInsets.all(8.0), child: Text("No", style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8.0), child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8.0), child: Text("Nilai", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(8.0), child: Text("-")),
                    Padding(padding: EdgeInsets.all(8.0), child: Text("Belum ada percobaan")),
                    Padding(padding: EdgeInsets.all(8.0), child: Text("-")),
                  ],
                ),
              ],
            ),
            
            const Spacer(),
            
            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                },
                child: const Text("Ambil Kuis Sekarang"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: kPrimaryColor),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Kembali ke Kelas", style: TextStyle(color: kPrimaryColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  
  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
