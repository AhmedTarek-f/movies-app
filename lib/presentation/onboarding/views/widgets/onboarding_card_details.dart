import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_cubit.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_intent.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_state.dart';
import 'package:movies_app/utils/common_widgets/custom_elevated_button.dart';

class OnboardingCardDetails extends StatelessWidget {
  const OnboardingCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingCubit = BlocProvider.of<OnboardingCubit>(context);

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => current is! FinishState,
      builder: (context, state) {
        final card = Container(
          key: ValueKey(state.index),
          padding: REdgeInsets.only(
            right: 16,
            left: 16,
            bottom: state.index == 0 ? 33 : 20,
            top: 27,
          ),
          decoration: BoxDecoration(
            color: state.index == 0
                ? Colors.transparent
                : theme.colorScheme.onSecondary,
            borderRadius: state.index == 0
                ? null
                : BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
          ),
          child: Column(
            children: [
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Text(
                      state.onboardingData!.title,
                      textAlign: TextAlign.center,
                      style: state.index == 0
                          ? theme.textTheme.displaySmall
                          : theme.textTheme.headlineSmall,
                    ),
                    Visibility(
                      visible: state.onboardingData!.description.isNotEmpty,
                      child: RPadding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          state.onboardingData!.description,
                          textAlign: state.index == 0
                              ? TextAlign.justify
                              : TextAlign.center,
                          style: state.index == 0
                              ? theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: theme.colorScheme.secondary.withValues(
                                    alpha: 0.7,
                                  ),
                                )
                              : theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: theme.colorScheme.secondary,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const RSizedBox(height: 24),
              CustomElevatedButton(
                onPressed: () async {
                  await onboardingCubit.doIntent(
                    intent: OnboardingNextIntent(),
                  );
                },
                buttonTitle: state.onboardingData!.buttonText,
              ),
              Visibility(
                visible: state.index > 1,
                child: RPadding(
                  padding: const EdgeInsets.only(top: 16),
                  child: CustomElevatedButton(
                    onPressed: () {
                      onboardingCubit.doIntent(
                        intent: OnboardingPreviousIntent(),
                      );
                    },
                    backgroundColor: theme.colorScheme.onSecondary,
                    borderColor: theme.colorScheme.primary,
                    buttonTitle: AppText.back,
                    titleStyle: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

        return (state.index == 0)
            ? card
                  .animate(key: ValueKey("anim-${state.index}"))
                  .slideY(
                    duration: const Duration(milliseconds: 600),
                    begin: 1,
                    end: 0,
                  )
                  .fade()
            : card
                  .animate(
                    key: ValueKey(
                      "anim-${state.index}-${state.isGoingForward}",
                    ),
                  )
                  .slideX(
                    duration: const Duration(milliseconds: 600),
                    begin: state.isGoingForward ? -1 : 1,
                    end: 0,
                  )
                  .fade();
      },
    );
  }
}
