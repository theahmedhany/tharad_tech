import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tharad_tech/features/login/data/models/login_request_body.dart';
import 'package:tharad_tech/features/login/data/models/login_response.dart';

import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // Login API
  @POST(ApiConstants.apiLogin)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  // Signup API
  // @POST(ApiConstants.apiSignup)
  // @MultiPart()
  // Future<SignupResponse> signup(@Body() FormData formData);

  // Exam Details API
  // @GET(ApiConstants.apiExamDetails)
  // Future<ExamDetailsModel> getExamDetails(@Query('examId') String examId);
}
