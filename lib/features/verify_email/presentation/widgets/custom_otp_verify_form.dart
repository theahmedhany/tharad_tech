import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../../generated/l10n.dart';
import '../logic/otp_cubit.dart';

class CustomOtpVerifyForm extends StatefulWidget {
  final String email;
  final int initialOtp;
  const CustomOtpVerifyForm({
    super.key,
    required this.email,
    required this.initialOtp,
  });

  @override
  State<CustomOtpVerifyForm> createState() => _CustomOtpVerifyFormState();
}

class _CustomOtpVerifyFormState extends State<CustomOtpVerifyForm> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _otpController.text = widget.initialOtp.toString();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _otpController.dispose();
    super.dispose();
  }

  PinTheme get _defaultPinTheme => PinTheme(
    width: 56.w,
    height: 56.h,
    textStyle: AppTextStyles.font18Bold.copyWith(
      color: context.customAppColors.grey900,
    ),
    decoration: BoxDecoration(
      color: context.customAppColors.grey100,
      border: Border.all(color: context.customAppColors.grey300, width: 1.5.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

  PinTheme get _focusedPinTheme => _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration!.copyWith(
      border: Border.all(
        color: context.customAppColors.primary500,
        width: 1.5.w,
      ),
    ),
  );

  PinTheme get _submittedPinTheme => _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration!.copyWith(
      border: Border.all(
        color: context.customAppColors.primary500,
        width: 1.5.w,
      ),
    ),
  );

  PinTheme get _errorPinTheme => _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration!.copyWith(
      border: Border.all(color: context.customAppColors.error, width: 1.5.w),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Pinput(
                controller: _otpController,
                focusNode: _focusNode,
                length: 4,
                showCursor: true,
                validator: (pin) {
                  if (pin == null || pin.length < 4) {
                    return S.of(context).otpScreenInvalidCode;
                  }
                  return null;
                },
                pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                cursor: Container(
                  width: 2.w,
                  height: 24.h,
                  color: context.customAppColors.primary500,
                ),
                defaultPinTheme: _defaultPinTheme,
                focusedPinTheme: _focusedPinTheme,
                submittedPinTheme: _submittedPinTheme,
                errorPinTheme: _errorPinTheme,
                onChanged: (pin) {
                  if (_errorMessage != null) {
                    setState(() {
                      _errorMessage = null;
                    });
                  }
                },
                keyboardType: TextInputType.number,
                separatorBuilder: (index) => SizedBox(width: 12.w),
              ),
            ),
          ),

          if (_errorMessage != null) ...[
            SizedBox(height: 24.h),
            Text(
              _errorMessage!,
              style: AppTextStyles.font14SemiBold.copyWith(
                color: context.customAppColors.error,
              ),
              textAlign: TextAlign.center,
            ),
          ],

          verticalSpace(40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  // TODO: Implement resend OTP functionality
                },
                child: Text(
                  S.of(context).otpScreenResendCode,
                  style: AppTextStyles.font16Regular.copyWith(
                    color: context.customAppColors.primary700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  _otpController.clear();
                  setState(() => _errorMessage = null);
                  _focusNode.requestFocus();
                },
                child: Text(
                  S.of(context).otpScreenClearCode,
                  style: AppTextStyles.font16Bold.copyWith(
                    color: context.customAppColors.grey700,
                  ),
                ),
              ),
            ],
          ),

          verticalSpace(18),

          CustomAppButton(
            buttonText: S.of(context).otpScreenVerifyButton,
            textStyle: AppTextStyles.font16Bold.copyWith(
              color: context.customAppColors.white,
            ),
            onPressed: _validateAndVerify,
          ),
        ],
      ),
    );
  }

  void _validateAndVerify() {
    final otp = _otpController.text.trim();

    if (otp.length < 4) {
      setState(() {
        _errorMessage = S.of(context).otpScreenInvalidCode;
      });
    } else {
      setState(() {
        _errorMessage = null;
      });

      if (_formKey.currentState!.validate()) {
        context.read<OtpCubit>().emitVerifyOtp(widget.email, otp);
      }
    }
  }
}
