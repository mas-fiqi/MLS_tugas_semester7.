import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  
  // Video Data from User Request
  final List<Map<String, String>> _videos = [
    {
      "title": "Pertemuan 1: Konsep Dasar UI/UX",
      "id": "Kqpby3g30hA",
      "desc": "Pengenalan dasar tentang User Interface dan User Experience Design."
    },
    {
      "title": "Pertemuan 2: Design System",
      "id": "8bMh8azh3CY",
      "desc": "Membuat konsistensi desain dengan menggunakan Design System."
    },
    {
      "title": "Pertemuan 3: Prototyping",
      "id": "tpo6rIhb7yY",
      "desc": "Tahap akhir sebelum development: membuat prototype interaktif."
    },
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0]['id']!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playVideo(int index) {
    setState(() {
      _currentIndex = index;
    });
    _controller.load(_videos[index]['id']!);
  }

  @override
  Widget build(BuildContext context) {
    final currentVideo = _videos[_currentIndex];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Rekaman Kelas", style: TextStyle(color: kTextColor)),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: kTextColor),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: kOutlineColor.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // YouTube Player
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kOutlineColor.withOpacity(0.3))),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
              ),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: kPrimaryColor,
                progressColors: const ProgressBarColors(
                  playedColor: kPrimaryColor,
                  handleColor: kPrimaryColor,
                ),
                onReady: () {
                  // _controller.addListener(listener);
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Current Video Info
                  Text(
                    currentVideo['title']!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kTextColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentVideo['desc']!,
                    style: const TextStyle(color: kSubtitleColor, fontSize: 13),
                  ),
                  const SizedBox(height: 24),
                  
                  const Divider(color: kOutlineColor),
                  const SizedBox(height: 16),

                  const Text(
                    "Daftar Putar Kelas",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor),
                  ),
                  const SizedBox(height: 12),
                  
                  // Playlist
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _videos.length,
                    separatorBuilder: (c, i) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final video = _videos[index];
                      final isPlaying = index == _currentIndex;
                      
                      return InkWell(
                        onTap: () => _playVideo(index),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isPlaying ? kPrimaryColor.withOpacity(0.1) : kCardColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isPlaying ? kPrimaryColor : kOutlineColor.withOpacity(0.1),
                              width: isPlaying ? 1.5 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage("https://img.youtube.com/vi/${video['id']}/0.jpg"),
                                        fit: BoxFit.cover,
                                        opacity: 0.7,
                                      ),
                                    ),
                                  ),
                                  if (isPlaying)
                                    const Icon(Icons.equalizer, color: kPrimaryColor, size: 20)
                                  else
                                    const Icon(Icons.play_circle_fill, color: Colors.white, size: 20),
                                ],
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      video['title']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: isPlaying ? kPrimaryColor : kTextColor,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Video Pembelajaran",
                                      style: TextStyle(fontSize: 11, color: kSubtitleColor.withOpacity(0.7)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
