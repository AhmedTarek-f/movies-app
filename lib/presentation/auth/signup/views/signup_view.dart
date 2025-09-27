import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/auth/signup/views/widgets/signup_app_bar.dart';
import 'package:movies_app/presentation/auth/signup/views/widgets/signup_view_body.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_cubit.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_intent.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (context) =>
          getIt.get<SignupCubit>()
            ..doIntent(intent: InitializeSignupFormIntent()),
      child: const Scaffold(appBar: SignupAppBar(), body: SignupViewBody()),
    );
  }
}
