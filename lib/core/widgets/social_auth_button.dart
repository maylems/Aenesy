import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum SocialAuthStyle { dark, light, outline }

/// A "Continue with X" button used on the auth landing screens
/// (register/login), styled per provider (Apple/Google/Email).
class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.label,
    required this.icon,
    required this.style,
    required this.onPressed,
  });

  final String label;
  final Widget icon;
  final SocialAuthStyle style;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color background;
    final Color foreground;
    final BoxBorder? border;

    switch (style) {
      case SocialAuthStyle.dark:
        background = Colors.black;
        foreground = Colors.white;
        border = null;
      case SocialAuthStyle.light:
        background = Colors.white;
        foreground = Colors.black;
        border = Border.all(color: const Color(0xFFE2E2E2));
      case SocialAuthStyle.outline:
        background = Colors.white;
        foreground = Colors.black;
        border = Border.all(color: AppColors.limeCard, width: 2);
    }

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: border,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: IconTheme(
                  data: IconThemeData(color: foreground, size: 24),
                  child: Center(child: icon),
                ),
              ),
              const SizedBox(width: 14),
              // Fixed width so every button's row has the same total extent
              // regardless of label length — that's what keeps the icons in
              // the same column once the row is centered as a group.
              SizedBox(
                width: 176,
                child: Text(
                  label,
                  style: TextStyle(
                    color: foreground,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
