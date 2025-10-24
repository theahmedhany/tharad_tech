import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../generated/l10n.dart';
import '../helpers/spacing.dart';
import '../theme/app_texts/app_text_styles.dart';
import '../theme/theme_manager/theme_extensions.dart';
import '../widgets/show_custom_snack_bar.dart';

class ImagePickerUtils {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> showImagePickerBottomSheet(
    BuildContext context, {
    required String title,
  }) async {
    return await showModalBottomSheet<File?>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _ImagePickerBottomSheet(title: title),
    );
  }

  static Future<File?> _pickImage(
    ImageSource source, {
    BuildContext? context,
  }) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null) {
        final file = File(image.path);
        final fileSize = await file.length();
        const maxSizeInBytes = 5 * 1024 * 1024;

        if (fileSize > maxSizeInBytes) {
          if (context != null && context.mounted) {
            showCustomSnackBar(
              context,
              S.of(context).imageSizeExceeds5MB,
              backgroundColor: context.customAppColors.error,
            );
          }
          return null;
        }

        return file;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

class _ImagePickerBottomSheet extends StatelessWidget {
  const _ImagePickerBottomSheet({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          color: context.customAppColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeIn(
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: context.customAppColors.grey300,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),

                verticalSpace(24),

                FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 100),
                  child: Text(
                    title,
                    style: AppTextStyles.font18Bold.copyWith(
                      color: context.customAppColors.primary700,
                      fontSize: 20.sp,
                    ),
                  ),
                ),

                verticalSpace(12),

                FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    S.of(context).registerScreenChoosePhotoSource,
                    style: AppTextStyles.font14Regular.copyWith(
                      color: context.customAppColors.primary700,
                    ),
                  ),
                ),

                verticalSpace(32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ZoomIn(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 300),
                      child: _ImagePickerOption(
                        icon: Icons.camera_alt_rounded,
                        title: S.of(context).registerScreenCamera,
                        onTap: () async {
                          final image = await ImagePickerUtils._pickImage(
                            ImageSource.camera,
                            context: context,
                          );
                          if (context.mounted) {
                            Navigator.pop(context, image);
                          }
                        },
                      ),
                    ),

                    ZoomIn(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 400),
                      child: _ImagePickerOption(
                        icon: Icons.photo_library_rounded,
                        title: S.of(context).registerScreenGallery,
                        onTap: () async {
                          final image = await ImagePickerUtils._pickImage(
                            ImageSource.gallery,
                            context: context,
                          );
                          if (context.mounted) {
                            Navigator.pop(context, image);
                          }
                        },
                      ),
                    ),
                  ],
                ),

                verticalSpace(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImagePickerOption extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ImagePickerOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<_ImagePickerOption> createState() => _ImagePickerOptionState();
}

class _ImagePickerOptionState extends State<_ImagePickerOption> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: 140.w,
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.customAppColors.grey100,
                context.customAppColors.grey100.withValues(alpha: 0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: _isPressed
                  ? context.customAppColors.primary700.withValues(alpha: 0.3)
                  : context.customAppColors.primary200,
              width: 1.5.w,
            ),
            boxShadow: [
              BoxShadow(
                color: _isPressed
                    ? context.customAppColors.primary700.withValues(alpha: 0.15)
                    : context.customAppColors.primary700.withValues(
                        alpha: 0.05,
                      ),
                blurRadius: _isPressed ? 12 : 8,
                offset: Offset(0, _isPressed ? 2 : 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: context.customAppColors.primary700.withValues(
                    alpha: 0.1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                  size: 32.sp,
                  color: context.customAppColors.primary700,
                ),
              ),
              verticalSpace(12),
              Text(
                widget.title,
                style: AppTextStyles.font14Regular.copyWith(
                  color: context.customAppColors.primary700,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
