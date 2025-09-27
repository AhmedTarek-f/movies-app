import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_cubit.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_intent.dart';

class AvatarItem extends StatelessWidget {
  const AvatarItem({
    super.key,
    required this.isSelectedAvatar,
    required this.avatarImage,
    required this.avatarIndex,
  });
  final bool isSelectedAvatar;
  final String avatarImage;
  final int avatarIndex;
  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return GestureDetector(
      onTap: () {
        signupCubit.doIntent(
          intent: MoveToSelectedAvatarIntent(avatarIndex: avatarIndex),
        );
      },
      child: Container(
        margin: REdgeInsets.all(isSelectedAvatar ? 0 : 25),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset(avatarImage, fit: BoxFit.contain),
      ),
    );
  }
}
