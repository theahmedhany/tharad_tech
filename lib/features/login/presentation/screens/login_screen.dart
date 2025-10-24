import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/features/login/presentation/logic/login_cubit.dart';
import 'package:tharad_tech/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../widgets/login_footer.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(40),

              const LoginHeader(),

              verticalSpace(40),

              Text(
                S.of(context).loginScreenTitle,
                style: AppTextStyles.font24Bold.copyWith(
                  color: context.customAppColors.grey900,
                ),
              ),

              verticalSpace(32),

              const LoginForm(),

              verticalSpace(32),

              CustomAppButton(
                buttonText: S.of(context).loginScreenLoginButton,
                textStyle: AppTextStyles.font18SemiBold.copyWith(
                  color: context.customAppColors.white,
                ),
                onPressed: () {
                  validateThenDoLogin(context);
                },
                borderRadius: 8.r,
              ),

              verticalSpace(24),

              const LoginFooter(),

              verticalSpace(24),

              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
