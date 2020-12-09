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
  final double sizeOfIcon;
  final double fontSize;
  final Color color;
  final VoidCallback onTap;
  CommentButton({
    Key key,
    this.postId,
    this.commentCount = '',
    this.color,
    this.sizeOfIcon = 24,
    this.onTap, this.fontSize=12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.commentCount = "12";
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Image.asset(
            HelloIcons.comment_light_icon,
            color: color ?? AppColors.kbDarkestGrey,
            height: sizeOfIcon,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            commentCount,
            style: AppThemes.normalTextStyle.copyWith(
                fontSize: fontSize, color: color ?? AppColors.kbDarkTextColor),
          )
        ],
      ),
      onTap: () {
        print('User wants to see comments');
        onTap();
      },
    );
  }
}
