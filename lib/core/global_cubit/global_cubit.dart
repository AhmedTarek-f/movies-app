import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/cache/shared_preferences_helper.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/core/global_cubit/global_state.dart';
import 'package:movies_app/core/router/route_names.dart';

@injectable
class GlobalCubit extends Cubit<GlobalState> {
  final SharedPreferencesHelper _sharedPreferencesHelper;
  GlobalCubit(this._sharedPreferencesHelper) : super(GlobalInitial());

  late int languageSelectedIndex;
  late bool isArLanguage;
  bool isDeleteAccountLoading = false;
  late final String redirectedScreen;

  void onInit() {
    isArLanguage = _sharedPreferencesHelper.getBool(
      key: ConstKeys.isArLanguage,
    );
    languageSelectedIndex = isArLanguage ? 1 : 0;
    setRedirectedScreen();
  }

  Future<void> onLanguageIndexChanged({required int index}) async {
    if (languageSelectedIndex != index && index == 0) {
      languageSelectedIndex = index;
      await _sharedPreferencesHelper.saveBool(
        key: ConstKeys.isArLanguage,
        value: false,
      );
      isArLanguage = false;
      emit(ChangeLanguageIndexState(selectedLang: "en"));
    } else if (languageSelectedIndex != index && index == 1) {
      languageSelectedIndex = index;
      await _sharedPreferencesHelper.saveBool(
        key: ConstKeys.isArLanguage,
        value: true,
      );
      isArLanguage = true;
      emit(ChangeLanguageIndexState(selectedLang: "ar"));
    }
  }

  void setRedirectedScreen() {
    final isLoginScreen = _sharedPreferencesHelper.getBool(
      key: ConstKeys.isLoginScreen,
    );
    if (isLoginScreen) {
      redirectedScreen = RouteNames.login;
    } else {
      redirectedScreen = RouteNames.onboarding;
    }
  }
}
