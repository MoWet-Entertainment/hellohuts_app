import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hellohuts_app/helper/logger.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/models/user.dart';
import 'package:hellohuts_app/services/auth_services/auth_service.dart';
import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';
import 'package:hellohuts_app/services/firestore_services/firestore_service.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:meta/meta.dart';

class FireBaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  String _verificationCode = "";
  User _userModel;
  User get userModel => _userModel;
  FirebaseUser user;
  String userId;
  var log = getLogger('FireBaseAuthService');
  Future<User> _userFromFirebase(FirebaseUser user) async {
    if (user == null) {
      return null;
    }
    User userFromFirebase = await _firestoreService.getUser(user.uid);
    return userFromFirebase;
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      {User userModel,
      @required String email,
      @required String password}) async {
    try {
      final AuthResult authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = authResult.user;
      userId = user.uid;
      await _analyticsService.logSignUp('email');
      await _analyticsService.setUserProperties(userId: userId);
      userModel.copyWith(
        uid: userId,
      );
      createUser(userModel, newUser: true);
      return userModel;
    } on AuthException catch (error) {
      throw AuthException(error.code, error.message);
    } catch (error) {
      cprint(error, errorIn: 'signInWithEmailAndPassword');
      throw error;
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final AuthResult authResult = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: email);
      user = authResult.user;
      userId = user.uid;
      await _analyticsService.logSignUp('email');
      await _analyticsService.setUserProperties(userId: userId);
      return userId;
    } on AuthException catch (error) {
      throw AuthException(error.code, error.message);
    } catch (error) {
      user = null;
      throw error;
    }
  }

  @override
  Future<bool> isSignInWithEmailLink(String link) async {
    return await _firebaseAuth.isSignInWithEmailLink(link);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> sendSignInWithEmailLink(
      {String email,
      String url,
      bool handleCodeInApp,
      String iOSBundleID,
      String androidPackageName,
      bool androidInstallIfNotAvailable,
      String androidMinimumVersion}) async {
    return await _firebaseAuth.sendSignInWithEmailLink(
      email: email,
      url: url,
      handleCodeInApp: handleCodeInApp,
      iOSBundleID: iOSBundleID,
      androidPackageName: androidPackageName,
      androidInstallIfNotAvailable: androidInstallIfNotAvailable,
      androidMinimumVersion: androidMinimumVersion,
    );
  }

  @override
  Future<String> signInWithEmailAndLink({String email, String link}) async {
    try {
      final AuthResult authResult = await _firebaseAuth.signInWithEmailAndLink(
        email: email,
        link: link,
      );
      user = authResult.user;
      userId = user.uid;
      await _analyticsService.logSignUp('email with link');
      await _analyticsService.setUserProperties(userId: userId);
      return userId;
    }
    on AuthException catch (error) {
      throw AuthException(error.code, error.message);
    } catch (error) {
      user = null;
      debugLog(error);
      throw error;
    }
  }

  ///Create User from `Facebook Login`
  ///If the  user is new, the create a new user
  ///If user is old, then it authenticates and returns firebase user data
  @override
  Future<String> signInWithFacebook() async {
    try {
      final FacebookLogin facebookLogin = FacebookLogin();
      facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
      _analyticsService.logLogin('facebook_login');
      final FacebookLoginResult result =
          await facebookLogin.logIn(<String>['public_profile']);
      if (result == null) {
        throw Exception('Facbook login Cancelled by user');
      }
      if (result.accessToken != null) {
        final AuthResult authResult = await _firebaseAuth.signInWithCredential(
          FacebookAuthProvider.getCredential(
              accessToken: result.accessToken.token),
        );
        user = authResult.user;
        userId = user.uid;
        createUserFromSocialSignIn(user);
        return userId;
      }
      return null;
    }
    on AuthException catch (error) {
      throw AuthException(error.code, error.message);
    } catch (error) {
      user = null;
      cprint(error, errorIn: 'signInWithFacebook');
      throw error;
    }
  }

  @override
  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      _analyticsService.logLogin('google_signin');
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google Login cancelled by user');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final AuthResult authResult = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        user = authResult.user;
        userId = user.uid;
        createUserFromSocialSignIn(user);
        print("user id is: " + userId);
        return userId;
      }
      return null;
    }
    on AuthException catch (error) {
      throw AuthException(error.code, error.message);
    } catch (error) {
      user = null;
      cprint(error, errorIn: 'signInWithGoogle');
      throw error;
    }
  }

  @override
  Future<void> signOut() async {
    _userModel = null;
    userId = '';
    user = null;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final FacebookLogin facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    return _firebaseAuth.signOut();
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map((user) => _userModel);
  }

  @override
  Future<User> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<FirebaseUser> currentFirebaseUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  @override
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneNumber,
      timeout: Duration(seconds: 3),
      verificationCompleted: (authCredential) =>
          _verificationCompleted(authCredential),
      verificationFailed: (authException) => _verificationFailed(authException),
      codeSent: (verificationCode, [code]) =>
          _smsCodeSent(verificationCode, [code]),
      codeAutoRetrievalTimeout: (verificationId) =>
          _codeAuthRetrievalTimeOut(verificationId),
    );
  }

  _verificationCompleted(AuthCredential authCredential) {
    // _firebaseAuth.signInWithCredential(authCredential);
  }

  String _verificationFailed(AuthException authException) {
    return authException.message;
  }

  _smsCodeSent(String verificationCode, List<int> code) {
    this._verificationCode = verificationCode;
  }

  _codeAuthRetrievalTimeOut(String verificationCode) {
    this._verificationCode = verificationCode;
  }

  @override
  Future<String> signInWithSmsCode(String smsCode) async {
    try {
      _analyticsService.logLogin('sms_code_based');
      print("sms code :" + smsCode.toString());
      print("verification code: " + _verificationCode);
      AuthCredential authCredential = PhoneAuthProvider.getCredential(
          verificationId: _verificationCode, smsCode: smsCode);
      final AuthResult authResult =
          await _firebaseAuth.signInWithCredential(authCredential);
      user = authResult.user;
      userId = user.uid;
      createUserFromSocialSignIn(user);
      return userId;
    }on AuthException catch (error) {
      throw AuthException(error.code, error.message);
    } catch (error) {
      user = null;
      cprint(error, errorIn: 'signInWithSms');
      throw error;
    }
  }

  /// `Create` and `Update` user
  /// If `newUser` is `true`, then new User is created
  /// Else existing user will get updated with new values
  void createUser(User user, {bool newUser = false}) {
    if (newUser) {
      _analyticsService.logEvent(event: 'create_newUser');
      _userModel = user;
      //time at which the user is created
      String createdDateTime = setCurrentDateTime();
      _userModel.copyWith(
          createdAt: createdDateTime,
          userRole: 'reg_user',
          lastLoginAt: createdDateTime);
    }
    String lastUpdatedDateTime = setCurrentDateTime();
    _userModel = user;
    _userModel.copyWith(profLastUpdatedAt: lastUpdatedDateTime);
    _firestoreService.createUser(_userModel);
  }

  /// Create user profile from Social Media login
  createUserFromSocialSignIn(FirebaseUser user) async {
    var diff = DateTime.now().difference(user.metadata.creationTime);
    // Check if user is new or old
    // If user is new then add new user to firebase database
    bool val = await _firestoreService.checkUserIsPresent(user);
    if (!val) {
      String currentDateTime = setCurrentDateTime();
      User model = User(
        photoUrl: user.photoUrl,
        displayName: user.displayName,
        email: user.email,
        uid: user.uid,
        phoneNumber: user.phoneNumber,
        isEmailVerified: user.isEmailVerified,
        createdAt: currentDateTime,
        lastLoginAt: currentDateTime,
        profLastUpdatedAt: currentDateTime,
        userRole: 'reg_user',
      );

      createUser(model, newUser: true);
    } else {
      cprint('Last login at: ${user.metadata.lastSignInTime}');
    }
  }

  @override
  void dispose() {}
}
