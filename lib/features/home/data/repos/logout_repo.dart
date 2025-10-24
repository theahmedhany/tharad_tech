import '../../../../../core/networking/api_network_exceptions.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';

class LogoutRepo {
  final ApiServices _apiServices;

  LogoutRepo(this._apiServices);

  Future<ApiResult<void>> logout() async {
    try {
      await _apiServices.logout();
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
