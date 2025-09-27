sealed class SignUpIntent {}

class InitializeSignupFormIntent extends SignUpIntent {}

class TogglePasswordObscureIntent extends SignUpIntent {}

class ToggleConfirmPasswordObscureIntent extends SignUpIntent {}

class SignupWithEmailAndPasswordIntent extends SignUpIntent {}

class ChangeAvatarIndexIntent extends SignUpIntent {
  final int avatarIndex;
  ChangeAvatarIndexIntent({required this.avatarIndex});
}

class MoveToSelectedAvatarIntent extends SignUpIntent {
  final int avatarIndex;
  MoveToSelectedAvatarIntent({required this.avatarIndex});
}
