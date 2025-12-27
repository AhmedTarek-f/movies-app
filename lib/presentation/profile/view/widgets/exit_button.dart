import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/presentation/profile/view_model/profile_cubit.dart';
import 'package:movies_app/presentation/profile/view_model/profile_intent.dart';
import 'package:movies_app/presentation/profile/view_model/profile_state.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';
import 'package:movies_app/utils/common_widgets/loading_button.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) => state.logoutStatus.isLoading
          ? LoadingButton(backgroundColor: theme.colorScheme.error)
          : CustomElevatedButton(
              backgroundColor: theme.colorScheme.error,
              onPressed: () async {
                await profileCubit.doIntent(LogoutIntent());
              },
              isText: false,
              buttonTitle: "",
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Text(
                      AppText.exit,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: ConstKeys.roboto,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    const RSizedBox(width: 10),
                    SvgPicture.asset(AppIcons.exit),
                  ],
                ),
              ),
            ),
    );
  }
}
