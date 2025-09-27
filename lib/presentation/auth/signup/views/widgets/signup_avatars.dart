import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/auth/signup/views/widgets/avatar_item.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_cubit.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_intent.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_state.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

class SignupAvatars extends StatelessWidget {
  const SignupAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return Column(
      children: [
        RSizedBox(
          height: 161,
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) => PageView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: signupCubit.avatarPageController,
              onPageChanged: (value) => signupCubit.doIntent(
                intent: ChangeAvatarIndexIntent(avatarIndex: value),
              ),
              itemBuilder: (BuildContext context, int index) => AvatarItem(
                isSelectedAvatar: index == state.avatarIndex,
                avatarImage: MoviesMethodHelper.avatars[index],
                avatarIndex: index,
              ),
              itemCount: MoviesMethodHelper.avatars.length,
            ),
          ),
        ),
        const RSizedBox(height: 10),
        Text(AppText.avatar, style: theme.textTheme.bodyLarge),
        const RSizedBox(height: 12),
      ],
    );
  }
}
