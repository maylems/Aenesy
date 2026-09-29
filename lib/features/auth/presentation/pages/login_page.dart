import 'package:flutter/material.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/google_glyph.dart';
import '../../../../core/widgets/social_auth_button.dart';
import '../../../../core/widgets/svg_icon.dart';
import '../widgets/privacy_notice.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _showComingSoon(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Log in with $provider — coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text('Welcome back', style: AppTextStyles.pageTitle),
              const SizedBox(height: 8),
              Text(
                'Log in to keep tracking your deliveries with Aenesy.',
                style: AppTextStyles.subtitle,
              ),
              const Spacer(),
              SocialAuthButton(
                label: 'Continue with Apple',
                icon: const SvgIcon(
                  'assets/icons/apple.svg',
                  color: Colors.white,
                  size: 24,
                ),
                style: SocialAuthStyle.dark,
                onPressed: () => _showComingSoon(context, 'Apple'),
              ),
              const SizedBox(height: 14),
              SocialAuthButton(
                label: 'Continue with Google',
                icon: const GoogleGlyph(),
                style: SocialAuthStyle.light,
                onPressed: () => _showComingSoon(context, 'Google'),
              ),
              const SizedBox(height: 14),
              SocialAuthButton(
                label: 'Continue with Email',
                icon: const SvgIcon(
                  'assets/icons/email.svg',
                  color: Colors.black,
                  size: 28,
                ),
                style: SocialAuthStyle.outline,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.loginEmail),
              ),
              const SizedBox(height: 24),
              const PrivacyNotice(),
              const SizedBox(height: 20),
              Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.register),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyles.subtitle,
                          children: [
                            const TextSpan(text: "Don't have an account? "),
                            TextSpan(
                              text: 'Register',
                              style: AppTextStyles.subtitle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
