import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/forget_password/views/widgets/forget_password_email_field.dart';
import 'package:movies_app/presentation/auth/forget_password/views/widgets/verify_email_button.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_cubit.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_state.dart';
import 'package:movies_app/utils/loaders/loaders.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state.forgetPasswordStatus.isFailure) {
          Loaders.showErrorMessage(
            message: state.forgetPasswordStatus.error?.message ?? "",
            context: context,
          );
        } else if (state.forgetPasswordStatus.isSuccess) {
          Navigator.of(context).pop();
          Loaders.showSuccessMessage(
            message: AppText.resetPasswordMessage,
            context: context,
          );
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(
                AppImages.forgotPassword,
                width: ScreenUtil().screenWidth,
                height: 430.h,
                fit: BoxFit.cover,
              ),
              const RSizedBox(height: 24),
              const ForgetPasswordEmailField(),
              const RSizedBox(height: 24),
              const VerifyEmailButton(),
            ],
          ),
        ),
      ),
    );
  }
}
