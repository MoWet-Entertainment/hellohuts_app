

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/firebase_constants.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/models/user/app_user.dart';
import 'package:hellohuts_app/services/auth_services/auth_service.dart';
import 'package:hellohuts_app/services/auth_services/firebase_auth_service.dart';
import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';
import 'package:hellohuts_app/services/firestore_services/firestore_service.dart';
import 'package:hellohuts_app/states/app_state.dart';
import 'package:hellohuts_app/helper/auth_status.dart';
import 'package:hellohuts_app/helper/logger.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';

class AuthState extends AppState {
  var logger = getLogger('AuthState');
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String userId;
  User user;
  AppUser _userModel;
  AppUser get userModel => _userModel;
  final AuthService _authService = locator<FireBaseAuthService>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  //To logout from the Device
  void logoutCallback() {
    authStatus = AuthStatus.NOT_DETERMINED;
    userId = '';
    user = null;
    _userModel = null;
    _authService.signOut();
    logger.d('Logged out from Hellohuts');
    notifyListeners();
  }

  //To change between Auth Methods, Login and Signup Pages
  void openSignUpPage() {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    userId = '';
    notifyListeners();
  }

  databaseInit() async {
    try {
      if (userId != null) {
        _userModel = await _firestoreService.getUser(userId);
      }
    } catch (error) {
      cprint(error, errorIn: 'databaseInit');
    }
  }

  //Verfiy userCredentials login - email with password
  Future<String> signInWithEmailAndPassword(String email, String password,
      {GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      loading = true;
      var result =
          await _authService.signInWithEmailAndPassword(email, password);
      loading = false;
      userId = result;
      authStatus = AuthStatus.LOGGED_IN;
      notifyListeners();
      return userId;
    } catch (error) {
      user = null;
      userId = null;
      _userModel = null;
      loading = false;
      String message;
      if (error.code.contains(AuthErrors.auth_InvalidEmail)) {
        message = AppStrings.invalidEmailErrorText;
      } else if (error.code.contains(AuthErrors.auth_UserNotFound)) {
        message = AppStrings.userNotFoundSignUpInstead;
      } else if (error.code.contains(AuthErrors.auth_UserDisabled)) {
        message = AppStrings.userDisabledText;
      } else if (error.code.contains(AuthErrors.auth_TooManyRequests)) {
        message = AppStrings.tooManyRequests;
      } else if (error.code.contains(AuthErrors.auth_OperationNotAllowed)) {
        message = AppStrings.operationNotAllowed;
      } else if (error.code.contains(AuthErrors.auth_IncorrectPassword)) {
        message = AppStrings.invalidPassword;
      } else {
        message = AppStrings.genericErrorText;
      }
      cprint(error, errorIn: 'signInWithEmailAndPassword');
      customSnackBar(scaffoldKey, message);
      _analyticsService.logLogin('email_login');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      notifyListeners();
      return null;
    }
  }

  Future<String> signUpWithEmailAndPassword(AppUser userModel, String password,
      {GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      loading = true;
      var result = await _authService.createUserWithEmailAndPassword(
          userModel: userModel, email: userModel.email, password: password);
      _userModel = result;
      userId = result.uid;
      authStatus = AuthStatus.LOGGED_IN;
      loading = false;
      notifyListeners();
      return userId;
    } catch (error) {
      user = null;
      userId = null;
      _userModel = null;
      loading = false;
      String message;
      logger.e(error.code);
      if (error.code.contains(AuthErrors.auth_EmailAlreadyInUse)) {
        message = AppStrings.emailAlreadyUsed;
      } else if (error.code.contains(AuthErrors.auth_WeakPassword)) {
        message = AppStrings.passwordWeak;
      } else {
        message = AppStrings.genericErrorText;
      }
      cprint(error, errorIn: 'signUpWithEmailAndPassword');
      customSnackBar(scaffoldKey, message);
      _analyticsService.logLogin('email_signup');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      notifyListeners();
      return null;
    }
  }

  Future<String> googleLogin({GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      userId = await _authService.signInWithGoogle();
      _userModel = await getCurrentUser();
      authStatus = AuthStatus.LOGGED_IN;
      print(authStatus);
      notifyListeners();
      return userId;
    } catch (error) {
      print(error);
      user = null;
      userId = null;
      _userModel = null;
      loading = false;
      String message;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'googleLogin');
      _analyticsService.logLogin('social_google_login');
      if (error.message.contains(AuthErrors.auth_accoundExistsWithDiffCred)) {
        message = AppStrings.accountExistsWithDiffCredentials;
        customSnackBar(scaffoldKey, message);
      }
      return null;
    }
  }

  Future<String> facebookLogin({GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      userId = await _authService.signInWithFacebook();
      loading = false;
      authStatus = AuthStatus.LOGGED_IN;
      notifyListeners();
      return userId;
    } catch (error) {
      user = null;
      userId = null;
      _userModel = null;
      loading = false;
      String message;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'facebookLogin');
      _analyticsService.logLogin('social_facebook_login');
      if (error.message.contains(AuthErrors.auth_accoundExistsWithDiffCred)) {
        message = AppStrings.accountExistsWithDiffCredentials;
        customSnackBar(scaffoldKey, message);
      }
      return null;
    }
  }

  /// Fetch current user profile
  Future<AppUser> getCurrentUser() async {
    try {
      loading = true;
      _analyticsService.logEvent(event: 'get_currentUSer');
      _userModel = await _authService.currentUser();
      print(_userModel);
      if (_userModel != null) {
        authStatus = AuthStatus.LOGGED_IN;
        userId = _userModel.uid;
      } else {
        authStatus = AuthStatus.NOT_LOGGED_IN;
      }
      loading = false;
      return _userModel;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'getCurrentUser');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }

  Future<void> sendEmailVerification(
      GlobalKey<ScaffoldState> scaffoldKey) async {
    User user = _authService.currentFirebaseUser();
    user.sendEmailVerification().then((_) {
      _analyticsService.logEvent(
        event: 'email_verifcation_sent',
        parameter: {userModel.displayName: user.email},
      );
      customSnackBar(
        scaffoldKey,
        'An email verification link is send to your email.',
      );
    }).catchError((error) {
      cprint(error.message, errorIn: 'sendEmailVerification');
      _analyticsService.logEvent(
          event: 'email_verifcation_block',
          parameter: {userModel.displayName: user.email});
      customSnackBar(
        scaffoldKey,
        error.message,
      );
    });
  }

  /// Send password reset link to email
  Future<void> forgetPassword(String email,
      {GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      await _authService.sendPasswordResetEmail(email).then((value) {
        customSnackBar(scaffoldKey,
            'A reset password link is sent yo your mail.You can reset your password from there');
        _analyticsService.logEvent(event: 'forgot+password');
      }).catchError((error) {
        cprint(error.message);
        return false;
      });
    } catch (error) {
      customSnackBar(scaffoldKey, error.message);
      return Future.value(false);
    }
  }
}
