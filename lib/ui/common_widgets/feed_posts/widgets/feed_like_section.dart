import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class FeedPostLikeSection extends StatelessWidget {
  final FeedModel model;
  const FeedPostLikeSection({Key key, this.model}) : super(key: key);
  final userId = '1234';
  //TODO: Add user id here

  @override
  Widget build(BuildContext context) {
    return _postLikeSection(context, model);
  }

  Widget _postLikeSection(BuildContext context, FeedModel model) {
    var state = Provider.of<FeedState>(context);
    return Flexible(
      flex: 1,
      child: LimitedBox(
        maxWidth: 80,
        child: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          icon: model.userLiked
              ? const Icon(
                  HelloIcons.heart_1,
              
                  color: AppColors.kDarkRed,
                )
              : const Icon(
                  HelloIcons.heart_empty_1,
                
                  color: AppColors.kDarkGrey,
                ),
          onPressed: () {
            state.addLikeToPost(model, userId);
          },
        ),
      ),
    );
  }
}
