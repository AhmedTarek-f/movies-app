import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/cache/shared_preferences_helper.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/core/global_cubit/global_intent.dart';
import 'package:movies_app/core/global_cubit/global_state.dart';
import 'package:movies_app/core/router/route_names.dart';

@injectable
class GlobalCubit extends Cubit<GlobalState> {
  final SharedPreferencesHelper _sharedPreferencesHelper;
  final FirebaseAuth _auth;

  GlobalCubit(this._sharedPreferencesHelper, this._auth)
    : super(const GlobalState());

  Future<void> doIntent({required GlobalIntent intent}) async {
    switch (intent) {
      case GlobalInitializationIntent():
        _onInit();
        break;
      case ChangeLanguageIntent():
        await _changedLanguageIndex(
          newSelectedLanguage: intent.newSelectedLanguage,
        );
        break;
    }
  }

  void _onInit() {
    _getSelectedLanguage();
    _setRedirectedScreen();
  }

  void _getSelectedLanguage() {
    final isArLanguage = _sharedPreferencesHelper.getBool(
      key: ConstKeys.isArLanguage,
    );
    if (isArLanguage) {
      emit(state.copyWith(selectedLanguage: Language.arabic));
    } else {
      emit(state.copyWith(selectedLanguage: Language.english));
    }
  }

  void _setRedirectedScreen() {
    final isLoginScreen = _sharedPreferencesHelper.getBool(
      key: ConstKeys.isLoginScreen,
    );
    if (isLoginScreen) {
      if (_auth.currentUser != null) {
        if (_auth.currentUser?.emailVerified ?? false) {
          emit(state.copyWith(redirectedScreen: RouteNames.signup));
          // emit(state.copyWith(redirectedScreen: RouteNames.moviesNavigationView));
        } else {
          emit(state.copyWith(redirectedScreen: RouteNames.emailVerification));
        }
      } else {
        emit(state.copyWith(redirectedScreen: RouteNames.login));
      }
    } else {
      emit(state.copyWith(redirectedScreen: RouteNames.onboarding));
    }
  }

  Future<void> _changedLanguageIndex({
    required Language newSelectedLanguage,
  }) async {
    if (newSelectedLanguage == Language.english) {
      await _sharedPreferencesHelper.saveBool(
        key: ConstKeys.isArLanguage,
        value: false,
      );
      emit(state.copyWith(selectedLanguage: Language.english));
    } else {
      await _sharedPreferencesHelper.saveBool(
        key: ConstKeys.isArLanguage,
        value: true,
      );
      emit(state.copyWith(selectedLanguage: Language.arabic));
    }
  }
}
