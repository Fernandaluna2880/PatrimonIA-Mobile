import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.textOnLightTitle),
        title: const Text(
          'Notificaciones',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.textOnLightTitle,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildSectionHeader('Hoy'),
          _buildNotificationItem(
            icon: Icons.auto_stories,
            title: 'Nueva memoria agregada en tu comunidad',
            time: 'Hace 2h',
            dotColor: Colors.blueAccent,
            isUnread: true,
          ),
          _buildNotificationItem(
            icon: Icons.chat_bubble_outline,
            title: 'El Narrador tiene nuevas historias para ti',
            time: 'Hace 5h',
            dotColor: AppColors.amber,
            isUnread: true,
          ),
          _buildSectionHeader('Esta semana'),
          _buildNotificationItem(
            icon: Icons.verified_user_outlined,
            title: 'Tu testimonio fue aprobado al corpus',
            time: 'Ayer',
            dotColor: AppColors.greenForest,
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: AppColors.textMuted,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String time,
    required Color dotColor,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isUnread ? Border.all(color: dotColor.withValues(alpha: 0.5), width: 1) : null,
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 4, backgroundColor: dotColor),
          const SizedBox(width: 12),
          Icon(icon, color: AppColors.textOnLightTitle, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.textOnLightTitle,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
