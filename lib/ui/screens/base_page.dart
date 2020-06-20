import 'package:flutter/material.dart';

import 'package:hellohuts_app/states/app_state.dart';
import 'package:hellohuts_app/ui/common_widgets/bottomNavbar/bottom_navbar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_bottom_nav_bar.dart';
import 'package:hellohuts_app/ui/screens/explore.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final PageStorageBucket bucket = PageStorageBucket();
  final PageStorageKey exploreKey = PageStorageKey('exploreKey');
  final PageStorageKey homeKey = PageStorageKey('homeKey');
  final PageStorageKey categoryKey = PageStorageKey('categoryKey');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int pageIndex = 0;

  @override
  void initState() {
    print("test");
    super.initState();
  }

 

  Widget _body() {
    var state = Provider.of<AppState>(context);
    return Stack(
      children: <Widget>[
        _getPage(state.pageIndex),
        BottomNavBar(),
      ],
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return ExplorePage(
          scaffoldKey: _scaffoldKey,
          key: exploreKey,
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
        key: _scaffoldKey, body: PageStorage(bucket: bucket, child: _body()));
  }
}
