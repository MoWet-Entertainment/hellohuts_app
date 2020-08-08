import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class CommentButton extends StatelessWidget {
  final String postId;
  final String commentCount;
  const CommentButton({
    Key key,
    this.postId,
    this.commentCount = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Icon(
            HelloIcons.comment,
            size: 21,
            color: AppColors.kAlmostBlack,
          ),
          SizedBox(
            width: 4.0,
          ),
          // Text(
          //   commentCount,
          //   style: TextStyle(fontSize: 10),
          // )
        ],
      ),
      onTap: () {
        print('User wants to see comments');
        ExtendedNavigator.of(context).push(Routes.commentsDetail);
      },
    );
  }
}