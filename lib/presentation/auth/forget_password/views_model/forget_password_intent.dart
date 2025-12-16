sealed class ForgetPasswordIntent {
  const ForgetPasswordIntent();
}

final class ForgetPasswordInitializationIntent extends ForgetPasswordIntent {
  const ForgetPasswordInitializationIntent();
}

final class VerifyEmailIntent extends ForgetPasswordIntent {
  const VerifyEmailIntent();
}
