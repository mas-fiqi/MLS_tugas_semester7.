import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data for diverse notifications
    final List<Map<String, dynamic>> notifications = [
      {
        "title": "Tugas Baru: Desain UI/UX",
        "message": "Dosen telah menambahkan tugas baru. Tenggat waktu: 3 hari lagi. Segera kerjakan!",
        "time": "2 jam lalu",
        "type": "task", // task, info, warning
        "isRead": false,
      },
      {
        "title": "Jadwal Ujian Keluar",
        "message": "Jadwal UAS Semester Genap telah dipublikasikan. Cek sekarang di menu Jadwal.",
        "time": "5 jam lalu",
        "type": "info",
        "isRead": false,
      },
      {
        "title": "Nilai Kuis Diterbitkan",
        "message": "Nilai untuk Kuis 1 - Pemrograman Mobile sudah tersedia. Ketuk untuk melihat detail.",
        "time": "1 hari lalu",
        "type": "score",
        "isRead": true,
      },
      {
        "title": "Pengingat Pembayaran",
        "message": "Batas pembayaran UKT semester depan berakhir besok. Abaikan jika sudah membayar.",
        "time": "2 hari lalu",
        "type": "warning",
        "isRead": true,
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: kGreenGradient,
        ),
        child: Column(
          children: [
            // 1. Header (Green Gradient Area)
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.notifications_active_rounded, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Notifikasi",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "4 Baru",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 2. Main Content (White Bottom Sheet)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F7FA), // Very light grey background
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(24, 30, 24, 130),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notif = notifications[index];
                    return _buildNotificationCard(notif);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notif) {
    IconData icon;
    Color color;
    String typeLabel;

    switch (notif['type']) {
      case 'task':
        icon = Icons.assignment_rounded;
        color = Colors.blue;
        typeLabel = "Tugas";
        break;
      case 'warning':
        icon = Icons.warning_amber_rounded;
        color = Colors.orange;
        typeLabel = "Penting";
        break;
      case 'score':
        icon = Icons.verified_rounded;
        color = Colors.green;
        typeLabel = "Nilai";
        break;
      case 'info':
      default:
        icon = Icons.info_outline_rounded;
        color = kPrimaryColor; // Use global green
        typeLabel = "Info";
        break;
    }

    bool isRead = notif['isRead'];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
        border: !isRead ? Border.all(color: color.withOpacity(0.5), width: 1.5) : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 16),
                
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              typeLabel.toUpperCase(),
                              style: TextStyle(
                                color: color,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Text(
                            notif['time'],
                            style: const TextStyle(
                              color: kSubtitleColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notif['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notif['message'],
                        style: const TextStyle(
                          color: kSubtitleColor,
                          fontSize: 12,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
