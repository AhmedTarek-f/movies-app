import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/profile/view/widgets/profile_view_body.dart';
import 'package:movies_app/presentation/profile/view_model/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => getIt.get<ProfileCubit>(),
      child: const SafeArea(child: ProfileViewBody()),
    );
  }
}
