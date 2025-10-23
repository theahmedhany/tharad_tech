import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Avatar
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.customAppColors.white,
                width: 4.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.customAppColors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Container(
                color: context.customAppColors.grey200,
                child: Icon(
                  Icons.person,
                  size: 50.sp,
                  color: context.customAppColors.grey600,
                ),
              ),
            ),
          ),
          verticalSpace(12),
          // User Name
          Text(
            'thar22',
            style: AppTextStyles.font24Bold.copyWith(
              color: context.customAppColors.white,
              shadows: [
                Shadow(
                  color: context.customAppColors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          verticalSpace(4),
          // User Email
          Text(
            'Tharad@gmail.com',
            style: AppTextStyles.font14Regular.copyWith(
              color: context.customAppColors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
