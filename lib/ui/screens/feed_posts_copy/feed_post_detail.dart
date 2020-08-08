import 'package:flutter/material.dart';

import 'package:hellohuts_app/models/test.dart';

class PostDetailScreen extends StatelessWidget {
  final FeedModel model;
  const PostDetailScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(model.postTitle),
          ),
        ),
      ),
    );
  }
}
