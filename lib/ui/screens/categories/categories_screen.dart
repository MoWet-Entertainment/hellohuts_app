import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/interactions/follow_button.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/categories/post_detail/post_image.dart';
import 'package:hellohuts_app/ui/screens/categories/post_detail/post_image_fullview.dart';
import 'package:hellohuts_app/ui/screens/categories/widgets/wigets.dart';
import 'package:hellohuts_app/ui/common_widgets/interactions/comment/comments_placeholder.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';

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
    final theme = Theme.of(context);
    final isDark = ThemeOptions.of(context).isDarkTheme(context);
    return AnnotatedSafeArea(
      statusBarColor: Colors.transparent,
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    backgroundColor: theme.colorScheme.background,
                    title: _searchField(context),
                    floating: true,
                    pinned: true,
                    snap: false,
                    primary: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorPadding:
                          const EdgeInsets.only(bottom: 4, left: 16, right: 8),
                      indicatorColor: AppColors.kYellowLight,
                      labelColor: theme.colorScheme.onBackground,
                      unselectedLabelColor: isDark
                          ? AppColors.kbDarkGrey
                          : AppColors.kbDarkestGrey,
                      labelStyle: theme.textTheme.bodyText1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: theme.textTheme.bodyText1.copyWith(
                          fontSize: 14, fontWeight: FontWeight.normal),
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
              CategoriesStaggeredGrid(),
              CategoriesStaggeredGrid(),
              CategoriesStaggeredGrid(),
              CategoriesStaggeredGrid(),
              CategoriesStaggeredGrid(),
              CategoriesStaggeredGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => ExtendedNavigator.root.push(
        Routes.categoriesSearchPage,
      ),
      child: Container(
        height: 64,
        padding:
            const EdgeInsets.only(top: 16, bottom: 8.0, left: 16, right: 16),
        child: TextField(
          enabled: false,
          style: theme.textTheme.bodyText2.copyWith(fontSize: 14),
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              fillColor: theme.colorScheme.secondaryVariant,
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







class ImageCard extends StatefulWidget {
  const ImageCard({this.imageData});
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
          child: Hero(
            tag: widget.imageData.id,
            child: CachedNetworkImage(
              imageUrl: widget.imageData.imageUrlList[0],
              fit: BoxFit.cover,
            ),
          ),
          onTap: () => {
            print("user tapped"),
            ExtendedNavigator.root.push(Routes.postDetailPage,
                arguments:
                    PostDetailPageArguments(imageData: widget.imageData))
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



