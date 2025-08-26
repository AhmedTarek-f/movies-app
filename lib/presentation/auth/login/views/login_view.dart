import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/login_view_body.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: const SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
