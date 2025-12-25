import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_animations.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/create_new_account.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/forget_password_button.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/google_login_button.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/login_button.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/login_form.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_cubit.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_state.dart';
import 'package:movies_app/utils/common_widgets/language_switch.dart';
import 'package:movies_app/utils/loaders/full_screen_loader.dart';
import 'package:movies_app/utils/loaders/loaders.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loginStatus.isLoading) {
          FullScreenLoader.openLoadingDialog(
            text: AppText.loggingYouIn,
            animation: AppAnimations.loadingMobile,
            context: context,
          );
        } else if (state.loginStatus.isFailure) {
          FullScreenLoader.stopLoading(context: context);
          Loaders.showErrorMessage(
            message: state.loginStatus.error?.message ?? "",
            context: context,
          );
        } else if (state.loginStatus.isSuccess) {
          FullScreenLoader.stopLoading(context: context);
          Navigator.of(
            context,
          ).pushReplacementNamed(RouteNames.moviesBottomNavigation);
        }
      },
      child: SingleChildScrollView(
        child: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            children: [
              const RSizedBox(height: 42),
              Image.asset(
                AppImages.moviesLogo,
                width: 121.w,
                height: 118.h,
                fit: BoxFit.cover,
              ),
              const RSizedBox(height: 69),
              const LoginForm(),
              const RSizedBox(height: 17),
              const ForgetPasswordButton(),
              const RSizedBox(height: 32),
              const LoginButton(),
              const RSizedBox(height: 22),
              const CreateNewAccount(),
              const RSizedBox(height: 28),
              const GoogleLoginButton(),
              const RSizedBox(height: 34),
              const LanguageSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}
