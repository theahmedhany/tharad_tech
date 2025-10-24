import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_cubit.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../generated/l10n.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  // Handle theme selection and close the bottom sheet
  void _selectTheme(BuildContext context, ThemeMode themeMode) {
    context.read<ThemeCubit>().state == themeMode
        ? null
        : context.read<ThemeCubit>().updateTheme(themeMode);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Get current theme mode from ThemeCubit
    final currentTheme = context.watch<ThemeCubit>().state;

    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      child: Container(
        decoration: BoxDecoration(
          color: context.customAppColors.grey50,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.h, bottom: 20.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: context.customAppColors.grey300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Icon(
                    Icons.color_lens_rounded,
                    size: 24.sp,
                    color: context.customAppColors.primary700,
                  ),
                  horizontalSpace(12),
                  Text(
                    S.of(context).homeThemeBottomSheet,
                    style: AppTextStyles.font18Regular.copyWith(
                      color: context.customAppColors.grey900,
                    ),
                  ),
                ],
              ),
            ),

            verticalSpace(24),

            Column(
              children: [
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  from: 50,
                  child: _ThemeOption(
                    title: S.of(context).homeThemeLight,
                    subtitle: S.of(context).homeLightThemeDescription,
                    icon: Icons.light_mode,
                    themeMode: ThemeMode.light,
                    isSelected: currentTheme == ThemeMode.light,
                    onTap: () => _selectTheme(context, ThemeMode.light),
                  ),
                ),
                verticalSpace(8),
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  from: 100,
                  child: _ThemeOption(
                    title: S.of(context).homeThemeDark,
                    subtitle: S.of(context).homeDarkThemeDescription,
                    icon: Icons.dark_mode,
                    themeMode: ThemeMode.dark,
                    isSelected: currentTheme == ThemeMode.dark,
                    onTap: () => _selectTheme(context, ThemeMode.dark),
                  ),
                ),
                verticalSpace(8),
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  from: 150,
                  child: _ThemeOption(
                    title: S.of(context).homeThemeSystem,
                    subtitle: S.of(context).homeSystemThemeDescription,
                    icon: Icons.brightness_auto,
                    themeMode: ThemeMode.system,
                    isSelected: currentTheme == ThemeMode.system,
                    onTap: () => _selectTheme(context, ThemeMode.system),
                  ),
                ),
              ],
            ),

            verticalSpace(32),
          ],
        ),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final ThemeMode themeMode;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.themeMode,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isSelected
              ? context.customAppColors.primary700
              : context.customAppColors.grey400,
          width: 2,
        ),
        color: isSelected
            ? context.customAppColors.primary700.withValues(alpha: 0.1)
            : Colors.transparent,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        leading: Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: isSelected
                ? context.customAppColors.primary700
                : context.customAppColors.grey200,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            color: isSelected
                ? context.customAppColors.grey100
                : context.customAppColors.grey500,
            size: 24.r,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.font18Bold.copyWith(
            color: context.customAppColors.grey800,
          ),
        ),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.font18Regular.copyWith(
            color: context.customAppColors.grey600,
          ),
        ),
        trailing: isSelected
            ? Icon(
                Icons.check_circle,
                color: context.customAppColors.primary700,
                size: 24.r,
              )
            : Icon(
                Icons.circle_outlined,
                color: context.customAppColors.grey400,
                size: 24.r,
              ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
