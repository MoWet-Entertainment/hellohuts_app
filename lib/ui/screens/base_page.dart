import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hellohuts_app/states/app_state.dart';
import 'package:hellohuts_app/states/auth_state.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/common_widgets/bottom_navbar/bottom_navbar.dart';
import 'package:hellohuts_app/ui/screens/explore.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage>{
  final PageStorageBucket bucket = PageStorageBucket();
  final PageStorageKey exploreKey = PageStorageKey('exploreKey');
  final PageStorageKey homeKey = PageStorageKey('homeKey');
  final PageStorageKey categoryKey = PageStorageKey('categoryKey');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  int pageIndex = 0;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.kPureWhite,
        statusBarIconBrightness: Brightness.dark));
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

  Widget _body() {
    return Scaffold(
      backgroundColor: AppColors.kPureWhite,
      body: Stack(
        children: <Widget>[
          _getPage(Provider.of<AppState>(context).pageIndex),
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return ExplorePage(
            key: exploreKey,
          scaffoldKey: _scaffoldKey,
          refreshIndicatorKey: _refreshIndicatorKey,
        
        );
        break;
      case 1:
        return Scaffold(
          backgroundColor: Colors.green,
          body: Container(
            child: Center(
              child: Text('Home'),
            ),
          ),
        );
        break;
      case 2:
        return Scaffold(
          backgroundColor: Colors.blue,
          body: Container(
            child: Center(
              child: Text('HelloHome'),
            ),
          ),
        );
        break;
      case 3:
        return Scaffold(
          backgroundColor: Colors.green,
          body: Container(
            child: Center(
              child: Text('Messages'),
            ),
          ),
        );
        break;
      case 4:
        return Scaffold(
          backgroundColor: Colors.yellow,
          drawer: Drawer(),
          body: Container(
            child: Center(
              child: Text('Profile'),
            ),
          ),
        );
        break;
      default:
        return ExplorePage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PageStorage(
        bucket: bucket,
        child: _body(),
      ),
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavBar(),
    );
  }

}
