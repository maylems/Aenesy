import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'long_arrow_painter.dart';

/// The lime, pill-shaped button with a long-arrow icon used as the primary
/// call to action (onboarding "next", etc.).
class PillArrowButton extends StatelessWidget {
  const PillArrowButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.limeCard,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: onPressed,
        child: Container(
          width: 110,
          height: 56,
          alignment: Alignment.center,
          child: const SizedBox(
            width: 56,
            height: 24,
            child: CustomPaint(painter: LongArrowPainter()),
          ),
        ),
      ),
    );
  }
}
