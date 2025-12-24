import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/course_detail_screen.dart';

class MyClassesScreen extends StatefulWidget {
  const MyClassesScreen({super.key});

  @override
  State<MyClassesScreen> createState() => _MyClassesScreenState();
}

class _MyClassesScreenState extends State<MyClassesScreen> {
  // Data for "Sering Dikunjungi" (Top Horizontal)
  final List<Map<String, dynamic>> _frequentClasses = const [
    {"name": "UI/UX", "code": "DSN-001", "color": Colors.purple, "icon": Icons.design_services},
    {"name": "OS", "code": "TIF-002", "color": Colors.blue, "icon": Icons.computer},
    {"name": "Inggris", "code": "UMU-005", "color": kPrimaryColor, "icon": Icons.language},
    {"name": "Web", "code": "TIF-007", "color": Colors.indigo, "icon": Icons.code},
    {"name": "Data", "code": "TIF-008", "color": Colors.brown, "icon": Icons.storage},
  ];

  // Data for "Semua Kelas" (Bottom Vertical)
  final List<Map<String, dynamic>> _allClasses = const [
    {"name": "UI/UX Design", "code": "DSN-001", "progress": 0.75, "color": Colors.purple, "icon": Icons.design_services},
    {"name": "Sistem Operasi", "code": "TIF-002", "progress": 0.45, "color": Colors.blue, "icon": Icons.computer},
    {"name": "Kewarganegaraan", "code": "UMU-003", "progress": 1.0, "color": Colors.red, "icon": Icons.flag},
    {"name": "Multimedia", "code": "TIF-004", "progress": 0.20, "color": Colors.orange, "icon": Icons.movie},
    {"name": "Bahasa Inggris", "code": "UMU-005", "progress": 0.85, "color": kPrimaryColor, "icon": Icons.language},
    {"name": "Olah Raga", "code": "UMU-006", "progress": 0.10, "color": Colors.teal, "icon": Icons.sports_soccer},
    {"name": "Pemrograman Web", "code": "TIF-007", "progress": 0.60, "color": Colors.indigo, "icon": Icons.code},
    {"name": "Basis Data", "code": "TIF-008", "progress": 0.50, "color": Colors.brown, "icon": Icons.storage},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
           // 1. Nature Background
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bg_nature.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // 2. Dark Overlay
          Container(
            color: kBackgroundColor.withOpacity(0.75),
          ),

          // 3. Content
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Search Bar (Adjusted Size)
                      Container(
                        height: 55, // Increased from 45
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                      color: kCardColor,
                      borderRadius: BorderRadius.circular(16), // Slightly rounder
                      border: Border.all(color: kOutlineColor.withOpacity(0.3)), 
                      boxShadow: [
                        BoxShadow(
                          color: kShadowColor.withOpacity(0.05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                        child: TextField(
                          style: const TextStyle(color: kTextColor, fontSize: 15),
                          decoration: InputDecoration(
                            hintText: "Cari Kelas...",
                            hintStyle: TextStyle(color: kSubtitleColor, fontSize: 15),
                            border: InputBorder.none,
                            icon: const Icon(Icons.search, color: kPrimaryColor, size: 24),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 12), // Adjusted padding
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // 2. Section: Sering Dikunjungi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sering Dikunjungi",
                            style: TextStyle(
                              fontSize: 17, // Slightly larger
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                          ),
                          Text(
                            "Lihat Semua",
                            style: TextStyle(
                              fontSize: 13,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Horizontal List (Enlarged)
                      SizedBox(
                        height: 100, // Increased from 80
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _frequentClasses.length,
                          itemBuilder: (context, index) {
                            final item = _frequentClasses[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 20), // More spacing
                              child: Column(
                                children: [
                                  Container(
                                    width: 60, // Increased from 48
                                    height: 60, // Increased from 48
                                    decoration: BoxDecoration(
                                      color: kCardColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: kOutlineColor),
                                      boxShadow: [
                                          BoxShadow(
                                            color: item['color'].withOpacity(0.2),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                          )
                                      ]
                                    ),
                                    child: Icon(
                                      item['icon'],
                                      color: item['color'],
                                      size: 28, // Increased from 20
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                      color: kSubtitleColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 5),

                // 3. Semua Kelas
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // Plain background, consistent with parent
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            "Semua Kelas",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2 Classes per row
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1.1, // Increased to make cards smaller/shorter
                            ),
                            itemCount: _allClasses.length,
                            itemBuilder: (context, index) {
                              final course = _allClasses[index];
                              return _buildCourseGridItem(course);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseGridItem(Map<String, dynamic> course) {
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kOutlineColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withOpacity(0.1),
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
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(course['icon'], color: course['color'], size: 24),
                    ),
                    Text(
                      "${((course['progress'] as double) * 100).toInt()}%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: course['color'],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                
                // Text Info
                Text(
                  course['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: kTextColor,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  course['code'],
                  style: const TextStyle(
                    color: kSubtitleColor,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Progress Bar
                SizedBox(
                  height: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: course['progress'],
                      backgroundColor: kBackgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(course['color']),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
