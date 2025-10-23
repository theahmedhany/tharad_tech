import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/shared_pref_helper.dart';
import '../utils/constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static Dio? uploadDio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Dio getUploadDio() {
    if (uploadDio == null) {
      uploadDio = Dio();
      uploadDio!
        ..options.connectTimeout = null
        ..options.receiveTimeout = null
        ..options.sendTimeout = null;
      addDioHeadersToUploadDio();
      addDioInterceptorToUploadDio();
      return uploadDio!;
    } else {
      return uploadDio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.userToken)}',
    };
  }

  static void addDioHeadersToUploadDio() async {
    uploadDio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.userToken)}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
    uploadDio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        enabled: kDebugMode,
      ),
    );
  }

  static void addDioInterceptorToUploadDio() {
    uploadDio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        enabled: kDebugMode,
      ),
    );
  }
}
