import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';
import 'package:movies_app/domain/use_cases/email_verification/send_email_verification_use_case.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views_model/email_verification_intent.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views_model/email_verification_state.dart';

@injectable
class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final SendEmailVerificationUseCase _sendEmailVerificationUseCase;

  EmailVerificationCubit(this._sendEmailVerificationUseCase)
    : super(const EmailVerificationState());

  Future<void> doIntent({required EmailVerificationIntent intent}) async {
    switch (intent) {
      case EmailVerificationInitializationIntent():
        await _onInit();
        break;
      case ManualEmailVerificationIntent():
        _checkEmailVerificationStatus();
        break;
      case ResendEmailVerificationRequestIntent():
        await _sendEmailVerification();
        break;
    }
  }

  Future<void> _onInit() async {
    await _sendEmailVerification();
    await _setTimerForAutoRedirect();
  }

  void _checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      emit(
        state.copyWith(
          sendEmailVerificationStatus: const StateStatus.initial(),
          isEmailVerified: true,
        ),
      );
    }
  }

  Future<void> _sendEmailVerification() async {
    emit(
      state.copyWith(sendEmailVerificationStatus: const StateStatus.loading()),
    );
    final result = await _sendEmailVerificationUseCase.invoke();
    switch (result) {
      case Success<void>():
        emit(
          state.copyWith(
            sendEmailVerificationStatus: const StateStatus.success(null),
          ),
        );
        emit(
          state.copyWith(
            sendEmailVerificationStatus: const StateStatus.initial(),
          ),
        );
      case Failure<void>():
        emit(
          state.copyWith(
            sendEmailVerificationStatus: StateStatus.failure(
              result.responseException,
            ),
          ),
        );
        emit(
          state.copyWith(
            sendEmailVerificationStatus: const StateStatus.initial(),
          ),
        );
    }
  }

  Future<void> _setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
        timer.cancel();
        emit(state.copyWith(isEmailVerified: true));
      }
    });
  }
}
