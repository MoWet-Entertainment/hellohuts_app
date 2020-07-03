import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

Widget appBarIcon(
    {@required IconData icon,
    Color color,
    double size = 24,
    bool notification = false,
    Function actionCall}) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.0),
          color: AppColors.kLightGrey,
        ),
        height: 40.0,
        width: 40.0,
       
      ),
      IconButton(
          icon: Icon(
            icon,
            color: color ?? AppColors.kPureBlack,
            size: size,
          ),
          onPressed: actionCall),
      notification
          ?  new Positioned(
        right: 2,
        top: 8,
        child: new Container(
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color: AppColors.kPureWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          constraints: BoxConstraints(
            minWidth: 16,
            minHeight: 16,
          ),
          child: Container(
            decoration: new BoxDecoration(
            color: AppColors.kAccentColor,
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: BoxConstraints(
            maxHeight: 12,
            maxWidth: 12,

          ),
          ),
        ),
      ):Container(),
    ],
  );
}
