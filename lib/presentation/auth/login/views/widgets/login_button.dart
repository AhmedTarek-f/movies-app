import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_cubit.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_intent.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return CustomElevatedButton(
      onPressed: () async {
        await loginCubit.doIntent(intent: LoginWithEmailAndPasswordIntent());
      },
      buttonTitle: AppText.login,
    );
  }
}
