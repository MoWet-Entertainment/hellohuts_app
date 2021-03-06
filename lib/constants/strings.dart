class AppStrings {
  // Generic strings
  static const String ok = 'OK';
  static const String cancel = 'Cancel';

  // Logout
  static const String logout = 'Logout';
  static const String logoutAreYouSure =
      'Are you sure that you want to logout?';
  static const String logoutFailed = 'Logout failed';

//Signup

  static const String signUpHeroText = 'Smarter ways to your dream home';
  // Sign In Page
  static const String signIn = 'Login';
  static const String signUp = 'Sign Up';

  static const String signInWithEmailPassword =
      'Sign in with email and password';
  static const String signInWithEmailLink = 'Sign in with email link';
  static const String signInWithFacebook = 'Sign in with Facebook';
  static const String signInWithGoogle = 'Sign in with Google';
  static const String goAnonymous = 'Go anonymous';
  static const String or = 'or';
  static String greetText = "Hello ";
  static String greetTextSignUp = "Hello there!";
  static String actionTextSignUp = "Get Started with Hellohuts";
  static String switchToSignInText = "Already have an account?";
  static String actionTextSignIn = "Welcome Back to Hellohuts";
  static String switchToSignUp = "New to Hellohuts?";
  static String signInWithPhone = "Login with Phone Number";
  static String signUpWithPhone = "Sign up with Phone Number";
  static String continueWithText = "Continue with";
  // Email & Password page
  static const String register = 'Register';
  static const String forgotPassword = 'Forgot password';
  static const String forgotPasswordQuestion = 'Forgot password?';
  static const String createAnAccount = 'Create an account';
  static const String needAnAccount = 'Need an account? Register';
  static const String haveAnAccount = 'Have an account already?';
  static const String signInFailed = 'Sign in failed';
  static const String registrationFailed = 'Registration failed';
  static const String passwordResetFailed = 'Password reset failed';
  static const String sendResetLink = 'Send Reset Link';
  static const String backToSignIn = 'Back to sign in';
  static const String resetLinkSentTitle = 'Reset link sent';
  static const String resetLinkSentMessage =
      'Check your email to reset your password';
  static const String emailLabel = 'Email';
  static const String emailHint = 'test@test.com';
  static const String userNotFoundSignUpInstead =
      'User not found. Sign up instead?';
  static const String emailAlreadyUsed =
      'This email is already used. Please sign in';
  static const String password8CharactersLabel = 'Password (8+ characters)';
  static const String passwordLabel = 'Password';
  static const String invalidEmailErrorText = 'Email entered is invalid';
  static const String invalidEmailEmpty = 'Email can\'t be empty';
  static const String invalidPasswordTooShort = 'Password is too short';
  static const String passwordWeak = 'Password entered is too weak.';
  static const String invalidPasswordEmpty = 'Password can\'t be empty';
  static const String invalidPassword = 'Password entered is incorrect.';
  static const String userDisabledText =
      "Sorry! We are unable to forward your request";

  static const String tooManyRequests =
      'Sorry! Too many requests. Please try again later';

  static const String operationNotAllowed = 'Sorry! Operation not allowed';
  static const String accountExistsWithDiffCredentials =
      "Already exists an account with this email address";
  static const String genericErrorText =
      'Sorry!. Unable to process the request. Please connect with HelloCare.';

  // Email link page
  static const String submitEmailAddressLink =
      'Submit your email address to receive an activation link.';
  static const String checkYourEmail = 'Check your email';
  static String activationLinkSent(String email) =>
      'We have sent an activation link to $email';
  static const String errorSendingEmail = 'Error sending email';
  static const String sendActivationLink = 'Send activation link';
  static const String activationLinkError = 'Email activation error';
  static const String submitEmailAgain =
      'Please submit your email address again to receive a new activation link.';
  static const String userAlreadySignedIn =
      'Received an activation link but you are already signed in.';
  static const String isNotSignInWithEmailLinkMessage =
      'Invalid activation link';

  // Home page
  static const String homePage = 'Home Page';

  // Developer menu
  static const String developerMenu = 'Developer menu';
  static const String authenticationType = 'Authentication type';
  static const String firebase = 'Firebase';
  static const String mock = 'Mock';

  //Search Screen
  static const String searchHintTextForExplore = "Where do you want your home?";
  static const String searchHintTextForCategories =
      "Search like Living room design";

  //Services Offered
  static String servicesOffered_WhatCanWeHelpWithText(String location) =>
      "What can we help you find in " + location + "?";
}
