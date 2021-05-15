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
import '../screens/dashboard/dashboard_landing/dashboard_landing.dart';
import '../screens/dashboard/documents/document_upload.dart';
import '../screens/dashboard/documents/documents_page.dart';
import '../screens/dashboard/payments/payments_screen.dart';
import '../screens/dashboard/project_details/project_details.dart';
import '../screens/dashboard/reports/reports_page.dart';
import '../screens/explore.dart';
import '../screens/feed_posts/feed_post_detail.dart';
import '../screens/feed_posts/widgets/comments/post_comments_deatil.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/post_detail/post_detail.dart';
import '../screens/quick_items/quick_items.dart';
import '../screens/search/search_screen.dart';
import '../screens/services_offered/build_my_home/add_details.dart';
import '../screens/services_offered/build_my_home/pages/cost_estimate_screen.dart';
import '../screens/services_offered/services_offered_base_page.dart';
import '../screens/startup_screen.dart';
import '../screens/welcome_page.dart';

class Routes {
  static const String startUpPage = '/';
  static const String basePage = '/base-page';
  static const String explorePage = '/explore-page';
  static const String welcomePage = '/welcome-page';
  static const String searchPage = '/search-page';
  static const String categoriesSearchPage = '/categories-search-page';
  static const String dashboardLandingPage = '/dashboard-landing-page';
  static const String postDetailScreen = '/post-detail-screen';
  static const String commentsDetail = '/post-comments-detail-page';
  static const String costEstimate = '/cost-estimate';
  static const String professionals = '/Professionals';
  static const String moreItems = '/more-items';
  static const String materials = '/Materials';
  static const String phoneAuthGetPhone = '/phone-auth-get-phone';
  static const String servicesOfferedBasePage = '/services-offered-base-page';
  static const String addDetailsForHomePage = '/add-details-for-home-page';
  static const String costEstimatePage = '/cost-estimate-page';
  static const String categoriesPage = '/categories-page';
  static const String postDetailPage = '/post-detail-page';
  static const String projectDetailsPage = '/project-details-page';
  static const String documentsPage = '/documents-page';
  static const String documentsUploadPage = '/documents-upload-page';
  static const String onboardingPage = '/onboarding-page';
  static const String paymentsPage = '/payments-page';
  static const String reportsPage = '/reports-page';
  static const all = <String>{
    startUpPage,
    basePage,
    explorePage,
    welcomePage,
    searchPage,
    categoriesSearchPage,
    dashboardLandingPage,
    postDetailScreen,
    commentsDetail,
    costEstimate,
    professionals,
    moreItems,
    materials,
    phoneAuthGetPhone,
    servicesOfferedBasePage,
    addDetailsForHomePage,
    costEstimatePage,
    categoriesPage,
    postDetailPage,
    projectDetailsPage,
    documentsPage,
    documentsUploadPage,
    onboardingPage,
    paymentsPage,
    reportsPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpPage, page: StartUpPage),
    RouteDef(Routes.basePage, page: BasePage),
    RouteDef(Routes.explorePage, page: ExplorePage),
    RouteDef(Routes.welcomePage, page: WelcomePage),
    RouteDef(Routes.searchPage, page: SearchPage),
    RouteDef(Routes.categoriesSearchPage, page: CategoriesSearchPage),
    RouteDef(Routes.dashboardLandingPage, page: DashboardLandingPage),
    RouteDef(Routes.postDetailScreen, page: PostDetailScreen),
    RouteDef(Routes.commentsDetail, page: PostCommentsDetailPage),
    RouteDef(Routes.costEstimate, page: CostEstimate),
    RouteDef(Routes.professionals, page: Professionals),
    RouteDef(Routes.moreItems, page: MoreItems),
    RouteDef(Routes.materials, page: Materials),
    RouteDef(Routes.phoneAuthGetPhone, page: PhoneAuthGetPhone),
    RouteDef(Routes.servicesOfferedBasePage, page: ServicesOfferedBasePage),
    RouteDef(Routes.addDetailsForHomePage, page: AddDetailsForHomePage),
    RouteDef(Routes.costEstimatePage, page: CostEstimatePage),
    RouteDef(Routes.categoriesPage, page: CategoriesPage),
    RouteDef(Routes.postDetailPage, page: PostDetailPage),
    RouteDef(Routes.projectDetailsPage, page: ProjectDetailsPage),
    RouteDef(Routes.documentsPage, page: DocumentsPage),
    RouteDef(Routes.documentsUploadPage, page: DocumentsUploadPage),
    RouteDef(Routes.onboardingPage, page: OnboardingPage),
    RouteDef(Routes.paymentsPage, page: PaymentsPage),
    RouteDef(Routes.reportsPage, page: ReportsPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartUpPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const StartUpPage(),
        settings: data,
      );
    },
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
    DashboardLandingPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DashboardLandingPage(),
        settings: data,
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
    PostCommentsDetailPage: (data) {
      final args = data.getArgs<PostCommentsDetailPageArguments>(
        orElse: () => PostCommentsDetailPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PostCommentsDetailPage(
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
    AddDetailsForHomePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddDetailsForHomePage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    CostEstimatePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const CostEstimatePage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    CategoriesPage: (data) {
      final args = data.getArgs<CategoriesPageArguments>(
        orElse: () => CategoriesPageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CategoriesPage(
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
    ProjectDetailsPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const ProjectDetailsPage(),
        settings: data,
      );
    },
    DocumentsPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const DocumentsPage(),
        settings: data,
      );
    },
    DocumentsUploadPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const DocumentsUploadPage(),
        settings: data,
      );
    },
    OnboardingPage: (data) {
      final args = data.getArgs<OnboardingPageArguments>(
        orElse: () => OnboardingPageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OnboardingPage(key: args.key),
        settings: data,
      );
    },
    PaymentsPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const PaymentsPage(),
        settings: data,
      );
    },
    ReportsPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const ReportsPage(),
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

/// PostCommentsDetailPage arguments holder class
class PostCommentsDetailPageArguments {
  final Key key;
  final Comment model;
  final String commentsParentPostId;
  PostCommentsDetailPageArguments(
      {this.key, this.model, this.commentsParentPostId});
}

/// CategoriesPage arguments holder class
class CategoriesPageArguments {
  final Key key;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CategoriesPageArguments({this.key, this.scaffoldKey});
}

/// PostDetailPage arguments holder class
class PostDetailPageArguments {
  final Key key;
  final ImageData imageData;
  PostDetailPageArguments({this.key, @required this.imageData});
}

/// OnboardingPage arguments holder class
class OnboardingPageArguments {
  final Key key;
  OnboardingPageArguments({this.key});
}
