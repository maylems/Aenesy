import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Full-width black pill button used for form submissions (register, login).
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isLoading ? Colors.black54 : Colors.black,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: isLoading ? null : onPressed,
        child: Container(
          width: double.infinity,
          height: 56,
          alignment: Alignment.center,
          child: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    valueColor: AlwaysStoppedAnimation(AppColors.limeCard),
                  ),
                )
              : Text(
                  label,
                  style: AppTextStyles.buttonLabel.copyWith(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
