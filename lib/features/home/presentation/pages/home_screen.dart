import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/home/presentation/pages/task_detail_screen.dart';
import 'package:learning_management_system/features/profile/presentation/pages/profile_screen.dart';
import 'package:learning_management_system/features/home/presentation/pages/announcement_list_screen.dart';
import 'package:learning_management_system/core/services/language_service.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/my_classes_screen.dart';

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
      "title": "Workshop UI/UX Design",
      "subtitle": "Ikuti workshop gratis minggu depan.",
      "label": "EVENT",
      "labelColor": kPrimaryColor, // Lime
      "icon": Icons.brush_rounded,
    },
    {
      "title": "Jadwal UAS Semester Genap",
      "subtitle": "Cek jadwal ujian anda sekarang...",
      "label": "PENTING",
      "labelColor": Colors.orangeAccent,
      "icon": Icons.campaign_rounded,
    },
    {
      "title": "Libur Semester Telah Tiba",
      "subtitle": "Persiapkan liburanmu dengan baik!",
      "label": "INFO",
      "labelColor": Colors.blueAccent,
      "icon": Icons.beach_access_rounded,
    },
  ];

  @override
  void initState() {
    super.initState();
    _announcementController = PageController(initialPage: 0);
    
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_announcementController.hasClients) {
        int nextPage = _currentAnnouncement + 1;
        if (nextPage >= _announcements.length) nextPage = 0;
        _announcementController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
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
      backgroundColor: kBackgroundColor, // Pitch Black
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
          // 2. Dark Overlay (Stronger for Sporty Theme)
          Container(
            color: kBackgroundColor.withOpacity(0.75), // Further reduced opacity for clearer background
          ),

          // 3. Content
          SafeArea(
            child: Column(
              children: [
                // 1. Header Section (Compact)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LanguageService.instance.getString('welcome'),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: kSubtitleColor,
                                ),
                              ),
                              Text(
                                LanguageService.instance.getString('student'),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: kSurfaceColor,
                              child: Icon(Icons.person, color: kPrimaryColor, size: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Dashboard Title Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LanguageService.instance.getString('dashboard'),
                            style: const TextStyle(
                              fontSize: 24, // Reduced from 32
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.translate, color: Colors.white, size: 20),
                            onPressed: () {
                              _showLanguageSelector(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 2. Announcements (Compact & Dark)
                SizedBox(
                  height: 150, // Increased height to prevent overflow
                  child: PageView.builder(
                    controller: _announcementController,
                    itemCount: _announcements.length,
                    itemBuilder: (context, index) {
                      final item = _announcements[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white, // White card as per reference
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnnouncementListScreen())),
                          child: Row(
                            children: [
                              // Left: Text Content
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: item["labelColor"].withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          item["label"],
                                          style: TextStyle(
                                            color: item["labelColor"],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item["title"],
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Ikuti workshop gratis minggu depan.", // Dummy subtitle matching image
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Right: Image Section
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0), // Padding to make it "neater"
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12), // Rounded corners inside
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/bg_login.png',
                                        fit: BoxFit.cover,
                                        height: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentAnnouncement = index;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // 3. Main Content (Scrollable)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // Removed redundant background color/decoration since parent is pitch black
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPriorityTask(),
                          const SizedBox(height: 24),
                          _buildClassProgress(),
                          const SizedBox(height: 100), // Bottom padding
                        ],
                      ),
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

  Widget _buildPriorityTask() {
    return Column(
      children: [
        Row(
           children: [
             Icon(Icons.assignment_ind_rounded, color: kPrimaryColor, size: 20),
             const SizedBox(width: 8),
             Text(
               LanguageService.instance.getString('priority_task'),
               style: const TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
                 color: kTextColor,
               ),
             ),
           ],
        ),

        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16), // Compact padding
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kOutlineColor.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: kShadowColor.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
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
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kPrimaryColor.withOpacity(0.3)),
                    ),
                    child: Text(
                      "UI Design",
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                  Text(LanguageService.instance.getString('tomorrow'), style: const TextStyle(color: kErrorColor, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                LanguageService.instance.getString('ui_design'),
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kTextColor),
              ),
              const Text(
                "Tugas 01 - Wireframing",
                style: TextStyle(color: kSubtitleColor, fontSize: 12),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CircleAvatar(radius: 10, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 12, color: Colors.white)),
                  const SizedBox(width: 8),
                  const Text("Dosen Pengampu", style: TextStyle(color: kSubtitleColor, fontSize: 12)),
                  const Spacer(),
                  SizedBox(
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskDetailScreen())),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.black, // Dark text on Lime button
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      child: Text(
                        LanguageService.instance.getString('detail'), 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildClassProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
               Text(
               LanguageService.instance.getString('class_progress'),
               style: const TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
                 color: kTextColor,
               ),
             ),
             GestureDetector(
               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyClassesScreen())),
               child: Text(
                 LanguageService.instance.getString('see_all'), 
                 style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 12)
                ),
             )
          ],
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            final courses = [
              {"name": "Pemrograman Mobile", "progress": 0.75, "color": Colors.blue},
              {"name": "Basis Data Lanjut", "progress": 0.40, "color": Colors.orange},
              {"name": "Bahasa Inggris", "progress": 0.90, "color": kPrimaryColor},
            ];
            final course = courses[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12), // Compact
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kOutlineColor.withOpacity(0.1)),
                 boxShadow: [
                  BoxShadow(
                    color: kShadowColor.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: CircularProgressIndicator(
                      value: course["progress"] as double,
                      backgroundColor: kBackgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(course["color"] as Color),
                      strokeWidth: 4,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course["name"] as String,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: kTextColor),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "${((course["progress"] as double) * 100).toInt()}% Selesai",
                          style: const TextStyle(color: kSubtitleColor, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 14, color: kSubtitleColor),
                ],
              ),
            );
          },
        ),
      ],
    );
  }


  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: kCardColor, // Dark sheet
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageService.instance.getString('change_language'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Text("🇮🇩", style: TextStyle(fontSize: 24)),
                title: const Text("Bahasa Indonesia", style: TextStyle(color: kTextColor)),
                trailing: LanguageService.instance.currentLanguage == AppLanguage.indonesian
                    ? Icon(Icons.check_circle, color: kPrimaryColor)
                    : null,
                onTap: () {
                  LanguageService.instance.switchLanguage(AppLanguage.indonesian);
                  Navigator.pop(context);
                },
              ),
              const Divider(color: kOutlineColor),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Text("🇺🇸", style: TextStyle(fontSize: 24)),
                title: const Text("English", style: TextStyle(color: kTextColor)),
                trailing: LanguageService.instance.currentLanguage == AppLanguage.english
                    ? Icon(Icons.check_circle, color: kPrimaryColor)
                    : null,
                onTap: () {
                  LanguageService.instance.switchLanguage(AppLanguage.english);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    LanguageService.instance.getString('cancel'),
                    style: const TextStyle(color: kSubtitleColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
