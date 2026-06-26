import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class UnderlineInput extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;

  const UnderlineInput({super.key, required this.hint, this.isPassword = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: AppColors.textOnLightTitle),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textMuted),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputBorder, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greenDark, width: 2),
        ),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off, color: AppColors.textMuted, size: 20)
            : null,
      ),
    );
  }
}
