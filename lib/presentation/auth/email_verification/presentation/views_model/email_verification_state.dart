import 'package:equatable/equatable.dart';
import 'package:movies_app/core/state_status/state_status.dart';

final class EmailVerificationState extends Equatable {
  final StateStatus<void> sendEmailVerificationStatus;
  final bool isEmailVerified;
  const EmailVerificationState({
    this.sendEmailVerificationStatus = const StateStatus.initial(),
    this.isEmailVerified = false,
  });
  EmailVerificationState copyWith({
    StateStatus<void>? sendEmailVerificationStatus,
    bool? isEmailVerified,
  }) {
    return EmailVerificationState(
      sendEmailVerificationStatus:
          sendEmailVerificationStatus ?? this.sendEmailVerificationStatus,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  @override
  List<Object?> get props => [sendEmailVerificationStatus, isEmailVerified];
}
