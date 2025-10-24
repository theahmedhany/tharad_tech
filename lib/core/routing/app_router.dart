import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/core/di/dependency_injection.dart';
import 'package:tharad_tech/core/routing/routes.dart';
import 'package:tharad_tech/features/edit_profile/presentation/screens/edit_profile_screen.dart';
import 'package:tharad_tech/features/home/presentation/screens/home_screen.dart';
import 'package:tharad_tech/features/login/presentation/logic/login_cubit.dart';
import 'package:tharad_tech/features/login/presentation/screens/login_screen.dart';
import 'package:tharad_tech/features/register/presentation/screens/register_screen.dart';
import 'package:tharad_tech/features/verify_email/presentation/screens/otp_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

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
