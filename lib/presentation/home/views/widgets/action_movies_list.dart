import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_animations.dart';
import 'package:movies_app/presentation/home/views/widgets/shimmer/action_movies_list_shimmer.dart';
import 'package:movies_app/presentation/home/views_model/home_cubit.dart';
import 'package:movies_app/presentation/home/views_model/home_state.dart';
import 'package:movies_app/utils/common_widgets/movie_card.dart';
import 'package:movies_app/utils/loaders/animation_loader_widget.dart';

class ActionMoviesList extends StatelessWidget {
  const ActionMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.moviesStatus.isSuccess) {
          return RSizedBox(
            height: 220.h,
            child: state.actionMovies.isNotEmpty
                ? ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => MovieCard(
                      movie: state.actionMovies[index],
                      width: 146.w,
                      height: 220.h,
                    ),
                    separatorBuilder: (_, __) => const RSizedBox(width: 16),
                    itemCount: state.actionMovies.length,
                  )
                : const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AnimationLoaderWidget(
                      text: "",
                      animation: AppAnimations.popcorn,
                    ),
                  ),
          );
        } else {
          return const ActionMoviesListShimmer();
        }
      },
    );
  }
}
