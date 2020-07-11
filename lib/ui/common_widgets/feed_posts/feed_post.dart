import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/ui/common_widgets/feed_posts/widgets/widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class FeedPost extends StatelessWidget {
  final FeedModel model;
  const FeedPost({Key key, this.model}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      child: _feedPosts(model),
    );
  }

  Widget _feedPosts(FeedModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          color: AppColors.kPureWhite,
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
