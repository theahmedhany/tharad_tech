import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../widgets/edit_profile_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      appBar: AppBar(
        backgroundColor: context.customAppColors.primary600,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: context.customAppColors.white,
            size: 28.sp,
          ),
          onPressed: () {
            // Handle notifications
          },
        ),
        title: Text(
          'الملف الشخصي',
          style: AppTextStyles.font20Bold.copyWith(
            color: context.customAppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with gradient
            Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.customAppColors.primary600,
                    context.customAppColors.background,
                  ],
                ),
              ),
            ),
            verticalSpace(24),
            // Edit Profile Form
            const EditProfileForm(),
            verticalSpace(32),
          ],
        ),
      ),
    );
  }
}
