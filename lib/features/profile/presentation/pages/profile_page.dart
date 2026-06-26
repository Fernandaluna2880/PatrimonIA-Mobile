import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B3A0A), Color(0xFF3D1A08)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.greenDark,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.amber, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 31,
                        child: Icon(Icons.person, size: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'María Xochitl López',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.amber,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.auto_awesome, size: 10, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          'Guardián',
                          style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '📍 San Cristóbal de las Casas, Chiapas',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildStatCard('12', 'Historias guardadas'),
                      const SizedBox(width: 12),
                      _buildStatCard('45', 'Historias leídas'),
                      const SizedBox(width: 12),
                      _buildStatCard('3', 'Comunidades'),
                    ],
                  ),
                  const SizedBox(height: 28),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mis memorias guardadas',
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.textOnLightTitle,
                        ),
                      ),
                      Text(
                        'Ver todas',
                        style: TextStyle(
                          color: AppColors.greenDark,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildMemoryItem('El Nagual del Cerro Tzontehuitz', 'Leyenda', Icons.eco, AppColors.categoryLeyenda),
                  _buildMemoryItem('La Llorona en el Río Amarillo', 'Leyenda', Icons.eco, AppColors.categoryLeyenda),
                  const SizedBox(height: 24),
                  const Text(
                    'Configuración',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textOnLightTitle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.cardBorder, width: 0.5),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.textOnLightTitle,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemoryItem(String title, String category, IconData icon, Color badgeColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: badgeColor.withValues(alpha: 0.15),
            child: Icon(icon, color: badgeColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.textOnLightTitle,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit_outlined, size: 18, color: AppColors.textMuted),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.textMuted),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
