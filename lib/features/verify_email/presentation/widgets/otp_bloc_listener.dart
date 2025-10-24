import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/features/verify_email/data/models/otp_response.dart';
import 'package:tharad_tech/features/verify_email/presentation/logic/otp_cubit.dart';
import 'package:tharad_tech/features/verify_email/presentation/logic/otp_state.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_loading.dart';

class OtpBlocListener extends StatelessWidget {
  const OtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (otpResponse) {
            context.pop();
            _showSuccessDialog(context, otpResponse);
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
        dialogHeader: 'حدث خطأ أثناء التحقق من الرمز.',
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

  void _showSuccessDialog(BuildContext context, OtpResponse otpResponse) {
    context.pushNamedAndRemoveUntil(
      Routes.loginScreen,
      predicate: (route) => false,
    );

    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogHeader: 'تم التحقق بنجاح.',
        dialogBody: 'تم تفعيل حسابك بنجاح ، يمكنك تسجيل الدخول الآن.',
        dialogIcon: Icons.check_circle_outline,
        dialogColor: context.customAppColors.success,
        press: () {
          context.pop();
        },
      ),
    );
  }
}
