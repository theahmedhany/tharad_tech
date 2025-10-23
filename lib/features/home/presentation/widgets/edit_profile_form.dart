import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_app_button.dart';
import 'profile_image_section.dart';

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

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Username Field
            Text(
              'اسم المستخدم',
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _usernameController,
              hintText: 'thar22',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال اسم المستخدم';
                }
                return null;
              },
            ),
            verticalSpace(16),

            // Email Field
            Text(
              'البريد الالكتروني',
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _emailController,
              hintText: 'Tharad@gmail.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال البريد الإلكتروني';
                }
                return null;
              },
            ),
            verticalSpace(16),

            // Profile Image Section
            Text(
              'الصورة الشخصية',
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(8),
            const ProfileImageSection(),
            verticalSpace(16),

            // Current Password Field
            Text(
              'كلمة المرور الحالية',
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _currentPasswordController,
              hintText: '••••••••••',
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

            // New Password Field
            Text(
              'كلمة المرور الجديدة',
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _newPasswordController,
              hintText: '••••••••••',
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

            // Confirm Password Field
            Text(
              'تأكيد كلمة المرور الجديدة',
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _confirmPasswordController,
              hintText: '••••••••••',
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

            // Save Button
            CustomAppButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Handle save changes
                  Navigator.of(context).pop();
                }
              },
              buttonText: 'حفظ التغييرات',
              textStyle: AppTextStyles.font18Bold.copyWith(
                color: context.customAppColors.white,
              ),
            ),
            verticalSpace(16),

            // Logout Link
            Center(
              child: GestureDetector(
                onTap: () {
                  _showLogoutDialog(context);
                },
                child: Text(
                  'تسجيل الخروج',
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: context.customAppColors.error,
                    decoration: TextDecoration.underline,
                    decorationColor: context.customAppColors.error,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            'تأكيد تسجيل الخروج',
            style: AppTextStyles.font20Bold.copyWith(
              color: context.customAppColors.grey900,
            ),
            textAlign: TextAlign.right,
          ),
          content: Text(
            'هل أنت متأكد من رغبتك في تسجيل الخروج من حسابك؟',
            style: AppTextStyles.font16Regular.copyWith(
              color: context.customAppColors.grey700,
            ),
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'إلغاء',
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: context.customAppColors.grey700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                // Handle logout logic
                // e.g., clear shared preferences, navigate to login
              },
              child: Text(
                'تسجيل الخروج',
                style: AppTextStyles.font16Bold.copyWith(
                  color: context.customAppColors.error,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
