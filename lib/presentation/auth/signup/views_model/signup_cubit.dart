import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/client/api_result.dart';
import 'package:movies_app/core/state_status/state_status.dart';
import 'package:movies_app/domain/entities/requests/signup_request/signup_request_entity.dart';
import 'package:movies_app/domain/use_cases/signup/signup_use_case.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_intent.dart';
import 'package:movies_app/presentation/auth/signup/views_model/signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase _signupUseCase;
  SignupCubit(this._signupUseCase) : super(const SignupState());

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneNumberController;
  late final PageController? avatarPageController;
  late GlobalKey<FormState> signupFormKey;

  Future<void> doIntent({required SignUpIntent intent}) async {
    switch (intent) {
      case InitializeSignupFormIntent():
        _onInit();
        break;
      case TogglePasswordObscureIntent():
        _togglePasswordObscure();
        break;
      case ToggleConfirmPasswordObscureIntent():
        _toggleConfirmPasswordObscure();
        break;
      case SignupWithEmailAndPasswordIntent():
        await _signup();
        break;
      case ChangeAvatarIndexIntent():
        _getCurrentAvatarIndex(index: intent.avatarIndex);
        break;
      case MoveToSelectedAvatarIntent():
        _moveToSelectedAvatarIndex(index: intent.avatarIndex);
        break;
    }
  }

  void _onInit() async {
    signupFormKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    avatarPageController = PageController(
      initialPage: state.avatarIndex,
      viewportFraction: 0.4.r,
    );
  }

  void _enableAutoValidateMode() {
    emit(state.copyWith(autoValidateMode: AutovalidateMode.always));
  }

  void _getCurrentAvatarIndex({required int index}) {
    emit(state.copyWith(avatarIndex: index));
  }

  void _moveToSelectedAvatarIndex({required int index}) {
    avatarPageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void _togglePasswordObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void _toggleConfirmPasswordObscure() {
    emit(state.copyWith(isObscureConfirm: !state.isObscureConfirm));
  }

  Future<void> _signup() async {
    if (signupFormKey.currentState!.validate()) {
      emit(state.copyWith(signupStatus: const StateStatus.loading()));
      final result = await _signupUseCase.invoke(
        request: SignupRequestEntity(
          fullName: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          selectedImage: state.avatarIndex,
        ),
      );
      switch (result) {
        case Success<void>():
          emit(state.copyWith(signupStatus: const StateStatus.success(null)));
          break;
        case Failure<void>():
          emit(
            state.copyWith(
              signupStatus: StateStatus.failure(result.responseException),
            ),
          );
          break;
      }
    } else {
      _enableAutoValidateMode();
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
