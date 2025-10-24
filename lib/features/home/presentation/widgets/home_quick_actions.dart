import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../generated/l10n.dart';
import '../../data/cache/hive_service.dart';
import '../logic/user_details/user_details_cubit.dart';
import 'home_action_card.dart';
import 'theme_bottom_sheet.dart';

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
            onTap: () async {
              final cachedUser = HiveService.getCachedUserDetails();
              final result = await Navigator.of(
                context,
              ).pushNamed(Routes.editProfileScreen, arguments: cachedUser);

              if (result == true && context.mounted) {
                context.read<UserDetailsCubit>().emitGetUserDetails();
              }
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
