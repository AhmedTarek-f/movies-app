import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/onboarding/onboarding_entity.dart';

class OnboardingState extends Equatable {
  final int index;
  final OnboardingEntity? onboardingData;
  final bool isGoingForward;

  const OnboardingState({
    this.onboardingData,
    this.index = 0,
    this.isGoingForward = true,
  });

  OnboardingState copyWith({
    OnboardingEntity? onboardingData,
    int? index,
    bool? isGoingForward,
  }) {
    return OnboardingState(
      index: index ?? this.index,
      onboardingData: onboardingData ?? this.onboardingData,
      isGoingForward: isGoingForward ?? this.isGoingForward,
    );
  }

  @override
  List<Object?> get props => [index, onboardingData, isGoingForward];
}

class FinishState extends OnboardingState{
  @override
  List<Object?> get props => [];
}