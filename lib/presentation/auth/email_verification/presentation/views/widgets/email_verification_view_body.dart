import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_animations.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/router/route_names.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views_model/email_verification_cubit.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views_model/email_verification_intent.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views_model/email_verification_state.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';
import 'package:movies_app/utils/common_widgets/success_screen.dart';
import 'package:movies_app/utils/loaders/loaders.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = FirebaseAuth.instance;
    final emailVerificationCubit = BlocProvider.of<EmailVerificationCubit>(
      context,
    );
    return BlocListener<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state.sendEmailVerificationStatus.isSuccess) {
          Loaders.showSuccessMessage(
            message: AppText.verificationMessageSent,
            context: context,
          );
        } else if (state.isEmailVerified) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SuccessScreen(
                image: AppAnimations.successEmailVerification,
                title: AppText.verified,
                subTitle: AppText.emailVerified,
                isAnimation: true,
                // onPressed: () => Navigator.of(
                //   context,
                // ).pushReplacementNamed(RouteNames.homeScreen),
                onPressed: () => Navigator.of(
                  context,
                ).pushReplacementNamed(RouteNames.login),
              ),
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: RPadding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.deliveredEmailIllustration, width: 0.6.sw),
              const RSizedBox(height: 32),
              Text(
                AppText.verifyYourEmail.tr(),
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const RSizedBox(height: 16),
              Text(
                auth.currentUser?.email ?? "",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary.withValues(alpha: 0.8),
                ),
                textAlign: TextAlign.center,
              ),
              const RSizedBox(height: 16),
              Text(
                AppText.verifyNow.tr(),
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const RSizedBox(height: 32),
              CustomElevatedButton(
                onPressed: () async {
                  await emailVerificationCubit.doIntent(
                    intent: const ManualEmailVerificationIntent(),
                  );
                },
                buttonTitle: AppText.continueText.tr(),
              ),
              const RSizedBox(height: 16),
              RSizedBox(
                width: ScreenUtil().screenWidth,
                child: TextButton(
                  onPressed: () async {
                    await emailVerificationCubit.doIntent(
                      intent: const ResendEmailVerificationRequestIntent(),
                    );
                  },
                  child: Text(
                    AppText.resendEmail.tr(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
