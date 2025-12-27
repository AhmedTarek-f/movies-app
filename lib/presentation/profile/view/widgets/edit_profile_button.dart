import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomElevatedButton(
      onPressed: () {},
      buttonTitle: AppText.editProfile,
      titleStyle: theme.textTheme.titleLarge?.copyWith(
        fontFamily: ConstKeys.roboto,
        fontWeight: FontWeight.w400,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}
