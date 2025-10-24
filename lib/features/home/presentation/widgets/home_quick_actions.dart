import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/routing/routes.dart';
import 'package:tharad_tech/core/theme/theme_manager/theme_extensions.dart';
import 'package:tharad_tech/features/home/data/cache/hive_service.dart';
import 'package:tharad_tech/features/home/presentation/logic/user_details/user_details_cubit.dart';
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
