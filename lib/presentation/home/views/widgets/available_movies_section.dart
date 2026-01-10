import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/presentation/home/views/widgets/movies_carousel_view.dart';

class AvailableMoviesSection extends StatelessWidget {
  const AvailableMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Image.asset(AppImages.availableNow, height: 93.h),
        ),
        const RSizedBox(height: 21),
        const MoviesCarouselView(),
        const RSizedBox(height: 21),
        Image.asset(AppImages.watchNow, height: 146.h),
      ],
    );
  }
}
