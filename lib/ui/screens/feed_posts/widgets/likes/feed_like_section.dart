import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    Key key,
    @required this.model,
    @required this.state,
  }) : super(key: key);

  final FeedModel model;
  final FeedState state;

  //TODO: Add User ID here
  final userId = '1234';

  @override
  Widget build(BuildContext context) {
    // var controller = useAnimationController(
    //     duration: Duration(milliseconds: 300), lowerBound: 0.9, upperBound: 1);
//TODO: ADD Aimation to give resoponse to the user
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          model.userLiked
              ? const Icon(
                  HelloIconsOld.thumbs_up,
                  size: 22,
                  color: AppColors.kDarkRed,
                )
              : const Icon(
                  HelloIconsOld.thumbs_up,
                  size: 22,
                  color: AppColors.kAlmostBlack,
                ),
          SizedBox(
            width: 4.0,
          ),
          // Text(
          //   '1.2K',
          //   style: TextStyle(fontSize: 10),
          // )
        ],
      ),
      onTap: () {
        state.addLikeToPost(model, userId);
      },
    );
  }
}

