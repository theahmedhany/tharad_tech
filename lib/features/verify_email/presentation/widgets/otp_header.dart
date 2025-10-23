import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/tharad_tech_logo.png',
      width: 180.w,
      height: 100.h,
      fit: BoxFit.contain,
    );
  }
}
