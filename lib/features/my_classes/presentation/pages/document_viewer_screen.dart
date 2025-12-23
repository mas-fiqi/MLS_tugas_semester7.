import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class DocumentViewerScreen extends StatelessWidget {
  const DocumentViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Document background usually white or light grey
      appBar: AppBar(
        title: const Text("Pengantar User Interface Design"),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        actions: [
          Container(
             margin: const EdgeInsets.only(right: 16),
             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
             decoration: BoxDecoration(
               color: Colors.white.withOpacity(0.2),
               borderRadius: BorderRadius.circular(20),
             ),
             child: const Text(
               "Halaman 1 / 26",
               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
             ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Mock Document Pages
              _buildMockPage(1),
              const SizedBox(height: 16),
              _buildMockPage(2),
              const SizedBox(height: 16),
              _buildMockPage(3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMockPage(int pageNumber) {
    return Container(
      width: double.infinity,
      height: 650, // Increased height to prevent overflow (RenderFlex error)
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Modul Pembelajaran - UI/UX", style: TextStyle(color: Colors.grey[400], fontSize: 10)),
              Text("Page $pageNumber", style: TextStyle(color: Colors.grey[400], fontSize: 10)),
            ],
          ),
          const SizedBox(height: 24),
          Container(height: 20, width: 150, color: Colors.grey[200]), // Title placeholder
          const SizedBox(height: 16),
          // Text lines lines
          for (int i = 0; i < 15; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                height: 10, 
                width: double.infinity, 
                color: Colors.grey[100],
              ),
            ),
          
          if (pageNumber % 2 == 0) // Image graphic on even pages
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 20),
               child: Container(
                 height: 100,
                 width: double.infinity,
                 color: Colors.blue[50],
                 child: const Center(child: Icon(Icons.image, color: Colors.blue, size: 40)),
               ),
             ),
        ],
      ),
    );
  }
}
