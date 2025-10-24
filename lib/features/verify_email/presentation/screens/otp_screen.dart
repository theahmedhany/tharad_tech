import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../generated/l10n.dart';
import '../widgets/custom_otp_verify_form.dart';
import '../widgets/otp_bloc_listener.dart';
import '../widgets/otp_header.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  final int otp;
  const OtpScreen({super.key, required this.email, required this.otp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(64),

                OtpHeader(),

                verticalSpace(24),

                Text(
                  S.of(context).otpScreenTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font24Bold.copyWith(
                    color: context.customAppColors.grey900,
                  ),
                ),

                verticalSpace(16),

                Text(
                  S.of(context).otpScreenSubtitle,
                  style: AppTextStyles.font16Regular.copyWith(
                    color: context.customAppColors.grey600,
                  ),
                  textAlign: TextAlign.center,
                ),

                verticalSpace(60),

                CustomOtpVerifyForm(email: email, initialOtp: otp),

                verticalSpace(24),

                const OtpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
