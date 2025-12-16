import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/state_status/state_status.dart';

final class ForgetPasswordState extends Equatable {
  final StateStatus<void> forgetPasswordStatus;
  final AutovalidateMode autoValidateMode;

  const ForgetPasswordState({
    this.forgetPasswordStatus = const StateStatus.initial(),
    this.autoValidateMode = AutovalidateMode.disabled,
  });

  ForgetPasswordState copyWith({
    StateStatus<void>? forgetPasswordStatus,
    AutovalidateMode? autoValidateMode,
  }) {
    return ForgetPasswordState(
      forgetPasswordStatus: forgetPasswordStatus ?? this.forgetPasswordStatus,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
    );
  }

  @override
  List<Object?> get props => [forgetPasswordStatus, autoValidateMode];
}
