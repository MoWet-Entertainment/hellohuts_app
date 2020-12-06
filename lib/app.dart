import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/controllers/theme_controller.dart';
import 'package:hellohuts_app/helper/app_config.dart';
import 'package:hellohuts_app/helper/logger.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/providers/providers.dart';
import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';
import 'package:hellohuts_app/ui/routes/guards/auth_guards.dart';
import 'package:hellohuts_app/ui/routes/guards/auth_guards.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:provider/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as rp;

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var log = getLogger('FireBaseAuthService');

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromPreferences();
    return FutureBuilder(
      //initialize FlutterFire
      future: _initialization,
      builder: (context, snapshot) {
        //Check for errors
        if (snapshot.hasError) {
          //TODO: Add a custom error page, if some error occurs while launching the app
          return Container(
            child: Center(
              child: Text(
                  "Error while initializing firebase. Add a custom error Page"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: providers,
            child: Builder(
              builder: (themeContext) {
                return ModelBinding(
                  initialModel: ThemeOptions(
                    themeMode: ThemeController.to.themeMode,
                    textScaleFactor: UIConstants.systemTextScaleFactorOption,
                    customTextDirection: CustomTextDirection.localeBased,
                    locale: null,
                    timeDilation: timeDilation,
                    platform: defaultTargetPlatform,
                  ),
                  child: rp.ProviderScope(
                    child: GetMaterialApp(
                      debugShowCheckedModeBanner: false,
                      navigatorKey: Get.key,
                      title: Provider.of<AppConfig>(context).appTitle,
                      theme:AppThemes.lightThemeData,
                      darkTheme: AppThemes.darkThemeData,
                      themeMode: ThemeController.to.themeMode,
                      home: Container(),
                      builder: ExtendedNavigator.builder<AppRouter>(
                        navigatorKey: Get.key,
                        router: AppRouter(),
                        guards: [AuthGuard()],
                      ),
                      navigatorObservers: <NavigatorObserver>[
                        locator<AnalyticsService>().getAnalyticsObserver(),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        //TODO: Change Circular Progress indicator to custom loading screen
        return CircularProgressIndicator();
      },
    );
  }
}
