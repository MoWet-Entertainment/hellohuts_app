import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class AppThemes {
  static BuildContext context;
  static final ThemeData defaultTheme = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    accentColor: AppColors.kAccentColor,
    buttonColor: AppColors.kPrimaryColor,
    canvasColor: AppColors.kPureWhite,
    bottomAppBarColor: AppColors.kPrimaryColor,
  );
}
