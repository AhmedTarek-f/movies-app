import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.onPressed,
    required this.isAnimation,
  });

  final String image;
  final String title;
  final String subTitle;
  final bool isAnimation;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isAnimation
                    ? Lottie.asset(image, width: 0.6.sw)
                    : Image.asset(image, width: 0.6.sw),
                const RSizedBox(height: 32),
                Text(
                  title.tr(),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const RSizedBox(height: 16),
                Text(
                  subTitle.tr(),
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const RSizedBox(height: 32),
                CustomElevatedButton(
                  onPressed: onPressed,
                  buttonTitle: AppText.continueText.tr(),
                  titleStyle: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
