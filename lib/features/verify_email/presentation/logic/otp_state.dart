import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState<T> with _$OtpState<T> {
  const factory OtpState.idle() = Idle<T>;
  const factory OtpState.loading() = Loading<T>;
  const factory OtpState.success(T data) = Success<T>;
  const factory OtpState.error({required String error}) = Error;
}
