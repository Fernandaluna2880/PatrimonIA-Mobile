import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: const Text(
          'Buscar en el patrimonio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.burntOrange,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: AppColors.textOnLightTitle),
              decoration: InputDecoration(
                hintText: 'Busca leyendas, rituales, personajes...',
                hintStyle: const TextStyle(color: AppColors.textMuted),
                prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildSearchResult('nagual', Icons.access_time),
                  _buildSearchResult('danza de los parachicos', Icons.access_time),
                  _buildSearchResult('tejidos tzotzil', Icons.access_time),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResult(String term, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.textMuted, size: 20),
      title: Text(
        term,
        style: const TextStyle(color: AppColors.textOnLightBody, fontSize: 14),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.close, color: AppColors.textMuted, size: 18),
        onPressed: () {},
      ),
    );
  }
}
