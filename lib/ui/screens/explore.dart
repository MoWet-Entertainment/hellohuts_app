import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellohuts_app/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/auth_states/auth_state.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/feed_post.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class ExplorePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  ExplorePage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  void initState() {
    
  }

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin<ExplorePage> {
  bool notificationFlag = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        primary: false,
        extendBody: true,
        backgroundColor: AppColors.kPureWhite,
        body:
          AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: AppColors.kPureWhite),
          child: SafeArea(
       
            child: _FeedWidgetBody(
              key: widget.key,
              scaffoldKey: widget.scaffoldKey,
            ),
          ),
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
      ///This can be used to achieve floating app bar,
      ///but currently this also floats the [_HeaderSection] which is undesirable
      ///Therefore given false for now
      floatHeaderSlivers: false,

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
    final state = Provider.of<FeedState>(context);
    final List<FeedModel> list = state.getFeedList();

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0)),
        color: AppColors.kLavender.withOpacity(0.7)
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: ScrollConfiguration(
          behavior: NeatScrollBehavior(),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding:
                EdgeInsets.only(top: 32.w, bottom: 64, left: 12.w, right: 12.w),
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (context, index) {
              FeedModel model = list[index];

              ///TODO: Check if you are facing any perf issue
              /// If yes Change the FeedPost to _feedPosts(context, model)
              return FeedPost(model: model);
            },
          ),
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
          padding: EdgeInsets.only(bottom: 16.0),
          sliver: SliverAppBar(
            floating: true,
            pinned: true,

            ///set `snap` false, when flutter verion `1.17.4` is upgraded
            snap: false,
            primary: true,
            forceElevated: innerBoxIsScrolled,
            elevation: 1.0,
            brightness: Brightness.light,
            backgroundColor: AppColors.kPureWhite,

            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: customIconSquare(
                  isCustomIcon: true,
                  iconAsset: HelloIcons.menu_icon,
                  iconColor: AppColors.kDarkTextColor,
                  iconSize: 24.0,
                  backgroundSize: 40.0,
                  backgroundColor: AppColors.kAliceBlue,
                  borderRadius: 12.0,
                  actionCall: () {
                    //TODO: Add App drawer code here
                    print("User clicked on App Drawer");
                  }),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: customIconSquare(
                    isCustomIcon: true,
                    iconAsset: HelloIcons.search_icon,
                    iconColor: AppColors.kDarkTextColor,
                    iconSize: 24.0,
                    backgroundSize: 40.0,
                    backgroundColor: AppColors.kAliceBlue,
                    borderRadius: 12.0,
                    actionCall: () {
                      ExtendedNavigator.of(context).push(Routes.searchPage);
                    }),
              ),
            ],
            centerTitle: true,
            title: Text(AppConstants.appName.toLowerCase(), style: AppThemes.appBarDefaultText),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = "Vinoop";
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            spacer(height: 16),
            _UsersGreet(),
            // spacer(height: 24),
            // _SearchBar(),
            spacer(height: 16),
            _QuickPicks(),
            spacer(height: 32),
          ],
        ),
      ),
    );
  }
}

class _UsersGreet extends StatelessWidget {
  const _UsersGreet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);
    var user = authState.user != null ? authState.user.displayName : "James";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _userHello(user),
          spacer(height: 4.0),
          _userQuestion(),
        ],
      ),
    );
  }

  Widget _userHello(String user) {
    return Text("Hi " + user,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(fontSize: 13, color: AppColors.kDarkGrey)));
  }

  Widget _userQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Building a new home?",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 24,
                    color: AppColors.kDarkTextColor,
                    fontWeight: FontWeight.bold))),
        Text("We’ve got you covered!",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 24,
                    color: AppColors.kDarkTextColor,
                    fontWeight: FontWeight.bold))),
      ],
    );
  }
}

class _QuickPicks extends StatelessWidget {
  const _QuickPicks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: AppColors.kAliceBlue,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _QuickPicksItem(
                  iconAsset: HelloIcons.cost_estimate_icon,
                  text: "Cost Estimate",
                  call: _callCostEstimate,
                ),
                _QuickPicksItem(
                    iconAsset: HelloIcons.professionals_icon,
                    text: "Professionals",
                    call: _callProfessionals),
                _QuickPicksItem(
                    iconAsset: HelloIcons.materials_icon,
                    text: "Materials",
                    call: _callMaterials),
                _QuickPicksItem(
                    iconAsset: HelloIcons.more_items_icon,
                    text: 'More',
                    call: _callMoreItems),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _callProfessionals() {
    print("Clicked Proferssionals");
    ExtendedNavigator.root.push(Routes.professionals);
  }

  void _callMaterials() {
    print("Clicked Materials");
    ExtendedNavigator.root.push(Routes.materials);
  }

  void _callMoreItems() {
    print("Clicked More Items");
    ExtendedNavigator.root.push(Routes.moreItems);
  }

  void _callCostEstimate() {
    print("Clicked CostEstimate");
    ExtendedNavigator.root.push(Routes.costEstimate);
  }
}

class _QuickPicksItem extends StatelessWidget {
  final String iconAsset;
  final String text;
  final Color textColor;
  final Function call;
  _QuickPicksItem({
    Key key,
    this.iconAsset,
    this.text,
    this.textColor,
    this.call,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 801), allowFontScaling: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        child: Column(
          children: <Widget>[
            customIconSquare(
              iconAsset: iconAsset,
              isCustomIcon: true,
              iconSize: 24.0,
              iconColor: AppColors.kAlmostBlack,
              backgroundSize: 56,
              borderRadius: 16.0,
              backgroundColor: AppColors.kPureWhite,
              actionCall: call,
            ),
            spacer(height: 8.0),
            Align(
              alignment: Alignment.center,
              child: text != null
                  ? Text(text,
                      style: GoogleFonts.lato(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: textColor != null
                              ? textColor
                              : AppColors.kDarkTextColor))
                  : Container(),
            )
          ],
        ),
        onTap: call,
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
                HelloIconsOld.search,
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
