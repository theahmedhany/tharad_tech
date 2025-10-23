import 'package:flutter/material.dart';
import 'package:tharad_tech/core/helpers/extensions.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/routing/routes.dart';
import 'package:tharad_tech/generated/l10n.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).loginScreenDontHaveAccount,
          style: AppTextStyles.font16Regular.copyWith(
            color: context.customAppColors.grey700,
          ),
        ),

        horizontalSpace(4),

        TextButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.registerScreen);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            S.of(context).loginScreenSignUp,
            style: AppTextStyles.font16Regular.copyWith(
              color: context.customAppColors.primary700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
