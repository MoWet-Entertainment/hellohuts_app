import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';

import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget  {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  ExplorePage({Key key, this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  bool notificationFlag = false;

  @override
  void initState() {
    ScreenUtil.init(width: 375, height: 801);
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          extendBody: true,
                  body: Container(
                    child: RefreshIndicator(
                      key: refreshIndicatorKey,
                      onRefresh: () async {
                        //refersh the home page feed
                        //TODO: Add provider her to get data from the data base
                        var feedState = Provider.of<FeedState>(context, listen: false);
                        // feedState.getDataFromDataBase();
                        print("refresh");
                        return Future.value(true);
                      },
                      child: _FeedWidgetBody(
                        refreshIndicatorKey: refreshIndicatorKey,
                        scaffoldKey: scaffoldKey,
                      ),
                    ),
                  ),
        );
  }
}

class _FeedWidgetBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  const _FeedWidgetBody({Key key, this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      ///set [floatHeaderSliver] to true . For getting the floating appBar
      ///This feature is not available in flutter stable `1.17.4`
      ///
      /// but available in Master branch
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return <Widget>[
          _appBarTop(context, innerBoxIsScrolled),
          _headerSection(),
        ];
      },
      body: _ExplorePostsFeed(
        scaffoldKey: scaffoldKey,
        refreshIndicatorKey: refreshIndicatorKey,
      ),
    );
  }
}

class _ExplorePostsFeed extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  const _ExplorePostsFeed({Key key, this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
      child: Container(
        color: AppColors.kMediumGrey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 64.h),
          child: ScrollConfiguration(
            behavior: NeatScrollBehavior(),
               child: Consumer<FeedState>(builder: (context, state, child) {
              final List<FeedModel> list = state.getFeedList();
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 12),
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  FeedModel model = list[index];
                  return _feedPosts(context, model);
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}

Widget _explorePosts() {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
    child: Container(
      color: AppColors.kPureWhite,
      child: Container(
        color: AppColors.kMediumGrey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 64.h),
          child: ScrollConfiguration(
            behavior: NeatScrollBehavior(),
            child: FutureBuilder(
              // future: _getList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.none &&
                    snapshot.hasData == null) {
                  print("Loading");
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 12),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      FeedModel model = snapshot.data[index];
                      return _feedPosts(context, model);
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _feedPosts(BuildContext context, FeedModel list) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      child: Container(
        color: AppColors.kPureWhite,
        child: Container(
          child: Column(
            children: <Widget>[
              _feedPostTopSection(context, list),
              _feedPostMiddleSection(list),
              _feedPostBottomSection(list),
            ],
          ),
        ),
      ),
    ),
  );
}

Container _feedPostMiddleSection(FeedModel list) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: AspectRatio(
      aspectRatio: 319.w / 199.h,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Image.network(
          list.postImage,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
      ),
    ),
  );
}

Widget _feedPostBottomSection(FeedModel model) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _postDetailsSection(model),
          _postLikeSection(),
        ],
      ),
    ),
  );
}

Widget _postDetailsSection(FeedModel model) {
  return Padding(
    padding: EdgeInsets.only(left: 28.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Container(
            constraints: BoxConstraints(maxWidth: 288.w),
            child: Text(model.postTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: AppColors.kDarkTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(model.postedDate),
            Text("|"),
            Text(model.postCategory),
          ],
        )
      ],
    ),
  );
}

Widget _postLikeSection() {
  return Flexible(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.only(right: 24.0, top: 16, bottom: 16),
      child: Container(
        child: Icon(
          HelloIcons.heart,
          size: 24,
          color: AppColors.kDarkGrey,
        ),
      ),
    ),
  );
}

Widget _feedPostTopSection(BuildContext context, FeedModel list) {
  return Padding(
    padding: EdgeInsets.only(left: 26.w, right: 16.h, top: 16.w, bottom: 8.h),
    child: Row(
      children: <Widget>[
        postedUserSection(context,
            imagePath: list.userAvatar,
            postedUser: list.postedUser,
            userTitle: list.postedUsertitle,
            radiusOfAvatar: 8.w),
        Spacer(),
        Icon(HelloIcons.ellipsis_v),
      ],
    ),
  );
}

Widget _appBarTop(BuildContext context, bool innerBoxIsScrolled) {
  var state = Provider.of<FeedState>(context, listen: false);
  return SliverOverlapAbsorber(
    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    sliver: SliverSafeArea(
      top: false,
      bottom: false,
      sliver: SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        sliver: SliverAppBar(
          floating: true,
          pinned: false,

          ///set `snap` false, when flutter verion `1.17.4` is upgraded
          snap: true,
          primary: true,
          forceElevated: innerBoxIsScrolled,
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: AppColors.kPureWhite,
          leading: appBarIcon(icon: HelloIcons.subject, size: 24),
          actions: <Widget>[
            appBarIcon(
                icon: HelloIcons.bell,
                size: 24,
                notification: state.isNotificationFlag),
          ],
          centerTitle: true,
          title: Icon(
            HelloIcons.hello_icon,
            color: AppColors.kDarkTextColor,
          ),
        ),
      ),
    ),
  );
}

Widget _headerSection() {
  var user = 'Vinoop';
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          spacer(height: 32),
          _userGreet(user),
          spacer(height: 24),
          _searchBar(),
          spacer(height: 24),
          _quickPicks(),
          spacer(height: 32),
        ],
      ),
    ),
  );
}

Widget _userGreet(var user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _userHello(user),
      spacer(height: 4.0),
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
  return GestureDetector(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        color: AppColors.kLightGrey,
        height: 48,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: <Widget>[
              Spacer(),
              Icon(
                HelloIcons.search,
                size: 16,
                color: AppColors.kAccentColor,
              ),
              spacer(width: 8),
              Text("Search for designs, plans etc",
                  style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kDarkGrey)),
              Spacer(),
            ],
          ),
        ),
      ),
    ),
    onTap: () {
      ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.searchScreen);
    },
  );
}

Widget _quickPicks() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _quickPickItem(
        icon: HelloIcons.rupee_sign,
        text: "Cost Estimate",
        call: _test,
      ),
      _quickPickItem(
          icon: HelloIcons.constructor_1, text: "Professionals", call: _test),
      _quickPickItem(icon: HelloIcons.truck, text: "Materials", call: _test),
      _quickPickItem(icon: HelloIcons.apps, text: 'More', call: _test),
    ],
  );
}

void _test() {
  print("Clicked");
}

Widget _quickPickItem(
    {IconData icon,
    double size = 20,
    Color iconColor = AppColors.kDarkTextColor,
    String text,
    Color textColor,
    Function call}) {
  return Padding(
    padding: EdgeInsets.all(4.0.w),
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: Stack(
            children: <Widget>[
              Container(
                width: 56.w,
                height: 56.w,
                color: AppColors.kLightGrey,
                child: Icon(
                  icon,
                  size: size,
                  color: iconColor,
                ),
              ),
              new Positioned.fill(
                  child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  onTap: call != null ? () => call() : () => {},
                ),
              ))
            ],
          ),
        ),
        spacer(height: 8.0),
        Align(
          alignment: Alignment.center,
          child: text != null
              ? Text(text,
                  style: GoogleFonts.roboto(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: textColor != null
                          ? textColor
                          : AppColors.kDarkTextColor))
              : Container(),
        )
      ],
    ),
  );
}
