import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_texts/app_text_styles.dart';
import '../theme/theme_manager/theme_extensions.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool? isEnabled;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.labelText,
    this.labelStyle,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.prefixIcon,
    this.isEnabled,
    this.maxLength,
    this.keyboardType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnabled,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: context.customAppColors.primary900,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
        labelText: labelText,
        labelStyle:
            labelStyle ??
            AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey700,
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: context.customAppColors.primary900,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: context.customAppColors.grey300,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.customAppColors.error,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.customAppColors.error,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),

        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.customAppColors.grey300,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),

        hintStyle:
            hintStyle ??
            AppTextStyles.font18Regular.copyWith(
              color: context.customAppColors.grey700,
            ),

        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor:
            backgroundColor ??
            context.customAppColors.primary200.withValues(alpha: 0.5),
        filled: true,
        prefixIcon: prefixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font18Regular.copyWith(
        color: context.customAppColors.grey900,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
