import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_cubit.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_intent.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return CustomElevatedButton(
      onPressed: () async {
        await loginCubit.doIntent(intent: LoginWithGoogleIntent());
      },
      buttonTitle: "",
      isText: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.google,
            width: 27.r,
            height: 27.r,
            fit: BoxFit.cover,
          ),
          const RSizedBox(width: 12),
          Flexible(
            child: Text(
              AppText.loginWithGoogle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
