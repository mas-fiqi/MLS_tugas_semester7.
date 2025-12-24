import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/quiz/presentation/pages/quiz_info_screen.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/task_detail_screen.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/video_player_screen.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/document_viewer_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  final String courseName;
  final String lecturerCode;

  const CourseDetailScreen({
    super.key,
    required this.courseName,
    required this.lecturerCode,
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _selectedTab = 0; // 0: Materi, 1: Tugas & Kuis

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          widget.courseName,
          style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded, color: kTextColor),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: kOutlineColor.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: Column(
        children: [
          // 1. Custom Segmented Control (Tab Switcher)
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: kOutlineColor.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildTabItem(0, "Materi"),
                _buildTabItem(1, "Tugas & Kuis"),
              ],
            ),
          ),

          // 2. Content List
          Expanded(
            child: _selectedTab == 0 ? _buildMaterialList() : _buildAssignmentList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    bool isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : kSubtitleColor, // Black text on Neon
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialList() {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85, 
      ),
      itemCount: 16,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kOutlineColor.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: kShadowColor.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                 _showMaterialOptions(context, index);
              },
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(16), // Padding inside card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(Icons.more_vert_rounded, color: kSubtitleColor, size: 20),
                      ],
                    ),
                    const Spacer(),
                    
                    // Text Info
                    Text(
                      "Pertemuan ${index + 1}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Topik pembahasan pertemuan ${index + 1}",
                      style: const TextStyle(color: kSubtitleColor, fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showMaterialOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border.all(color: kOutlineColor.withOpacity(0.1)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: kOutlineColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Materi Pertemuan ${index + 1}",
              style: const TextStyle(
                color: kTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
             _buildSubItem(
              icon: Icons.picture_as_pdf_rounded,
              color: Colors.redAccent,
              title: "Slide Presentasi",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DocumentViewerScreen()));
              },
            ),
            const SizedBox(height: 12),
            _buildSubItem(
              icon: Icons.play_circle_fill_rounded,
              color: Colors.blueAccent,
              title: "Rekaman Kelas",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoPlayerScreen()));
              },
            ),
             const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSubItem({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kOutlineColor.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: kTextColor,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, color: kSubtitleColor, size: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentList() {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: 4, // Fixed count based on previous static list
      itemBuilder: (context, index) {
        // Reconstructing static data for grid
        final List<Map<String, dynamic>> assignments = [
           {
            "icon": Icons.assignment_rounded,
            "color": Colors.blue,
            "title": "Tugas 1",
            "subtitle": "Studi Kasus UI",
            "trailing": _buildStatusChip("Selesai", Colors.green),
            "route": const TaskDetailScreen(),
           },
           {
            "icon": Icons.quiz_rounded,
            "color": Colors.orange,
            "title": "Kuis 1",
            "subtitle": "Konsep Dasar",
            "trailing": _buildStatusChip("Selesai", Colors.green),
            "route": const QuizInfoScreen(),
           },
           {
            "icon": Icons.assignment_rounded,
            "color": Colors.purple,
            "title": "Tugas 2",
            "subtitle": "Wireframing",
            "trailing": _buildStatusChip("Besok", Colors.orange),
            "route": const TaskDetailScreen(),
           },
           {
            "icon": Icons.assignment_late_rounded,
            "color": Colors.redAccent,
            "title": "UTS",
            "subtitle": "Proyek Kasir",
            "trailing": _buildStatusChip("2 Min", kPrimaryColor),
            "route": const TaskDetailScreen(),
           },
        ];

        final item = assignments[index];
        return _buildCardGridItem(
          icon: item['icon'],
          iconBgColor: item['color'],
          title: item['title'],
          subtitle: item['subtitle'],
          trailing: item['trailing'],
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => item['route'])),
        );
      },
    );
  }

  Widget _buildCardGridItem({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kOutlineColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: iconBgColor.withOpacity(0.1),
                      child: Icon(icon, color: iconBgColor, size: 20),
                    ),
                    trailing,
                  ],
                ),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: kTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: kSubtitleColor,
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
