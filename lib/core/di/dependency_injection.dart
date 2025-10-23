// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';

// import '../networking/api_services.dart';
// import '../networking/dio_factory.dart';

// final getIt = GetIt.instance;

// Future<void> initGetIt() async {
//   // Dio & ApiService
//   Dio dio = DioFactory.getDio();
//   getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

//   // Login
//   // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
//   // getIt.registerFactory<LoginCubit>(
//   //   () => LoginCubit(
//   //     getIt<LoginRepo>(),
//   //     getIt<RegisterNotificationDeviceCubit>(),
//   //   ),
//   // );
// }
