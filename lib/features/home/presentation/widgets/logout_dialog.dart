import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/extensions.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad_tech/core/theme/theme_manager/theme_extensions.dart';
import 'package:tharad_tech/core/widgets/custom_app_button.dart';
import 'package:tharad_tech/generated/l10n.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: context.customAppColors.background,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64.w,
              height: 64.h,
              decoration: BoxDecoration(
                color: context.customAppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                size: 32.sp,
                color: context.customAppColors.error,
              ),
            ),

            verticalSpace(20),

            Text(
              S.of(context).homeLogoutConfirmationTitle,
              style: AppTextStyles.font20Bold.copyWith(
                color: context.customAppColors.grey900,
              ),
              textAlign: TextAlign.center,
            ),

            verticalSpace(12),

            Text(
              S.of(context).homeScreenLogoutConfirmation,
              style: AppTextStyles.font16Regular.copyWith(
                color: context.customAppColors.grey700,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            verticalSpace(28),

            Row(
              children: [
                Expanded(
                  child: CustomAppButton(
                    buttonText: S.of(context).homeScreenCancel,
                    textStyle: AppTextStyles.font16Bold.copyWith(
                      color: context.customAppColors.grey0,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),

                horizontalSpace(12),

                Expanded(
                  child: CustomAppButton(
                    buttonText: S.of(context).homeScreenLogout,
                    backgroundColor: context.customAppColors.error,
                    textStyle: AppTextStyles.font16Bold.copyWith(
                      color: context.customAppColors.grey0,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
