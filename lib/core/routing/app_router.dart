import 'package:flutter/material.dart';

import '../../features/auth/domain/entities/app_user.dart';
import '../../features/auth/presentation/pages/login_email_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_email_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';

class AppRoutes {
  AppRoutes._();

  static const onboarding = '/';
  static const register = '/register';
  static const registerEmail = '/register/email';
  static const login = '/login';
  static const loginEmail = '/login/email';
  static const home = '/home';
}

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case AppRoutes.registerEmail:
        return MaterialPageRoute(builder: (_) => const RegisterEmailPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.loginEmail:
        return MaterialPageRoute(builder: (_) => const LoginEmailPage());
      case AppRoutes.home:
        final user = settings.arguments as AppUser;
        return MaterialPageRoute(builder: (_) => HomePage(user: user));
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
    }
  }
}
