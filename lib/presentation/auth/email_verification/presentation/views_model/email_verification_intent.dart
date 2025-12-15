sealed class EmailVerificationIntent {
  const EmailVerificationIntent();
}

class EmailVerificationInitializationIntent extends EmailVerificationIntent {
  const EmailVerificationInitializationIntent();
}

class ManualEmailVerificationIntent extends EmailVerificationIntent {
  const ManualEmailVerificationIntent();
}

class ResendEmailVerificationRequestIntent extends EmailVerificationIntent {
  const ResendEmailVerificationRequestIntent();
}
