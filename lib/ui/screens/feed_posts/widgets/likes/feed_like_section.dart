import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/feed_state.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    Key key,
    this.isLiked = false,
    this.likeCount,
    this.onLikedCallback,
    this.sizeOfIcon=24,
    this.fontSize=12,
    this.likedIconColor= AppColors.kPureWhite,
    this.likedBackgroundColor= AppColors.kPrimaryRed,
    this.defaultIconColor=AppColors.kDarkestGrey,
    this.defaultBackgroundColor =AppColors.kAliceBlue, 
    this.likedTextColor =AppColors.kPureWhite,
     this.defaultTextColor=AppColors.kDarkestGrey,
  }) : super(key: key);

  final bool isLiked;
  final String likeCount;
  final VoidCallback onLikedCallback;
  final double sizeOfIcon;
  final double fontSize;
  final Color likedIconColor;
  final Color likedBackgroundColor;
  final Color defaultIconColor;
  final Color defaultBackgroundColor;
    final Color likedTextColor;
  final Color defaultTextColor;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  final userId = '1234';

  @override
  Widget build(BuildContext context) {
    // var controller = useAnimationController(
    //     duration: Duration(milliseconds: 300), lowerBound: 0.9, upperBound: 1);

//TODO: ADD Aimation to give resoponse to the user
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: widget.isLiked
                  ?widget.likedBackgroundColor
                  :widget.defaultBackgroundColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                HelloIcons.heart_bold_icon,
                height: widget.sizeOfIcon,
                color: widget.isLiked
                    ? widget.likedIconColor
                    : widget.defaultIconColor,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(widget.likeCount ?? '1.2K',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: widget.fontSize ,
                      color: widget.isLiked
                          ? widget.likedTextColor
                          : widget.defaultTextColor),
                          ),
              SizedBox(
                width: 4.0,
              ),
            ],
          ),
        ),
        onTap: widget.onLikedCallback);
  }
}
