import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/presentation/splash/views_model/splash_cubit.dart';
import 'package:movies_app/presentation/splash/views_model/splash_state.dart';
import 'package:movies_app/utils/loaders/loaders.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<SplashCubit, SplashState>(
      listener: (BuildContext context, SplashState state) {
        if (state.userDataStatus.isFailure) {
          Navigator.of(
            context,
          ).pushReplacementNamed(RouteNames.moviesBottomNavigation);
          Loaders.showErrorMessage(
            message: state.userDataStatus.error?.message ?? "",
            context: context,
          );
        } else if (state.userDataStatus.isSuccess) {
          Navigator.of(
            context,
          ).pushReplacementNamed(RouteNames.moviesBottomNavigation);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.moviesLogo,
              height: 180.r,
              width: 180.r,
            ),
          ),
          const RSizedBox(height: 52),
          Center(
            child: RSizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
