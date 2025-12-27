import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/presentation/profile/view/widgets/profile_movies_list.dart';
import 'package:movies_app/presentation/profile/view/widgets/profile_movies_tab_bar.dart';
import 'package:movies_app/presentation/profile/view/widgets/profile_sliver_app_bar.dart';
import 'package:movies_app/presentation/profile/view_model/profile_cubit.dart';
import 'package:movies_app/presentation/profile/view_model/profile_state.dart';
import 'package:movies_app/utils/loaders/loaders.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current.logoutStatus != previous.logoutStatus,
      listener: (context, state) {
        if (state.logoutStatus.isFailure) {
          Loaders.showErrorMessage(
            message: state.logoutStatus.error?.message ?? "",
            context: context,
          );
        } else if (state.logoutStatus.isSuccess) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
        }
      },
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const ProfileSliverAppBar(),
            const ProfileMoviesTabBar(),
          ],
          body: const ProfileMoviesList(),
        ),
      ),
    );
  }
}
