import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_cubit.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_intent.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_state.dart';
import 'package:movies_app/utils/common_widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/validations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => Form(
        key: loginCubit.loginFormKey,
        autovalidateMode: state.autoValidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              label: AppText.email,
              controller: loginCubit.emailController,
              prefixIcon: RPadding(
                padding: const EdgeInsets.only(left: 19, right: 8),
                child: SvgPicture.asset(
                  AppIcons.email,
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.contain,
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              hintText: AppText.emailHint,
              validator: (value) => Validations.emailValidation(email: value),
            ),
            const RSizedBox(height: 22.4),
            CustomTextFormField(
              label: AppText.password,
              controller: loginCubit.passwordController,
              prefixIcon: RPadding(
                padding: const EdgeInsets.only(left: 19, right: 8),
                child: SvgPicture.asset(
                  AppIcons.passwordLock,
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.contain,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  loginCubit.doIntent(intent: ToggleObscurePasswordIntent());
                },
                icon: Icon(
                  state.isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 28.r,
                ),
              ),
              obscuringCharacter: "*",
              hintText: AppText.passwordHint,
              obscureText: state.isObscure,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) =>
                  Validations.passwordValidation(password: value),
            ),
          ],
        ),
      ),
    );
  }
}
