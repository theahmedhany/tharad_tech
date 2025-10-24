import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_state.freezed.dart';

@freezed
class LogoutState<T> with _$LogoutState<T> {
  const factory LogoutState.idle() = Idle<T>;
  const factory LogoutState.loading() = Loading<T>;
  const factory LogoutState.success(T data) = Success<T>;
  const factory LogoutState.error({required String error}) = Error;
}
