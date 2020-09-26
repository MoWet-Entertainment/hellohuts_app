import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: model.userLiked ? AppColors.kPrimaryRed : AppColors.kAliceBlue
        ),

              child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(HelloIcons.heart_bold_icon,
                height: 22,
                    color: model.userLiked? AppColors.kPureWhite: AppColors.kDarkestGrey,
                  ),
             
            SizedBox(
              width: 4.0,
            ),
            Text(
              '1.2K',
              style: AppThemes.normalTextStyle.copyWith(color: model.userLiked?AppColors.kPureWhite:AppColors.kDarkestGrey)

            )
          ],
        ),
      ),
      onTap: () {
        state.addLikeToPost(model, userId);
      },
    );
  }
}

