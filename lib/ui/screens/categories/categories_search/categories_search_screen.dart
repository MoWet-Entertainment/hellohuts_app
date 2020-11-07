import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/models/search/search_item.dart';
import 'package:hellohuts_app/states/search/search_categories_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:provider/provider.dart';
import 'package:hellohuts_app/states/search/search_state_main.dart';

class CategoriesSearchPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  CategoriesSearchPage({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _CategoriesSearchPageState createState() => _CategoriesSearchPageState();
}

class _CategoriesSearchPageState extends State<CategoriesSearchPage> {
  bool flag = true;
  void onFilterPressed() {
    //TODO: Add filter here
    print("user wants to filter");
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = Provider.of<SearchCategoriesState>(context, listen: false);
      state.resetSearch();
      //TODO: initialise Search State here and show user specific filter conditions
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("building parent");
    final state = Provider.of<SearchCategoriesState>(context);
    return 
        AnnotatedRegion<SystemUiOverlayStyle>(
          value: ThemeOptions.of(context).getSystemUIOverlayStyle(context),
          child: SafeArea(
            child: Scaffold(
              appBar: CustomSearchBar(
                hintText: AppStrings.searchHintTextForCategories,
                onSearchChanged: (text) =>state.setSearchText(text),
                resetSearchCallback: () =>state.resetSearch(),
                onActionPressed: ()=>state.resetSearch(),  
              ),
              body: _SearchBody(),
            ),
          )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class _SearchBody extends StatefulWidget {
  const _SearchBody({Key key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchCategoriesState>(context);
    final theme = Theme.of(context);
    final bool isSearching = state.isSearching;
    return Container(
      color:theme.colorScheme.background,
      // padding: const EdgeInsets.symmetric(horizontal: 18),
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
    final state = Provider.of<SearchCategoriesState>(context);
    final results = state.getSearchResults();
    return Container(
      padding: const EdgeInsets.only(top: 4.0),
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
    var state = Provider.of<SearchCategoriesState>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: InkWell(
        splashColor: Colors.transparent,
        child: Container(
          child: Column(
            children: [
              _searchResult(item),
              Container(
                 padding: const EdgeInsets.symmetric(horizontal: 28),
                              child: Container(
                 
                  height:1, color:Theme.of(context).dividerColor),
              ),
            ],
          ),
          
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

      
    return Builder(
      builder: (BuildContext context){
        final theme = Theme.of(context);
      final isDarkTheme =ThemeOptions.of(context).isDarkTheme(context);
          return CustomListTile(
          tilePadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal:16),
           backgroundColor:theme.colorScheme.background,
        borderRadius: BorderRadius.zero,
        leading: customIconSquare(
         backgroundColor:isDarkTheme? AppColors.kDark_7: theme.colorScheme.secondaryVariant,
            iconAsset: _getLeadingIcon(item),
            iconColor: isDarkTheme?AppColors.kbDarkGrey: theme.colorScheme.onBackground,
            backgroundSize: 40,
            iconSize: 24,
            isCustomIcon: true,
        ),
            titleText: Text(item.searchString,
            style: theme.textTheme.subtitle1),
        subTitle: Text(
          item.searchType.toString(),
          style: theme.textTheme.bodyText1
              .copyWith(fontSize: 12, fontWeight: FontWeight.w300),
        ),
      
      );
      }
    );
      }
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


Widget _customIconForSeach(IconData iconData,
    {size = 16.0, Color color = AppColors.kbAlmostBlack}) {
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
