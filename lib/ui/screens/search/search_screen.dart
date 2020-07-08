import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
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
      final state = Provider.of<SearchState>(context,listen: false);
      //TODO: initialise Search State here and show user specific filter conditions
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
      isBackButton: true,
      iconData: HelloIcons.sliders_v_alt,
      onActionPressed: onFilterPressed,
    ),);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
