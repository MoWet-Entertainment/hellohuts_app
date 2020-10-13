import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hellohuts_app/constants/app_constants.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'dart:math' as math;

class CategoriesScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CategoriesScreen({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<String> _tabs = <String>[
    "Featured",
    "Popular",
    "Latest",
    "Trending",
    "Fantastics",
    "Brilliant",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: Colors.transparent),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.kPureWhite,
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverOverlapAbsorber(
                      // This widget takes the overlapping behavior of the SliverAppBar,
                      // and redirects it to the SliverOverlapInjector below. If it is
                      // missing, then it is possible for the nested "inner" scroll view
                      // below to end up under the SliverAppBar even when the inner
                      // scroll view thinks it has not been scrolled.
                      // This is not necessary if the "headerSliverBuilder" only builds
                      // widgets that do not overlap the next sliver.
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverSafeArea(
                        top: false,
                        sliver: SliverAppBar(
                          backgroundColor: AppColors.kPureWhite,
                          title: _searchField(context),
                          floating: true,
                          pinned: true,
                          snap: false,
                          primary: true,
                          forceElevated: innerBoxIsScrolled,
                          bottom: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            indicatorPadding: const EdgeInsets.only(
                                bottom: 4, left: 16, right: 8),
                            indicatorColor: AppColors.kAccentColor,
                            labelColor: AppColors.kDarkTextColor,
                            unselectedLabelColor: AppColors.kDarkestGrey,
                            labelStyle: AppThemes.normalTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            unselectedLabelStyle: AppThemes.normalTextStyle
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                            // These are the widgets to put in each tab in the tab bar.
                            tabs: _tabs
                                .map((String name) => Tab(
                                      text: name,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  // These are the contents of the tab views, below the tabs.
                  children: [
                    InstagramSearchGrid(),
                    PinterestGrid(),
                    StandardGrid(),
                    StandardStaggeredGrid(),
                    InstagramSearchGrid(),
                    PinterestGrid(),
                  ],
                  // children: _tabs.map((String name) {
                  //   return SafeArea(
                  //     top: false,
                  //     bottom: false,
                  //     child: InstagramSearchGrid(),
                  //     // child: Builder(
                  //     //   // This Builder is needed to provide a BuildContext that is "inside"
                  //     //   // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
                  //     //   // find the NestedScrollView.
                  //     //   builder: (BuildContext context) {
                  //     //     return CustomScrollView(
                  //     //       // The "controller" and "primary" members should be left
                  //     //       // unset, so that the NestedScrollView can control this
                  //     //       // inner scroll view.
                  //     //       // If the "controller" property is set, then this scroll
                  //     //       // view will not be associated with the NestedScrollView.
                  //     //       // The PageStorageKey should be unique to this ScrollView;
                  //     //       // it allows the list to remember its scroll position when
                  //     //       // the tab view is not on the screen.
                  //     //       key: PageStorageKey<String>(name),
                  //     //       slivers: <Widget>[
                  //     //         SliverOverlapInjector(
                  //     //           // This is the flip side of the SliverOverlapAbsorber above.
                  //     //           handle: NestedScrollView
                  //     //               .sliverOverlapAbsorberHandleFor(context),
                  //     //         ),
                  //     //         SliverPadding(
                  //     //           padding: const EdgeInsets.all(8.0),
                  //     //           // In this example, the inner scroll view has
                  //     //           // fixed-height list items, hence the use of
                  //     //           // SliverFixedExtentList. However, one could use any
                  //     //           // sliver widget here, e.g. SliverList or SliverGrid.
                  //     //           sliver: SliverFixedExtentList(
                  //     //             // The items in this example are fixed to 48 pixels
                  //     //             // high. This matches the Material Design spec for
                  //     //             // ListTile widgets.
                  //     //             itemExtent: 60.0,
                  //     //             delegate: SliverChildBuilderDelegate(
                  //     //               (BuildContext context, int index) {
                  //     //                 // This builder is called for each child.
                  //     //                 // In this example, we just number each list item.
                  //     //                 return Container(
                  //     //                     color: Color((math.Random()
                  //     //                                         .nextDouble() *
                  //     //                                     0xFFFFFF)
                  //     //                                 .toInt() <<
                  //     //                             0)
                  //     //                         .withOpacity(1.0));
                  //     //               },
                  //     //               // The childCount of the SliverChildBuilderDelegate
                  //     //               // specifies how many children this inner list
                  //     //               // has. In this example, each tab has a list of
                  //     //               // exactly 30 items, but this is arbitrary.
                  //     //               childCount: 30,
                  //     //             ),
                  //     //           ),
                  //     //         ),
                  //     //       ],
                  //     //     );
                  //     //   },
                  //     // ),
                  //   );
                  // }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return GestureDetector(
      onTap: () => ExtendedNavigator.root.push(
        Routes.categoriesSearchPage,
      ),
      child: Container(
        height: 64,
        padding:
            const EdgeInsets.only(top: 16, bottom: 8.0, left: 24, right: 16),
        child: TextField(
          enabled: false,
          style: AppThemes.searchHintStyle
              .copyWith(color: AppColors.kDarkTextColor, fontSize: 14),
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              fillColor: AppColors.kAliceBlue,
              // isDense: true,
              prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 8.0),
                  child: Image.asset(
                    HelloIcons.search_icon,
                    color: AppColors.kDarkGrey,
                    height: 22,
                  )),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 44, maxWidth: 44),
              hintText: AppStrings.searchHintTextForCategories,
              hintStyle: AppThemes.searchHintStyle,
              focusColor: AppColors.kPureWhite,
              filled: true,
              contentPadding: const EdgeInsets.only(left: 5, right: 4),
              suffixIconConstraints:
                  BoxConstraints(maxWidth: 40, maxHeight: 40)),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _SearchBodyCategories extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _SearchBodyCategories({Key key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = [
      StandardGrid(),
      InstagramSearchGrid(),
      PinterestGrid(),
      StandardStaggeredGrid(),
    ];
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          child: ScrollConfiguration(
            behavior: NeatScrollBehavior(),
            child: PageView(
              children: [
                StandardGrid(),
                InstagramSearchGrid(),
                PinterestGrid(),
                StandardStaggeredGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StandardGrid extends StatelessWidget {
  const StandardGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Standard Grid Created");
    return GridView.builder(
      itemCount: imageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => ImageCard(
        imageData: imageList[index],
      ),
    );
  }
}

class StandardStaggeredGrid extends StatelessWidget {
  const StandardStaggeredGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("StandardStaggeredGrid  Created");

    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageCard(
        imageData: imageList[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}

class InstagramSearchGrid extends StatelessWidget {
  const InstagramSearchGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("InstagramSearchGrid  Created");

    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageCard1(
        imageData: imageList[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 7 == 0) ? 2 : 1,
          (index % 7 == 0)
              ? 2
              : (index % 3 == 0)
                  ? 2
                  : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("PinterestGrid  Created");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: imageList.length,
        itemBuilder: (context, index) => ImageCard1(
          imageData: imageList[index],
        ),
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(16.0),
    //   child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    // );
    return Container(
        child: Image.network(imageData.imageUrl, fit: BoxFit.cover));
  }
}

class ImageCard1 extends StatefulWidget {
  const ImageCard1({this.imageData});
  final ImageData imageData;

  @override
  _ImageCard1State createState() => _ImageCard1State();
}

class _ImageCard1State extends State<ImageCard1> {
  OverlayEntry _popupDialog;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: GestureDetector(
          child: Hero(
              tag: widget.imageData.id,
              child:
                  Image.network(widget.imageData.imageUrl, fit: BoxFit.cover)),
          onTap: () => {
            print("user tapped"),
            ExtendedNavigator.root.push(Routes.postImageWidget,
                arguments:
                    PostImageWidgetArguments(imageData: widget.imageData))
          },
          onLongPress: () => {
            _popupDialog = _createPopupDialog(widget.imageData),
            Overlay.of(context).insert(_popupDialog),
          },
          onLongPressEnd: (details) => _popupDialog?.remove(),
        ));

    // return Image.network(imageData.imageUrl, fit: BoxFit.cover);
  }

  OverlayEntry _createPopupDialog(ImageData imageData) {
    return OverlayEntry(
      builder: (context) => AnimatedDialog(
        child: _createPopupContent(imageData),
      ),
    );
  }


  Widget _createPopupContent(ImageData imageData) {
    return Builder(
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            // height: fullHeight(context)*0.7,
            width: fullWidth(context) * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _createPhotoTitle(),
                Image.network(imageData.imageUrl, fit: BoxFit.fitHeight),
                _createActionBar(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _createPhotoTitle() => Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        width: double.infinity,
        color: AppColors.kPureWhite,
        child: Text('this is a large image',
            style: TextStyle(color: Colors.black)),
      );

  Widget _createActionBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        color: AppColors.kPureWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            Icon(
              Icons.chat_bubble_outline,
              color: Colors.black,
            ),
            Icon(
              Icons.send,
              color: Colors.black,
            ),
          ],
        ),
      );
}

class PostImageWidget extends StatelessWidget {
  final ImageData imageData;
  const PostImageWidget({Key key, @required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
          tag: imageData.id,
          child: Image.network(
            imageData.imageUrl,
            fit: BoxFit.cover,
          )),
    );
  }
}

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
