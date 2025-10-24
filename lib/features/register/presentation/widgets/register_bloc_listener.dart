import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../data/models/register_response.dart';
import '../logic/register_cubit.dart';
import '../logic/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (registerResponse) {
            context.pop();
            _showSuccessDialog(context, registerResponse);
          },
          error: (error) {
            context.pop();
            _showErrorDialog(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogHeader: 'حدث خطأ أثناء انشاء الحساب.',
        dialogBody: error,
        dialogIcon: Icons.error_outline,
        dialogColor: context.customAppColors.error,
        press: () => context.pop(),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: context.customAppColors.primary700.withValues(alpha: 0.2),
      builder: (context) => const Center(child: CustomLoading(size: 100)),
    );
  }

  void _showSuccessDialog(
    BuildContext context,
    RegisterResponse registerResponse,
  ) {
    context.pushNamedAndRemoveUntil(
      Routes.otpScreen,
      arguments: {
        'email': registerResponse.data.email,
        'otp': registerResponse.data.otp,
      },
      predicate: (route) => false,
    );

    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogHeader: 'تم انشاء الحساب بنجاح.',
        dialogBody:
            'يجب التحقق من بريدك الإلكتروني باستخدام رمز التحقق المرسل.',
        dialogIcon: Icons.check_circle_outline,
        dialogColor: context.customAppColors.success,
        press: () {
          context.pop();
        },
      ),
    );
  }
}
