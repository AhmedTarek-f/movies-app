import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views/widgets/movies_bottom_navigation_bar.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views/widgets/movies_bottom_navigation_view_body.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_cubit.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_intent.dart';

class MoviesBottomNavigationView extends StatelessWidget {
  const MoviesBottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBottomNavigationCubit>(
      create: (context) => getIt.get<MoviesBottomNavigationCubit>()
        ..doIntent(intent: const MoviesBottomNavigationInitializationIntent()),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: MoviesBottomNavigationBar(),
        body: MoviesBottomNavigationViewBody(),
      ),
    );
  }
}
