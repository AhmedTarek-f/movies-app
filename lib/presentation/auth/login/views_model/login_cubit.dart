import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';
import 'package:movies_app/domain/entities/requests/login_request_entity.dart';
import 'package:movies_app/domain/use_cases/login/login_with_email_and_password_use_case.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_intent.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_state.dart';
import 'package:movies_app/utils/movies_method_helper.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginWithEmailAndPasswordUseCase _loginWithEmailAndPasswordUseCase;
  LoginCubit(this._loginWithEmailAndPasswordUseCase)
    : super(const LoginState());

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late GlobalKey<FormState> loginFormKey;

  Future<void> doIntent({required LoginIntent intent}) async {
    switch (intent) {
      case InitializeLoginFormIntent():
        _onInit();
        break;
      case LoginWithEmailAndPasswordIntent():
        await _login();
        break;
      case ToggleObscurePasswordIntent():
        _toggleObscure();
        break;
    }
  }

  void _onInit() async {
    loginFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void _enableAutoValidateMode() {
    emit(state.copyWith(autoValidateMode: AutovalidateMode.always));
  }

  void _toggleObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  Future<void> _login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(state.copyWith(loginStatus: const StateStatus.loading()));
      final userData = await _loginWithEmailAndPasswordUseCase.invoke(
        request: LoginRequestEntity(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      switch (userData) {
        case Success<void>():
          {
            MoviesMethodHelper.userData = FirebaseAuth.instance.currentUser;
            emit(state.copyWith(loginStatus: const StateStatus.success(null)));
            break;
          }
        case Failure<void>():
          {
            emit(
              state.copyWith(
                loginStatus: StateStatus.failure(userData.responseException),
              ),
            );
            break;
          }
      }
    } else {
      _enableAutoValidateMode();
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
