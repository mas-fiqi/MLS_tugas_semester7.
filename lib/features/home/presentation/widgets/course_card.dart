import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final String lecturerCode;
  final double progress;
  final Color iconColor;
  final VoidCallback? onTap;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.lecturerCode,
    required this.progress,
    this.iconColor = const Color(0xFF6C63FF), // Defaulting to purple manually if kPrimaryColor can't be const in default value easily without correct import, but kPrimaryColor is const. Let's use kPrimaryColor.
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(0), // Padding moved to inner
        decoration: BoxDecoration(
          color: kSurfaceColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 8),
              blurRadius: 16,
            ),
          ],
        ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12), // Reduced padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courseName,
                            style: const TextStyle(
                              color: kTextColor,
                              fontSize: 14, // Smaller title
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2), // Reduced spacing
                          Text(
                            "Dosen: $lecturerCode",
                            style: const TextStyle(
                              color: kSubtitleColor,
                              fontSize: 12, // Smaller subtitle
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6), // Smaller icon box
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor, size: 14), // Smaller icon
                    ),
                  ],
                ),
                const SizedBox(height: 12), // Reduced spacing
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6, // Thinner progress bar
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(kAccentColor),
                  ),
                ),
                const SizedBox(height: 6), // Reduced spacing
                Text(
                  "${(progress * 100).toInt()}% Selesai",
                  style: const TextStyle(
                    color: kAccentColor,
                    fontSize: 10, // Smaller text
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
