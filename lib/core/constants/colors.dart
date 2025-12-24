import 'package:flutter/material.dart';

// Brand Colors (Deep Blue & Neon Aqua Theme)
const Color kBackgroundColor = Color(0xFF0B1220); // Deep Navy/Biru Dongker Gelap
const Color kCardColor = Color(0xFF162135);       // Lighter Navy (Card Container)
const Color kSurfaceColor = Color(0xFF162135);    // Alias for Card Color

const Color kPrimaryColor = Color(0xFF00E5FF);    // Neon Aqua / Cyan
const Color kAccentColor = Color(0xFF00E5FF);     // Neon Aqua
const Color kSecondaryColor = Color(0xFF0B1220);  // Deep Navy
const Color kHighlightColor = Color(0xFF00E5FF);  // Neon Highlight

const Color kErrorColor = Color(0xFFCF6679);

// Gradients (Deep & Neon)
const LinearGradient kPrimaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF00E5FF), // Neon Aqua
    Color(0xFF00B8D4), // Darker Cyan
  ],
);

const LinearGradient kGreenGradient = kPrimaryGradient; // Alias for compatibility with other screens (retains the name mostly for generic usage)

const LinearGradient kDarkGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0B1220),
    Color(0xFF080D16),
  ],
);

// Text Colors
const Color kTextColor = Color(0xFFFFFFFF);        // White (High Contrast)
const Color kSubtitleColor = Color(0xFF8899A6);    // Faded Blue Grey (Cool Tone)
const Color kTextLightColor = Color(0xFFFFFFFF);   // White Text

// UI Utility Colors
const Color kOutlineColor = Color(0xFF00E5FF);     // Neon Border (Low Opacity usually)
const Color kShadowColor = Color(0xFF00E5FF);      // Neon Glow
const Color kGlassColor = Color(0xFF162135);       // Dark Glass
const Color kInputBackgroundColor = Color(0xFF1C2A42); // Slightly lighter for inputs
