import 'package:flutter/material.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/illustration_card.dart';
import '../widgets/message_card.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.illustrationBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            children: [
              const Expanded(flex: 58, child: IllustrationCard()),
              const SizedBox(height: 13),
              Expanded(
                flex: 42,
                child: MessageCard(
                  onNext: () => Navigator.of(context)
                      .pushNamed(AppRoutes.register),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
