import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class AnnouncementListScreen extends StatelessWidget {
  const AnnouncementListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data (Duplicated from Home for now)
    final List<Map<String, dynamic>> announcements = [
      {
        "title": "Jadwal UAS Semester Genap",
        "subtitle": "Cek jadwal ujian anda sekarang dan pastikan tidak ada jadwal yang bentrok.",
        "label": "PENTING",
        "labelColor": Colors.orange,
        "icon": Icons.campaign_rounded,
        "date": "23 Juni 2024",
      },
      {
        "title": "Libur Semester Telah Tiba",
        "subtitle": "Persiapkan liburanmu dengan baik! Kampus akan tutup mulai tanggal 30 Juni.",
        "label": "INFO",
        "labelColor": Colors.blue,
        "icon": Icons.beach_access_rounded,
        "date": "20 Juni 2024",
      },
      {
        "title": "Workshop UI/UX Design",
        "subtitle": "Ikuti workshop gratis minggu depan bersama expert dari Gojek & Tokopedia.",
        "label": "EVENT",
        "labelColor": Colors.green,
        "icon": Icons.brush_rounded,
        "date": "18 Juni 2024",
      },
      {
        "title": "Pemeliharaan Server",
        "subtitle": "Server LMS akan mengalami downtime pada hari Sabtu pukul 22:00 WIB.",
        "label": "MAINTENANCE",
        "labelColor": Colors.red,
        "icon": Icons.settings_rounded,
        "date": "15 Juni 2024",
      },
      {
        "title": "Beasiswa Berprestasi",
        "subtitle": "Pendaftaran beasiswa Djarum telah dibuka untuk mahasiswa semester 4.",
        "label": "BEASISWA",
        "labelColor": Colors.purple,
        "icon": Icons.school_rounded,
        "date": "10 Juni 2024",
      },
    ];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Semua Pengumuman",
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: kOutlineColor.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final item = announcements[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: kOutlineColor.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (item["labelColor"] as Color).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(item["icon"], color: item["labelColor"], size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: (item["labelColor"] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item["label"],
                              style: TextStyle(
                                color: item["labelColor"],
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            item["date"],
                            style: const TextStyle(color: kSubtitleColor, fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item["title"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item["subtitle"],
                        style: const TextStyle(
                          color: kSubtitleColor,
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
