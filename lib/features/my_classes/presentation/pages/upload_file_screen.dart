import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'dart:ui';

class UploadFileScreen extends StatelessWidget {
  const UploadFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload File"),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Maksimum File 5MB. Format yang diperbolehkan: PDF, DOCX, ZIP.",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 16),
            
            // Upload Area (Dashed Border)
            Expanded(
              child: CustomPaint(
                painter: DashedRectPainter(color: Colors.grey.shade400, strokeWidth: 2.0, gap: 5.0),
                child: Container(
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload_outlined, size: 80, color: Colors.blue.shade300),
                      const SizedBox(height: 16),
                      const Text(
                        "File yang akan diupload tampil di sini",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Drag & drop atau klik untuk memilih",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Logic to pick file
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Pilih File", style: TextStyle(color: Colors.black87)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic to upload
                       Navigator.pop(context); // Simulate success and go back
                       ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text("Tugas berhasil dikirim!")),
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800, // Active/Grey as requested
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Simpan", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashedRectPainter({this.strokeWidth = 2.0, this.color = Colors.black, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = size.width;
    double y = size.height;

    Path _topPath = getDashedPath(a: const Offset(0, 0), b: Offset(x, 0), gap: gap);
    Path _rightPath = getDashedPath(a: Offset(x, 0), b: Offset(x, y), gap: gap);
    Path _bottomPath = getDashedPath(a: Offset(0, y), b: Offset(x, y), gap: gap);
    Path _leftPath = getDashedPath(a: const Offset(0, 0), b: Offset(0, y), gap: gap);

    canvas.drawPath(_topPath, dashedPaint);
    canvas.drawPath(_rightPath, dashedPaint);
    canvas.drawPath(_bottomPath, dashedPaint);
    canvas.drawPath(_leftPath, dashedPaint);
  }

  Path getDashedPath({required Offset a, required Offset b, required double gap}) {
    Size size = Size(b.dx - a.dx, b.dy - a.dy);
    Path path = Path();
    path.moveTo(a.dx, a.dy);
    bool shouldDraw = true;
    Offset currentPoint = a;

    double radians = 0.0;
    if (size.width != 0) {
      radians = size.width > 0 ? 0.0 : 3.14159; // right or left
    } else {
      radians = size.height > 0 ? 1.5708 : -1.5708; // down or up 
    }

    double distance = 0.0;
    double totalDistance = (size.width != 0) ? size.width.abs() : size.height.abs();

    while (distance < totalDistance) {
      if (shouldDraw) {
        // Draw line
        double nextDistance = distance + gap;
        if (nextDistance > totalDistance) nextDistance = totalDistance;
        
        // Calculate next point
        // Simple logic for rectilinear rect
        if (size.width != 0) {
           path.lineTo(a.dx + (size.width > 0 ? nextDistance : -nextDistance), a.dy);
        } else {
           path.lineTo(a.dx, a.dy + (size.height > 0 ? nextDistance : -nextDistance));
        }
        distance = nextDistance;
      } else {
        // Skip gap
         double nextDistance = distance + gap;
           if (size.width != 0) {
           path.moveTo(a.dx + (size.width > 0 ? nextDistance : -nextDistance), a.dy);
        } else {
           path.moveTo(a.dx, a.dy + (size.height > 0 ? nextDistance : -nextDistance));
        }
        distance = nextDistance;
      }
      shouldDraw = !shouldDraw;
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
