import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class GlassBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const GlassBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 30), // Floating margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: kBackgroundColor.withOpacity(0.8), // Deep Navy Glass
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: kOutlineColor.withOpacity(0.2), // Neon Border
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(0, Icons.home_rounded),
                _buildNavItem(1, Icons.calendar_today_rounded),
                _buildNavItem(2, Icons.person_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor.withOpacity(0.1) : Colors.transparent, // Neon glow for active
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? kPrimaryColor : kSubtitleColor, // Neon or Grey
          size: 24,
        ),
      ),
    );
  }
}
