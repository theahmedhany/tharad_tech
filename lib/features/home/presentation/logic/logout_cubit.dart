import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/features/home/data/repos/logout_repo.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutRepo _logoutRepo;

  LogoutCubit(this._logoutRepo) : super(const LogoutState.idle());

  void emitLogoutStates() async {
    emit(const LogoutState.loading());

    final response = await _logoutRepo.logout();

    response.when(
      success: (_) async {
        await clearUserData();
        emit(const LogoutState.success(null));
      },
      failure: (error) {
        emit(LogoutState.error(error: AppErrorHandler.getErrorMessage(error)));
      },
    );
  }

  Future<void> clearUserData() async {
    await SharedPrefHelper.clearAllSecuredData();
    await SharedPrefHelper.clearAllData();
  }
}
