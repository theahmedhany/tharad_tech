import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/extensions.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../widgets/edit_profile_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: context.customAppColors.primaryGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              verticalSpace(40),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.customAppColors.primary200.withValues(
                          alpha: 0.2,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: context.customAppColors.grey0,
                          size: 22.sp,
                        ),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),

                    Expanded(
                      child: Text(
                        S.of(context).editProfileScreenTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: context.customAppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.customAppColors.primary200.withValues(
                          alpha: 0.2,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications_none_rounded,
                          color: context.customAppColors.grey0,
                          size: 28.sp,
                        ),
                        onPressed: () {
                          // Handle notifications
                        },
                      ),
                    ),
                  ],
                ),
              ),

              verticalSpace(24),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: context.customAppColors.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  child: const SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: EditProfileForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
