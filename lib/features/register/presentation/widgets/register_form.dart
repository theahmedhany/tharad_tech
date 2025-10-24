import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/profile_image_picker.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  File? profileImage;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onImageSelected(File? image) {
    setState(() {
      profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            controller: _usernameController,
            hintText: S.of(context).registerScreenNameHint,
            validator: (p0) {},
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
            controller: _emailController,
            hintText: S.of(context).registerScreenEmailHint,
            keyboardType: TextInputType.emailAddress,
            validator: (p0) {},
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
            controller: _passwordController,
            hintText: S.of(context).registerScreenPasswordHint,
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

          verticalSpace(24),

          Text(
            S.of(context).registerScreenConfirmPassword,
            style: AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey900,
            ),
          ),

          verticalSpace(8),

          AppTextFormField(
            controller: _confirmPasswordController,
            hintText: S.of(context).registerScreenConfirmPasswordHint,
            isObscureText: !_isConfirmPasswordVisible,
            validator: (p0) {},
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
