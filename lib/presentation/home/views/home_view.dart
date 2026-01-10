import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/home/views/widgets/home_view_body.dart';
import 'package:movies_app/presentation/home/views_model/home_cubit.dart';
import 'package:movies_app/presentation/home/views_model/home_intent.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) =>
          getIt.get<HomeCubit>()..doIntent(const HomeInitializationIntent()),
      child: const HomeViewBody(),
    );
  }
}
