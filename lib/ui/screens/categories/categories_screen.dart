import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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

class CategoriesScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CategoriesScreen({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: AppColors.kPureWhite),
          child: SafeArea(
            child: Scaffold(
              body: NestedScrollView(
                ///This can be used to achieve floating app bar,
                ///but currently this also floats the [_HeaderSection] which is undesirable
                ///Therefore given false for now
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverSafeArea(
                        sliver: SliverAppBar(
                          pinned: false,
                          snap: false,
                          floating: true,
                          titleSpacing: 8.0,
                          backgroundColor: AppColors.kPureWhite,
                          elevation: 0,
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(8.0),
                            child: Container(
                              height: 8.0,
                            ),
                          ),
                          title: _searchField(context),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 40,
                        color: AppColors.kDarkGreen,
                      ),
                    ),
                  ];
                },
                body: _SearchBodyCategories(
                  scaffoldKey: widget.scaffoldKey,
                ),
              ),
            ),

            // appBar: AppBar(
            //   titleSpacing: 8.0,
            //   backgroundColor: AppColors.kPureWhite,
            //   elevation: 0,
            //   bottom: PreferredSize(
            //     preferredSize: Size.fromHeight(8.0),
            //     child: Container(
            //       height: 8.0,
            //     ),
            //   ),
            //   title: _searchField(context),
            // ),
            // // actions: _getActionButtons(context),
            // body: _SearchBodyCategories(),
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
    return Scaffold(
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
      itemBuilder: (context, index) => ImageCard(
        imageData: imageList[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
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
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    );
  }
}
