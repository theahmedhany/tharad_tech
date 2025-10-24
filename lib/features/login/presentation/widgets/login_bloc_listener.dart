import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/core/widgets/custom_alert_dialog.dart';
import 'package:tharad_tech/features/login/presentation/logic/login_cubit.dart';
import 'package:tharad_tech/features/login/presentation/logic/login_state.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../../core/widgets/custom_loading.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (loginResponse) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (route) => false,
            );
          },
          error: (error) => _showErrorDialog(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogHeader: 'حدث خطأ أثناء تسجيل الدخول.',
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
}
