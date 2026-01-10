import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/home/views/widgets/shimmer/movie_card_shimmer.dart';
import 'package:movies_app/presentation/home/views_model/home_cubit.dart';
import 'package:movies_app/presentation/home/views_model/home_state.dart';

class ActionMoviesListShimmer extends StatelessWidget {
  const ActionMoviesListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => RSizedBox(
        height: 220.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              MovieCardShimmer(width: 146.w, height: 220.h),
          separatorBuilder: (_, __) => const RSizedBox(width: 16),
          itemCount: 10,
        ),
      ),
    );
  }
}
