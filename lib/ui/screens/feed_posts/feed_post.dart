import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/post/feed_content.dart';
import 'package:hellohuts_app/ui/screens/feed_posts/widgets/post/feed_top_section.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class FeedPost extends StatefulWidget {
  final FeedModel model;
   FeedPost({Key key, this.model}) : super(key: key);

  @override
  _FeedPostState createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: _feedPosts(widget.model),
    );
  }

  Widget _feedPosts(FeedModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor,width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: Theme.of(context).colorScheme.surface
        ),
        child: Column(
          children: <Widget>[
            FeedPostTopSection(model: model),
            FeedPostContent(model: model),
          ],
        ),
      ),
    );
  }
}
