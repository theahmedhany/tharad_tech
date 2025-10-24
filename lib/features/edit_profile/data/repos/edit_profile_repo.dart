import 'package:dio/dio.dart';
import 'package:tharad_tech/features/edit_profile/data/models/edit_profile_response.dart';

import '../../../../../core/networking/api_network_exceptions.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';

class EditProfileRepo {
  final ApiServices _apiServices;

  EditProfileRepo(this._apiServices);

  Future<ApiResult<EditProfileResponse>> editProfile(FormData formData) async {
    try {
      final response = await _apiServices.editProfile(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
