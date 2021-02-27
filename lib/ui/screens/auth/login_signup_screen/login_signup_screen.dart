import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/services/storage_services/shared_preference_service.dart';
import 'package:hellohuts_app/states/auth_states/phone_auth.dart';
import 'package:hellohuts_app/states/countries.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/widgets.dart';
import 'package:hellohuts_app/ui/screens/auth/phone_auth/select_country.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:get/get.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        // resizeToAvoidBottomInset : false,

        appBar: CustomAppBar(
            isCrossButton: true,
            customBackButton: Icon(
              Icons.close_rounded,
              color: theme.colorScheme.onBackground,
            ),
            onCrossButtonPressed: _onCrossButtonPressed),
        body: _LoginSignupScreenBody(theme: theme));
  }

  void _onCrossButtonPressed() {
    print("close button pressed");
    ExtendedNavigator.root.pop();
  }
}

class _LoginSignupScreenBody extends StatefulWidget {
  const _LoginSignupScreenBody({
    Key key,
    @required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  __LoginSignupScreenBodyState createState() => __LoginSignupScreenBodyState();
}

class __LoginSignupScreenBodyState extends State<_LoginSignupScreenBody> {
  var preference = locator<SharedPreferencesService>();

  String greetTextSignUp = "Hello there!";
  String actionTextSignUp = "Get Started with Hellohuts";
  String switchToSignInText = "Already have an account?";

  String existingUserFirstName = '';
  String greetTextSignIn = '';

  String actionTextSignIn = "Welcome Back to Hellohuts";
  String switchToSignUp = "New to Hellohuts?";
  String signInText = "Login";
  String signUpText = "Sign Up";
  String signInWithPhone = "Login with Phone Number";
  String signUpWithPhone = "Sign up with Phone Number";
  bool _isLogin = false;

  @override
  void initState() {
    existingUserFirstName = preference.getFromDisk("user_first_name");
    greetTextSignIn =
        existingUserFirstName != null && existingUserFirstName.length > 0
            ? "Hello " + existingUserFirstName
            : "Hello there!";
    super.initState();
  }

  void switchLoginSignUp() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    final countriesProvider = Provider.of<CountryProvider>(context);
    final loader = Provider.of<PhoneAuthDataProvider>(context).loading;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              HelloIcons.hellohuts_icon,
              height: 48,
            ),
            SizedBox(
              height: 16.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isLogin ? greetTextSignIn : greetTextSignUp,
                  softWrap: true,
                  style: widget.theme.textTheme.bodyText1.copyWith(
                      color: widget.theme.colorScheme.onBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Text(
              _isLogin ? actionTextSignIn : actionTextSignUp,
              softWrap: true,
              style: widget.theme.textTheme.headline3.copyWith(
                color: widget.theme.colorScheme.onBackground,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            _PhoneBasedAuthWidget(
              buttonText: _isLogin ? signInWithPhone : signUpWithPhone,
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "or",
                      style: widget.theme.textTheme.bodyText1,
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            Center(
                child: Text(
              "Continue with",
              style: widget.theme.textTheme.bodyText1,
            )),
            SizedBox(height: 16),
            _socialLoginWidget(),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Text(_isLogin ? switchToSignUp : switchToSignInText,
                    style: widget.theme.textTheme.bodyText2),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      _isLogin ? signUpText : signInText,
                      style: widget.theme.textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  onTap: () => {switchLoginSignUp()},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialLoginWidget() {
    return Builder(builder: (context) {
      bool _isDark = Get.isDarkMode;
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _materialCircularButton(
                child: Image.asset(
                  HelloIcons.google_bold_icon,
                  height: 30,
                ),
                onPressed: () {
                  //TODO:  Implement Google Sign in Here
                  print("Google Sign in");
                }),
            _materialCircularButton(
                child: Image.asset(
                  HelloIcons.facebook_bold_icon,
                  height: 30,
                ),
                onPressed: () {
                  print("Facebook Sign in");
                  //TODO:  Implement Facebook Sign in Here
                }),
            _materialCircularButton(
                child: Image.asset(
                  HelloIcons.apple_bold_icon,
                  height: 30,
                ),
                onPressed: () {
                  print("Apple Sign in ");
                  //TODO: Implemet Apple Sign in Here
                }),
          ],
        ),
      );
    });
  }

  Widget _materialCircularButton({Widget child, VoidCallback onPressed}) {
    return Builder(
      builder: (context) => RawMaterialButton(
        shape: CircleBorder(),
        padding: const EdgeInsets.all(8.0),
        onPressed: onPressed ?? () {},
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.background),
          child: child,
        ),
      ),
    );
  }
}

class _PhoneBasedAuthWidget extends StatelessWidget {
  String buttonText;
  _PhoneBasedAuthWidget({
    Key key,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);
    final phoneNumberProvider = Provider.of<PhoneAuthDataProvider>(context);

    final theme = Theme.of(context);

    return Container(
      child: Column(
        children: [
          SubTitle(
            text: "Phone Number",
            style: theme.textTheme.bodyText1.copyWith(fontSize: 14),
          ),
          Padding(
              padding: const EdgeInsets.all(0),
              child: ShowSelectedCountry(
                country: countryProvider.selectedCountry,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SelectCountry()),
                  );
                },
              )),
          PhoneNumberField(
            controller: phoneNumberProvider.phoneNumberController,
            prefix: countryProvider.selectedCountry.dialCode ?? "+91",
            onTextChanged: phoneNumberProvider.setValidPhoneNumber,
          ),
          SizedBox(height: 8.0),
          Text(
            "We'll send you a verification code to confirm your number.",
            style: theme.textTheme.bodyText1,
          ),
          SizedBox(height: 24.0),
          CupertinoButton(
              disabledColor: AppColors.kbPrimaryYellow.withOpacity(0.5),
              onPressed: phoneNumberProvider.isValidPhoneNumber ? () {} : null,
              child: Text(
                buttonText ?? "Not given",
                style: theme.textTheme.bodyText2
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              color: AppColors.kbPrimaryYellow)
        ],
      ),
    );
  }
}
