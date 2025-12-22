import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart'; 

final ThemeData appTheme = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  // Mengatur skema warna menggunakan Primary Color
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    primary: kPrimaryColor,
    secondary: kAccentColor,
    background: kBackgroundColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimaryColor, 
    foregroundColor: Colors.white, 
    elevation: 0,
    centerTitle: true,
  ),
  // Mengatur style tombol Elevated Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
  ),
  // Mengatur style Text Field (untuk form Login)
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor, width: 2),
    ),
  ),
  // Anda bisa menambahkan TextTheme di sini jika ingin menggunakan font kustom.
);
