import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/onboarding/views/widgets/onboarding_card_details.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_cubit.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_state.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listenWhen: (previous, current) => current is FinishState,
      listener: (BuildContext context, OnboardingState state) {
        if (state is FinishState) {
          // Navigator.of(context).pushReplacementNamed(RouteNames.login);
        }
      },
      builder: (context, state) => Stack(
        children: [
          Image.asset(state.onboardingData!.image, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: state.onboardingData!.gradientColors,
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: OnboardingCardDetails(),
          ),
        ],
      ),
    );
  }
}
