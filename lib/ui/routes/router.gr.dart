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
import 'package:hellohuts_app/ui/screens/search/search_detail.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/feed_post_detail.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/post_comments_deatil.dart';
import 'package:hellohuts_app/models/user_feed/comments.dart';

abstract class Routes {
  static const basePage = '/';
  static const explorePage = '/explore-page';
  static const welcomePage = '/welcome-page';
  static const searchScreen = '/search-screen';
  static const searchDetail = '/search-detail';
  static const postDetailScreen = '/post-detail-screen';
  static const commentsDetail = '/comments-detail';
  static const all = {
    basePage,
    explorePage,
    welcomePage,
    searchScreen,
    searchDetail,
    postDetailScreen,
    commentsDetail,
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
        if (hasInvalidArgs<SearchPageArguments>(args)) {
          return misTypedArgsRoute<SearchPageArguments>(args);
        }
        final typedArgs = args as SearchPageArguments ?? SearchPageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => SearchPage(
              key: typedArgs.key, scaffoldKey: typedArgs.scaffoldKey),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        );
      case Routes.searchDetail:
        if (hasInvalidArgs<SearchDetailArguments>(args)) {
          return misTypedArgsRoute<SearchDetailArguments>(args);
        }
        final typedArgs =
            args as SearchDetailArguments ?? SearchDetailArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SearchDetail(key: typedArgs.key),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        );
      case Routes.postDetailScreen:
        if (hasInvalidArgs<PostDetailScreenArguments>(args)) {
          return misTypedArgsRoute<PostDetailScreenArguments>(args);
        }
        final typedArgs =
            args as PostDetailScreenArguments ?? PostDetailScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              PostDetailScreen(key: typedArgs.key, model: typedArgs.model),
          settings: settings,
        );
      case Routes.commentsDetail:
        if (hasInvalidArgs<PostCommentsDetailArguments>(args)) {
          return misTypedArgsRoute<PostCommentsDetailArguments>(args);
        }
        final typedArgs = args as PostCommentsDetailArguments ??
            PostCommentsDetailArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PostCommentsDetail(
                  key: typedArgs.key,
                  model: typedArgs.model,
                  commentsParentPostId: typedArgs.commentsParentPostId),
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

//SearchPage arguments holder class
class SearchPageArguments {
  final Key key;
  final GlobalKey<ScaffoldState> scaffoldKey;
  SearchPageArguments({this.key, this.scaffoldKey});
}

//SearchDetail arguments holder class
class SearchDetailArguments {
  final Key key;
  SearchDetailArguments({this.key});
}

//PostDetailScreen arguments holder class
class PostDetailScreenArguments {
  final Key key;
  final FeedModel model;
  PostDetailScreenArguments({this.key, this.model});
}

//PostCommentsDetail arguments holder class
class PostCommentsDetailArguments {
  final Key key;
  final Comment model;
  final String commentsParentPostId;
  PostCommentsDetailArguments(
      {this.key, this.model, this.commentsParentPostId});
}
