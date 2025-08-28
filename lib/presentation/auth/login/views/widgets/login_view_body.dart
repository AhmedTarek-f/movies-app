import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/create_new_account.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/forget_password_button.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/google_login_button.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/login_button.dart';
import 'package:movies_app/presentation/auth/login/views/widgets/login_form.dart';
import 'package:movies_app/utils/common_widgets/language_switch.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
