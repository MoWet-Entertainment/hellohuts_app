class AuthErrors {
  //Firebase Login Errors
  static const String auth_InvalidEmail = "ERROR_INVALID_EMAIL";
  static const String auth_UserNotFound = "user-not-found";
  static const String auth_UserDisabled = "ERROR_USER_DISABLED";
  static const String auth_TooManyRequests = "ERROR_TOO_MANY_REQUESTS";
  static const String auth_OperationNotAllowed = "ERROR_OPERATION_NOT_ALLOWED";
  static const String auth_IncorrectPassword = "ERROR_WRONG_PASSWORD";

  //Firebase SignUp Errors
  static const String auth_WeakPassword = "weak-password";
  static const String auth_EmailAlreadyInUse = "email-already-in-use";

  //Firebase Social Error

  static const String auth_invalidCredentials = "ERROR_INVALID_CREDENTIAL";
  static const String auth_accoundExistsWithDiffCred =
      "account-exists-with-different-credential";
  static const String auth_invalidActivationCode = "ERROR_INVALID_ACTION_CODE";

  //Firebase password reset Errors
  static const String auth_expiredActionCode = "EXPIRED_ACTION_CODE";
  static const String auth_inavlidActionCode = "INVALID_ACTION_CODE";
  static const String auth_userDisabledPasswordReset = "USER_DISABLED";
  static const String auth_userNotFoundPasswordReset = "USER_NOT_FOUND";
  static const String auth_weakPasswordWhileReset = "WEAK_PASSWORD";
}
