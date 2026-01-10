import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/home/views/widgets/action_movies_section.dart';
import 'package:movies_app/presentation/home/views/widgets/available_movies_section.dart';
import 'package:movies_app/presentation/home/views/widgets/home_linear_gradient_layer.dart';
import 'package:movies_app/presentation/home/views_model/home_cubit.dart';
import 'package:movies_app/presentation/home/views_model/home_state.dart';
import 'package:movies_app/utils/common_widgets/shimmer_effect.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Stack(
        children: [
          state.moviesStatus.isLoading
              ? Positioned.fill(
                  child: ShimmerEffect(
                    width: ScreenUtil().screenWidth,
                    height: 0.7.sh,
                  ),
                )
              : Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: state.selectedMovie?.mediumCoverImage ?? "",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) => ShimmerEffect(
                      width: ScreenUtil().screenWidth,
                      height: 0.7.sh,
                    ),
                  ),
                ),
          const HomeLinearGradientLayer(),
          SingleChildScrollView(
            padding: REdgeInsets.only(bottom: 120),
            child: const Column(
              children: [AvailableMoviesSection(), ActionMoviesSection()],
            ),
          ),
        ],
      ),
    );
  }
}
