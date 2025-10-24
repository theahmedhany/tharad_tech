import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../../core/widgets/profile_image_picker.dart';
import '../../../../core/widgets/show_custom_snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/data/models/user_details_model.dart';
import '../logic/edit_profile_cubit.dart';
import 'edit_profile_bloc_listener.dart';

class EditProfileForm extends StatefulWidget {
  final UserDetailsModel? userData;

  const EditProfileForm({super.key, this.userData});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  String? _initialImageUrl;

  @override
  void initState() {
    super.initState();
    if (widget.userData != null) {
      _initialImageUrl = widget.userData!.data.image;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<EditProfileCubit>().initializeWithUserData(
          widget.userData!,
        );
      });
    }
  }

  void _onImageSelected(File? image) {
    setState(() {
      context.read<EditProfileCubit>().profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Form(
        key: context.read<EditProfileCubit>().formKey,
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
              controller: context.read<EditProfileCubit>().userNameController,
              hintText: S.of(context).registerScreenNameHint,
              validator: (value) {
                final trimmedValue = value?.trim() ?? '';
                if (trimmedValue.isEmpty) {
                  return 'من فضلك أدخل اسم المستخدم.';
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
              controller: context.read<EditProfileCubit>().emailController,
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

            verticalSpace(16),

            ProfileImagePicker(
              onImageSelected: _onImageSelected,
              initialImageUrl: _initialImageUrl,
            ),

            verticalSpace(16),

            Text(
              S.of(context).editProfileOldPassword,
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),

            verticalSpace(8),

            AppTextFormField(
              controller: context.read<EditProfileCubit>().passwordController,
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
                if (value == null || value.isEmpty) {
                  return 'من فضلك أدخل كلمة المرور الحالية.';
                }
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
              controller: context
                  .read<EditProfileCubit>()
                  .newPasswordController,
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
                if (value == null || value.isEmpty) {
                  return 'من فضلك أدخل كلمة المرور الجديدة.';
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
              controller: context
                  .read<EditProfileCubit>()
                  .confirmNewPasswordController,
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
                if (value == null || value.isEmpty) {
                  return 'من فضلك أدخل تأكيد كلمة المرور.';
                }
                if (value !=
                    context
                        .read<EditProfileCubit>()
                        .newPasswordController
                        .text) {
                  return 'كلمة المرور غير متوافقة.';
                }
                return null;
              },
            ),

            verticalSpace(32),

            CustomAppButton(
              onPressed: () {
                validateThenRegister(context);
              },
              buttonText: S.of(context).editProfileSaveButton,
              textStyle: AppTextStyles.font18Bold.copyWith(
                color: context.customAppColors.white,
              ),
            ),

            verticalSpace(16),

            EditProfileBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenRegister(BuildContext context) {
    if (!context.read<EditProfileCubit>().formKey.currentState!.validate()) {
      return;
    }

    final cubit = context.read<EditProfileCubit>();

    if (cubit.profileImage == null && cubit.initialImageUrl == null) {
      showCustomSnackBar(
        context,
        'يرجى اختيار صورة شخصية',
        backgroundColor: context.customAppColors.error,
      );
      return;
    }

    context.read<EditProfileCubit>().emitEditProfileStates();
  }
}
