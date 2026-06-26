import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/category_chip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.darkBrown,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.amber, size: 14),
                        SizedBox(width: 6),
                        Text(
                          'San Cristóbal de las Casas',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none_outlined, color: AppColors.textOnLightTitle),
                        onPressed: () {},
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.greenForest,
                        child: const Text('M', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Historia destacada',
                style: TextStyle(
                  fontFamily: 'Playfair Display',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.textOnLightTitle,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => context.push('/detail'),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B4A0A), Color(0xFF4A2010)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.amber,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.auto_awesome, size: 12, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              'Historia destacada',
                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'El Nagual del Cerro Tzontehuitz',
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.play_arrow, color: Colors.white, size: 18),
                              SizedBox(width: 4),
                              Text(
                                '3 min lectura',
                                style: TextStyle(color: Colors.white70, fontSize: 13),
                              ),
                            ],
                          ),
                          const Icon(Icons.favorite_border, color: Colors.white, size: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explorar por tema',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textOnLightTitle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Ver todo',
                      style: TextStyle(color: AppColors.greenDark, fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(label: 'Leyendas', isSelected: true, onTap: () {}),
                    const SizedBox(width: 8),
                    CategoryChip(label: 'Tradiciones', isSelected: false, onTap: () {}),
                    const SizedBox(width: 8),
                    CategoryChip(label: 'Rituales', isSelected: false, onTap: () {}),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Memorias recientes',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textOnLightTitle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Ver todo',
                      style: TextStyle(color: AppColors.greenDark, fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildMemoryCard(
                Icons.eco,
                'El Sombrerón de Zinacantán',
                'Leyenda',
                'San Cristóbal',
                '3 min',
                Colors.green,
              ),
              const SizedBox(height: 8),
              _buildMemoryCard(
                Icons.agriculture,
                'La Milpa Sagrada',
                'Tradición',
                'Chamula',
                '4 min',
                AppColors.burntOrange,
              ),
              const SizedBox(height: 8),
              _buildMemoryCard(
                Icons.music_note,
                'Danza del Jaguar',
                'Ritual',
                'Tenejapa',
                '5 min',
                AppColors.categoryRitual,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemoryCard(
    IconData icon,
    String title,
    String category,
    String location,
    String duration,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconColor.withValues(alpha: 0.15),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textOnLightTitle,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(fontSize: 10, color: iconColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.location_on, size: 10, color: AppColors.textMuted),
                    const SizedBox(width: 2),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 10, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                duration,
                style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
              ),
              const SizedBox(height: 4),
              const Icon(Icons.local_fire_department, size: 16, color: Colors.redAccent),
            ],
          ),
        ],
      ),
    );
  }
}
