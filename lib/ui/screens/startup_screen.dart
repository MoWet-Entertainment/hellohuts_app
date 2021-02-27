import 'package:flutter/material.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/services/auth_services/auth_service.dart';
import 'package:hellohuts_app/services/storage_services/shared_preference_service.dart';
import 'package:hellohuts_app/ui/screens/base_page.dart';
import 'package:hellohuts_app/ui/screens/onboarding/onboarding_screen.dart';
import 'package:hellohuts_app/ui/screens/testpage.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStartUpScreen();
  }

  Widget _getStartUpScreen() {
    var sharedPreferenceServide = locator<SharedPreferencesService>();
    var authService = locator<AuthService>();

    if (authService.isSignedIn()) {
      return BasePage();
    }
    if (sharedPreferenceServide.hasSignedUp) {
      //return Login Page
      return FirstPage();
    } else {
      return OnboardingScreen();
    }
  }
}
