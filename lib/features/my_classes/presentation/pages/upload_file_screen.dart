import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'dart:ui';
import 'dart:async'; // For Timer simulation

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  String? _selectedFn;
  bool _isUploading = false;

  void _pickFile() {
    setState(() {
      _isUploading = true;
    });
    
    // Simulate file picking delay
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _isUploading = false;
          _selectedFn = "Tugas_Analisis_UID.pdf"; // Simulated file
        });
      }
    });
  }

  void _submitTask() {
    if (_selectedFn == null) return;

    // Simulate upload delay
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Mengupload tugas...")),
    );
    
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pop(context); 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Tugas berhasil dikirim!"),
            backgroundColor: kPrimaryColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Upload File", style: TextStyle(color: kTextColor)),
        backgroundColor: kBackgroundColor,
        foregroundColor: kTextColor,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: kOutlineColor.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Maksimum File 5MB. Format yang diperbolehkan: PDF, DOCX, ZIP.",
                style: TextStyle(color: kSubtitleColor, fontSize: 13),
              ),
              const SizedBox(height: 24),
              
              // Upload Area (Resized & Interactive)
              GestureDetector(
                onTap: _pickFile,
                child: CustomPaint(
                  painter: DashedRectPainter(
                    color: _selectedFn != null ? kPrimaryColor : kOutlineColor, 
                    strokeWidth: 2.0, 
                    gap: 6.0
                  ),
                  child: Container(
                    height: 280, // Fixed height, not too big
                    width: double.infinity,
                    color: kCardColor.withOpacity(0.3),
                    child: _isUploading
                        ? const Center(child: CircularProgressIndicator(color: kPrimaryColor))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _selectedFn != null 
                                  ? Icon(Icons.check_circle, size: 60, color: kPrimaryColor)
                                  : Icon(Icons.cloud_upload_outlined, size: 60, color: kSubtitleColor),
                              const SizedBox(height: 16),
                              Text(
                                _selectedFn ?? "File yang akan diupload tampil di sini",
                                style: TextStyle(
                                  color: _selectedFn != null ? kPrimaryColor : kSubtitleColor, 
                                  fontSize: 16,
                                  fontWeight: _selectedFn != null ? FontWeight.bold : FontWeight.normal
                                ),
                              ),
                              const SizedBox(height: 8),
                              if (_selectedFn == null)
                                const Text(
                                  "Tap atau klik untuk memilih file",
                                  style: TextStyle(color: kSubtitleColor, fontSize: 12),
                                ),
                            ],
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _pickFile,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: kOutlineColor),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        foregroundColor: kTextColor,
                      ),
                      child: const Text("Pilih File"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _selectedFn != null ? _submitTask : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        disabledBackgroundColor: kCardColor,
                        disabledForegroundColor: kSubtitleColor.withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: _selectedFn != null ? 4 : 0,
                      ),
                      child: const Text("Simpan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
    
    double totalDistance = (size.width != 0) ? size.width.abs() : size.height.abs();
    double distance = 0.0;

    while (distance < totalDistance) {
      double nextDistance = distance + gap;
      if (nextDistance > totalDistance) nextDistance = totalDistance;

      if (shouldDraw) {
        if (size.width != 0) {
           path.lineTo(a.dx + (size.width > 0 ? nextDistance : -nextDistance), a.dy);
        } else {
           path.lineTo(a.dx, a.dy + (size.height > 0 ? nextDistance : -nextDistance));
        }
      } else {
        if (size.width != 0) {
           path.moveTo(a.dx + (size.width > 0 ? nextDistance : -nextDistance), a.dy);
        } else {
           path.moveTo(a.dx, a.dy + (size.height > 0 ? nextDistance : -nextDistance));
        }
      }
      distance = nextDistance;
      shouldDraw = !shouldDraw;
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant DashedRectPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

