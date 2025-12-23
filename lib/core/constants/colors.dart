import 'package:flutter/material.dart';

// Brand Colors (Modern Light Clean)
const Color kBackgroundColor = Color(0xFFF8F9FD); // Light Grey-ish White
const Color kSurfaceColor = Colors.white;         // Clean White for cards
const Color kPrimaryColor = Color(0xFF20B2AA);    // Light Teal (Fallback)
const Color kAccentColor = Color(0xFF42A5F5);     // Soft Blue (Secondary)
const Color kErrorColor = Color(0xFFCF6679);

// Gradients
const LinearGradient kPrimaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF20B2AA), // Light Teal
    Color(0xFF42A5F5), // Soft Blue
  ],
);

// Text Colors
const Color kTextColor = Color(0xFF333333);        // Dark Grey for readability
const Color kSubtitleColor = Color(0xFF9E9E9E);    // Light Grey for subtitles
const Color kTextLightColor = Color(0xFFFFFFFF);   // White Text (on gradient)

// UI Utility Colors
const Color kShadowColor = Color.fromARGB(13, 0, 0, 0); // Very subtle shadow
const Color kOutlineColor = Color(0xFFEEEEEE);          // Very light border
const Color kInputBackgroundColor = Colors.white;       // White input for light theme
