// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../constants/mock1.dart';
import '../../models/test.dart';
import '../../models/user_feed/comments.dart';
import '../screens/auth/phone_auth/get_phone.dart';
import '../screens/base_page.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/categories/categories_search/categories_search_screen.dart';
import '../screens/explore.dart';
import '../screens/feed_posts/feed_post_detail.dart';
import '../screens/feed_posts/widgets/comments/post_comments_deatil.dart';
import '../screens/post_detail/post_detail.dart';
import '../screens/quick_items/quick_items.dart';
import '../screens/search/search_screen.dart';
import '../screens/services_offered/build_my_home/add_details.dart';
import '../screens/services_offered/build_my_home/pages/cost_estimate_screen.dart';
import '../screens/services_offered/services_offered_base_page.dart';
import '../screens/welcome_page.dart';

class Routes {
  static const String basePage = '/';
  static const String explorePage = '/explore-page';
  static const String welcomePage = '/welcome-page';
  static const String searchPage = '/search-page';
  static const String categoriesSearchPage = '/categories-search-page';
  static const String postDetailScreen = '/post-detail-screen';
  static const String commentsDetail = '/post-comments-detail';
  static const String costEstimate = '/cost-estimate';
  static const String professionals = '/Professionals';
  static const String moreItems = '/more-items';
  static const String materials = '/Materials';
  static const String phoneAuthGetPhone = '/phone-auth-get-phone';
  static const String servicesOfferedBasePage = '/services-offered-base-page';
  static const String addDetailsForHome = '/add-details-for-home';
  static const String costEstimateScreen = '/cost-estimate-screen';
  static const String categoriesScreen = '/categories-screen';
  static const String postDetailPage = '/post-detail-page';
  static const all = <String>{
    basePage,
    explorePage,
    welcomePage,
    searchPage,
    categoriesSearchPage,
    postDetailScreen,
    commentsDetail,
    costEstimate,
    professionals,
    moreItems,
    materials,
    phoneAuthGetPhone,
    servicesOfferedBasePage,
    addDetailsForHome,
    costEstimateScreen,
    categoriesScreen,
    postDetailPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.basePage, page: BasePage),
    RouteDef(Routes.explorePage, page: ExplorePage),
    RouteDef(Routes.welcomePage, page: WelcomePage),
    RouteDef(Routes.searchPage, page: SearchPage),
    RouteDef(Routes.categoriesSearchPage, page: CategoriesSearchPage),
    RouteDef(Routes.postDetailScreen, page: PostDetailScreen),
    RouteDef(Routes.commentsDetail, page: PostCommentsDetail),
    RouteDef(Routes.costEstimate, page: CostEstimate),
    RouteDef(Routes.professionals, page: Professionals),
    RouteDef(Routes.moreItems, page: MoreItems),
    RouteDef(Routes.materials, page: Materials),
    RouteDef(Routes.phoneAuthGetPhone, page: PhoneAuthGetPhone),
    RouteDef(Routes.servicesOfferedBasePage, page: ServicesOfferedBasePage),
    RouteDef(Routes.addDetailsForHome, page: AddDetailsForHome),
    RouteDef(Routes.costEstimateScreen, page: CostEstimateScreen),
    RouteDef(Routes.categoriesScreen, page: CategoriesScreen),
    RouteDef(Routes.postDetailPage, page: PostDetailPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    BasePage: (data) {
      final args = data.getArgs<BasePageArguments>(
        orElse: () => BasePageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => BasePage(key: args.key),
        settings: data,
      );
    },
    ExplorePage: (data) {
      final args = data.getArgs<ExplorePageArguments>(
        orElse: () => ExplorePageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ExplorePage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
          refreshIndicatorKey: args.refreshIndicatorKey,
        ),
        settings: data,
      );
    },
    WelcomePage: (data) {
      final args = data.getArgs<WelcomePageArguments>(
        orElse: () => WelcomePageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            WelcomePage(key: args.key),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
    SearchPage: (data) {
      final args = data.getArgs<SearchPageArguments>(
        orElse: () => SearchPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SearchPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    CategoriesSearchPage: (data) {
      final args = data.getArgs<CategoriesSearchPageArguments>(
        orElse: () => CategoriesSearchPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CategoriesSearchPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    PostDetailScreen: (data) {
      final args = data.getArgs<PostDetailScreenArguments>(
        orElse: () => PostDetailScreenArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostDetailScreen(
          key: args.key,
          model: args.model,
        ),
        settings: data,
      );
    },
    PostCommentsDetail: (data) {
      final args = data.getArgs<PostCommentsDetailArguments>(
        orElse: () => PostCommentsDetailArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PostCommentsDetail(
          key: args.key,
          model: args.model,
          commentsParentPostId: args.commentsParentPostId,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
    CostEstimate: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const CostEstimate(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    Professionals: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Professionals(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    MoreItems: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MoreItems(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    Materials: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Materials(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    PhoneAuthGetPhone: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PhoneAuthGetPhone(),
        settings: data,
      );
    },
    ServicesOfferedBasePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ServicesOfferedBasePage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    AddDetailsForHome: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddDetailsForHome(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    CostEstimateScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const CostEstimateScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    CategoriesScreen: (data) {
      final args = data.getArgs<CategoriesScreenArguments>(
        orElse: () => CategoriesScreenArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CategoriesScreen(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
        settings: data,
      );
    },
    PostDetailPage: (data) {
      final args = data.getArgs<PostDetailPageArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostDetailPage(
          key: args.key,
          imageData: args.imageData,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// BasePage arguments holder class
class BasePageArguments {
  final Key key;
  BasePageArguments({this.key});
}

/// ExplorePage arguments holder class
class ExplorePageArguments {
  final Key key;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  ExplorePageArguments({this.key, this.scaffoldKey, this.refreshIndicatorKey});
}

/// WelcomePage arguments holder class
class WelcomePageArguments {
  final Key key;
  WelcomePageArguments({this.key});
}

/// SearchPage arguments holder class
class SearchPageArguments {
  final Key key;
  final GlobalKey<ScaffoldState> scaffoldKey;
  SearchPageArguments({this.key, this.scaffoldKey});
}

/// CategoriesSearchPage arguments holder class
class CategoriesSearchPageArguments {
  final Key key;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CategoriesSearchPageArguments({this.key, this.scaffoldKey});
}

/// PostDetailScreen arguments holder class
class PostDetailScreenArguments {
  final Key key;
  final FeedModel model;
  PostDetailScreenArguments({this.key, this.model});
}

/// PostCommentsDetail arguments holder class
class PostCommentsDetailArguments {
  final Key key;
  final Comment model;
  final String commentsParentPostId;
  PostCommentsDetailArguments(
      {this.key, this.model, this.commentsParentPostId});
}

/// CategoriesScreen arguments holder class
class CategoriesScreenArguments {
  final Key key;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CategoriesScreenArguments({this.key, this.scaffoldKey});
}

/// PostDetailPage arguments holder class
class PostDetailPageArguments {
  final Key key;
  final ImageData imageData;
  PostDetailPageArguments({this.key, @required this.imageData});
}
