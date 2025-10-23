import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).loginScreenEmail,
            style: AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey900,
            ),
          ),

          verticalSpace(8),

          AppTextFormField(
            controller: _emailController,
            hintText: S.of(context).loginScreenEmailHint,
            keyboardType: TextInputType.emailAddress,
            validator: (p0) {},
          ),

          verticalSpace(24),

          Text(
            S.of(context).loginScreenPassword,
            style: AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey900,
            ),
          ),

          verticalSpace(8),

          AppTextFormField(
            controller: _passwordController,
            hintText: S.of(context).loginScreenPasswordHint,
            isObscureText: !_isPasswordVisible,
            validator: (p0) {},
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: context.customAppColors.grey700,
                size: 24.sp,
              ),
            ),
          ),

          verticalSpace(16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        side: BorderSide(
                          color: context.customAppColors.grey300,
                          width: 1.5.w,
                        ),
                        activeColor: context.customAppColors.primary700,
                      ),
                    ),
                    horizontalSpace(8),
                    Flexible(
                      child: Text(
                        S.of(context).loginScreenRememberMe,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.font16Regular.copyWith(
                          color: context.customAppColors.grey700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to forgot password screen.
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      S.of(context).loginScreenForgotPassword,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: AppTextStyles.font16Regular.copyWith(
                        color: context.customAppColors.primary700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
