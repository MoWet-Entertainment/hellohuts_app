import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:hellohuts_app/models/app_user.dart';

abstract class AuthService {
  Future<AppUser> currentUser();
  User currentFirebaseUser();
 bool isSignedIn();
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<AppUser> createUserWithEmailAndPassword(
      {AppUser userModel, @required String email, @required String password});
  Future<void> sendPasswordResetEmail(String email);
  Future<String> signInWithGoogle();
  Future<String> signInWithFacebook();
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<String> signInWithSmsCode(String phoneNumber,String smsCode);
  Future<void> signOut();
  Stream<User> get onAuthStateChanged;
  void dispose();
}
