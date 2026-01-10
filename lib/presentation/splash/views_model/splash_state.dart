import 'package:equatable/equatable.dart';
import 'package:movies_app/core/state_status/state_status.dart';

final class SplashState extends Equatable {
  final StateStatus<void> userDataStatus;

  const SplashState({this.userDataStatus = const StateStatus.initial()});

  SplashState copyWith({
    StateStatus<void>? userDataStatus,
    bool? isNavigationToLogin,
  }) {
    return SplashState(userDataStatus: userDataStatus ?? this.userDataStatus);
  }

  @override
  List<Object?> get props => [userDataStatus];
}
