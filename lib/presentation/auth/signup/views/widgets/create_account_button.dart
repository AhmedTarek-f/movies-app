import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_cubit.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_intent.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return CustomElevatedButton(
      onPressed: () async {
        await signupCubit.doIntent(intent: SignupWithEmailAndPasswordIntent());
      },
      buttonTitle: AppText.createAccount,
    );
  }
}
