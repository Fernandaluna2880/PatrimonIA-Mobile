import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/audio_player_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8B3A0A), Color(0xFF3D1A08)],
              ),
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.pop(),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.electric_bolt, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit_outlined, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.categoryLeyenda,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: const Text(
                      'Leyenda',
                      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'El Nagual del Cerro Tzontehuitz',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColors.textOnLightTitle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '📍 Chamula, Chiapas · 👤 Doña Caterina Gómez · Mar 2024',
                    style: TextStyle(fontSize: 12, color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 16),
                  const GoldDotSeparatorSmall(),
                  const SizedBox(height: 20),
                  const Text(
                    'Cuentan los abuelos en Los Altos de Chiapas que el Cerro Tzontehuitz no es una simple elevación de tierra y árboles, sino el hogar de protectores antiguos que cambian de forma al caer el crepúsculo.\n\n'
                    'Aquellos hombres sabios, conocidos como Naguales, asumen el espíritu de jaguares o serpientes emplumadas para vigilar que los cazadores y recolectores respeten los ciclos de la madre tierra.\n\n'
                    'Si entras al cerro con malas intenciones, una densa neblina impregnada con aroma a copal bloqueará tu sendero, y escucharás un rugido profundo que te recordará que el patrimonio no se vende, se venera...',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textOnLightBody,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const AudioPlayerWidget(),
        ],
      ),
    );
  }
}

class GoldDotSeparatorSmall extends StatelessWidget {
  const GoldDotSeparatorSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        20,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          width: 3,
          height: 3,
          decoration: const BoxDecoration(
            color: AppColors.amber,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
