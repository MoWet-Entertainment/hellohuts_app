import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/search/search_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/ui/common_widgets/search_bar.dart';
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
    final state = Provider.of<SearchState>(context,listen:false);
    print("building parent");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: CustomSearchBar(
            isBackButton: true,
            iconData: HelloIconsOld.sliders_v_alt,
            onActionPressed: onFilterPressed,
          ),
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

class SearchBody extends StatelessWidget {
  const SearchBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchState>(context);
    final bool isSearching = state.isSearching;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: isSearching ? _ShowResults() : _BuildSuggestions(),
    );
  }
}

class _ShowResults extends StatelessWidget {
  const _ShowResults({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchState>(context);
    final results = state.getSearchResults();
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return _SearchResultsCard(item: results[index]);
        });
  }
}

class _SearchResultsCard extends StatelessWidget {
  final SearchItem item;
  const _SearchResultsCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SearchState>(context);
    return InkWell(
      child: Container(
        height: 64.0,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: AppColors.kMediumGrey)),
        ),
        child: _searchResultsCardItem(item),
      ),
      onTap: () {
        state.setSelectedItem(item);
        print("User wishes to navigate to " + item.searchString + " page");
        ExtendedNavigator.of(context).push(Routes.searchDetail);
      },
    );
  }

  Widget _searchResultsCardItem(SearchItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.kMediumGrey, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
              color: AppColors.kLightGrey,
            ),
            child: _GetLeadingIcon(type: item.searchType),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  item.searchString,
                  style: AppThemes.postHeadLineStyle,
                ),
              ),
              Container(
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _GetLeadingIcon extends StatelessWidget {
  final SearchType type;

  const _GetLeadingIcon({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getLeadingIcon(type),
    );
  }

  Widget _getLeadingIcon(SearchType type) {
    switch (type) {
      case SearchType.Building:
        return _customIconForSeach(
          HelloIconsOld.building,
        );
      case SearchType.Location:
        return _customIconForSeach(
          HelloIconsOld.location_point,
        );
      case SearchType.Material:
        return _customIconForSeach(
          HelloIconsOld.truck,
        );

      case SearchType.Professionals:
        return _customIconForSeach(
          HelloIconsOld.constructor_1,
        );
      case SearchType.Other:
        return _customIconForSeach(
          HelloIconsOld.book_alt,
        );
      default:
        return _customIconForSeach(HelloIconsOld.postcard);
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
}

class _BuildSuggestions extends StatelessWidget {
  const _BuildSuggestions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cities = ['Ankara', 'İzmir', 'İstanbul', 'Samsun', 'Sakarya'];
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
          );
        },
        itemCount: cities.length,
      ),
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
