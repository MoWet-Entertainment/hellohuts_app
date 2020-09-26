import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static BuildContext context;
  static final ThemeData defaultTheme = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    accentColor: AppColors.kAccentColor,
    buttonColor: AppColors.kPrimaryColor,
    canvasColor: AppColors.kPureWhite,
    bottomAppBarColor: AppColors.kPrimaryColor,
  );

  static final TextStyle postDateAndCategoryStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
        color: AppColors.kDarkGrey,
        fontSize: 10.0,
        fontWeight: FontWeight.w400),
  );

  static final TextStyle popUpStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: AppColors.kDarkGrey,
        fontSize: 14.0,
        fontWeight: FontWeight.w400),
  );
  static final TextStyle postHeadLineUserStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: AppColors.kDarkTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w500),
  );

  static final TextStyle postHeadLineStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: AppColors.kDarkTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w400),
  );

  static final TextStyle postedAuthorTextMainHeadStyle = GoogleFonts.lato(
    fontSize: 12.0,
    textStyle:
        TextStyle(fontWeight: FontWeight.w400, color: AppColors.kDarkTextColor),
  );

  static final TextStyle postedAuthorTextSubHeadStyle = GoogleFonts.lato(
    fontSize: 10.0,
    textStyle:
        TextStyle(fontWeight: FontWeight.w400, color: AppColors.kDarkGrey),
  );

  static final TextStyle searchHintStyle = GoogleFonts.openSans(
    fontSize: 14.0,
    textStyle:
        TextStyle(fontWeight: FontWeight.w400, color: AppColors.kDarkGrey),
  );

  static final TextStyle appBarDefaultText = GoogleFonts.openSans(
      fontSize: 16,
      textStyle: TextStyle(
          fontWeight: FontWeight.bold, color: AppColors.kDarkTextColor));
}
