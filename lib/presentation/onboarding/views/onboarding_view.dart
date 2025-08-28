import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/onboarding/views/widgets/onboarding_view_body.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_cubit.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_intent.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (context) =>
          getIt.get<OnboardingCubit>()
            ..doIntent(intent: OnboardingInitializeIntent()),
      child: const Scaffold(body: OnboardingViewBody()),
    );
  }
}
