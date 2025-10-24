import 'package:tharad_tech/features/verify_email/data/models/otp_response.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class OtpRepo {
  final ApiServices apiServices;

  OtpRepo(this.apiServices);

  Future<ApiResult<OtpResponse>> verifyOtp(String email, String otp) async {
    try {
      var response = await apiServices.verifyOtp(email, otp);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
