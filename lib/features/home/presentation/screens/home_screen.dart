import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/features/home/presentation/widgets/home_header_section.dart';
import 'package:tharad_tech/features/home/presentation/widgets/home_logout_button.dart';
import 'package:tharad_tech/features/home/presentation/widgets/home_quick_actions.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeaderSection(),

            verticalSpace(32),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).homeScreenQuickActions,
                    style: AppTextStyles.font20Bold.copyWith(
                      color: context.customAppColors.grey900,
                    ),
                  ),

                  verticalSpace(16),

                  HomeQuickActions(),

                  verticalSpace(32),

                  HomeLogoutButton(),

                  verticalSpace(32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
