import 'package:equatable/equatable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';

class LoginState extends Equatable {
  final StateStatus<Result<void>> loginStatus;
  const LoginState({this.loginStatus = const StateStatus.initial()});

  @override
  List<Object?> get props => [loginStatus];

  LoginState copyWith({StateStatus<Result<void>>? loginStatus}) {
    return LoginState(loginStatus: loginStatus ?? this.loginStatus);
  }
}

final class EnableAutoValidateModeState extends LoginState {
  @override
  List<Object?> get props => [];
}

final class ChangeObscureState extends LoginState {
  ChangeObscureState({this.isObscure = true});
  bool isObscure;

  ChangeObscureState copyWith2({required bool isObscurePassword}) {
    isObscurePassword = !isObscurePassword;
    return ChangeObscureState(isObscure: isObscurePassword);
  }

  @override
  List<Object?> get props => [isObscure];
}
