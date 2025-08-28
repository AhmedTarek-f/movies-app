abstract final class AppText {
  //Login
  static const String email = "Email";
  static const String emailHint = "Enter your email address";
  static const String password = "Password";
  static const String passwordHint = "**********";
  static const String forgotPassword = "Forget Password ?";
  static const String login = "Login";
  static const String dontHaveAcc = "Don’t Have Account ?";
  static const String createOne = "Create One";
  static const String or = "OR";
  static const String loginWithGoogle = "Login With Google";
  static const String loggingYouIn = "loggingYouIn";

  // Onboarding
  static const String onboardingTitle1 = "Find Your Next Favorite Movie Here";
  static const String onboardingTitle2 = "Discover Movies";
  static const String onboardingTitle3 = "Explore All Genres";
  static const String onboardingTitle4 = "Create Watchlists";
  static const String onboardingTitle5 = "Rate, Review, and Learn";
  static const String onboardingTitle6 = "Start Watching Now";
  static const String onboardingDescription1 =
      "Get access to a huge library of movies to suit all tastes. You will surely like it.";
  static const String onboardingDescription2 =
      "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.";
  static const String onboardingDescription3 =
      "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.";
  static const String onboardingDescription4 =
      "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.";
  static const String onboardingDescription5 =
      "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.";
  static const String onboardingDescription6 = "";
  static const String exploreNow = "Explore Now";
  static const String next = "Next";
  static const String finish = "Finish";
  static const String back = "Back";

  // Validations
  static const String nameValidation = "Name field is required";
  static const String phoneNumberValidation = "Phone number field is required";
  static const String phoneNumberValidation2 =
      "Phone Number should consist of 11 digits";
  static const String emailValidation = "Email field is required";
  static const String emailValidation2 = "Enter a valid email";
  static const String passwordValidation = "Password field is required";
  static const String passwordValidation2 =
      "Password field should contain at least 8 characters";
  static const String confirmPasswordValidation =
      "Confirm password field is required";
  static const String confirmPasswordValidation2 =
      "Password does not match, please check the entered password";
  static const String passwordValidation3 = "Password cannot contain spaces";
  static const String passwordValidation4 =
      "Password must contain at least one number";
  static const String passwordValidation5 =
      "Password must not exceed 20 characters";

  //Exceptions
  static const String connectionError =
      "Please check your internet connection and try again";
  static const String noResponseReceivedMessage =
      "No response received or response is not in expected format.";
  static const String error = "Error";
  static const String unexpectedError = "Unexpected error:";
  static const String unexpectedErrorOccurred = "Unexpected error occurred.";
  static const String requestCancelled = "Request was cancelled.";
  static const String receiveTimeout =
      "Receive timeout, please try again later.";
  static const String sendTimeout = "Send timeout, please try again later.";
  static const String connectionTimeout =
      "Connection timeout, please try again later.";
  static const String networkError =
      "Something went wrong. Please check your internet connection.";
  static const String anUnknownErrorOccurred = "An unknown error occurred.";

  // Firebase Exceptions
  static const String emailAlreadyInUse = "emailAlreadyInUse";
  static const String invalidEmail = "invalidEmail";
  static const String networkRequestFailed = "networkRequestFailed";
  static const String weakPassword = "weakPassword";
  static const String userDisabled = "userDisabled";
  static const String userNotFound = "userNotFound";
  static const String invalidVerificationCode = "invalidVerificationCode";
  static const String invalidVerificationId = "invalidVerificationId";
  static const String quotaExceeded = "quotaExceeded";
  static const String emailAlreadyExists = "emailAlreadyExists";
  static const String providerAlreadyLinked = "providerAlreadyLinked";
  static const String requiresRecentLogin = "requiresRecentLogin";
  static const String credentialAlreadyInUse = "credentialAlreadyInUse";
  static const String userMismatch = "userMismatch";
  static const String accountExistsWithDifferentCredential =
      "accountExistsWithDifferentCredential";
  static const String operationNotAllowed = "operationNotAllowed";
  static const String expiredActionCode = "expiredActionCode";
  static const String invalidActionCode = "invalidActionCode";
  static const String missingActionCode = "missingActionCode";
  static const String userTokenExpired = "userTokenExpired";
  static const String wrongPassword = "wrongPassword";
  static const String userTokenRevoked = "userTokenRevoked";
  static const String invalidMessagePayload = "invalidMessagePayload";
  static const String invalidSender = "invalidSender";
  static const String invalidRecipientEmail = "invalidRecipientEmail";
  static const String missingIframeStart = "missingIframeStart";
  static const String missingIframeEnd = "missingIframeEnd";
  static const String missingIframeSrc = "missingIframeSrc";
  static const String authDomainConfigRequired = "authDomainConfigRequired";
  static const String missingAppCredential = "missingAppCredential";
  static const String invalidAppCredential = "invalidAppCredential";
  static const String sessionCookieExpired = "sessionCookieExpired";
  static const String uidAlreadyExists = "uidAlreadyExists";
  static const String invalidCordovaConfiguration =
      "invalidCordovaConfiguration";
  static const String appDeleted = "appDeleted";
  static const String userTokenMismatch = "userTokenMismatch";
  static const String webStorageUnsupported = "webStorageUnsupported";
  static const String invalidCredential = "invalidCredential";
  static const String appNotAuthorized = "appNotAuthorized";
  static const String keychainError = "keychainError";
  static const String internalError = "internalError";
  static const String invalidLoginCredentials = "invalidLoginCredentials";
  static const String unknownAuthError = "unknownAuthError";
  static const String unknownFirebaseError = "unknownFirebaseError";
  static const String invalidCustomToken = "invalidCustomToken";
  static const String customTokenMismatch = "customTokenMismatch";
  static const String captchaCheckFailed = "captchaCheckFailed";
  static const String googleLoginCanceled = "googleLoginCanceled";

  // Firestore-related errors
  static const String permissionDenied = "permissionDenied";
  static const String unavailable = "unavailable";
  static const String notFound = "notFound";
  static const String alreadyExists = "alreadyExists";
  static const String resourceExhausted = "resourceExhausted";
  static const String cancelled = "cancelled";
  static const String deadlineExceeded = "deadlineExceeded";
  static const String dataLoss = "dataLoss";
  static const String invalidArgument = "invalidArgument";
  static const String aborted = "aborted";
  static const String outOfRange = "outOfRange";
  static const String unknownErrorMessage = "unknownErrorMessage";
}
