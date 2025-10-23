import 'package:flutter/material.dart';
import 'package:tharad_tech/core/routing/routes.dart';
import 'package:tharad_tech/features/login/presentation/screens/logic_screen.dart';
import 'package:tharad_tech/features/register/presentation/screens/register_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Logic Screen
      case Routes.logicScreen:
        return MaterialPageRoute(builder: (_) => const LogicScreen());

      // Register Screen
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return null;
    }
  }
}
