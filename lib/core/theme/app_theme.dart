import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_management_system/core/constants/colors.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  
  // Color Scheme
  colorScheme: const ColorScheme.dark(
    primary: kPrimaryColor,
    secondary: kAccentColor,
    surface: kSurfaceColor,
    error: kErrorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: kTextColor,
    background: kBackgroundColor,
  ),

  // Typography
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme.apply(
      bodyColor: kTextColor,
      displayColor: kTextColor,
    ),
  ),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent, // Transparent for modern look
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: kTextColor),
    titleTextStyle: TextStyle(
      color: kTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins', 
    ),
  ),

  // Card Theme
  cardTheme: CardThemeData(
    color: kSurfaceColor,
    elevation: 0, // Flat design
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Very rounded
      side: const BorderSide(color: kOutlineColor, width: 1), // Subtle outline for depth
    ),
    margin: const EdgeInsets.only(bottom: 16),
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 4, // Slight pop for buttons
      shadowColor: kPrimaryColor.withOpacity(0.4), // Glow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  // Input Decoration Theme (Forms)
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kInputBackgroundColor,
    hintStyle: TextStyle(color: kSubtitleColor.withOpacity(0.6)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
    ),
  ),
  
  // Icon Theme
  iconTheme: const IconThemeData(color: kPrimaryColor),
);
