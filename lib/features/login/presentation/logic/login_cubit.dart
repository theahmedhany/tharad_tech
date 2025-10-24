import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../../../core/utils/constants.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.idle());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const LoginState.loading());

    try {
      final response = await _loginRepo.login(
        LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      response.when(
        success: (loginResponse) async {
          await saveUserToken(loginResponse.data.token);

          emit(LoginState.success(loginResponse));
        },
        failure: (error) {
          emit(LoginState.error(error: AppErrorHandler.getErrorMessage(error)));
        },
      );
    } catch (e) {
      emit(
        const LoginState.error(
          error: "حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.",
        ),
      );
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(
      key: SharedPrefKeys.userToken,
      value: token,
    );

    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
