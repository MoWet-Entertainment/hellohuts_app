import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:hellohuts_app/models/user.dart';

abstract class AuthService {
  Future<User> currentUser();
  Future<FirebaseUser> currentFirebaseUser();
  Future<bool> isSignedIn();
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(
      {User userModel, @required String email, @required String password});
  Future<void> sendPasswordResetEmail(String email);
  Future<String> signInWithEmailAndLink({String email, String link});
  Future<bool> isSignInWithEmailLink(String link);
  Future<void> sendSignInWithEmailLink({
    @required String email,
    @required String url,
    @required bool handleCodeInApp,
    @required String iOSBundleID,
    @required String androidPackageName,
    @required bool androidInstallIfNotAvailable,
    @required String androidMinimumVersion,
  });
  Future<String> signInWithGoogle();
  Future<String> signInWithFacebook();
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<String> signInWithSmsCode(String smsCode);
  Future<void> signOut();
  Stream<User> get onAuthStateChanged;
  void dispose();
}
