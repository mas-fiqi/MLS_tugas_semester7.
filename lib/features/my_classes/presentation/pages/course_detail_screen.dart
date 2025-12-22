import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseName;
  final String lecturerCode;

  const CourseDetailScreen({
    super.key,
    required this.courseName,
    required this.lecturerCode,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(courseName),
          backgroundColor: kPrimaryColor,
          bottom: const TabBar(
            indicatorColor: kAccentColor,
            indicatorWeight: 4,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "Materi"),
              Tab(text: "Tugas & Kuis"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Materi
            ListView.builder(
              itemCount: 16,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      "Pertemuan ${index + 1}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Topik pembahasan pertemuan ${index + 1}"),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                        title: const Text("Slide Presentasi"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.video_library, color: Colors.blue),
                        title: const Text("Rekaman Kelas"),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
            
            // Tab 2: Tugas & Kuis
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildTaskItem("Tugas 1: Studi Kasus", "Selesai", true),
                _buildTaskItem("Kuis 1: Konsep Dasar", "Selesai", true),
                _buildTaskItem("Tugas 2: Analisis", "Tenggat: Besok", false),
                _buildTaskItem("UTS", "Tenggat: 2 Minggu lagi", false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(String title, String status, bool isDone) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          isDone ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isDone ? kAccentColor : Colors.grey,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          status,
          style: TextStyle(
            color: isDone ? kAccentColor : Colors.orange,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
