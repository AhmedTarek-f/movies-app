import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_cubit.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_state.dart';
import 'package:movies_app/utils/common_widgets/custom_text_form_field.dart';
import 'package:movies_app/utils/validations.dart';

class ForgetPasswordEmailField extends StatelessWidget {
  const ForgetPasswordEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) => Form(
        key: forgetPasswordCubit.forgetPasswordFormKey,
        autovalidateMode: state.autoValidateMode,
        child: CustomTextFormField(
          label: AppText.email,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          controller: forgetPasswordCubit.emailController,
          prefixIcon: RPadding(
            padding: const EdgeInsets.only(left: 19, right: 8),
            child: SvgPicture.asset(
              AppIcons.email,
              width: 30.r,
              height: 30.r,
              fit: BoxFit.contain,
            ),
          ),
          validator: (value) => Validations.emailValidation(email: value),
          enabled: !state.forgetPasswordStatus.isLoading,
        ),
      ),
    );
  }
}
