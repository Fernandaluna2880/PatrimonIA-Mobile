import 'package:flutter/material.dart';
import '../../../../shared/widgets/bottom_nav_bar.dart';
import 'home_page.dart';
import 'home_guardian_page.dart';
import '../../../narrator/presentation/pages/narrador_page.dart';
import '../../../guardian/presentation/pages/record_page.dart';
import '../../../search/presentation/pages/search_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class MainNavigationLayout extends StatefulWidget {
  const MainNavigationLayout({super.key});

  @override
  State<MainNavigationLayout> createState() => _MainNavigationLayoutState();
}

class _MainNavigationLayoutState extends State<MainNavigationLayout> {
  int _currentIndex = 0;
  final bool _isGuardian = false;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _rebuildPages();
  }

  void _rebuildPages() {
    _pages
      ..clear()
      ..addAll([
        _isGuardian ? const HomeGuardianPage() : const HomePage(),
        const NarradorChatPage(),
        const RecordMemoryPage(),
        const SearchPage(),
        const UserProfilePage(),
      ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
