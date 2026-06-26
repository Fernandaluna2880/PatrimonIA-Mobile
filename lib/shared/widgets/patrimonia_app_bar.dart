import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PatrimoniaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool isDark;

  const PatrimoniaAppBar({super.key, required this.title, this.actions, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDark ? AppColors.mediumBrown : AppColors.cream,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Playfair Display',
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.textOnDarkTitle : AppColors.textOnLightTitle,
          fontSize: 18,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
