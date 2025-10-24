import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.idle() = Idle<T>;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.profileImageSelected() = ProfileImageSelected;
  const factory RegisterState.success(T data) = Success<T>;
  const factory RegisterState.error({required String error}) = Error;
}
