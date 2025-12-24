import 'package:flutter/material.dart';
import 'package:learning_management_system/core/services/language_service.dart';
import 'core/theme/app_theme.dart';
// Ganti home dengan SplashScreen nanti di Perintah #2
import 'package:learning_management_system/features/authentication/presentation/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LanguageService.instance.languageNotifier,
      builder: (context, language, child) {
        return MaterialApp(
          title: 'LMS Hybrid App',
          theme: appTheme, // Terapkan tema
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
