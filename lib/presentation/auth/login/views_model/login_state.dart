import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';

class LoginState extends Equatable {
  final StateStatus<Result<void>> loginStatus;
  final bool isObscure;
  final AutovalidateMode autoValidateMode;
  const LoginState({
    this.loginStatus = const StateStatus.initial(),
    this.isObscure = true,
    this.autoValidateMode = AutovalidateMode.disabled,
  });

  LoginState copyWith({
    StateStatus<Result<void>>? loginStatus,
    bool? isObscure,
    AutovalidateMode? autoValidateMode,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      isObscure: isObscure ?? this.isObscure,
    );
  }

  @override
  List<Object?> get props => [loginStatus, isObscure, autoValidateMode];
}
