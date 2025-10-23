import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme_manager/theme_extensions.dart';

class CustomAppButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const CustomAppButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth?.w ?? double.maxFinite,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.customAppColors.primary700,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        gradient: backgroundColor == null
            ? context.customAppColors.primaryGradient
            : null,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 14.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
          child: Center(child: Text(buttonText, style: textStyle)),
        ),
      ),
    );
  }
}
