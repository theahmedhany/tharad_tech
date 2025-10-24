import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad_tech/core/theme/theme_manager/theme_extensions.dart';
import 'package:tharad_tech/core/widgets/custom_app_button.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../helpers/spacing.dart';

class CustomAlertDialog extends StatelessWidget {
  final String dialogHeader;
  final String dialogBody;
  final Color dialogColor;
  final IconData dialogIcon;
  final VoidCallback press;

  const CustomAlertDialog({
    super.key,
    required this.dialogIcon,
    required this.dialogHeader,
    required this.dialogBody,
    required this.dialogColor,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.customAppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: dialogColor.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12.r),
              child: Container(
                decoration: BoxDecoration(
                  color: dialogColor.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(10.r),
                child: Center(
                  child: Icon(
                    dialogIcon,
                    size: 30.r,
                    color: context.customAppColors.grey0,
                  ),
                ),
              ),
            ),
            verticalSpace(20),
            Text(
              dialogHeader,
              style: AppTextStyles.font18Bold.copyWith(
                color: context.customAppColors.grey900,
              ),
            ),
            verticalSpace(14),
            Text(
              dialogBody,
              textAlign: TextAlign.center,
              style: AppTextStyles.font14Regular.copyWith(
                color: context.customAppColors.grey700,
              ),
            ),
            verticalSpace(26),
            CustomAppButton(
              buttonText: S.of(context).showCustomSnackBarOk,
              backgroundColor: dialogColor,
              textStyle: AppTextStyles.font14Regular.copyWith(
                color: context.customAppColors.grey0,
              ),
              onPressed: press,
            ),
          ],
        ),
      ),
    );
  }
}
