import 'package:movies_app/core/exceptions/response_exception.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class EnableAutoValidateModeState extends LoginState {}

final class ChangeObscureState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginFailureState extends LoginState {
  LoginFailureState({required this.errorData});
  final ResponseException errorData;
}

final class LoginLoadingState extends LoginState {}
