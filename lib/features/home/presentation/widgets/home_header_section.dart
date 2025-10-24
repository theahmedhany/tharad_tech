import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/theme/app_texts/app_text_styles.dart';
import 'package:tharad_tech/core/theme/theme_manager/theme_extensions.dart';
import 'package:tharad_tech/core/widgets/custom_loading.dart';
import 'package:tharad_tech/core/widgets/dashed_border_painter.dart';
import 'package:tharad_tech/generated/l10n.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: context.customAppColors.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).homeScreenWelcome,
                  style: AppTextStyles.font24Bold.copyWith(
                    color: context.customAppColors.grey0,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.customAppColors.primary200.withValues(
                      alpha: 0.2,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      color: context.customAppColors.grey0,
                      size: 28.sp,
                    ),
                    onPressed: () {
                      // Handle notifications.
                    },
                  ),
                ),
              ],
            ),
          ),

          verticalSpace(24),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomPaint(
              painter: DashedBorderPainter(
                color: context.customAppColors.primary600,
                strokeWidth: 2.w,
                dashWidth: 8.w,
                dashSpace: 4.w,
                borderRadius: 28.r,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: context.customAppColors.primary200.withValues(
                    alpha: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Stack(
                    children: [
                      Container(
                        height: 230.h,
                        decoration: BoxDecoration(
                          color: context.customAppColors.primary300.withValues(
                            alpha: 0.4,
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return const Center(
                              child: CustomLoading(size: 100),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Center(
                              child: Image.asset(
                                'assets/images/tharad_tech_logo.png',
                                width: 100.w,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),

                      Positioned(
                        top: 12.h,
                        left: 12.w,
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: context.customAppColors.primary700
                                .withValues(alpha: 0.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera,
                            size: 20.sp,
                            color: context.customAppColors.grey0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          verticalSpace(16),

          Text(
            'Ahmed Hany',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.font24Bold.copyWith(
              color: context.customAppColors.grey0,
              shadows: [
                Shadow(
                  color: context.customAppColors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),

          verticalSpace(8),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: context.customAppColors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 18.sp,
                  color: context.customAppColors.grey0,
                ),
                horizontalSpace(8),
                Flexible(
                  child: Text(
                    'Tharad@gmail.com',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font16Regular.copyWith(
                      color: context.customAppColors.grey0.withValues(
                        alpha: 0.95,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          verticalSpace(32),
        ],
      ),
    );
  }
}
