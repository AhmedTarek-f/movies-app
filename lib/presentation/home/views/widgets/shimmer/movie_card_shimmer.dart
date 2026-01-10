import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/common_widgets/shimmer_effect.dart';

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        ShimmerEffect(
          width: width ?? 234.w,
          height: height ?? 351.h,
          radius: 20.r,
        ),

        PositionedDirectional(
          top: 11.h,
          start: 9.w,
          child: Container(
            padding: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: theme.colorScheme.onSecondary.withValues(alpha: 0.71),
            ),
            child: Row(
              children: [
                ShimmerEffect(width: 23.w, height: 14.h, radius: 4),
                const RSizedBox(width: 5),
                ShimmerEffect(width: 14.w, height: 14.h, radius: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
