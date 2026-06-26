import 'package:flutter/material.dart';

class PatrimoniaTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF5F0DC),
      fontFamily: 'DM Sans',
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF1A5C3A),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFE8940A),
        onSecondary: Color(0xFFFFFFFF),
        surface: Color(0xFFF5F0DC),
        onSurface: Color(0xFF2D1A0A),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Playfair Display',
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Color(0xFF2D1A0A),
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Playfair Display',
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Color(0xFF2D1A0A),
        ),
        titleLarge: TextStyle(
          fontFamily: 'Playfair Display',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color(0xFF2D1A0A),
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color(0xFF2D1A0A),
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: Color(0xFF5A3A20),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Color(0xFF5A3A20),
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Color(0xFF8B6A4A),
        ),
        labelSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11,
          color: Color(0xFF8B6A4A),
        ),
      ),
    );
  }
}
