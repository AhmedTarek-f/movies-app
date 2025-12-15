import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_animations.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/presentation/auth/signup/views/widgets/create_account_button.dart';
import 'package:movies_app/presentation/auth/signup/views/widgets/have_account.dart';
import 'package:movies_app/presentation/auth/signup/views/widgets/signup_avatars.dart';
import 'package:movies_app/presentation/auth/signup/views/widgets/signup_form.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_cubit.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_state.dart';
import 'package:movies_app/utils/common_widgets/language_switch.dart';
import 'package:movies_app/utils/loaders/full_screen_loader.dart';
import 'package:movies_app/utils/loaders/loaders.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.signupStatus.isLoading) {
          FullScreenLoader.openLoadingDialog(
            text: AppText.signingYouUpMessage,
            animation: AppAnimations.loadingMobile,
            context: context,
          );
        } else if (state.signupStatus.isFailure) {
          FullScreenLoader.stopLoading(context: context);
          Loaders.showErrorMessage(
            message: state.signupStatus.error?.message ?? "",
            context: context,
          );
        } else if (state.signupStatus.isSuccess) {
          FullScreenLoader.stopLoading(context: context);
          Navigator.of(context).pushNamedAndRemoveUntil(
            RouteNames.emailVerification,
            (route) => false,
          );
        }
      },
      child: const SingleChildScrollView(
        child: RPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              RSizedBox(height: 9),
              SignupAvatars(),
              SignupForm(),
              RSizedBox(height: 24),
              CreateAccountButton(),
              RSizedBox(height: 18),
              HaveAccount(),
              RSizedBox(height: 18),
              LanguageSwitch(),
              RSizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
