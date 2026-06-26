import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/category_chip.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _activeFilter = 'Todos';
  bool _hasSubmitted = false;

  final List<String> _filters = ['Todos', 'Leyendas', 'Historia', 'Rituales', 'Música'];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: AppColors.textOnLightTitle),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    setState(() => _hasSubmitted = value.trim().isNotEmpty);
                  },
                  decoration: InputDecoration(
                    hintText: 'Busca leyendas, rituales, personajes...',
                    hintStyle: const TextStyle(color: AppColors.textMuted),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search, color: AppColors.textMuted),
                      onPressed: () {
                        if (_searchController.text.trim().isNotEmpty) {
                          setState(() => _hasSubmitted = true);
                        }
                      },
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close, color: AppColors.textMuted),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _hasSubmitted = false);
                            },
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: _filters.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CategoryChip(
                      label: filter,
                      isSelected: _activeFilter == filter,
                      onTap: () => setState(() => _activeFilter = filter),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _hasSubmitted ? _buildResultsView() : _buildLandingView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLandingView() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Text(
          'Búsquedas recientes',
          style: TextStyle(
            fontFamily: 'Playfair Display',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.textOnLightTitle,
          ),
        ),
        const SizedBox(height: 8),
        _buildRecentSearch('nagual'),
        _buildRecentSearch('danza de los parachicos'),
        _buildRecentSearch('tejidos tzotzil'),
        const SizedBox(height: 24),
        const Text(
          'Temas populares en tu comunidad',
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
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.3,
          children: [
            _buildTopicCard(Icons.eco, 'Naguales', '12 memorias'),
            _buildTopicCard(Icons.eco, 'Medicina ancestral', '8 memorias'),
            _buildTopicCard(Icons.auto_awesome, 'Rituales de curación', '15 memorias'),
            _buildTopicCard(Icons.agriculture, 'Milpa sagrada', '10 memorias'),
            _buildTopicCard(Icons.terrain, 'Cerros sagrados', '7 memorias'),
            _buildTopicCard(Icons.palette, 'Tejidos de Zinacantán', '9 memorias'),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentSearch(String term) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.access_time, color: AppColors.textMuted, size: 20),
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

  Widget _buildTopicCard(IconData icon, String name, String count) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: AppColors.amber),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: AppColors.textOnLightTitle,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: const TextStyle(fontSize: 11, color: AppColors.amber),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsView() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text(
          '18 resultados para "${_searchController.text}"',
          style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
        ),
        const SizedBox(height: 12),
        _buildResultCard(
          icon: Icons.eco,
          category: 'Leyenda',
          title: 'El Nagual del Cerro Tzontehuitz',
          excerpt: '...dicen los abuelos que el nagual protege la zona boscosa de cazadores furtivos al transformarse...',
          location: 'Chamula',
          badgeColor: AppColors.categoryLeyenda,
        ),
        const SizedBox(height: 8),
        _buildResultCard(
          icon: Icons.menu_book,
          category: 'Historia',
          title: 'Avistamientos en Los Altos (1974)',
          excerpt: 'Un registro oral sobre crónicas comunitarias que detallan encuentros con un supuesto nagual felino.',
          location: 'Tenejapa',
          badgeColor: AppColors.categoryHistoria,
        ),
        const SizedBox(height: 24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('← Anterior', style: TextStyle(color: AppColors.greenDark, fontSize: 13, fontWeight: FontWeight.w500)),
            SizedBox(width: 16),
            Text('15/20', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
            SizedBox(width: 16),
            Text('Siguiente →', style: TextStyle(color: AppColors.greenDark, fontSize: 13, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildResultCard({
    required IconData icon,
    required String category,
    required String title,
    required String excerpt,
    required String location,
    required Color badgeColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 10, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      category,
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
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
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.textOnLightTitle,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            excerpt,
            style: const TextStyle(fontSize: 13, color: AppColors.textOnLightBody, height: 1.3),
          ),
        ],
      ),
    );
  }
}
