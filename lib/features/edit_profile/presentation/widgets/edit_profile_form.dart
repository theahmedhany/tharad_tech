import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/widgets/profile_image_picker.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_app_button.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'thar22');
  final _emailController = TextEditingController(text: 'Tharad@gmail.com');
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  File? profileImage;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),

            Text(
              S.of(context).registerScreenName,
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),

            verticalSpace(8),

            AppTextFormField(
              controller: _usernameController,
              hintText: S.of(context).registerScreenNameHint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).registerScreenNameHint;
                }
                return null;
              },
            ),

            verticalSpace(16),

            Text(
              S.of(context).registerScreenEmail,
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),

            verticalSpace(8),

            AppTextFormField(
              controller: _emailController,
              hintText: S.of(context).registerScreenEmailHint,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).registerScreenEmailHint;
                }
                return null;
              },
            ),

            verticalSpace(16),

            ProfileImagePicker(onImageSelected: _onImageSelected),

            verticalSpace(16),

            Text(
              S.of(context).editProfileOldPassword,
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),

            verticalSpace(8),

            AppTextFormField(
              controller: _currentPasswordController,
              hintText: S.of(context).editProfileOldPasswordHint,
              isObscureText: _obscureCurrentPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureCurrentPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: context.customAppColors.grey600,
                  size: 24.sp,
                ),
                onPressed: () {
                  setState(() {
                    _obscureCurrentPassword = !_obscureCurrentPassword;
                  });
                },
              ),
              validator: (value) {
                return null;
              },
            ),
            verticalSpace(16),

            Text(
              S.of(context).editProfileNewPassword,
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _newPasswordController,
              hintText: S.of(context).editProfileNewPasswordHint,
              isObscureText: _obscureNewPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureNewPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: context.customAppColors.grey600,
                  size: 24.sp,
                ),
                onPressed: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
              ),
              validator: (value) {
                return null;
              },
            ),

            verticalSpace(16),

            Text(
              S.of(context).editProfileConfirmPassword,
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _confirmPasswordController,
              hintText: S.of(context).editProfileConfirmPasswordHint,
              isObscureText: _obscureConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: context.customAppColors.grey600,
                  size: 24.sp,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              validator: (value) {
                return null;
              },
            ),

            verticalSpace(32),

            CustomAppButton(
              onPressed: () {},
              buttonText: S.of(context).editProfileSaveButton,
              textStyle: AppTextStyles.font18Bold.copyWith(
                color: context.customAppColors.white,
              ),
            ),

            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
