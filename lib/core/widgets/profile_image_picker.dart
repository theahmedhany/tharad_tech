import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../helpers/spacing.dart';
import '../theme/app_texts/app_text_styles.dart';
import '../theme/theme_manager/theme_extensions.dart';
import '../utils/image_picker_utils.dart';
import 'custom_loading.dart';
import 'dashed_border_painter.dart';

class ProfileImagePicker extends StatefulWidget {
  final Function(File?) onImageSelected;
  final String? initialImageUrl;

  const ProfileImagePicker({
    super.key,
    required this.onImageSelected,
    this.initialImageUrl,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final File? image = await ImagePickerUtils.showImagePickerBottomSheet(
      context,
      title: S.of(context).registerChooseProfilePictureHint,
    );

    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).registerChooseProfilePicture,
          style: AppTextStyles.font18Regular.copyWith(
            color: context.customAppColors.grey900,
          ),
        ),

        verticalSpace(8),

        InkWell(
          onTap: _pickImage,
          borderRadius: BorderRadius.circular(16.r),
          child: CustomPaint(
            painter: DashedBorderPainter(
              color: context.customAppColors.primary600,
              strokeWidth: 2.w,
              dashWidth: 8.w,
              dashSpace: 4.w,
              borderRadius: 8.r,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: context.customAppColors.primary200.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: _selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Stack(
                        children: [
                          Image.file(
                            _selectedImage!,
                            height: 100.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),

                          Positioned(
                            top: 8.h,
                            left: 8.w,
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: context.customAppColors.primary700
                                    .withValues(alpha: 0.6),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera,
                                size: 16.sp,
                                color: context.customAppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : widget.initialImageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: widget.initialImageUrl!,
                            height: 100.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return Center(child: CustomLoading(size: 40));
                            },
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Icon(
                                  Icons.person_outline,
                                  size: 40.sp,
                                  color: context.customAppColors.grey400,
                                ),
                              );
                            },
                          ),
                          Positioned(
                            top: 8.h,
                            left: 8.w,
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: context.customAppColors.primary700
                                    .withValues(alpha: 0.6),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera,
                                size: 16.sp,
                                color: context.customAppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: context.customAppColors.primary200
                                .withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 24.sp,
                            color: context.customAppColors.primary900,
                          ),
                        ),
                        verticalSpace(12),
                        Text(
                          S.of(context).registerAvailableImages,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.font14Regular.copyWith(
                            color: context.customAppColors.grey600,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
