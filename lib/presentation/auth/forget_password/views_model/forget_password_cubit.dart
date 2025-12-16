import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';
import 'package:movies_app/domain/use_cases/forget_password/forget_password_use_case.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_intent.dart';
import 'package:movies_app/presentation/auth/forget_password/views_model/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordCubit(this._forgetPasswordUseCase)
    : super(const ForgetPasswordState());

  late final TextEditingController emailController;
  late GlobalKey<FormState> forgetPasswordFormKey;

  Future<void> doIntent({required ForgetPasswordIntent intent}) async {
    switch (intent) {
      case ForgetPasswordInitializationIntent():
        _onInit();
      case VerifyEmailIntent():
        await verifyEmail();
    }
  }

  void _onInit() {
    forgetPasswordFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
  }

  void _enableAutoValidateMode() {
    emit(state.copyWith(autoValidateMode: AutovalidateMode.always));
  }

  Future<void> verifyEmail() async {
    if (forgetPasswordFormKey.currentState!.validate()) {
      emit(state.copyWith(forgetPasswordStatus: const StateStatus.loading()));
      final result = await _forgetPasswordUseCase.invoke(
        email: emailController.text.trim(),
      );
      switch (result) {
        case Success<void>():
          emit(
            state.copyWith(
              forgetPasswordStatus: const StateStatus.success(null),
            ),
          );
        case Failure<void>():
          emit(
            state.copyWith(
              forgetPasswordStatus: StateStatus.failure(
                result.responseException,
              ),
            ),
          );
      }
    } else {
      _enableAutoValidateMode();
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
