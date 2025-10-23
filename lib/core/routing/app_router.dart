import 'package:flutter/material.dart';
import 'package:tharad_tech/core/routing/routes.dart';
import 'package:tharad_tech/features/home/presentation/screens/edit_profile_screen.dart';
import 'package:tharad_tech/features/home/presentation/screens/home_screen.dart';
import 'package:tharad_tech/features/login/presentation/screens/logic_screen.dart';
import 'package:tharad_tech/features/register/presentation/screens/register_screen.dart';
import 'package:tharad_tech/features/verify_email/presentation/screens/otp_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Logic Screen
      case Routes.logicScreen:
        return MaterialPageRoute(builder: (_) => const LogicScreen());

      // Register Screen
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      // OTP Screen
      case Routes.otpScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OtpScreen(email: email));

      // Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // Edit Profile Screen
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      default:
        return null;
    }
  }
}
