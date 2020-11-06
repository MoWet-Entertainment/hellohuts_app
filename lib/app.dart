import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hellohuts_app/helper/app_config.dart';
import 'package:hellohuts_app/helper/logger.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/providers/providers.dart';
import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';
import 'package:hellohuts_app/states/theme_state.dart';
import 'package:hellohuts_app/ui/routes/guards/auth_guards.dart';
import 'package:hellohuts_app/ui/routes/guards/auth_guards.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

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
            child: ThemeProvider(
              saveThemesOnChange: true,
              onInitCallback: (controller, previouslySavedThemeFuture) async {
                String savedTheme = await previouslySavedThemeFuture;
                if (savedTheme != null) {
                  controller.setTheme(savedTheme);
                } else {
                  Brightness platformBrighteness =
                      SchedulerBinding.instance.window.platformBrightness;
                  if (platformBrighteness == Brightness.dark) {
                    controller.setTheme('dark_theme');
                  } else {
                    controller.setTheme('light_theme');
                  }
                  // controller.forgetSavedTheme();
                }
              },
              themes: <AppTheme>[
                AppTheme(
                  id: 'light_theme',
                  description: "Hello App light theme",
                  data: AppThemes.lightThemeData,
                ),
                AppTheme(
                  id: 'dark_theme',
                  description: "Hello App dark theme",
                  data: AppThemes.darkThemeData,
                ),
              ],
              child: ThemeConsumer(
                child: Builder(
                  builder: (themeContext) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: Provider.of<AppConfig>(context).appTitle,
                      theme: ThemeProvider.themeOf(themeContext).data,
                      home: Container(),
                      builder: ExtendedNavigator.builder<AppRouter>(
                        router: AppRouter(),
                        guards: [AuthGuard()],
                      ),
                      navigatorObservers: <NavigatorObserver>[
                        locator<AnalyticsService>().getAnalyticsObserver(),
                      ],
                    );
                  },
                ),
              ),
          ),
          );
        }
        //TODO: Change Circular Progress indicator to custom loading screen
        return CircularProgressIndicator();
      },
    );
  }
}
