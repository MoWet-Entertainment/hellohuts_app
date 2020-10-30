import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static BuildContext context;

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: AppColors.kPureWhite,
      indicatorColor: AppColors.kPrimaryYellow,
      buttonColor: isDarkTheme
          ? AppColors.kButtonColorDark
          : AppColors.kButtonColorLight,
      hintColor:
          isDarkTheme ? AppColors.kHintColorDark : AppColors.kHintColorLight,
      textSelectionColor:
          isDarkTheme ? AppColors.kPureWhite : AppColors.kPureBlack,
      cardColor:
          isDarkTheme ? AppColors.kCardColorDark : AppColors.kCardColorLight,
      canvasColor: isDarkTheme
          ? AppColors.kCanvasColorDark
          : AppColors.kCanvasColorLight,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        color: isDarkTheme
            ? AppColors.kPrimaryColorDark
            : AppColors.kPrimaryColorLight,
        elevation: 0.0,
      ),
      accentColor:
          isDarkTheme ? AppColors.kAccentColorDark : AppColors.kAccentColorDark,
      bottomAppBarColor:
          isDarkTheme ? AppColors.kAccentColorDark : AppColors.kAccentColorDark,
      bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
            modalBackgroundColor:
                isDarkTheme ? AppColors.kAccentColorDark : AppColors.kPureWhite,
            modalElevation: 1,
          ),
      colorScheme: ColorScheme(
        background: isDarkTheme
            ? AppColors.kPrimaryColorDark
            : AppColors.kPrimaryColorLight,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        error: isDarkTheme ? AppColors.kDarkRed : AppColors.kDarkRed,
        onError: isDarkTheme ? AppColors.kPureWhite : AppColors.kPureBlack,
        surface: isDarkTheme ? AppColors.kDark_4 : AppColors.kPrimaryColorLight,
        primary: isDarkTheme
            ? AppColors.kPrimaryColorDark
            : AppColors.kPrimaryColorLight,
        onPrimary: isDarkTheme ? Colors.white : Colors.black,
        primaryVariant: isDarkTheme ? AppColors.kDark_1 : AppColors.kAliceBlue,
        secondary:
            isDarkTheme ? AppColors.kDark_3 : AppColors.kPrimaryColorLight,
        secondaryVariant: isDarkTheme ? AppColors.kDark_2 : AppColors.kLavender,
        onSecondary: isDarkTheme ? Colors.white : Colors.black,
        onBackground: isDarkTheme ? Colors.white : Colors.black,
        onSurface: isDarkTheme ? Colors.white : Colors.black,
      ),
    );
  }

  static final BottomSheetThemeData bottomSheetThemeData =
      BottomSheetThemeData(backgroundColor: AppColors.kPureWhite);
  static final AppBarTheme appBarTheme =
      AppBarTheme(color: AppColors.kPureWhite, brightness: Brightness.light);

  static final TextStyle postDateAndCategoryStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
        color: AppColors.kDarkGrey,
        fontSize: 10.0,
        fontWeight: FontWeight.w400),
  );

  static SystemUiOverlayStyle uiOverlayStyle(
      bool isDarkTheme, BuildContext context) {
    return isDarkTheme
        ? SystemUiOverlayStyle.light
            .copyWith(statusBarColor: AppColors.kPrimaryColorDark)
        : SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: AppColors.kPureWhite);
  }

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

  static final TextStyle normalTextStyle = GoogleFonts.lato(
      fontSize: 14.0,
      textStyle: TextStyle(
          fontWeight: FontWeight.normal, color: AppColors.kDarkTextColor));

  static final TextStyle normalTextLightStyle = GoogleFonts.lato(
      fontSize: 12.0,
      textStyle: TextStyle(
          fontWeight: FontWeight.w300, color: AppColors.kDarkTextColor));

  static final TextStyle searchHintStyle = GoogleFonts.muli(
    fontSize: 12.0,
    textStyle:
        TextStyle(fontWeight: FontWeight.w400, color: AppColors.kDarkGrey),
  );
  static final TextStyle normalSecondaryTextStyle = GoogleFonts.muli(
    fontSize: 12.0,
    textStyle:
        TextStyle(fontWeight: FontWeight.w400, color: AppColors.kDarkTextColor),
  );

  static final TextStyle appBarDefaultText = GoogleFonts.openSans(
      fontSize: 16,
      textStyle: TextStyle(
          fontWeight: FontWeight.bold));

  static final darkTheme = ThemeData(
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.kNavbarColorDark,
          elevation: 1,
          selectedItemColor: AppColors.kPrimaryYellow,
          unselectedItemColor: AppColors.kPureWhite,
        ),
    appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline6: appBarDefaultText.copyWith(color: AppColors.kPrimaryYellow)
        )
      ),
      textTheme: _normalTextTheme,
      
    colorScheme: ColorScheme(
      background: AppColors.kNavbarColorDark,
      brightness: Brightness.dark,
      error: AppColors.kDarkRed,
      onError: AppColors.kPureWhite,
      surface: AppColors.kDark_2,
      primary: AppColors.kPrimaryColorDark,
      onPrimary: Colors.white,
      primaryVariant: AppColors.kDark_1,
      secondary: AppColors.kDark_3,
      secondaryVariant: AppColors.kDark_2,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.kNavbarColorLight,
          elevation: 1,
          selectedItemColor: AppColors.kPrimaryYellow,
          unselectedItemColor: AppColors.kPureWhite,
        ),
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline6: appBarDefaultText.copyWith(color: AppColors.kPureBlack)
        )
      ),
      textTheme: _normalTextTheme,
    colorScheme: ColorScheme(
      background: AppColors.kPrimaryColorLight,
      brightness: Brightness.light,
      error: AppColors.kDarkRed,
      onError: AppColors.kPureWhite,
      surface: AppColors.kAliceBlue,
      primary: AppColors.kPrimaryColorLight,
      onPrimary: Colors.black,
      primaryVariant: AppColors.kAliceBlue,
      secondary: AppColors.kPrimaryColorLight,
      secondaryVariant: AppColors.kLavender,
      onSecondary: Colors.black,
      onBackground: Colors.black,
      onSurface: Colors.black,
    ),
  );
}

final TextTheme _normalTextTheme = TextTheme(
        headline6: GoogleFonts.lato(
          fontSize: 12,
        ),
        caption: GoogleFonts.lato(
          fontSize:12,
        ),
        bodyText1: GoogleFonts.lato(
          fontSize: 14,
        ),
        bodyText2: GoogleFonts.muli(
          fontSize: 14,
        ),
        
        );