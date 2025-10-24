import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/widgets/show_custom_snack_bar.dart';
import 'package:tharad_tech/features/register/presentation/logic/register_cubit.dart';
import 'package:tharad_tech/features/register/presentation/widgets/register_bloc_listener.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../widgets/register_footer.dart';
import '../widgets/register_form.dart';
import '../widgets/register_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(20),

              const RegisterHeader(),

              verticalSpace(40),

              Text(
                S.of(context).registerScreenTitle,
                style: AppTextStyles.font24Bold.copyWith(
                  color: context.customAppColors.grey900,
                ),
              ),

              verticalSpace(32),

              const RegisterForm(),

              verticalSpace(32),

              CustomAppButton(
                buttonText: S.of(context).registerScreenSignUpButton,
                textStyle: AppTextStyles.font18SemiBold.copyWith(
                  color: context.customAppColors.white,
                ),
                onPressed: () {
                  validateThenRegister(context);
                },
                borderRadius: 8.r,
              ),

              verticalSpace(24),

              const RegisterFooter(),

              verticalSpace(24),

              RegisterBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenRegister(BuildContext context) {
    if (!context.read<RegisterCubit>().formKey.currentState!.validate()) {
      return;
    }

    if (context.read<RegisterCubit>().profileImage == null) {
      showCustomSnackBar(
        context,
        'يرجى اختيار صورة شخصية',
        backgroundColor: context.customAppColors.error,
      );
      return;
    }

    context.read<RegisterCubit>().emitSignupStates();
  }
}
