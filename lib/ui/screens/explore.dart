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
import 'package:hellohuts_app/ui/screens/feed_posts_copy/feed_post.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  ExplorePage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin<ExplorePage> {
  bool notificationFlag = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      body: Container(
        child: _FeedWidgetBody(
          key: widget.key,
          scaffoldKey: widget.scaffoldKey,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _FeedWidgetBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _FeedWidgetBody({Key key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      ///set [floatHeaderSliver] to true . For getting the floating appBar
      ///This feature is not available in flutter stable `1.17.4`
      ///
      /// but available in Master branch

      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return <Widget>[
          _AppBarTop(
            innerBoxIsScrolled: innerBoxIsScrolled,
          ),
          _HeaderSection(),
        ];
      },
      body: _ExplorePostsFeed(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

class _ExplorePostsFeed extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _ExplorePostsFeed({Key key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(8.0),
            topRight: const Radius.circular(8.0)),
        color: AppColors.kMediumGrey,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: ScrollConfiguration(
          behavior: NeatScrollBehavior(),
          child: Consumer<FeedState>(builder: (context, state, child) {
            final List<FeedModel> list = state.getFeedList();
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 12, bottom: 64),
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (context, index) {
                FeedModel model = list[index];

                ///TODO: Check if you are facing any perf issue
                /// If yes Change the FeedPost to _feedPosts(context, model)
                return FeedPost(model: model);
              },
            );
          }),
        ),
      ),
    );
  }
}

class _AppBarTop extends StatelessWidget {
  final bool innerBoxIsScrolled;
  const _AppBarTop({Key key, this.innerBoxIsScrolled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            elevation:0.0,
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
}

class _HeaderSection extends StatelessWidget {
  final user = 'Vinoop';
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            spacer(height: 32),
            _userGreet(user),
            spacer(height: 24),
            _SearchBar(),
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
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  color: AppColors.kLightGrey,
                ),
                width: 56.w,
                height: 56.w,
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
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.kLightGrey,
        ),
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
      onTap: () => ExtendedNavigator.of(context).push(Routes.searchPage),
      // onTap: () => showSearch(context: context, delegate: CustomSearchDelegate()),
    );
  }
}
