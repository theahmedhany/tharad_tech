import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/profile_image_picker.dart';
import '../../../../generated/l10n.dart';
import '../logic/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _onImageSelected(File? image) {
    setState(() {
      context.read<RegisterCubit>().profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileImagePicker(onImageSelected: _onImageSelected),

          verticalSpace(24),

          Text(
            S.of(context).registerScreenName,
            style: AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey900,
            ),
          ),

          verticalSpace(8),

          AppTextFormField(
            controller: context.read<RegisterCubit>().userNameController,
            hintText: S.of(context).registerScreenNameHint,
            validator: (value) {
              final trimmedValue = value?.trim() ?? '';
              if (trimmedValue.isEmpty) {
                return 'من فضلك أدخل اسم المستخدم.';
              }
              return null;
            },
          ),

          verticalSpace(24),

          Text(
            S.of(context).registerScreenEmail,
            style: AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey900,
            ),
          ),

          verticalSpace(8),

          AppTextFormField(
            controller: context.read<RegisterCubit>().emailController,
            hintText: S.of(context).registerScreenEmailHint,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              final trimmedValue = value?.trim() ?? '';
              if (trimmedValue.isEmpty ||
                  !AppRegex.isEmailValid(trimmedValue)) {
                return 'من فضلك أدخل البريد الإلكتروني.';
              }
              return null;
            },
          ),

          verticalSpace(24),

          Text(
            S.of(context).registerScreenPassword,
            style: AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey900,
            ),
          ),

          verticalSpace(8),

          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            hintText: S.of(context).registerScreenPasswordHint,
            isObscureText: !_isPasswordVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك أدخل كلمة المرور.';
              }
              if (!AppRegex.hasLowerCase(value)) {
                return 'يحب أن تحتوي كلمة المرور علي حروف صغيرة.';
              }
              if (!AppRegex.hasUpperCase(value)) {
                return 'يجب أن تحتوي كلمة المرور علي حروف كبيرة.';
              }
              if (!AppRegex.hasNumber(value)) {
                return 'يجب أن تحتوي كلمة المرور علي رقم.';
              }
              if (!AppRegex.hasSpecialCharacter(value)) {
                return 'يجب أن تحتوي كلمة المرور علي حرف خاص.';
              }
              if (!AppRegex.hasMinLength(value)) {
                return 'يجب ألا تقل كلمة المرور عن 8 أحرف.';
              }
              return null;
            },
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

          verticalSpace(24),

          Text(
            S.of(context).registerScreenConfirmPassword,
            style: AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey900,
            ),
          ),

          verticalSpace(8),

          AppTextFormField(
            controller: context.read<RegisterCubit>().confirmPasswordController,
            hintText: S.of(context).registerScreenConfirmPasswordHint,
            isObscureText: !_isConfirmPasswordVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك أدخل تأكيد كلمة المرور.';
              }
              if (value !=
                  context.read<RegisterCubit>().passwordController.text) {
                return 'كلمة المرور غير متوافقة.';
              }
              return null;
            },
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              icon: Icon(
                _isConfirmPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: context.customAppColors.grey700,
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
