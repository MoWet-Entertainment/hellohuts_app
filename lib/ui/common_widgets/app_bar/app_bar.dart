import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

Widget appBarIcon(
    {IconData icon,
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
          onPressed: actionCall,
        ),
   
      notification
          ? new Positioned(
              right: 2,
              top: 8,
              child: new Container(
                padding: EdgeInsets.all(1),
                decoration: new BoxDecoration(
                  color: AppColors.kPureWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: BoxConstraints(
                  maxHeight: 16,
                  maxWidth: 16,
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
            )
          : Container(),
    ],
  );
}



