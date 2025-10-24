import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../home/data/models/user_details_model.dart';
import '../../data/repos/edit_profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _editProfileRepo;
  EditProfileCubit(this._editProfileRepo)
    : super(const EditProfileState.idle());

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  File? profileImage;
  String? initialImageUrl;

  final formKey = GlobalKey<FormState>();

  void initializeWithUserData(UserDetailsModel userData) {
    userNameController.text = userData.data.username;
    emailController.text = userData.data.email;
    initialImageUrl = userData.data.image;
  }

  void setProfileImage(File image) {
    profileImage = image;
    emit(const EditProfileState.profileImageSelected());
  }

  void emitEditProfileStates() async {
    if (!formKey.currentState!.validate()) return;

    if (profileImage == null && initialImageUrl == null) {
      emit(const EditProfileState.error(error: "يرجى اختيار صورة شخصية"));
      return;
    }

    emit(const EditProfileState.loading());

    try {
      final Map<String, dynamic> formDataMap = {
        '_method': 'PUT',
        'username': userNameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'new_password': newPasswordController.text.trim(),
        'new_password_confirmation': confirmNewPasswordController.text.trim(),
      };

      if (profileImage != null) {
        formDataMap['image'] = await MultipartFile.fromFile(
          profileImage!.path,
          filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
      }

      final formData = FormData.fromMap(formDataMap);

      final response = await _editProfileRepo.editProfile(formData);

      response.when(
        success: (editProfileResponse) =>
            emit(EditProfileState.success(editProfileResponse)),
        failure: (error) {
          emit(
            EditProfileState.error(
              error: AppErrorHandler.getErrorMessage(error),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        const EditProfileState.error(
          error: "حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.",
        ),
      );
    }
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    return super.close();
  }
}
