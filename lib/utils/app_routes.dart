import 'package:flutter/material.dart';
import 'package:movies/onboarding_screen/onboarding.dart';
import 'package:movies/screens/home/home.dart';
import 'package:movies/screens/login/login_screen.dart';
import 'package:movies/screens/register/register.dart';

abstract final class AppRoutes {
  static Route get onboardingScreen {
    return MaterialPageRoute(builder: (_) => const OnboardingScreen());
  }

  static Route get register {
    return MaterialPageRoute(builder: (_) => const Register());
  }

  static Route get login {
    return MaterialPageRoute(builder: (_) => LoginScreen());
  }

  static Route get home {
    return MaterialPageRoute(builder: (_) => Home());
  }
}
