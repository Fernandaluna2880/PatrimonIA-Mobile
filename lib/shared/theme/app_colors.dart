import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Paleta principal
  static const Color greenDark = Color(0xFF1A5C3A);
  static const Color greenForest = Color(0xFF2D7A4F);
  static const Color amber = Color(0xFFE8940A);
  static const Color burntOrange = Color(0xFFC8591A);
  static const Color darkBrown = Color(0xFF3D1F0A);
  static const Color mediumBrown = Color(0xFF6B3A1F);
  static const Color cream = Color(0xFFF5F0DC);
  static const Color strawYellow = Color(0xFFF0E8B0);

  // Colores de categorías (badges)
  static const Color categoryLeyenda = Color(0xFF1A5C3A);
  static const Color categoryTradicion = Color(0xFFC8591A);
  static const Color categoryHistoria = Color(0xFF8B4513);
  static const Color categoryRitual = Color(0xFF7B3F8C);
  static const Color categoryCancion = Color(0xFF1A6B8A);
  static const Color categoryPersonaje = Color(0xFF5A6B1A);

  static Color categoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'leyenda':
        return categoryLeyenda;
      case 'tradición':
      case 'tradicion':
        return categoryTradicion;
      case 'historia':
        return categoryHistoria;
      case 'ritual':
        return categoryRitual;
      case 'canción':
      case 'cancion':
        return categoryCancion;
      case 'personaje':
        return categoryPersonaje;
      default:
        return greenDark;
    }
  }

  // Texto sobre fondo oscuro
  static const Color textOnDarkTitle = Color(0xFFF5E6C8);
  static const Color textOnDarkBody = Color(0xFFD4C4A0);

  // Texto sobre fondo claro
  static const Color textOnLightTitle = Color(0xFF2D1A0A);
  static const Color textOnLightBody = Color(0xFF5A3A20);

  // Texto muted / secundario
  static const Color textMuted = Color(0xFF8B6A4A);

  // Nav
  static const Color navBackground = Color(0xFF2D1A0A);
  static const Color navActive = Color(0xFFE8940A);
  static const Color navInactive = Color(0xFFB8A88A);

  // Gradientes para headers
  static const Color headerStart = Color(0xFF8B3A0A);
  static const Color headerEnd = Color(0xFF5C2810);

  // Formularios (solo borde inferior)
  static const Color inputBorder = Color(0xFF8B2020);

  // Bordes y cards
  static const Color cardBorder = Color(0xFFE0D8C0);
}
