import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_cubit.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_intent.dart';
import 'package:movies_app/presentation/movies_bottom_navigation/views_model/movies_bottom_navigation_state.dart';

class MoviesBottomNavigationBar extends StatelessWidget {
  const MoviesBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final moviesBottomNavCubit = BlocProvider.of<MoviesBottomNavigationCubit>(
      context,
    );
    return Container(
      height: 61.h,
      margin: REdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: theme.colorScheme.shadow,
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.6),
            blurStyle: BlurStyle.outer,
            blurRadius: 12.r,
          ),
        ],
      ),
      child:
          BlocBuilder<MoviesBottomNavigationCubit, MoviesBottomNavigationState>(
            builder: (context, state) => Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => moviesBottomNavCubit.doIntent(
                      intent: const ChangeIndexIntent(index: 0),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.home,
                      colorFilter: ColorFilter.mode(
                        state.currentIndex == 0
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => moviesBottomNavCubit.doIntent(
                      intent: const ChangeIndexIntent(index: 1),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.search,
                      colorFilter: ColorFilter.mode(
                        state.currentIndex == 1
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => moviesBottomNavCubit.doIntent(
                      intent: const ChangeIndexIntent(index: 2),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.explore,
                      colorFilter: ColorFilter.mode(
                        state.currentIndex == 2
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => moviesBottomNavCubit.doIntent(
                      intent: const ChangeIndexIntent(index: 3),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.profile,
                      colorFilter: ColorFilter.mode(
                        state.currentIndex == 3
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
