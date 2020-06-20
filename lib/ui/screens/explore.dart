import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/constants/mock.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/common_widgets/appBar/app_bar.dart';

class ExplorePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  ExplorePage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    ScreenUtil.init(width: 375, height: 801);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.kPureWhite,
        statusBarIconBrightness: Brightness.dark));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: _scrollView(context));
  }

  Widget testWidget(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.green,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text('EXPLORE PAGE'),
            Spacer(),
            FlatButton(
              onPressed: () =>
                  ExtendedNavigator.of(context).pushNamed(Routes.welcomePage),
              child: Text("Go"),
              color: Colors.yellow,
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

Widget _scrollView(BuildContext context) {
  var list = Mock.list;
  var slivers2 = <Widget>[
    _appBarTop(),
    _headerSection(),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 60,
            color: Colors.red,
            child: Center(
              child: Text(list[index]),
            ),
          ),
        ),
        childCount: list.length,
      ),
    ),
  ];
  return CustomScrollView(slivers: slivers2);
}

Widget _appBarTop() {
  return SliverAppBar(
    floating: true,
    pinned: false,
    elevation: 0,
    brightness: Brightness.light
    backgroundColor: AppColors.kPureWhite,
    leading: appBarIcon(icon: HelloIcons.subject, size: 24),
    actions: <Widget>[appBarIcon(icon: HelloIcons.bell, size: 24)],
    centerTitle: true,
    title: Icon(
      HelloIcons.hello_icon,
      color: AppColors.kDarkTextColor,
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0.0),
      child: Container(
        color: Colors.grey.shade200,
        height: 1.0,
      ),
    ),
  );
}

Widget _headerSection() {
  var user = 'Vinoop';
  var searchText = ["Building a new Home?", "We've got you covered!"];
  return SliverToBoxAdapter(
      child: Container(
 
    padding: EdgeInsets.symmetric(horizontal: 48.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _spacer(height: 32),
        _userGreet(user),
        _spacer(height: 24),
        _searchBar(),
        _spacer(height: 24),
        _quickPicks(),
      ],
    ),
  ));
}

Widget _spacer({double height, double width}) {
  return SizedBox(
    height: height ?? 0,
    width: width ?? 0,
  );
}

Widget _userGreet(var user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _userHello(user),
      _spacer(height:4.0),
      _userQuestion(),
    ],
  );
}

Widget _userHello(var user) {
  return Text("Hi " + user,
      style: GoogleFonts.openSans(
          textStyle: TextStyle(fontSize: 13, color: AppColors.kDarkGrey)));
}

Widget _userQuestion() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Building a new home?",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 24,
                  color: AppColors.kDarkTextColor,
                  fontWeight: FontWeight.w500))),
      Text("We’ve got you covered!",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 24,
                  color: AppColors.kDarkTextColor,
                  fontWeight: FontWeight.w500))),
    ],
  );
}

Widget _searchBar() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12.0),
    child: Container(
      color: Colors.red,
      height: 40,
      width: double.infinity,
    ),
  );
}

Widget _quickPicks() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: Container(
            width: 56.w,
            height: 56.w,
            color: AppColors.kLightGrey,
          )),
      ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: Container(
            width: 56.w,
            height: 56.w,
            color: AppColors.kLightGrey,
          )),
      ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: Container(
            width: 56.w,
            height: 56.w,
            color: AppColors.kLightGrey,
          )),
      ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: Container(
            width: 56.w,
            height: 56.w,
            color: AppColors.kLightGrey,
          )),
    ],
  );
}
