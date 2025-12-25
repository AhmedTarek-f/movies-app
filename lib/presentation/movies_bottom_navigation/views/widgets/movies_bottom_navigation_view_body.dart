import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_cubit.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_intent.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_state.dart';

class MoviesBottomNavigationViewBody extends StatelessWidget {
  const MoviesBottomNavigationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBottomNavCubit = BlocProvider.of<MoviesBottomNavigationCubit>(
      context,
    );
    return BlocBuilder<
      MoviesBottomNavigationCubit,
      MoviesBottomNavigationState
    >(
      builder: (context, state) => PageView.builder(
        controller: moviesBottomNavCubit.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) => moviesBottomNavCubit.doIntent(
          intent: ChangeIndexIntent(index: value),
        ),
        itemBuilder: (_, index) => state.taps[index],
        itemCount: state.taps.length,
      ),
    );
  }
}
