import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/cache/hive_service.dart';
import '../../../data/repos/logout_repo.dart';
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
        if (!isClosed) {
          emit(const LogoutState.success(null));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            LogoutState.error(error: AppErrorHandler.getErrorMessage(error)),
          );
        }
      },
    );
  }

  Future<void> clearUserData() async {
    await SharedPrefHelper.clearAllSecuredData();
    await SharedPrefHelper.clearAllData();
    await HiveService.clearCachedUserDetails();
  }
}
