import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/theme/app_colors.dart';

class CommunitySelectorPage extends StatefulWidget {
  const CommunitySelectorPage({super.key});

  @override
  State<CommunitySelectorPage> createState() => _CommunitySelectorPageState();
}

class _CommunitySelectorPageState extends State<CommunitySelectorPage> {
  String selectedCommunity = 'Zinacantán';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.textOnLightTitle),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar comunidad...',
                        hintStyle: TextStyle(color: AppColors.textMuted),
                        prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildRegionHeader('📍 Altos de Chiapas'),
                  _buildCommunityTile('SCL', 'San Cristóbal de las Casas', '248 memorias'),
                  _buildCommunityTile('ZIN', 'Zinacantán', '156 memorias'),
                  _buildCommunityTile('CHM', 'Chamula', '189 memorias'),
                  _buildCommunityTile('TEN', 'Tenejapa', '92 memorias'),
                  const SizedBox(height: 16),
                  _buildRegionHeader('📍 Selva Lacandona'),
                  _buildCommunityTile('PAL', 'Palenque', '203 memorias'),
                  _buildCommunityTile('OCS', 'Ocosingo', '78 memorias'),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenDark,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Confirmar comunidad',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.amber,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildCommunityTile(String initials, String name, String memories) {
    final isSelected = selectedCommunity == name;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.greenDark : AppColors.cardBorder,
          width: isSelected ? 2 : 0.5,
        ),
      ),
      child: RadioListTile<String>(
        value: name,
        groupValue: selectedCommunity,
        activeColor: AppColors.greenDark,
        onChanged: (value) {
          if (value != null) {
            setState(() => selectedCommunity = value);
          }
        },
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.greenDark,
              child: Text(
                initials,
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.textOnLightTitle,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 42),
          child: Text(
            memories,
            style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
          ),
        ),
      ),
    );
  }
}
