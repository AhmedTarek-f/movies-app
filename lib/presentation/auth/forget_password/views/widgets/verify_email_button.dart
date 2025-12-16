import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_cubit.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_intent.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_state.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';
import 'package:movies_app/utils/common_widgets/loading_button.dart';

class VerifyEmailButton extends StatelessWidget {
  const VerifyEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    final theme = Theme.of(context);
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      buildWhen: (previous, current) =>
          current.forgetPasswordStatus.isLoading ||
          current.forgetPasswordStatus.isFailure,
      builder: (context, state) => state.forgetPasswordStatus.isLoading
          ? const LoadingButton()
          : CustomElevatedButton(
              onPressed: () async {
                await forgetPasswordCubit.doIntent(
                  intent: const VerifyEmailIntent(),
                );
              },
              buttonTitle: AppText.verifyEmail,
              isInterFamily: false,
              titleStyle: theme.textTheme.titleLarge?.copyWith(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }
}
