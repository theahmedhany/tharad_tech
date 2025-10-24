import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../data/models/otp_response.dart';
import '../../data/repos/otp_repo.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState<OtpResponse>> {
  final OtpRepo otpRepo;

  OtpCubit(this.otpRepo) : super(const Idle());

  void emitVerifyOtp(String email, String otp) async {
    emit(const OtpState.loading());

    var data = await otpRepo.verifyOtp(email, otp);
    data.when(
      success: (OtpResponse otpResponse) {
        emit(OtpState.success(otpResponse));
      },
      failure: (error) {
        emit(OtpState.error(error: AppErrorHandler.getErrorMessage(error)));
      },
    );
  }
}
