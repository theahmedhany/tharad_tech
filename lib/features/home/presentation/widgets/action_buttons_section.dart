import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/custom_app_button.dart';

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          // Quick Actions Title
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الإجراءات السريعة',
              style: AppTextStyles.font18Bold.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
          ),
          verticalSpace(16),

          // Edit Profile Button
          _buildActionButton(
            context,
            icon: Icons.edit_outlined,
            label: 'تعديل الملف الشخصي',
            backgroundColor: context.customAppColors.primary600,
            textColor: context.customAppColors.white,
            onTap: () {
              // Navigate to edit profile screen
              context.pushNamed(Routes.editProfileScreen);
            },
          ),
          verticalSpace(12),

          // Settings Button
          _buildActionButton(
            context,
            icon: Icons.settings_outlined,
            label: 'الإعدادات',
            backgroundColor: context.customAppColors.grey100,
            textColor: context.customAppColors.grey900,
            onTap: () {
              // Navigate to settings screen
            },
          ),
          verticalSpace(12),

          // Help & Support Button
          _buildActionButton(
            context,
            icon: Icons.help_outline,
            label: 'المساعدة والدعم',
            backgroundColor: context.customAppColors.grey100,
            textColor: context.customAppColors.grey900,
            onTap: () {
              // Navigate to help screen
            },
          ),
          verticalSpace(24),

          // Logout Button
          CustomAppButton(
            onPressed: () {
              _showLogoutDialog(context);
            },
            buttonText: 'تسجيل الخروج',
            textStyle: AppTextStyles.font18Bold.copyWith(
              color: context.customAppColors.white,
            ),
            backgroundColor: context.customAppColors.error,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: context.customAppColors.grey300.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 24.sp, color: textColor),
            horizontalSpace(12),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.font16SemiBold.copyWith(color: textColor),
              ),
            ),
            Icon(
              Icons.arrow_back_ios,
              size: 16.sp,
              color: textColor.withValues(alpha: 0.7),
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
