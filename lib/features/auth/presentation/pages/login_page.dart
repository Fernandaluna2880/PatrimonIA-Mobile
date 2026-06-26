import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/underline_input.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B3A0A), Color(0xFF5C2810)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.circle_outlined, size: 36, color: AppColors.amber),
                  const SizedBox(height: 8),
                  const Text(
                    'PatrimonIA',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildDotPattern(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bienvenido de vuelta',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: AppColors.textOnLightTitle,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const UnderlineInput(hint: 'tu@correo.com'),
                  const SizedBox(height: 20),
                  const UnderlineInput(hint: '········', isPassword: true),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    text: 'Iniciar sesión',
                    onPressed: () {
                      ref.read(authProvider.notifier).login();
                    },
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xFFD0C8B0))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'o continúa como',
                          style: TextStyle(color: Color(0xFF8B6A4A), fontSize: 13),
                        ),
                      ),
                      Expanded(child: Divider(color: Color(0xFFD0C8B0))),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF3A3A3A)),
                        foregroundColor: AppColors.textOnLightTitle,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        ref.read(authProvider.notifier).login();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.language, size: 20),
                          SizedBox(width: 8),
                          Text('Explorador anónimo', style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.push('/register');
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: '¿No tienes cuenta? ',
                          style: TextStyle(color: AppColors.textOnLightBody, fontSize: 14),
                          children: [
                            TextSpan(
                              text: 'Regístrate',
                              style: TextStyle(
                                color: AppColors.greenDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildDotPattern() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        12,
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
