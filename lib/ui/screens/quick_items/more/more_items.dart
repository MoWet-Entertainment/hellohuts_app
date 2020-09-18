import 'package:flutter/material.dart';

class MoreItems extends StatelessWidget {
  const MoreItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('More'),
          ),
        ),
      ),
    );
  }
}
