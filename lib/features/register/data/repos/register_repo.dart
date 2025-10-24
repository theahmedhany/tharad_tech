import 'package:dio/dio.dart';
import 'package:tharad_tech/features/register/data/models/register_response.dart';

import '../../../../../core/networking/api_network_exceptions.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';

class RegisterRepo {
  final ApiServices _apiServices;

  RegisterRepo(this._apiServices);

  Future<ApiResult<RegisterResponse>> register(FormData formData) async {
    try {
      final response = await _apiServices.register(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
