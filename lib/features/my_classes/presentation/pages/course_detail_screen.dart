import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/quiz/presentation/pages/quiz_info_screen.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/task_detail_screen.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/video_player_screen.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/document_viewer_screen.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/video_player_screen.dart';

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
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DocumentViewerScreen()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.video_library, color: Colors.blue),
                        title: const Text("Rekaman Kelas"),
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VideoPlayerScreen()),
                          );
                        },
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
                _buildTaskItem(context, "Tugas 1: Studi Kasus", "Selesai", true),
                _buildTaskItem(context, "Kuis 1: Konsep Dasar", "Selesai", true),
                _buildTaskItem(context, "Tugas 2: Analisis", "Tenggat: Besok", false),
                _buildTaskItem(context, "UTS", "Tenggat: 2 Minggu lagi", false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, String title, String status, bool isDone) {
    bool isQuiz = title.toLowerCase().contains('kuis');
    // Determine visuals based on type
    IconData icon = isQuiz ? Icons.quiz_rounded : Icons.assignment_rounded;
    Color iconColor = isQuiz ? Colors.orange : kPrimaryColor;
    Color iconBgColor = isQuiz ? Colors.orange.withOpacity(0.1) : kPrimaryColor.withOpacity(0.1);

    // Status styling
    Color statusColor;
    IconData statusIcon;
    if (isDone) {
      statusColor = Colors.green;
      statusIcon = Icons.check_circle_rounded;
    } else if (status.contains("Besok") || status.contains("Minggu") || status.contains("Tenggat")) {
      statusColor = Colors.orange[700]!;
      statusIcon = Icons.access_time_rounded;
    } else {
      statusColor = Colors.grey;
      statusIcon = Icons.circle_outlined;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: kSurfaceColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (isQuiz) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizInfoScreen()),
              );
            } else if (title.toLowerCase().contains("tugas")) {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TaskDetailScreen()),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon Box
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 16),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(statusIcon, size: 14, color: statusColor),
                          const SizedBox(width: 4),
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 12,
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Chevron or Action Button
                if (!isDone)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: const Text(
                      "Kerjakan",
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  )
                else
                  const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
