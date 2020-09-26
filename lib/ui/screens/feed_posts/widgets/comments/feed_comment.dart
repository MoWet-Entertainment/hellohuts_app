import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class CommentButton extends StatelessWidget {
  final String postId;
   String commentCount;
   CommentButton({
    Key key,
    this.postId,
    this.commentCount = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.commentCount = "12";
    return GestureDetector(
      child: Row(
        children: <Widget>[
         Image.asset(HelloIcons.comment_bold_icon, color: AppColors.kDarkestGrey, height: 22,),
          SizedBox(
            width: 4.0,
          ),
          Text(
            commentCount,
            style: AppThemes.normalTextStyle,
          )
        ],
      ),
      onTap: () {
        print('User wants to see comments');
        ExtendedNavigator.of(context).push(Routes.commentsDetail);
      },
    );
  }
}
