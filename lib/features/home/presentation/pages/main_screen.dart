import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/home/presentation/pages/home_screen.dart';
import 'package:learning_management_system/features/my_classes/presentation/pages/my_classes_screen.dart';
import 'package:learning_management_system/features/home/presentation/pages/notification_screen.dart';

import 'package:learning_management_system/features/home/presentation/widgets/glass_bottom_nav.dart';
import 'package:learning_management_system/features/profile/presentation/pages/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MyClassesScreen(),
    const ProfileScreen(), // Profile is now index 2
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Important for floating effect
      backgroundColor: kBackgroundColor, 
      body: _pages[_selectedIndex],
      bottomNavigationBar: GlassBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
