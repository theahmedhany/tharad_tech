import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad_tech/core/theme/theme_manager/theme_extensions.dart';

class HomeActionCard extends StatelessWidget {
  const HomeActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: context.customAppColors.grey50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.customAppColors.primary500.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: context.customAppColors.grey300.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 28.sp, color: color),
                ),
                verticalSpace(12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font16Bold.copyWith(
                    color: context.customAppColors.grey900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
