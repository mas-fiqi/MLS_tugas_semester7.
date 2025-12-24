import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/authentication/presentation/pages/login_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Fungsi untuk menunda navigasi
  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {}); 
    if (mounted) {
      // Placeholder navigasi sementara ke halaman kosong:
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bg_splash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          
          // 2. Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          
          // 3. Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon Placeholder for Logo
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.5)),
                  ),
                  child: const Icon(Icons.school_rounded, color: Colors.white, size: 80),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Learning Management System",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                 const SizedBox(height: 8),
                Text(
                  "Belajar di mana saja, kapan saja.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 48),
                // Optional: Loading indicator
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
