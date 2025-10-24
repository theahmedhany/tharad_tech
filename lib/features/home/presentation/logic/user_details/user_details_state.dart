import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_state.freezed.dart';

@freezed
class UserDetailsState<T> with _$UserDetailsState<T> {
  const factory UserDetailsState.idle() = Idle<T>;
  const factory UserDetailsState.loading() = Loading<T>;
  const factory UserDetailsState.success(T data) = Success<T>;
  const factory UserDetailsState.error({required String error}) = Error;
}
