import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/auth/login/views_model/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    onInit();
  }

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> loginFormKey;
  bool isObscure = true;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void onInit() {
    loginFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void enableAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(EnableAutoValidateModeState());
  }

  void toggleObscure() {
    isObscure = !isObscure;
    emit(ChangeObscureState());
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
    } else {
      enableAutoValidateMode();
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
