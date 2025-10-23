import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: context.customAppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: context.customAppColors.grey300.withValues(alpha: 0.5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'معلومات الحساب',
                    style: AppTextStyles.font20Bold.copyWith(
                      color: context.customAppColors.grey900,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: context.customAppColors.success.withValues(
                        alpha: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'نشط',
                      style: AppTextStyles.font12SemiBold.copyWith(
                        color: context.customAppColors.success,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(20),

              // User Information Rows
              _buildInfoRow(
                context,
                icon: Icons.person_outline,
                label: 'اسم المستخدم',
                value: 'thar22',
              ),
              verticalSpace(16),
              _buildInfoRow(
                context,
                icon: Icons.email_outlined,
                label: 'البريد الإلكتروني',
                value: 'Tharad@gmail.com',
              ),
              verticalSpace(16),
              _buildInfoRow(
                context,
                icon: Icons.phone_outlined,
                label: 'رقم الهاتف',
                value: '+966 XX XXX XXXX',
              ),
              verticalSpace(16),
              _buildInfoRow(
                context,
                icon: Icons.calendar_today_outlined,
                label: 'تاريخ الانضمام',
                value: '23 أكتوبر 2025',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: context.customAppColors.primary100,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            icon,
            size: 20.sp,
            color: context.customAppColors.primary700,
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.font12Regular.copyWith(
                  color: context.customAppColors.grey600,
                ),
              ),
              verticalSpace(2),
              Text(
                value,
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: context.customAppColors.grey900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
