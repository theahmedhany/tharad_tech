import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad_tech/core/theme/theme_manager/theme_extensions.dart';
import 'package:tharad_tech/features/home/presentation/widgets/logout_dialog.dart';
import 'package:tharad_tech/generated/l10n.dart';

class HomeLogoutButton extends StatelessWidget {
  const HomeLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.customAppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.customAppColors.error, width: 1.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const LogoutDialog();
              },
            );
          },
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).homeScreenLogout,
                    style: AppTextStyles.font18Bold.copyWith(
                      color: context.customAppColors.error,
                    ),
                  ),
                  horizontalSpace(12),
                  Icon(
                    Icons.logout,
                    color: context.customAppColors.error,
                    size: 24.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
