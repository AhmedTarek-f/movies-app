import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';
import 'package:movies_app/domain/use_cases/profile/logout_use_case.dart';
import 'package:movies_app/presentation/profile/view_model/profile_intent.dart';
import 'package:movies_app/presentation/profile/view_model/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final LogoutUseCase _logoutUseCase;
  ProfileCubit(this._logoutUseCase) : super(const ProfileState());

  Future<void> doIntent(ProfileIntent intent) async {
    switch (intent) {
      case InitializeProfileIntent():
        await _init();
        break;
      case LogoutIntent():
        await _logout();
        break;
    }
  }

  Future<void> _init() async {
    // Initialize watch list when implmenting it
  }

  Future<void> _logout() async {
    emit(state.copyWith(logoutStatus: const StateStatus.loading()));
    final result = await _logoutUseCase.invoke();
    switch (result) {
      case Success<void>():
        emit(state.copyWith(logoutStatus: const StateStatus.success(null)));
        break;
      case Failure<void>():
        emit(
          state.copyWith(
            logoutStatus: StateStatus.failure(result.responseException),
          ),
        );
        emit(state.copyWith(logoutStatus: const StateStatus.initial()));
        break;
    }
  }
}
