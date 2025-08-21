sealed class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class ChangeLanguageIndexState extends GlobalState {
  ChangeLanguageIndexState({required this.selectedLang});
  final String selectedLang;
}
