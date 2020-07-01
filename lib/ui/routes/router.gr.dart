// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hellohuts_app/ui/screens/base_page.dart';
import 'package:hellohuts_app/ui/screens/explore.dart';
import 'package:hellohuts_app/ui/screens/welcome_page.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';

abstract class Routes {
  static const basePage = '/';
  static const explorePage = '/explore-page';
  static const welcomePage = '/welcome-page';
  static const searchScreen = '/search-screen';
  static const all = {
    basePage,
    explorePage,
    welcomePage,
    searchScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.basePage:
        if (hasInvalidArgs<BasePageArguments>(args)) {
          return misTypedArgsRoute<BasePageArguments>(args);
        }
        final typedArgs = args as BasePageArguments ?? BasePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => BasePage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.explorePage:
        if (hasInvalidArgs<ExplorePageArguments>(args)) {
          return misTypedArgsRoute<ExplorePageArguments>(args);
        }
        final typedArgs =
            args as ExplorePageArguments ?? ExplorePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ExplorePage(
              key: typedArgs.key, scaffoldKey: typedArgs.scaffoldKey),
          settings: settings,
        );
      case Routes.welcomePage:
        if (hasInvalidArgs<WelcomePageArguments>(args)) {
          return misTypedArgsRoute<WelcomePageArguments>(args);
        }
        final typedArgs =
            args as WelcomePageArguments ?? WelcomePageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              WelcomePage(key: typedArgs.key),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        );
      case Routes.searchScreen:
        if (hasInvalidArgs<SearchScreenArguments>(args)) {
          return misTypedArgsRoute<SearchScreenArguments>(args);
        }
        final typedArgs =
            args as SearchScreenArguments ?? SearchScreenArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SearchScreen(key: typedArgs.key),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//BasePage arguments holder class
class BasePageArguments {
  final Key key;
  BasePageArguments({this.key});
}

//ExplorePage arguments holder class
class ExplorePageArguments {
  final Key key;
  final GlobalKey<ScaffoldState> scaffoldKey;
  ExplorePageArguments({this.key, this.scaffoldKey});
}

//WelcomePage arguments holder class
class WelcomePageArguments {
  final Key key;
  WelcomePageArguments({this.key});
}

//SearchScreen arguments holder class
class SearchScreenArguments {
  final Key key;
  SearchScreenArguments({this.key});
}
