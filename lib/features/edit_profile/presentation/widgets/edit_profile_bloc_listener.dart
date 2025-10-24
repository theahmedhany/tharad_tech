import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../logic/edit_profile_cubit.dart';
import '../logic/edit_profile_state.dart';

class EditProfileBlocListener extends StatelessWidget {
  const EditProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (data) {
            context.pop();
            Navigator.of(context).pop(true);
            _showSuccessDialog(context);
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
        dialogHeader: 'حدث خطأ أثناء تعديل الملف الشخصي.',
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

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogHeader: 'تم تعديل الملف الشخصي بنجاح.',
        dialogBody: 'تم حفظ التغييرات بنجاح.',
        dialogIcon: Icons.check_circle_outline,
        dialogColor: context.customAppColors.success,
        press: () {
          context.pop();
        },
      ),
    );
  }
}
