import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class NarradorChatPage extends StatelessWidget {
  const NarradorChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkBrown,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Column(
          children: [
            Text(
              'El Narrador',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontWeight: FontWeight.bold,
                color: AppColors.amber,
                fontSize: 18,
              ),
            ),
            Text(
              'Comunidad Los Altos, Chiapas',
              style: TextStyle(fontSize: 11, color: AppColors.textOnDarkBody),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildNarratorMessage(
                  'Cuenta la leyenda que en las profundidades del Cerro Tzontehuitz habita un espíritu protector ancestral...',
                ),
                const SizedBox(height: 16),
                _buildUserMessage('¿Cómo podemos pedirle permiso al cerro antes de entrar?'),
                const SizedBox(height: 16),
                _buildNarratorTyping(),
              ],
            ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildNarratorMessage(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.greenDark,
          child: const Icon(Icons.circle_outlined, size: 16, color: AppColors.amber),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'El Narrador',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.amber,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: AppColors.darkBrown,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.textOnDarkTitle,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserMessage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: Color(0xFF7A2A1A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarratorTyping() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.greenDark,
          child: const Icon(Icons.circle_outlined, size: 16, color: AppColors.amber),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(
            color: AppColors.darkBrown,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('·  ', style: TextStyle(color: Colors.white70, fontSize: 18)),
              Text('·  ', style: TextStyle(color: Colors.white70, fontSize: 18)),
              Text('·', style: TextStyle(color: Colors.white70, fontSize: 18)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.greenDark,
            child: IconButton(
              icon: const Icon(Icons.mic, color: Colors.white, size: 18),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pregunta sobre tu comunidad...',
                hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
                filled: true,
                fillColor: AppColors.cream,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.amber,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
