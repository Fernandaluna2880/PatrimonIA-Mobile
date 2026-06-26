import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CulturalCard extends StatelessWidget {
  final String title;
  final String category;
  final String duration;
  final bool isDestacada;

  const CulturalCard({
    super.key,
    required this.title,
    required this.category,
    required this.duration,
    this.isDestacada = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: isDestacada
            ? const LinearGradient(
                colors: [Color(0xFF8B4A0A), Color(0xFF4A2010)],
              )
            : null,
        color: isDestacada ? null : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isDestacada ? null : Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBadge(),
              if (isDestacada)
                const Icon(Icons.favorite_border, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Playfair Display',
              fontWeight: FontWeight.bold,
              fontSize: isDestacada ? 20 : 15,
              color: isDestacada ? AppColors.textOnDarkTitle : AppColors.textOnLightTitle,
            ),
          ),
          if (isDestacada) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.play_arrow, color: Colors.white, size: 18),
                const SizedBox(width: 4),
                Text(
                  '$duration min lectura',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.play_circle_fill, color: AppColors.greenForest, size: 22),
                const SizedBox(width: 6),
                Text(
                  duration,
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBadge() {
    final bgColor = AppColors.categoryColor(category);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
