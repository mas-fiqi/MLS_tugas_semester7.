import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/home/presentation/widgets/course_card.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/course_detail_screen.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  final List<Map<String, dynamic>> _courses = const [
    {"name": "UI/UX Design", "code": "DSN-001", "progress": 0.75, "color": Colors.purple},
    {"name": "Sistem Operasi", "code": "TIF-002", "progress": 0.45, "color": Colors.blue},
    {"name": "Kewarganegaraan", "code": "UMU-003", "progress": 1.0, "color": Colors.red},
    {"name": "Multimedia", "code": "TIF-004", "progress": 0.20, "color": Colors.orange},
    {"name": "Bahasa Inggris", "code": "UMU-005", "progress": 0.85, "color": Colors.green},
    {"name": "Olah Raga", "code": "UMU-006", "progress": 0.10, "color": Colors.teal},
    {"name": "Pemrograman Web", "code": "TIF-007", "progress": 0.60, "color": Colors.indigo},
    {"name": "Basis Data", "code": "TIF-008", "progress": 0.50, "color": Colors.brown},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelas Saya"),
        automaticallyImplyLeading: false, // Don't show back button on main tabs
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      backgroundColor: kSurfaceColor,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _courses.length,
        itemBuilder: (context, index) {
          final course = _courses[index];
          return CourseCard(
            courseName: course['name'],
            lecturerCode: course['code'],
            progress: course['progress'],
            iconColor: course['color'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    courseName: course['name'],
                    lecturerCode: course['code'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
