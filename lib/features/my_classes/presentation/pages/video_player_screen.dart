import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Video - User Interface Design"),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Container
            Container(
              width: double.infinity,
              height: 220, // Approx 16:9 aspect ratio
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                   // Placeholder for video content
                   Center(
                     child: Icon(
                       Icons.play_circle_fill,
                       size: 64,
                       color: Colors.red.withOpacity(0.9),
                     ),
                   ),
                   // Overlay Title
                   Positioned(
                     bottom: 20,
                     left: 16,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                           decoration: BoxDecoration(
                             color: Colors.black54,
                             borderRadius: BorderRadius.circular(4),
                           ),
                           child: const Text(
                             "Pertemuan 1: Pengantar UI/UX",
                             style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                               fontSize: 14,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   // Progress Bar Simulation
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 4,
                        child: Row(
                          children: [
                            Expanded(child: Container(color: Colors.red)),
                            Expanded(flex: 2, child: Container(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    "Deskripsi Video",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Video ini menjelaskan konsep dasar User Interface dan User Experience. Dipelajari juga tentang prinsip-prinsip desain yang baik.",
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  ),
                  const SizedBox(height: 24),
                  
                  const Text(
                    "Video Lainnya",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  
                  // Playlist / Recommendations
                  _buildVideoItem("Pertemuan 2: Layouting", "12:30", true),
                  _buildVideoItem("Pertemuan 3: Typography", "15:45", false),
                  _buildVideoItem("Pertemuan 4: Color Theory", "10:20", false),
                  _buildVideoItem("Pertemuan 5: Design System", "20:10", false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(String title, String duration, bool isPlaying) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
         boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: NetworkImage("https://via.placeholder.com/150"), // Placeholder
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(child: Icon(Icons.play_arrow, color: Colors.white)),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPlaying ? kPrimaryColor : Colors.black87,
          ),
        ),
        subtitle: Text(
          "Durasi: $duration",
          style: const TextStyle(fontSize: 12),
        ),
        trailing: isPlaying ? Icon(Icons.equalizer, color: kPrimaryColor) : const Icon(Icons.play_circle_outline, color: Colors.grey),
      ),
    );
  }
}
