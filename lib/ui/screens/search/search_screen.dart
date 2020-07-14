import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/search/search_item.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/search_bar.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
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
    final state = Provider.of<SearchState>(context);
    print("building parenr");
    return Scaffold(
      appBar: CustomSearchBar(
        isBackButton: true,
        iconData: HelloIcons.sliders_v_alt,
        onActionPressed: onFilterPressed,
      ),
      body: SearchBody(),
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
    print("building again");
    final state = Provider.of<SearchState>(context);
    final text = state.searchText;
    final bool isSearching = state.isSearching;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48.0),
      child: isSearching ? _showResults() : _buildSuggestions(),
    );
  }
}

class _showResults extends StatelessWidget {
  const _showResults({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchState>(context);
    final  results = state.getSearchResults();
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(
              results[index].searchString,
            )),
          );
        });
  }
}

class _buildSuggestions extends StatelessWidget {
  const _buildSuggestions({Key key}) : super(key: key);

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
        icon: Icon(HelloIcons.filter),
        onPressed: () => print("user wants to filter search results"),
      ),
    ];
  }

  @override
  String get searchFieldLabel => 'Search for 4 bedroom home..';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(HelloIcons.angle_left_b),
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
