import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/cache/shared_preferences_helper.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/domain/entities/onboarding/onboarding_entity.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_intent.dart';
import 'package:movies_app/presentation/onboarding/views_model/onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final SharedPreferencesHelper _sharedPreferencesHelper;
  OnboardingCubit(this._sharedPreferencesHelper)
    : super(const OnboardingState());

  final List<OnboardingEntity> _onboardingList = [
    OnboardingEntity(
      title: AppText.onboardingTitle1,
      image: AppImages.onboarding1,
      description: AppText.onboardingDescription1,
      buttonText: AppText.exploreNow,
      gradientColors: LinearGradient(
        colors: [
          const Color(0xff1E1E1E).withValues(alpha: 0),
          const Color(0xff121312).withValues(alpha: 0.5),
          const Color(0xff121312).withValues(alpha: 0.91),
          const Color(0xff121312),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0, 0.39, 0.68, 1],
      ),
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle2,
      image: AppImages.onboarding2,
      description: AppText.onboardingDescription2,
      buttonText: AppText.next,
      gradientColors: LinearGradient(
        colors: [
          const Color(0xff084250).withValues(alpha: 0),
          const Color(0xff084250),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0, 1],
      ),
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle3,
      image: AppImages.onboarding3,
      description: AppText.onboardingDescription3,
      buttonText: AppText.next,
      gradientColors: LinearGradient(
        colors: [
          const Color(0xff85210E).withValues(alpha: 0.0),
          const Color(0xff85210E),
        ],
        stops: const [0, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle4,
      image: AppImages.onboarding4,
      description: AppText.onboardingDescription4,
      buttonText: AppText.next,
      gradientColors: LinearGradient(
        colors: [
          const Color(0xff4C2471).withValues(alpha: 0),
          const Color(0xff4C2471),
        ],
        stops: const [0, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle5,
      image: AppImages.onboarding5,
      description: AppText.onboardingDescription5,
      buttonText: AppText.next,
      gradientColors: LinearGradient(
        colors: [
          const Color(0xff601321).withValues(alpha: 0),
          const Color(0xff601321),
        ],
        stops: const [0, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    OnboardingEntity(
      title: AppText.onboardingTitle6,
      image: AppImages.onboarding6,
      description: AppText.onboardingDescription6,
      buttonText: AppText.finish,
      gradientColors: LinearGradient(
        colors: [
          const Color(0xff2A2C30).withValues(alpha: 0),
          const Color(0xff2A2C30),
        ],
        stops: const [0, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  ];

  Future<void> doIntent({required OnboardingIntent intent}) async {
    switch (intent) {
      case OnboardingInitializeIntent():
        _onInit();
        break;
      case OnboardingNextIntent():
        await _goToNext();
        break;
      case OnboardingPreviousIntent():
        _goToPrevious();
        break;
    }
  }

  void _onInit() {
    emit(state.copyWith(onboardingData: _onboardingList[state.index]));
  }

  Future<void> _goToNext() async {
    if (state.index < _onboardingList.length - 1) {
      final newIndex = state.index + 1;
      emit(
        state.copyWith(
          index: newIndex,
          onboardingData: _onboardingList[newIndex],
          isGoingForward: true,
        ),
      );
    } else {
      await _finish();
    }
  }

  void _goToPrevious() {
    if (state.index > 0) {
      final newIndex = state.index - 1;
      emit(
        state.copyWith(
          index: newIndex,
          onboardingData: _onboardingList[newIndex],
          isGoingForward: false,
        ),
      );
    }
  }

  Future<void> _finish() async {
    await _sharedPreferencesHelper.saveBool(
      key: ConstKeys.isLoginScreen,
      value: true,
    );
    emit(FinishState());
  }
}
