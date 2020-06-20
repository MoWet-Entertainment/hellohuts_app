import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/app.dart';
import 'package:hellohuts_app/constants/app_constants.dart';
import 'package:hellohuts_app/helper/app_config.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:provider/provider.dart';

void main() async {
  /**
   Set `enableInDevMode` to true to see reports while in debug mode
  This is only to be used for confirming that reports are being
  submitted as expected. It is not intended to be used for everyday
  development.
**/
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = Crashlytics.instance.recordFlutterError;
  WidgetsFlutterBinding.ensureInitialized();
  
  await setUpLocator();
  runZoned(() {
    runApp(Provider<AppConfig>(
      create: (context) => AppConfig(
        appTitle: AppConstants.appNameDev,
        buildFlavor: AppFlavor.dev,
      ),
      child: App(),
    ));
  }, onError: Crashlytics.instance.recordError);
}
