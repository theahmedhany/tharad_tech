import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/features/register/data/repos/register_repo.dart';
import 'package:tharad_tech/features/register/presentation/logic/register_state.dart';

import '../../../../../core/networking/api_error_handler.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.idle());

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  File? profileImage;

  final formKey = GlobalKey<FormState>();

  void setProfileImage(File image) {
    profileImage = image;
    emit(const RegisterState.profileImageSelected());
  }

  void emitSignupStates() async {
    if (!formKey.currentState!.validate()) return;

    if (profileImage == null) {
      emit(const RegisterState.error(error: "يرجى اختيار صورة شخصية"));
      return;
    }

    emit(const RegisterState.loading());

    try {
      final formData = FormData.fromMap({
        'username': userNameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'password_confirmation': confirmPasswordController.text.trim(),
        'image': await MultipartFile.fromFile(
          profileImage!.path,
          filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
        ),
      });

      final response = await _registerRepo.register(formData);

      response.when(
        success: (registerResponse) =>
            emit(RegisterState.success(registerResponse)),
        failure: (error) {
          emit(
            RegisterState.error(error: AppErrorHandler.getErrorMessage(error)),
          );
        },
      );
    } catch (e) {
      emit(
        const RegisterState.error(
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
    confirmPasswordController.dispose();
    return super.close();
  }
}
