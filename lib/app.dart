import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/helper/app_config.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/providers/providers.dart';
import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';
import 'package:hellohuts_app/ui/routes/guards/auth_guards.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemes.context = context;

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Provider.of<AppConfig>(context).appTitle,
        theme: AppThemes.defaultTheme,
        builder: ExtendedNavigator<Router>(
          router: Router(),
          guards: [AuthGuard()],
        ),
        navigatorObservers: <NavigatorObserver>[
          locator<AnalyticsService>().getAnalyticsObserver(),
        ],
      ),
    );
  }
}
