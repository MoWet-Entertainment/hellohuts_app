import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

Widget appBarIcon(
    {@required IconData icon,
    Color color,
    double size = 24,
    Function actionCall}) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
     
      ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 40.0,
          width: 40.0,
          color: AppColors.kLightGrey,
        ),
      ),
       IconButton(
          icon: Icon(
            icon,
            color: color ?? AppColors.kPureBlack,
            size: size,
          ),
          onPressed: actionCall),
    ],
  );
}
