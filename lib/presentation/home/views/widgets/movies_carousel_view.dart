import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/home/views/widgets/shimmer/movie_card_shimmer.dart';
import 'package:movies_app/presentation/home/views/widgets/shimmer/movies_list_shimmer.dart';
import 'package:movies_app/presentation/home/views_model/home_cubit.dart';
import 'package:movies_app/presentation/home/views_model/home_intent.dart';
import 'package:movies_app/presentation/home/views_model/home_state.dart';
import 'package:movies_app/utils/common_widgets/movie_card.dart';

class MoviesCarouselView extends StatelessWidget {
  const MoviesCarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, HomeState state) {
        if (state.moviesStatus.isSuccess && state.moviesStatus.data != null) {
          return CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) {
              if (index < state.moviesStatus.data!.length) {
                return MovieCard(
                  movie: state.moviesStatus.data![index],
                  isSelected:
                      state.moviesStatus.data![index].movieId ==
                      state.selectedMovie?.movieId,
                );
              } else {
                return const MovieCardShimmer();
              }
            },
            options: CarouselOptions(
              initialPage: state.currentIndex ?? 0,
              viewportFraction: 0.55,
              autoPlay: true,
              aspectRatio: 1.4 / 1,
              autoPlayInterval: const Duration(seconds: 6),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) async {
                homeCubit.doIntent(ChangeSelectedMovieIntent(index: index));
                await homeCubit.doIntent(const LoadMoreMoviesIntent());
              },
              enableInfiniteScroll: false,
            ),
            itemCount:
                state.moviesStatus.data!.length +
                (state.isLoadingMoreMovies ? 5 : 0),
          );
        } else {
          return const MoviesListShimmer();
        }
      },
    );
  }
}
