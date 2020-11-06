import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:hellohuts_app/states/app_state.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/common_widgets/bottom_navbar/bottom_navbar.dart';
import 'package:hellohuts_app/ui/screens/categories/categories_screen.dart';
import 'package:hellohuts_app/ui/screens/drawer/custom_drawer.dart';
import 'package:hellohuts_app/ui/screens/explore.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/screens/testpage.dart';
import 'package:hellohuts_app/ui/screens/welcome_page.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final PageStorageBucket bucket = PageStorageBucket();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: AppColors.kPureWhite,
    //     statusBarIconBrightness: Brightness.dark));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //TODO: Initialise all the db functionalities here
      initFeedPosts();
    });
    super.initState();
  }

  void initFeedPosts() {
    var state = Provider.of<FeedState>(context, listen: false);
    // state.databaseInit();
    state.getDataFromDatabase();
  }

  // Widget _body(int index) {
  //   return IndexedStack(
  //     children: <Widget>[ExplorePage(), WelcomePage(), FirstPage(), FirstPage()],
  //     index: index,
  //   );
  // }

  Widget _body(int index) {
    var state = Provider.of<AppState>(context);
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ExplorePage(),
        CategoriesScreen(),
        FirstPage(),
        FirstPage()
      ],
      controller: _pageController,
      onPageChanged: (page) {
        state.setPageIndex = page;
      },
    );
  }

  // Widget _getPage(int index) {
  //   switch (index) {
  //     case 0:
  //       return FirstPage(
  //           // key: PageStorageKey('ExploreKey'),
  //           );
  //       break;
  //     case 1:
  //       return WelcomePage(
  //         key: PageStorageKey('WelcomeKey'),
  //       );
  //       break;
  //     case 2:
  //       return FirstPage(
  //         key: PageStorageKey('TEts'),
  //       );
  //       break;

  //     case 3:
  //       return FirstPage();
  //       break;
  //     default:
  //       return ExplorePage();
  //       break;
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _scaffoldKey,
  //     body: PageStorage(
  //         bucket: bucket,
  //         child: _getPage(Provider.of<AppState>(context).pageIndex)),
  //     extendBody: true,
  //     backgroundColor: AppColors.kPureWhite,
  //     bottomNavigationBar: BottomNavBar(),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _scaffoldKey,
  //     body: _body(Provider.of<AppState>(context).pageIndex),
  //     extendBody: true,
  //     backgroundColor: AppColors.kPureWhite,
  //     bottomNavigationBar: BottomNavBar(),
  //   );
  // }
  @override
  Widget build(BuildContext context) { 
            return Scaffold(
              drawer: SidebarMenu(),
              backgroundColor: Theme.of(context).colorScheme.background,
              body: _body(Provider.of<AppState>(context).pageIndex),
              extendBody: true,
              key: _scaffoldKey,
              bottomNavigationBar: BottomNavBar(
                pageController: _pageController,
              ),
            );
  }
}
