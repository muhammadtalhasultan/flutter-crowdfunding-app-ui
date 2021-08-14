import 'package:flutter/material.dart';

import '../models/result.dart';
import '../models/urgent.dart';
import '../ui/screens/auth/forgetpw_screen.dart';
import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/auth/signup_screen.dart';
import '../ui/screens/initial/onboarding_screen.dart';
import '../ui/screens/initial/spash_screen.dart';
import '../ui/screens/tab/charity/start_charity_screen.dart';
import '../ui/screens/tab/charity/step_four_screen.dart';
import '../ui/screens/tab/charity/step_one_screen.dart';
import '../ui/screens/tab/charity/step_three_screen.dart';
import '../ui/screens/tab/charity/step_two_screen.dart';
import '../ui/screens/tab/home/detail_screen.dart';
import '../ui/screens/tab/home/donation_screen.dart';
import '../ui/screens/tab/search/result_screen.dart';
import '../ui/screens/tab/tab_screen.dart';

class RouteGenerator {
  static const String main = '/tab_screen';
  static const String forgetPw = '/forget_pw_screen';
  static const String login = '/login_screen';
  static const String onboarding = '/onboarding_screen';
  static const String splash = '/';
  static const String signup = '/signup_screen';
  static const String details = '/details_screen';
  static const String donation = '/donation_screen';
  static const String result = '/result_screen';
  static const String startCharity = '/start_charity_screen';
  static const String stepOne = '/step_one_screen';
  static const String stepTwo = '/step_two_screen';
  static const String stepThree = '/step_three_screen';
  static const String stepFour = '/step_four_screen';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case signup:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case forgetPw:
        return MaterialPageRoute(
          builder: (_) => const ForgetPwScreen(),
        );
      case main:
        return MaterialPageRoute(
          builder: (_) => const TabScreen(),
        );
      case details:
        return MaterialPageRoute(
          builder: (_) => DetailScreen(settings.arguments as Urgent),
        );
      case donation:
        return MaterialPageRoute(
          builder: (_) => DonationScreen(settings.arguments as String),
        );
      case result:
        return MaterialPageRoute(
          builder: (_) => ResultScreen(settings.arguments as Result),
        );
      case startCharity:
        return MaterialPageRoute(
          builder: (_) => StartCharityScreen(),
        );
      case stepOne:
        return MaterialPageRoute(
          builder: (_) => StepOneScreen(),
        );
      case stepTwo:
        return MaterialPageRoute(
          builder: (_) => StepTwoScreen(),
        );
      case stepThree:
        return MaterialPageRoute(
          builder: (_) => StepThreeScreen(),
        );
      case stepFour:
        return MaterialPageRoute(
          builder: (_) => StepFourScreen(),
        );
      default:
        throw RouteException('Route not found');
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
