import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/login_view_body.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_cubit.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_intent.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) =>
            getIt.get<LoginCubit>()
              ..doIntent(intent: InitializeLoginFormIntent()),
        child: const SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
