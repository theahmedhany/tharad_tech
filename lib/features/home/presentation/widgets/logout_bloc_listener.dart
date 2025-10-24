import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/features/home/presentation/logic/logout/logout_cubit.dart';
import 'package:tharad_tech/features/home/presentation/logic/logout/logout_state.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_loading.dart';

class LogoutBlocListener extends StatelessWidget {
  const LogoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (_) {
            context.pop();
            context.pop();
            _navigateToLogin(context);
          },
          error: (error) {
            context.pop();
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
        dialogHeader: 'حدث خطأ أثناء تسجيل الخروج.',
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

  void _navigateToLogin(BuildContext context) {
    context.pushNamedAndRemoveUntil(
      Routes.loginScreen,
      predicate: (route) => false,
    );
  }
}
