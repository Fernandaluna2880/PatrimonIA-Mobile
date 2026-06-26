import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class RecordMemoryPage extends StatelessWidget {
  const RecordMemoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.textOnLightTitle),
        title: const Text(
          'Guardar una Memoria',
          style: TextStyle(
            fontFamily: 'Playfair Display',
            color: AppColors.textOnLightTitle,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¿Qué historia quieres contar?',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.amber,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildStoryChip('Una leyenda local', true),
                _buildStoryChip('Un personaje histórico', false),
                _buildStoryChip('Una tradición familiar', false),
                _buildStoryChip('Un ritual', false),
                _buildStoryChip('Otro...', false),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Selecciona una categoría',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textOnLightTitle,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.9,
              children: [
                _buildCategoryCard(Icons.eco, 'Leyenda', true, AppColors.categoryLeyenda),
                _buildCategoryCard(Icons.account_balance, 'Historia', false, AppColors.categoryHistoria),
                _buildCategoryCard(Icons.auto_awesome, 'Ritual', false, AppColors.categoryRitual),
                _buildCategoryCard(Icons.library_music, 'Canción', false, AppColors.categoryCancion),
                _buildCategoryCard(Icons.person, 'Personaje', false, AppColors.categoryPersonaje),
                _buildCategoryCard(Icons.agriculture, 'Tradición', false, AppColors.categoryTradicion),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greenDark,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greenDark.withValues(alpha: 0.3),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.mic, color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Toca para grabar',
                    style: TextStyle(color: AppColors.textOnLightBody, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  _buildInactiveWaveform(),
                  const SizedBox(height: 12),
                  const Text(
                    'Cancelar',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.greenDark : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.greenDark : AppColors.cardBorder,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: isSelected ? Colors.white : AppColors.textOnLightBody,
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String label, bool isSelected, Color badgeColor) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? badgeColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? badgeColor : AppColors.cardBorder,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: isSelected ? Colors.white : AppColors.textMuted),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.textOnLightBody,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInactiveWaveform() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        12,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 3,
          height: 12,
          decoration: BoxDecoration(
            color: AppColors.textMuted.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
