import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/edit_profile/presentation/logic/edit_profile_cubit.dart';
import '../../features/edit_profile/presentation/screens/edit_profile_screen.dart';
import '../../features/home/data/models/user_details_model.dart';
import '../../features/home/data/repos/user_details_repo.dart';
import '../../features/home/presentation/logic/user_details/user_details_cubit.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/login/presentation/logic/login_cubit.dart';
import '../../features/login/presentation/screens/login_screen.dart';
import '../../features/register/presentation/logic/register_cubit.dart';
import '../../features/register/presentation/screens/register_screen.dart';
import '../../features/verify_email/data/repos/otp_repo.dart';
import '../../features/verify_email/presentation/logic/otp_cubit.dart';
import '../../features/verify_email/presentation/screens/otp_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );

      // OTP Screen
      case Routes.otpScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OtpCubit(getIt<OtpRepo>()),
            child: OtpScreen(email: args?['email'], otp: args?['otp']),
          ),
        );

      // Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                UserDetailsCubit(getIt<UserDetailsRepo>())
                  ..emitGetUserDetails(),
            child: const HomeScreen(),
          ),
        );

      // Edit Profile Screen
      case Routes.editProfileScreen:
        final userData = settings.arguments as UserDetailsModel?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditProfileCubit>(),
            child: EditProfileScreen(userData: userData),
          ),
        );

      default:
        return null;
    }
  }
}
