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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20), // Reduced margins
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20), // Slightly less rounded (24->20) mainly for proportion
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06), // Lighter shadow
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16), // Reduced padding (20->16)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. Header: Icon + Name
                Row(
                  children: [
                    // Soft Icon Check or Subject Icon
                    Container(
                      padding: const EdgeInsets.all(10), // Reduced
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.class_rounded, color: iconColor, size: 20), // Reduced size
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courseName,
                            style: const TextStyle( // Reduced Title
                              fontSize: 15, 
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            lecturerCode,
                            style: const TextStyle(
                              color: kSubtitleColor,
                              fontSize: 12, // Reduced Subtitle
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.more_horiz_rounded, color: Colors.grey, size: 20),
                  ],
                ),
                
                const SizedBox(height: 16), // Reduced gap
                
                // 2. Progress Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Progress",
                      style: TextStyle(
                        color: kSubtitleColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6, // Sleeker bar (10 -> 6)
                    backgroundColor: Colors.grey.shade100,
                    valueColor: AlwaysStoppedAnimation<Color>(iconColor), 
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
