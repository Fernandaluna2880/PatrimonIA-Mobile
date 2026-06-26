import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AudioPlayerWidget extends StatelessWidget {
  final double progress;
  final String currentTime;
  final String totalTime;
  final String speed;

  const AudioPlayerWidget({
    super.key,
    this.progress = 0.35,
    this.currentTime = '1:33',
    this.totalTime = '3:42',
    this.speed = '1x',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cream,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.greenDark,
              radius: 22,
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 4,
                      backgroundColor: AppColors.strawYellow,
                      color: AppColors.amber,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(currentTime, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                      Text(totalTime, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              speed,
              style: const TextStyle(
                color: AppColors.textOnLightBody,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
