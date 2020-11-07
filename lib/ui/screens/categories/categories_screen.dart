import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellohuts_app/constants/app_constants.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/board/add_to_board.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/comments_placeholder.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/comments/feed_comment.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/likes/feed_like_section.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/post/feed_content.dart';
import 'package:hellohuts_app/ui/screens/search/search_screen.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              backgroundColor: AppColors.kbPureWhite,
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
                          backgroundColor: AppColors.kbPureWhite,
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
                            indicatorColor: AppColors.kbAccentColor,
                            labelColor: AppColors.kbDarkTextColor,
                            unselectedLabelColor: AppColors.kbDarkestGrey,
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
                    InstagramSearchGrid(),
                    PinterestGrid(),
                    InstagramSearchGrid(),
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
              .copyWith(color: AppColors.kbDarkTextColor, fontSize: 14),
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              fillColor: AppColors.kbAliceBlue,
              // isDense: true,
              prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 8.0),
                  child: Image.asset(
                    HelloIcons.search_icon,
                    color: AppColors.kbDarkGrey,
                    height: 22,
                  )),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 44, maxWidth: 44),
              hintText: AppStrings.searchHintTextForCategories,
              hintStyle: AppThemes.searchHintStyle,
              focusColor: AppColors.kbPureWhite,
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
              : (index % 9 == 0)
                  ? 2
                  : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

List<StaggeredTile> _staggeredTileList = const <StaggeredTile>[
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1)
];

class NormalGrid extends StatelessWidget {
  const NormalGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Custom Grid");
    return SliverStaggeredGrid.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
        itemBuilder: (context, index) =>
            Image.network(imageList[index].imageUrlList[0], fit: BoxFit.cover),
        // Container(
        //       color: randomOpaqueColor(),
        //       child: Center(
        //         child: CircleAvatar(
        //           child: Center(child: Text(index.toString())),
        //         ),
        //       ),
        //     ),
        itemCount: 20);
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("PinterestGrid  Created");

    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageCard(
        imageData: imageList[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 8.0,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
    );
  }
}

class ImageCard2 extends StatelessWidget {
  const ImageCard2({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(16.0),
    //   child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    // );
    return Container(
        child: Image.network(imageData.imageUrlList[0], fit: BoxFit.cover));
  }
}

class ImageCard extends StatefulWidget {
  ImageCard({this.imageData});
  final ImageData imageData;

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  OverlayEntry _popupDialog;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: GestureDetector(
          child: Stack(
            children: [
              Hero(
                  tag: widget.imageData.id,
                  child: CachedNetworkImage(
                imageUrl: widget.imageData.imageUrlList[0],
                fit:BoxFit.cover,
              ),),
              widget.imageData.isTrending
                  ? Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: AppColors.kbPrimaryYellow.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          HelloIcons.flame_bold_icon,
                          color: AppColors.kbLightGrey,
                          height: 12,
                        )),
                      ))
                  : SizedBox(),
              Positioned(
                right: 8,
                bottom: 16,
                //TODO: Change the indicator of number of imgaes to more like an icon
                child: int.parse(widget.imageData.countOfImages) > 1
                    ? Row(
                        children: [
                          Container(
                            height: 4,
                            width: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.kbLightGrey.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.kbLightGrey.withOpacity(0.6),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ),
            ],
          ),
          onTap: () => {
     
            //  Navigator.push(context,MaterialPageRoute(builder:(context) =>MyAppTest() ))
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
                Image.network(imageData.imageUrlList[0], fit: BoxFit.fitHeight),
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
        color: AppColors.kbPureWhite,
        child: Text('this is a large image',
            style: TextStyle(color: Colors.black)),
      );

  Widget _createActionBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        color: AppColors.kbPureWhite,
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
              child:CachedNetworkImage(
                imageUrl: widget.imageData.imageUrlList[0],
                fit:BoxFit.cover,
              ),
              ),
          onTap: () => {
            print("user tapped"),
            ExtendedNavigator.root.push(Routes.postDetailWidget, arguments: PostDetailWidgetArguments(imageData: widget.imageData))
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
            width: fullWidth(context) * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _createPhotoTitle(),
                Image.network(imageData.imageUrlList[0], fit: BoxFit.fitHeight),
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
        color: AppColors.kbPureWhite,
        child: Text('this is a large image',
            style: TextStyle(color: Colors.black)),
      );

  Widget _createActionBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        color: AppColors.kbPureWhite,
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

class PostDetailWidget extends StatelessWidget {
  final ImageData imageData;
  double _heightOfAppBar;
  PostDetailWidget({Key key, @required this.imageData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final itemIndex = imageList.indexOf(imageData);
    // print("index is " + itemIndex.toString());
    _heightOfAppBar = fullHeight(context) * 0.7;
    print('Height of AppBar ' + _heightOfAppBar.toString());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.kbPureBlack,
        body: _scrollBody(context),
      ),
    );
  }

  Widget _scrollBody(BuildContext context) {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: NeatScrollBehavior(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.kbPureBlack,
                elevation: 0,
                leading: Container(
                  decoration: BoxDecoration(
                      // color: Colors.black.withOpacity(0.1),
                      gradient:
                          RadialGradient(center: Alignment.center, colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.transparent,
                      ]),
                      borderRadius: BorderRadius.circular(40)),
                  child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => ExtendedNavigator.of(context).pop()),
                ),
//               actions: [
// IconButton(icon: Icon(Icons.more_horiz, color: AppColors.kPureWhite,), onPressed: null)
//                ],
                floating: false,
                pinned: true,
                expandedHeight: _heightOfAppBar,
                flexibleSpace: DecoratedBox(
                  decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   colors: <Color>[
                      //     AppColors.kPrimaryYellow,
                      //     AppColors.kPrimaryYellow,
                      //   ],
                      // ),
                      color: Colors.black),
                  child: FlexibleSpaceBar(
                    stretchModes: [StretchMode.zoomBackground],
                    collapseMode: CollapseMode.pin,
                    background: PostImage(
                      imageData: imageData,
                    ),
                  ),
                ),
              ),
              _PostDetailTitleHeaders(),
              _PostDetailContent(),
              SliverToBoxAdapter(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          child: Container(
                              width: fullWidth(context),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: AppColors.kbDark_2,
                              ),
                              child: Row(
                                children: [
                                  //TODO:Add UserImage to avatar, instead of the placeholder
                                  CustomAvatar(radius: 10),
                                  SizedBox(width: 12),
                                  Text(
                                    'Add Comment',
                                    style: AppThemes.normalSecondaryTextStyle
                                        .copyWith(color: AppColors.kbDarkGrey),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    HelloIcons.send_bold_icon,
                                    height: 22,
                                    color: AppColors.kbDarkGrey,
                                  ),
                                ],
                              )),
                          onTap: () => {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DraggableScrollableSheet(
                                    initialChildSize: 0.5,
                                    maxChildSize: 1,
                                    builder: (BuildContext context,
                                        ScrollController scrollController) {
                                      return Stack(
                                        children: [
                                          Container(
                                            width: fullWidth(context),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              color: AppColors.kbSmokedWhite,
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.only(top:8),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        fullWidth(context) * .15,
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .dividerColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: MediaQuery.of(context).viewInsets.bottom,
                                            left: 0,
                                            right: 0,
                                                                                      child: Container(
                                                                                        padding: const EdgeInsets.only(left: 16,top:14, right:16, bottom:20),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    topRight: Radius.circular(20),
                                                  ),
                                                  color: AppColors.kbPureWhite,
                                                ),
                                                child: Container(
                                                 decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: AppColors.kbAliceBlue,
                                                ),

                                                  child: TextField(
                                                  
                                                    
                                                    decoration: InputDecoration(
                                                    prefixIcon: CustomAvatar(radius:10),
                                                    prefixIconConstraints: BoxConstraints(
                                                      maxWidth: 20,
                                                      maxHeight: 20
                                                    ),
                                                     border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            fillColor: AppColors.kbPureWhite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              }),
                    ]),
              )),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 24,
              )),
              NormalGrid(),
            ],
          ),
        ),
      ],
    );
  }
}

class _PostDetailContent extends StatelessWidget {
  const _PostDetailContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.kbPureBlack,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO:Chnage hardcoded text
              Text(
                'Simple, but elegant living room interior at a low cost',
                style: AppThemes.normalTextStyle.copyWith(
                    fontSize: 18,
                    color: AppColors.kbPureWhite,
                    fontWeight: FontWeight.bold),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. And its so confusing to see molecules getting robbed. But game of thrones was a good theory. Tellus molestie enim et turpis sagittis blandit aliquam. Ullamcorper dis sed integer velit nisi, maecenas diam sed nunc. Nibh lobortis egestas et, integer non at. Et mauris fermentum habitant tellus auctor in arcu, sodales a.ctor in arcu",
                  style: AppThemes.normalSecondaryTextStyle
                      .copyWith(color: AppColors.kbPureWhite, fontSize: 14),
                  maxLines: 6,
                  expandText: 'more',
                  linkColor: AppColors.kbLavender,
                  collapseText: ''),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostDetailTitleHeaders extends StatelessWidget {
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.topLeft,
        color: AppColors.kbPureBlack,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 24.0, left: 16, right: 16, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              postedUserSection(context,
                  postedUser: 'Harry James Potter',
                  radiusOfAvatar: 16,
                  postedUserTextStyle: AppThemes.normalTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.kbPureWhite),
                  userTitle: 'Architect',
                  userTitleTextStyle: AppThemes.normalSecondaryTextStyle
                      .copyWith(color: AppColors.kbDarkGrey)),
              FollowButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class FollowButton extends StatefulWidget {
  final bool isFollowing;
  final VoidCallback onPressed;
  const FollowButton({
    Key key,
    this.isFollowing = false,
    this.onPressed,
  }) : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollowing;
  @override
  void initState() {
    _isFollowing = widget.isFollowing;
    super.initState();
  }

  _toggleFollowFollowing() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildGestureDetector();
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
      onTap: () => {
        if (widget.onPressed != null) widget.onPressed(),
        _toggleFollowFollowing(),
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceIn,
        padding: _isFollowing
            ? const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8)
            : const EdgeInsets.only(left: 14, right: 16, top: 8, bottom: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: _isFollowing
              ? AppColors.kbDarkGreen.withOpacity(0.2)
              : AppColors.kbPrimaryYellow.withOpacity(0.2),
        ),
        child: _isFollowing
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Following',
                    style: AppThemes.normalTextStyle
                        .copyWith(color: AppColors.kbDarkGreen),
                  )
                ],
              )
            : Row(
                children: [
                  Image.asset(
                    HelloIcons.plus_bold_icon,
                    color: AppColors.kbPrimaryYellow,
                    height: 15,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Follow',
                    style: AppThemes.normalTextStyle
                        .copyWith(color: AppColors.kbPrimaryYellow),
                  )
                ],
              ),
      ),
    );
  }
}

Widget _buildViewWithScrollingCategories() {
  return ListView.builder(
    itemCount: 21, // records.length + 1 for the Categories card
    itemBuilder: (BuildContext context, int index) {
      return index == 0
          ? _buildCategoriesCard()
          : Card(
              child: Padding(
                padding: const EdgeInsets.all(16.00),
                child: Text(index.toString()),
              ),
            );
    },
  );
}

Widget _buildCategoriesCard() {
  return Card(
    elevation: 3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('one'), // Category( ...
        SizedBox(width: 10.0),
        Text('two'), // Category( ...
        SizedBox(width: 10.0),
        Text('three'), // Category( ...
      ],
    ),
  );
}

class AppBarTitle extends StatefulWidget {
  final ScrollController controller;
  final String titleText;
  final TextStyle titleTextStyle;
  final double scrollHeightToTrigger;
  AppBarTitle(
      {Key key,
      @required this.controller,
      this.titleText = '',
      this.titleTextStyle,
      this.scrollHeightToTrigger = 700.0})
      : super(key: key);

  @override
  _AppBarTitleState createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  bool _scrollFlag = false;
  @override
  void initState() {
    widget.controller.addListener(() {
      if (_scrollFlag == false &&
          widget.controller.position.pixels > widget.scrollHeightToTrigger) {
        setState(() {
          _scrollFlag = true;
        });
      }

      if (_scrollFlag == true &&
          widget.controller.position.pixels <= widget.scrollHeightToTrigger) {
        setState(() {
          _scrollFlag = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_scrollFlag ? widget.titleText : '',
        style: widget.titleTextStyle ??
            AppThemes.normalTextStyle
                .copyWith(fontSize: 14, fontWeight: FontWeight.bold));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class PostImage extends StatefulWidget {
  const PostImage({Key key, this.imageData}) : super(key: key);
  final ImageData imageData;

  @override
  _PostImageState createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> with TickerProviderStateMixin {
  int _activeIndex = 0;
  int animationSeconds = 4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FeedState>(context);
    bool isCarousel = widget.imageData.imageUrlList.length > 1 ? true : false;
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect rect) {
                      return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.6)
                          ]).createShader(rect);
                    },
                    blendMode: BlendMode.darken,
                    child: widget.imageData.imageUrlList.length > 1
                        ? CarouselSlider.builder(
                            itemCount: widget.imageData.imageUrlList.length,
                            options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 4),
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              height: fullHeight(context) * 0.8,
                              // aspectRatio: 0.7,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _activeIndex = index;
                                });
                                // feedState.updatePostActivePage(model, index);
                              },
                            ),
                            itemBuilder:
                                (BuildContext context, int itemIndex) =>
                                    Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: TweenAnimationBuilder(
                                  curve: Curves.linear,
                                  duration: Duration(seconds: animationSeconds),
                                  tween: Tween<double>(begin: 1, end: 1.06),
                                  builder: (context, double scale, child) {
                                    return Transform.scale(
                                      scale: scale,
                                      child: child,
                                    );
                                  },
                                  child: Image.network(
                                    widget.imageData.imageUrlList[itemIndex],
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              widget.imageData.imageUrlList[0],
                              fit: BoxFit.cover,
                              height: fullHeight(context) * 0.8,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      // height: 100,
                      width: fullWidth(context),
                      child: Row(
                        children: [
                          LikeButton(
                            isLiked: true,
                            likeCount: '918',
                            fontSize: 12,
                            sizeOfIcon: 24,
                            defaultIconColor: AppColors.kbPureWhite,
                            defaultTextColor: AppColors.kbPureWhite,
                            likedBackgroundColor:
                                AppColors.kbDarkRed.withOpacity(0.8),
                            defaultBackgroundColor:
                                AppColors.kbDarkGrey.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          CommentButton(
                            color: AppColors.kbPureWhite,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ShareWidget(
                            color: AppColors.kbPureWhite,
                          ),
                          Spacer(),
                          PlusButton(
                            postId: '',
                            addedToBoard: false,
                            defaultIconColor: AppColors.kbPureWhite,
                            addedToBoardBackGroundColor: Colors.transparent,
                            addedToBoardColor: AppColors.kbAccentColor,
                            defaultBackgroundColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.0),
            isCarousel
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8.0),
                      child: AnimatedSmoothIndicator(
                        count: widget.imageData.imageUrlList.length,
                        activeIndex: _activeIndex,
                        effect: ExpandingDotsEffect(
                            dotHeight: 6,
                            dotWidth: 12,
                            spacing: 4,
                            dotColor: AppColors.kbDarkGrey,
                            activeDotColor: AppColors.kbMediumGrey,
                            expansionFactor: 2),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ));
  }
}

class PostImageFullView extends StatefulWidget {
  const PostImageFullView({
    Key key,
    @required this.image,
  }) : super(key: key);

  final ImageData image;
  @override
  _PostImageFullViewState createState() => _PostImageFullViewState();
}

class _PostImageFullViewState extends State<PostImageFullView> {
  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InteractiveViewer(
        panEnabled: false,
        transformationController: transformationController,
        onInteractionEnd: (details) {
          setState(() {
            transformationController.toScene(Offset.zero);
          });
        },
        boundaryMargin: EdgeInsets.all(20.0),
        minScale: 0.1,
        maxScale: 6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.0),
          child: Image.network(
            widget.image.imageUrlList[0],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
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
