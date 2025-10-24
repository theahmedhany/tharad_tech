import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/theme/theme_manager/theme_extensions.dart';
import 'package:tharad_tech/core/widgets/dashed_border_painter.dart';

class HomeHeaderSectionShimmer extends StatelessWidget {
  const HomeHeaderSectionShimmer({super.key});

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
                Shimmer.fromColors(
                  baseColor: context.customAppColors.grey0.withValues(
                    alpha: 0.3,
                  ),
                  highlightColor: context.customAppColors.grey0.withValues(
                    alpha: 0.5,
                  ),
                  child: Container(
                    width: 150.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: context.customAppColors.grey0,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: context.customAppColors.grey0.withValues(
                    alpha: 0.3,
                  ),
                  highlightColor: context.customAppColors.grey0.withValues(
                    alpha: 0.5,
                  ),
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: context.customAppColors.grey0,
                      shape: BoxShape.circle,
                    ),
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
                  child: Shimmer.fromColors(
                    baseColor: context.customAppColors.primary300.withValues(
                      alpha: 0.4,
                    ),
                    highlightColor: context.customAppColors.primary200
                        .withValues(alpha: 0.6),
                    child: Container(
                      height: 230.h,
                      color: context.customAppColors.grey0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(16),
          Shimmer.fromColors(
            baseColor: context.customAppColors.grey0.withValues(alpha: 0.3),
            highlightColor: context.customAppColors.grey0.withValues(
              alpha: 0.5,
            ),
            child: Container(
              width: 180.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: context.customAppColors.grey0,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          verticalSpace(8),
          Shimmer.fromColors(
            baseColor: context.customAppColors.grey0.withValues(alpha: 0.3),
            highlightColor: context.customAppColors.grey0.withValues(
              alpha: 0.5,
            ),
            child: Container(
              width: 200.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: context.customAppColors.grey0,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          verticalSpace(32),
        ],
      ),
    );
  }
}
