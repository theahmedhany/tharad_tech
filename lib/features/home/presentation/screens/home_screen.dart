import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../widgets/action_buttons_section.dart';
import '../widgets/user_info_card.dart';
import '../widgets/user_profile_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: CustomScrollView(
        slivers: [
          // App Bar with gradient
          SliverAppBar(
            expandedHeight: 200.h,
            floating: false,
            pinned: true,
            backgroundColor: context.customAppColors.primary600,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'الصفحة الرئيسية',
                style: AppTextStyles.font18Bold.copyWith(
                  color: context.customAppColors.white,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: context.customAppColors.primaryGradient,
                ),
                child: const UserProfileHeader(),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: context.customAppColors.white,
                  size: 26.sp,
                ),
                onPressed: () {
                  // Handle notifications
                },
              ),
            ],
          ),

          // Body Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(24),
                // User Info Card
                const UserInfoCard(),
                verticalSpace(24),
                // Action Buttons
                const ActionButtonsSection(),
                verticalSpace(32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
