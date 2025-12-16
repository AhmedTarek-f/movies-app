import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/auth/forget_password/views/widgets/forget_password_app_bar.dart';
import 'package:movies_app/presentation/auth/forget_password/views/widgets/forget_password_view_body.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_cubit.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_intent.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) =>
          getIt.get<ForgetPasswordCubit>()
            ..doIntent(intent: const ForgetPasswordInitializationIntent()),
      child: const Scaffold(
        appBar: ForgetPasswordAppBar(),
        body: ForgetPasswordViewBody(),
      ),
    );
  }
}
