import 'package:flutter/material.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views/email_verification_view.dart';
import 'package:movies_app/presentation/auth/forget_password/views/forget_password_view.dart';
import 'package:movies_app/presentation/auth/login/views/login_view.dart';
import 'package:movies_app/presentation/auth/signup/views/signup_view.dart';
import 'package:movies_app/presentation/onboarding/views/onboarding_view.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case RouteNames.emailVerification:
        return MaterialPageRoute(builder: (_) => const EmailVerificationView());
      case RouteNames.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
    }
    return null;
  }
}
