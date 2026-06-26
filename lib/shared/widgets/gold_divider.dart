import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class GoldDivider extends StatelessWidget {
  const GoldDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        20,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
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
