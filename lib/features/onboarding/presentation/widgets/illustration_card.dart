import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'exhaust_smoke.dart';

class IllustrationCard extends StatelessWidget {
  const IllustrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.illustrationBg,
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.antiAlias,
      child: const Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
          Positioned.fill(child: ExhaustSmoke()),
        ],
      ),
    );
  }
}
