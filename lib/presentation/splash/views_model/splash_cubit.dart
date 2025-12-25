import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';
import 'package:movies_app/domain/use_cases/splash/get_user_data_use_case.dart';
import 'package:movies_app/presentation/splash/views_model/splash_intent.dart';
import 'package:movies_app/presentation/splash/views_model/splash_state.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final GetUserDataUseCase _getUserDataUseCase;

  SplashCubit(this._getUserDataUseCase) : super(const SplashState());

  Future<void> doIntent({required SplashIntent intent}) async {
    switch (intent) {
      case GetUserDataIntent():
        await _getUserData();
        break;
      case NavigateToLoginViewIntent():
        await _navigateToLogin();
        break;
    }
  }

  Future<void> _getUserData() async {
    emit(state.copyWith(userDataStatus: const StateStatus.loading()));
    final result = await _getUserDataUseCase.invoke();
    switch (result) {
      case Success<void>():
        emit(state.copyWith(userDataStatus: const StateStatus.success(null)));
        break;
      case Failure<void>():
        emit(
          state.copyWith(
            userDataStatus: StateStatus.failure(result.responseException),
          ),
        );
        emit(state.copyWith(userDataStatus: const StateStatus.initial()));
        break;
    }
  }

  Future<void> _navigateToLogin() async {
    MoviesMethodHelper.userData = null;
    emit(state.copyWith(isNavigationToLogin: true));
  }
}
