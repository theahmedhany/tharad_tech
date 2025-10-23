import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../theme/app_texts/app_text_styles.dart';
import '../theme/theme_manager/theme_extensions.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      action: SnackBarAction(
        label: S.of(context).showCustomSnackBarOk,
        textColor: context.customAppColors.grey0,
        onPressed: () {},
      ),
      backgroundColor: backgroundColor ?? context.customAppColors.primary700,
      content: Text(
        message,
        style: AppTextStyles.font14SemiBold.copyWith(
          color: context.customAppColors.grey0,
        ),
      ),
    ),
  );
}
