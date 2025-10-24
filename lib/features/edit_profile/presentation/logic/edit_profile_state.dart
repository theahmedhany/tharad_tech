import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState<T> with _$EditProfileState<T> {
  const factory EditProfileState.idle() = Idle<T>;
  const factory EditProfileState.loading() = Loading;
  const factory EditProfileState.profileImageSelected() = ProfileImageSelected;
  const factory EditProfileState.success(T data) = Success<T>;
  const factory EditProfileState.error({required String error}) = Error;
}
