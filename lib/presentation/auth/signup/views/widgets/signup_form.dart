import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_cubit.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_intent.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_state.dart';
import 'package:movies_app/utils/common_widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/validations.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) => Form(
        key: signupCubit.signupFormKey,
        autovalidateMode: state.autoValidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              label: AppText.name,
              controller: signupCubit.nameController,
              prefixIcon: RPadding(
                padding: const EdgeInsets.only(left: 19, right: 8),
                child: SvgPicture.asset(
                  AppIcons.identification,
                  width: 38.r,
                  height: 38.r,
                  fit: BoxFit.contain,
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              hintText: AppText.nameHint,
              validator: (value) => Validations.nameValidation(name: value),
            ),
            const RSizedBox(height: 24),
            CustomTextFormField(
              label: AppText.email,
              controller: signupCubit.emailController,
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
            const RSizedBox(height: 24),
            CustomTextFormField(
              label: AppText.password,
              controller: signupCubit.passwordController,
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
                  signupCubit.doIntent(intent: TogglePasswordObscureIntent());
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
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) =>
                  Validations.passwordValidation(password: value),
            ),
            const RSizedBox(height: 24),
            CustomTextFormField(
              label: AppText.confirmPassword,
              controller: signupCubit.confirmPasswordController,
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
                  signupCubit.doIntent(
                    intent: ToggleConfirmPasswordObscureIntent(),
                  );
                },
                icon: Icon(
                  state.isObscureConfirm
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 28.r,
                ),
              ),
              obscuringCharacter: "*",
              hintText: AppText.passwordHint,
              obscureText: state.isObscureConfirm,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => Validations.confirmPasswordValidation(
                password: signupCubit.passwordController.text,
                conformPassword: value,
              ),
            ),
            const RSizedBox(height: 24),
            CustomTextFormField(
              label: AppText.phoneNumber,
              controller: signupCubit.phoneNumberController,
              prefixIcon: RPadding(
                padding: const EdgeInsets.only(left: 19, right: 8),
                child: SvgPicture.asset(
                  AppIcons.phone,
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.contain,
                ),
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              hintText: AppText.phoneNumberHint,
              validator: (value) =>
                  Validations.phoneValidation(phoneNumber: value),
            ),
          ],
        ),
      ),
    );
  }
}
