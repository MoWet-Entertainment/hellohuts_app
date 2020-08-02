import 'package:flutter/material.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:provider/provider.dart';

class SearchDetail extends StatelessWidget {
  const SearchDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SearchState>(context);

    return Scaffold(
      body: Center(child: Text(state.getSelectedItem.searchString),),
    );
  }
}
