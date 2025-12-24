import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class DocumentViewerScreen extends StatefulWidget {
  const DocumentViewerScreen({super.key});

  @override
  State<DocumentViewerScreen> createState() => _DocumentViewerScreenState();
}

class _DocumentViewerScreenState extends State<DocumentViewerScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      "title": "Pengantar UI/UX Design",
      "content": "User Interface (UI) adalah jembatan antara manusia dan mesin. Fokusnya adalah pada tampilan visual, tata letak, dan bagaimana pengguna berinteraksi dengan produk. \n\nUser Experience (UX) mencakup seluruh pengalaman pengguna saat menggunakan produk, termasuk kemudahan penggunaan, efisiensi, dan kepuasan secara keseluruhan.",
      "image": "assets/images/bg_nature.jpg",
    },
    {
      "title": "Prinsip Desain Visual",
      "content": "Desain visual yang baik harus memiliki:\n\n1. Keseimbangan (Balance): Distribusi elemen visual.\n2. Hierarki (Hierarchy): Menunjukkan urutan kepentingan.\n3. Kontras (Contrast): Membedakan elemen satu dengan yang lain.\n4. Konsistensi (Consistency): Menggunakan pola yang sama di seluruh aplikasi.",
      "image": "assets/images/bg_login.png",
    },
    {
      "title": "Teori Warna & Tipografi",
      "content": "Warna dapat memengaruhi emosi dan keputusan pengguna. Gunakan palet warna yang harmonis (seperti aturan 60-30-10).\n\nTipografi tidak hanya tentang memilih font, tetapi juga tentang keterbacaan (readability) dan susunan teks yang nyaman di mata.",
      "image": "assets/images/bg_splash.jpg",
    },
    {
      "title": "Wireframing & Prototyping",
      "content": "Sebelum membuat desain akhir (High-Fidelity), desainer biasanya membuat Wireframe (kerangka kasar) untuk menyusun struktur informasi.\n\nPrototype adalah model interaktif yang mensimulasikan cara kerja aplikasi sebelum masuk ke tahap pengembangan (coding).",
      "image": "assets/images/kampus.png",
    },
    {
      "title": "Kesimpulan",
      "content": "UI yang cantik menarik pengguna, tetapi UX yang baik membuat mereka tetap menggunakan aplikasi Anda.\n\nKombinasi keduanya adalah kunci sukses produk digital.",
      "image": "assets/images/bg_nature.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Materi: UI Design", style: TextStyle(color: kTextColor)),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kTextColor),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: kOutlineColor.withOpacity(0.1), height: 1.0),
        ),
        actions: [
          Container(
             margin: const EdgeInsets.only(right: 16),
             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
             decoration: BoxDecoration(
               color: kPrimaryColor.withOpacity(0.1),
               borderRadius: BorderRadius.circular(20),
               border: Border.all(color: kPrimaryColor.withOpacity(0.3)),
             ),
             child: Text(
               "Slide ${_currentPage + 1} / ${_slides.length}",
               style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kPrimaryColor),
             ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _slides.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final slide = _slides[index];
          return _buildSlideItem(slide);
        },
      ),
    );
  }

  Widget _buildSlideItem(Map<String, String> slide) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slide Card Container
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kOutlineColor.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Header
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      slide["image"]!,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          slide["title"]!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(height: 2, width: 60, color: kPrimaryColor),
                        const SizedBox(height: 24),
                        
                        // Content
                        Text(
                          slide["content"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: kSubtitleColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Geser untuk melihat slide berikutnya",
                style: TextStyle(color: kSubtitleColor.withOpacity(0.5), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
