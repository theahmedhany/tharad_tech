import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tharad_tech/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:tharad_tech/features/edit_profile/presentation/logic/edit_profile_cubit.dart';
import 'package:tharad_tech/features/home/data/repos/logout_repo.dart';
import 'package:tharad_tech/features/home/data/repos/user_details_repo.dart';
import 'package:tharad_tech/features/home/presentation/logic/logout/logout_cubit.dart';
import 'package:tharad_tech/features/home/presentation/logic/user_details/user_details_cubit.dart';
import 'package:tharad_tech/features/login/data/repos/login_repo.dart';
import 'package:tharad_tech/features/login/presentation/logic/login_cubit.dart';
import 'package:tharad_tech/features/register/data/repos/register_repo.dart';
import 'package:tharad_tech/features/register/presentation/logic/register_cubit.dart';
import 'package:tharad_tech/features/verify_email/data/repos/otp_repo.dart';
import 'package:tharad_tech/features/verify_email/presentation/logic/otp_cubit.dart';

import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // Register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );

  // OTP Verification
  getIt.registerLazySingleton<OtpRepo>(() => OtpRepo(getIt()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt<OtpRepo>()));

  // Logout
  getIt.registerLazySingleton<LogoutRepo>(() => LogoutRepo(getIt()));
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt<LogoutRepo>()));

  // User Details
  getIt.registerLazySingleton<UserDetailsRepo>(() => UserDetailsRepo(getIt()));
  getIt.registerFactory<UserDetailsCubit>(
    () => UserDetailsCubit(getIt<UserDetailsRepo>()),
  );

  // Edit Profile
  getIt.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(getIt()));
  getIt.registerFactory<EditProfileCubit>(
    () => EditProfileCubit(getIt<EditProfileRepo>()),
  );
}
