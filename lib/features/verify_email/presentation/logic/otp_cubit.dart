import 'package:bloc/bloc.dart';
import 'package:tharad_tech/features/verify_email/data/models/otp_response.dart';
import 'package:tharad_tech/features/verify_email/data/repos/otp_repo.dart';
import 'package:tharad_tech/features/verify_email/presentation/logic/otp_state.dart';

import '../../../../core/networking/api_error_handler.dart';

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
