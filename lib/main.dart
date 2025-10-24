import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/di/dependency_injection.dart';
import 'package:tharad_tech/core/helpers/shared_pref_helper.dart';
import 'package:tharad_tech/core/routing/app_router.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefHelper.init();
  await initGetIt();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await checkIfLoggedInUser();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return MyApp(appRouter: AppRouter());
      },
    ),
  );
}

// checkIfLoggedInUser() async {
//   String? userToken = await SharedPrefHelper.getSecuredString(
//     key: SharedPrefKeys.userToken,
//   );

//   if (userToken != null && userToken.isNotEmpty) {
//     isLoggedInUser = true;
//   } else {
//     isLoggedInUser = false;
//   }
// }
