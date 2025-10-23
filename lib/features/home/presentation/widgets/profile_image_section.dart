import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_manager/theme_extensions.dart';
import '../../../../core/widgets/dashed_border_painter.dart';

class ProfileImageSection extends StatefulWidget {
  const ProfileImageSection({super.key});

  @override
  State<ProfileImageSection> createState() => _ProfileImageSectionState();
}

class _ProfileImageSectionState extends State<ProfileImageSection> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Handle image picker
        // You can implement this with image_picker package
      },
      child: Container(
        width: double.infinity,
        height: 140.h,
        decoration: BoxDecoration(
          color: context.customAppColors.primary200.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: CustomPaint(
          painter: DashedBorderPainter(
            color: context.customAppColors.primary600,
            strokeWidth: 2,
            dashWidth: 8,
            dashSpace: 4,
            borderRadius: 8.r,
          ),
          child: Center(
            child: _imageFile == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: context.customAppColors.primary200,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 28.sp,
                          color: context.customAppColors.primary700,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'JPEG, PNG امتدادات الصور المدعومة: JPG,',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: context.customAppColors.grey600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'الحد الأقصى: 5MB',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: context.customAppColors.grey600,
                        ),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
