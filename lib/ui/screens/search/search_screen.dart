import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/models/search/search_item.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:hellohuts_app/states/search_state.dart';

class SearchPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  SearchPage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool flag = true;
  void onFilterPressed() {
    //TODO: Add filter here
    print("user wants to filter");
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = Provider.of<SearchState>(context, listen: false);
      state.resetSearch();
      //TODO: initialise Search State here and show user specific filter conditions
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("building parent");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: CustomSearchBar(hintText: AppStrings.searchHintText),
          body: SearchBody(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class SearchBody extends StatefulWidget {
  const SearchBody({Key key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchState>(context);
    final bool isSearching = state.isSearching;
    return Container(
      color: state.isSearching ? AppColors.kAliceBlue : AppColors.kPureWhite,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: isSearching ? _ShowResults() : _BuildSuggestions(),
    );
  }
}

class _ShowResults extends StatefulWidget {
  const _ShowResults({Key key}) : super(key: key);

  @override
  __ShowResultsState createState() => __ShowResultsState();
}

class __ShowResultsState extends State<_ShowResults> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchState>(context);
    final results = state.getSearchResults();
    return Container(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListView.builder(
              itemCount: results?.length ?? 0,
              itemBuilder: (context, index) {
                return _SearchResultsCard(item: results[index]);
              }),
    );
  }
}

class _SearchResultsCard extends StatelessWidget {
  final SearchItem item;
  const _SearchResultsCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SearchState>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        child: Container(
          child: _searchResult(item),
        ),
        onTap: () {
          state.setSelectedItem(item);
          print("User wishes to navigate to " + item.searchString + " page");
          ExtendedNavigator.of(context).push(Routes.servicesOfferedBasePage);
        },
      ),
    );
  }

  Widget _searchResult(SearchItem item) {
    return CustomListTile(
      leading: customIconSquare(
        backgroundColor: AppColors.kAliceBlue,
        iconAsset: _getLeadingIcon(item),
        iconColor: AppColors.kAlmostBlack,
        backgroundSize: 40,
        iconSize: 24,
        isCustomIcon: true,
      ),
      titleText: Text(item.searchString,
          style: AppThemes.normalTextStyle
              .copyWith(fontSize: 14, color: AppColors.kDarkTextColor)),
      subTitle: Text(
        item.searchType.toString(),
        style: AppThemes.normalTextLightStyle
            .copyWith(fontSize: 12, color: AppColors.kDarkTextColor),
      ),
      backgroundColor: AppColors.kPureWhite,
    );
  }

  String _getLeadingIcon(SearchItem item) {
    switch (item.searchType) {
      case SearchType.Building:
        return HelloIcons.home_bold_icon;
      case SearchType.Location:
        return HelloIcons.location_bold_icon;
      case SearchType.Material:
        return HelloIcons.bag_bold_icon;

      case SearchType.Professionals:
        return HelloIcons.home_bold_icon;
      case SearchType.Other:
        return HelloIcons.chart_bold_icon;
      default:
        return HelloIcons.chart_bold_icon;
    }
  }
}

Widget _customIconForSeach(IconData iconData,
    {size = 16.0, Color color = AppColors.kAlmostBlack}) {
  return Icon(
    iconData,
    size: size,
    color: color,
  );
}

class _BuildSuggestions extends StatelessWidget {
  const _BuildSuggestions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cities = ['Ankara', 'İzmir', 'İstanbul', 'Samsun', 'Sakarya'];
    return Container(
        // child: ListView.builder(
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text(cities[index]),
        //     );
        //   },
        //   itemCount: cities.length,
        // ),
        );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final cities = ['Ankara', 'İzmir', 'İstanbul', 'Samsun', 'Sakarya'];
  var recentCities = ['Ankara'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(HelloIconsOld.filter),
        onPressed: () => print("user wants to filter search results"),
      ),
    ];
  }

  @override
  String get searchFieldLabel => 'Search for 4 bedroom home..';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(HelloIconsOld.angle_left_b),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Card(
          color: Colors.white,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? recentCities
        : cities.where((ele) => ele.contains(query)).toList();
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              onTap: () => showResults(context),
              leading: Icon(Icons.location_city),
              title: RichText(
                text: TextSpan(
                  text: suggestionsList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: suggestionsList[index].substring(query.length)),
                  ],
                ),
              ),
            ),
        itemCount: suggestionsList.length);
  }
}
