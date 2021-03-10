import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/helper/logger.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/models/user/app_user.dart';
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
  AppUser _userModel;
  AppUser get userModel => _userModel;
  User user;
  String userId;
  var log = getLogger('FireBaseAuthService');
  Future<AppUser> _userFromFirebase(User user) async {
    if (user == null) {
      return null;
    }
    AppUser userFromFirebase = await _firestoreService.getUser(user.uid);
    return userFromFirebase;
  }

  @override
  Future<AppUser> createUserWithEmailAndPassword(
      {AppUser userModel,
      @required String email,
      @required String password}) async {
    try {
      final UserCredential authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = authResult.user;
      userId = user.uid;
      await _analyticsService.logSignUp('email');
      await _analyticsService.setUserProperties(userId: userId);
      userModel.copyWith(
        uid: userId,
      );
      //TODO: Do email verification if necessary
      createUser(userModel, newUser: true);
      return userModel;
    } on FirebaseAuthException catch (error) {
      throw FirebaseAuthException(message: error.message, code: error.code);
    } catch (error) {
      cprint(error, errorIn: 'signInWithEmailAndPassword');
      throw error;
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential authResult = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: email);
      user = authResult.user;
      userId = user.uid;
      await _analyticsService.logSignUp('email');
      await _analyticsService.setUserProperties(userId: userId);
      return userId;
    } on FirebaseAuthException catch (error) {
      throw FirebaseAuthException(code: error.code, message: error.message);
    } catch (error) {
      user = null;
      throw error;
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<String> signInWithFacebook() async {
    //Trigger sign-in flow
    AccessToken accessToken = null;
    try {
       accessToken = await FacebookAuth.instance.login();
    } on FacebookAuthException catch (e) {
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print("You have a previous login operation in progress");
          throw e;
          break;
        case FacebookAuthErrorCode.CANCELLED:
          print("login cancelled");
          throw Exception('Facebook login cancelled by user');
          break;
        case FacebookAuthErrorCode.FAILED:
          print("login failed");
          throw Exception('Login failed');

          break;
      }
    }

    //Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken.token);

    try {
      //Once signed in, return the user credentials
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(facebookAuthCredential);
      _analyticsService.logLogin('facebook_login');
      user = userCredential.user;
      userId = user.uid;
      createUserFromSocialSignIn(user);
      return userId;
    } on FirebaseAuthException catch (error) {
      throw FirebaseAuthException(code: error.code, message: error.message);
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

      //Trigger authentication flow
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google Login cancelled by user');
      }

      //Obtain auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      //Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      if (credential != null) {
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        user = userCredential.user;
        userId = user.uid;
        createUserFromSocialSignIn(user);
        print("user id is: " + userId);
        return userId;
      }
      return null;
    } on FirebaseAuthException catch (error) {
      throw FirebaseAuthException(code: error.code, message: error.message);
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
    await FacebookAuth.instance.logOut();
    return _firebaseAuth.signOut();
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.userChanges();
  }

  @override
  Future<AppUser> currentUser() async {
    final User user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  User currentFirebaseUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    //TODO: Get the Country dynamically depending on the country
    String countryCode = Constants.countryCode["INDIA"];
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: countryCode + phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (authCredential) =>
          _verificationCompleted(authCredential),
      verificationFailed: (authException) => _verificationFailed(authException),
      codeSent: (verificationCode, [code]) =>
          _smsCodeSent(verificationCode, [code]),
      codeAutoRetrievalTimeout: (verificationId) =>
          _codeAuthRetrievalTimeOut(verificationId),
    );
  }

  _verificationCompleted(PhoneAuthCredential phoneAuthCredential) {
    _firebaseAuth.signInWithCredential(phoneAuthCredential);
  }

  String _verificationFailed(FirebaseAuthException authException) {
    return authException.message;
  }

  _smsCodeSent(String verificationCode, List<int> code) {
    this._verificationCode = verificationCode;
  }

  _codeAuthRetrievalTimeOut(String verificationCode) {
    this._verificationCode = verificationCode;
  }

  Future<String> verifyOTPAndLogin({String smsCode}) async {
    AuthCredential _authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationCode, smsCode: smsCode);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((UserCredential result) async {
      return result.user.uid;
    }).catchError((error) {
      throw error;
    });
    return null;
  }

  @override
  Future<String> signInWithSmsCode(String phoneNumber, String smsCode) async {
    // try {
    //   _analyticsService.logLogin('sms_code_based');
    //   print("sms code :" + smsCode.toString());
    //   print("verification code: " + _verificationCode);
    //   await _firebaseAuth.verifyPhoneNumber(
    //     phoneNumber: phoneNumber,
    //     timeout: Duration(seconds: 60),
    //     codeSent: (String verficationId, int resendToken) async {
    //       String smsCode = 'xxxx';
    //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //           verificationId: verficationId, smsCode: smsCode);
    //       final UserCredential authResult =
    //           await _firebaseAuth.signInWithCredential(credential);
    //       user = authResult.user;
    //       userId = user.uid;
    //       createUserFromSocialSignIn(user);
    //       return userId;
    //     },
    //   );
    // } on FirebaseAuthException catch (error) {
    //   throw FirebaseAuthException(code: error.code, message: error.message);
    // } catch (error) {
    //   user = null;
    //   cprint(error, errorIn: 'signInWithSms');
    //   throw error;
    // }
  }

  /// `Create` and `Update` user
  /// If `newUser` is `true`, then new User is created
  /// Else existing user will get updated with new values
  void createUser(AppUser user, {bool newUser = false}) {
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
  createUserFromSocialSignIn(User user) async {
    var diff = DateTime.now().difference(user.metadata.creationTime);
    // Check if user is new or old
    // If user is new then add new user to firebase database
    bool val = await _firestoreService.checkUserIsPresent(user);
    if (!val) {
      String currentDateTime = setCurrentDateTime();
      AppUser model = AppUser(
        photoUrl: user.photoURL,
        displayName: user.displayName,
        email: user.email,
        uid: user.uid,
        phoneNumber: user.phoneNumber,
        isEmailVerified: user.emailVerified,
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
