import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/state_status/state_status.dart';

class SignupState extends Equatable {
  final StateStatus<void> signupStatus;
  final bool isObscure;
  final bool isObscureConfirm;
  final AutovalidateMode autoValidateMode;
  final int avatarIndex;
  const SignupState({
    this.signupStatus = const StateStatus.initial(),
    this.isObscure = true,
    this.isObscureConfirm = true,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.avatarIndex = 4,
  });

  SignupState copyWith({
    StateStatus<void>? signupStatus,
    bool? isObscure,
    bool? isObscureConfirm,
    AutovalidateMode? autoValidateMode,
    int? avatarIndex,
  }) {
    return SignupState(
      signupStatus: signupStatus ?? this.signupStatus,
      isObscure: isObscure ?? this.isObscure,
      isObscureConfirm: isObscureConfirm ?? this.isObscureConfirm,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      avatarIndex: avatarIndex ?? this.avatarIndex,
    );
  }

  @override
  List<Object?> get props => [
    signupStatus,
    isObscure,
    isObscureConfirm,
    autoValidateMode,
    avatarIndex,
  ];
}
