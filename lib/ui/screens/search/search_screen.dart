import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController;
  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchAppBar,
      body: _searchResults,
    );
  }

  Widget get _searchAppBar {
    return AppBar(
      leading: Icon(HelloIcons.search, color: AppColors.kDarkGrey),
      title: Text('Search'),
    );
  }

  Widget get _searchResults {
    return Expanded(
      child: Container(
        color: Colors.red,
        child: Center(
          child: Text("Search Page"),
        ),
      ),
    );
  }
}
