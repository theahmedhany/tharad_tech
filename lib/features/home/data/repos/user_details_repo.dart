import 'package:tharad_tech/features/home/data/models/user_details_model.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class UserDetailsRepo {
  final ApiServices apiServices;

  UserDetailsRepo(this.apiServices);

  Future<ApiResult<UserDetailsModel>> getUserDetails() async {
    try {
      var response = await apiServices.userDetails();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
