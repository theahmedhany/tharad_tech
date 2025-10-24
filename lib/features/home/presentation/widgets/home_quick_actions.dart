import 'package:flutter/material.dart';
import 'package:tharad_tech/core/helpers/extensions.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/routing/routes.dart';
import 'package:tharad_tech/core/theme/theme_manager/theme_extensions.dart';
import 'package:tharad_tech/features/home/presentation/widgets/home_action_card.dart';
import 'package:tharad_tech/features/home/presentation/widgets/theme_bottom_sheet.dart';
import 'package:tharad_tech/generated/l10n.dart';

class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HomeActionCard(
            icon: Icons.edit_outlined,
            title: S.of(context).homeScreenEditProfile,
            color: context.customAppColors.primary600,
            onTap: () {
              context.pushNamed(Routes.editProfileScreen);
            },
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: HomeActionCard(
            icon: Icons.format_paint_outlined,
            title: S.of(context).homeScreenTheme,
            color: context.customAppColors.grey700,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const ThemeBottomSheet(),
              );
            },
          ),
        ),
      ],
    );
  }
}
