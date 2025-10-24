import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tharad_tech/features/login/data/models/login_request_body.dart';
import 'package:tharad_tech/features/login/data/models/login_response.dart';
import 'package:tharad_tech/features/register/data/models/register_response.dart';
import 'package:tharad_tech/features/verify_email/data/models/otp_response.dart';

import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // Login API
  @POST(ApiConstants.apiLogin)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  // Register API
  @POST(ApiConstants.apiRegister)
  @MultiPart()
  Future<RegisterResponse> register(@Body() FormData formData);

  // OTP Verify API
  @GET(ApiConstants.apiOtp)
  Future<OtpResponse> verifyOtp(
    @Query('email') String email,
    @Query('otp') String otp,
  );

  // Logout API
  @DELETE(ApiConstants.apiLogout)
  Future<HttpResponse> logout();
}
