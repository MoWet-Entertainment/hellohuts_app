import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import 'package:hellohuts_app/constants/app_constants.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/auth_states/auth_state.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/drawer/custom_drawer.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/feed_post.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';

class ExplorePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;


  ExplorePage({Key key, this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  @override
  void initState() {}

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin<ExplorePage> {
  bool notificationFlag = false;
  @override
  Widget build(BuildContext context) {

    super.build(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: ThemeOptions.of(context).getSystemUIOverlayStyle(context),
      child: Scaffold(
        primary: false,
        extendBody: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: _FeedWidgetBody(
            key: widget.key,
            scaffoldKey: widget.scaffoldKey,
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
            scaffoldKey: scaffoldKey,
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
          // color: AppColors.kLavender.withOpacity(0.7)),
          color: Theme.of(context).colorScheme.background),
      child: Padding(
        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
          child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            padding:
                EdgeInsets.only(top: 24, bottom: 64, left: 12.w, right: 12.w),
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
  final GlobalKey<ScaffoldState> scaffoldKey;
  const _AppBarTop({
    Key key,
    this.innerBoxIsScrolled,
    this.scaffoldKey,
  }) : super(key: key);

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
              brightness: Theme.of(context).colorScheme.brightness,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: customIconSquare(
                    isCustomIcon: true,
                    iconAsset: HelloIcons.menu_icon,
                    iconColor: Theme.of(context).colorScheme.onSurface,
                    iconSize: 24.0,
                    backgroundSize: 40.0,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    borderRadius: 12.0,
                    actionCall: () {
                      scaffoldKey.currentState.openDrawer();
                      print("User clicked on App Drawer");

                      // ThemeProvider.controllerOf(context).nextTheme();
                    }),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: customIconSquare(
                      isCustomIcon: true,
                      iconAsset: HelloIcons.search_icon,
                      iconColor: Theme.of(context).colorScheme.onSurface,
                      iconSize: 24.0,
                      backgroundSize: 40.0,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      borderRadius: 12.0,
                      actionCall: () {
                        ExtendedNavigator.of(context).push(Routes.searchPage);
                      }),
                ),
              ],
              centerTitle: true,
              title: Text(
                AppConstants.appName.toLowerCase(),
              )),
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
            spacer(height: 24),
            _QuickPicks(),
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
          _userHello(user, context),
          spacer(height: 4.0),
          _userQuestion(context),
        ],
      ),
    );
  }

  Widget _userHello(String user, BuildContext context) {
    return Text(
      "Hi " + user,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  Widget _userQuestion(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Building a new home?",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          "We’ve got you covered!",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
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
            color: Theme.of(context).colorScheme.secondaryVariant),
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
              iconColor: Theme.of(context).colorScheme.onBackground,
              backgroundSize: 56,
              borderRadius: 16.0,
              backgroundColor: Theme.of(context).colorScheme.surface,
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
                              : Theme.of(context).colorScheme.onBackground))
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
          color: AppColors.kbLightGrey,
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
                color: AppColors.kbAccentColor,
              ),
              spacer(width: 8),
              Text("Search for designs, plans etc",
                  style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kbDarkGrey)),
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
