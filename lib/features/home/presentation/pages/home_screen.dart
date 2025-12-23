import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/home/presentation/widgets/course_card.dart';
import 'package:learning_management_system/features/profile/presentation/pages/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _announcementController;
  int _currentAnnouncement = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> _announcements = [
    {
      "title": "Jadwal UAS Semester Genap",
      "subtitle": "Cek jadwal ujian anda sekarang...",
      "label": "PENTING",
      "labelColor": Colors.orange,
      "icon": Icons.campaign_rounded,
    },
    {
      "title": "Libur Semester Telah Tiba",
      "subtitle": "Persiapkan liburanmu dengan baik!",
      "label": "INFO",
      "labelColor": Colors.blue,
      "icon": Icons.beach_access_rounded,
    },
    {
      "title": "Workshop UI/UX Design",
      "subtitle": "Ikuti workshop gratis minggu depan.",
      "label": "EVENT",
      "labelColor": Colors.green,
      "icon": Icons.brush_rounded,
    },
  ];

  @override
  void initState() {
    super.initState();
    _announcementController = PageController(initialPage: 0);
    
    // Auto-slide every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentAnnouncement < _announcements.length - 1) {
        _currentAnnouncement++;
      } else {
        _currentAnnouncement = 0;
      }

      if (_announcementController.hasClients) {
        _announcementController.animateToPage(
          _currentAnnouncement,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _announcementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header (Greeting + Avatar)
            Container(
              padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 30),
              decoration: const BoxDecoration(
                gradient: kPrimaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hallo, Mahasiswa",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Selamat datang kembali!",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Pengumuman (Auto-Sliding Banner)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pengumuman Terakhir",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          _announcements.length,
                          (index) => Container(
                            margin: const EdgeInsets.only(left: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentAnnouncement == index
                                  ? kAccentColor
                                  : kSubtitleColor.withValues(alpha: 0.3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Auto-Sliding PageView
                  SizedBox(
                    height: 140,
                    child: PageView.builder(
                      controller: _announcementController,
                      itemCount: _announcements.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentAnnouncement = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = _announcements[index];
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 4), // Tiny gap if any
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: kOutlineColor),
                            boxShadow: const [
                              BoxShadow(
                                color: kShadowColor,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                 flex: 4,
                                 child: Padding(
                                   padding: const EdgeInsets.all(20),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Container(
                                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                         decoration: BoxDecoration(
                                           color: (item["labelColor"] as Color).withValues(alpha: 0.1),
                                           borderRadius: BorderRadius.circular(8),
                                         ),
                                         child: Text(
                                           item["label"],
                                           style: TextStyle(
                                             color: item["labelColor"],
                                             fontSize: 10, 
                                             fontWeight: FontWeight.bold
                                           ),
                                         ),
                                       ),
                                       const SizedBox(height: 8),
                                       Text(
                                         item["title"],
                                         style: const TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 16,
                                           color: kTextColor,
                                         ),
                                         maxLines: 2,
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                       const SizedBox(height: 4),
                                       Text(
                                         item["subtitle"],
                                         style: const TextStyle(color: kSubtitleColor, fontSize: 12),
                                       ),
                                     ],
                                   ),
                                 ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: kBackgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(item["icon"], size: 48, color: kPrimaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 3. Kartu Tugas (Priority Task)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Reduced padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20), // Slightly smaller radius
                      border: Border.all(color: kOutlineColor),
                      boxShadow: const [
                        BoxShadow(
                          color: kShadowColor,
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), // Compact badge
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Tugas Prioritas",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 10, // Smaller badge text
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 18), // Smaller Icon
                          ],
                        ),
                        const SizedBox(height: 12), // Reduced spacing
                        const Text(
                          "Desain Antarmuka Pengguna",
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 16, // Reduced from 20 -> 16
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2), // Reduced spacing
                        const Text(
                          "Tugas 01 - Wireframing & Prototyping",
                          style: TextStyle(
                            color: kSubtitleColor,
                            fontSize: 12, // Reduced from 14 -> 12
                          ),
                        ),
                        const SizedBox(height: 16), // Reduced spacing
                        Row(
                          children: [
                            const Icon(Icons.access_time_rounded, color: kSubtitleColor, size: 14),
                            const SizedBox(width: 6),
                            const Text(
                              "Tenggat: Besok, 23:59",
                              style: TextStyle(
                                color: kSubtitleColor,
                                fontSize: 11, // Smaller deadline text
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Compact button
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Detail",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11, // Smaller button text
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // 4. Progres Kelas (Horizontal Carousel)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0), // Remove extra padding for carousel full width
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Progres Kelas",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          "Lihat Semua",
                          style: TextStyle(
                            color: kAccentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Carousel Section
                  SizedBox(
                    height: 220, 
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.85),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final List<Map<String, dynamic>> courses = [
                          {
                            "name": "Pemrograman Mobile",
                            "code": "Dsn-001",
                            "progress": 0.75,
                            "color": Colors.blue
                          },
                          {
                            "name": "Basis Data Lanjut",
                            "code": "Dsn-002",
                            "progress": 0.40,
                            "color": Colors.orange
                          },
                          {
                            "name": "Bahasa Inggris",
                            "code": "Dsn-003",
                            "progress": 0.90,
                            "color": Colors.green
                          },
                          {
                            "name": "Jaringan Komputer",
                            "code": "Dsn-004",
                            "progress": 0.20,
                             "color": Colors.purple
                          },
                        ];

                        final course = courses[index];

                        return Padding(
                             padding: const EdgeInsets.only(right: 16.0),
                             child: CourseCard(
                                courseName: course["name"],
                                lecturerCode: course["code"],
                                progress: course["progress"],
                                iconColor: course["color"],
                              ),
                           );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
