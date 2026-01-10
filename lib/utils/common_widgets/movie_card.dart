import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/movie/movie_entity.dart';
import 'package:movies_app/utils/common_widgets/shimmer_effect.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.width,
    this.height,
    this.isSelected = false,
  });

  final MovieEntity? movie;
  final double? width;
  final double? height;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: isSelected ? REdgeInsets.all(4) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(20.r),
        boxShadow: [
          if (isSelected)
            BoxShadow(color: theme.colorScheme.primary, blurRadius: 8.r),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20.r),
            child: CachedNetworkImage(
              imageUrl: movie?.mediumCoverImage ?? "",
              width: width ?? 234.w,
              height: height ?? 351.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) =>
                  ShimmerEffect(width: width ?? 234.w, height: height ?? 351.h),
            ),
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
                  RSizedBox(
                    width: 23.w,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        movie?.rating?.toString() ?? "0.0",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  const RSizedBox(width: 5),
                  Icon(Icons.star, color: theme.colorScheme.primary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
