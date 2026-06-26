import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class RecordingPreviewPage extends StatelessWidget {
  const RecordingPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.textOnLightTitle),
        title: const Text(
          'Vista previa',
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
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.greenDark,
                    radius: 18,
                    child: const Icon(Icons.play_arrow, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: const LinearProgressIndicator(
                            value: 0.5,
                            minHeight: 4,
                            backgroundColor: AppColors.strawYellow,
                            color: AppColors.amber,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('0:45', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                            Text('1:30', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Icon(Icons.edit_note, size: 18, color: AppColors.greenForest),
                SizedBox(width: 6),
                Text(
                  'Transcripción automática',
                  style: TextStyle(
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textOnLightTitle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '"Mi abuelo me contaba que en las noches frías de Zinacantán se escuchaban silbidos entre las milpas, no eran pájaros, era el viento del duende..."',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textOnLightBody,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.edit, size: 14, color: AppColors.greenForest),
                      SizedBox(width: 4),
                      Text(
                        'Editar transcripción',
                        style: TextStyle(
                          color: AppColors.greenForest,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Metadatos',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textOnLightTitle,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildMetaChip(Icons.eco, 'Leyenda', AppColors.categoryLeyenda),
                const SizedBox(width: 8),
                _buildMetaChip(Icons.location_on, 'San Cristóbal de las Casas', AppColors.textMuted),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenDark,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                icon: const Icon(Icons.group_outlined, size: 20),
                label: const Text(
                  'Guardar al corpus comunitario',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Descartar',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
