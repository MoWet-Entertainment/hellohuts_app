import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static BuildContext context;

  static ThemeData themeData1(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: AppColors.kbPureWhite,
      indicatorColor: AppColors.kbPrimaryYellow,
      buttonColor: isDarkTheme
          ? AppColors.kbButtonColorDark
          : AppColors.kbButtonColorLight,
      hintColor:
          isDarkTheme ? AppColors.kbHintColorDark : AppColors.kbHintColorLight,
      textSelectionColor:
          isDarkTheme ? AppColors.kbPureWhite : AppColors.kbPureBlack,
      cardColor:
          isDarkTheme ? AppColors.kbCardColorDark : AppColors.kbCardColorLight,
      canvasColor: isDarkTheme
          ? AppColors.kbCanvasColorDark
          : AppColors.kbCanvasColorLight,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        color: isDarkTheme
            ? AppColors.kbPrimaryColorDark
            : AppColors.kbPrimaryColorLight,
        elevation: 0.0,
      ),
      accentColor: isDarkTheme
          ? AppColors.kbAccentColorDark
          : AppColors.kbAccentColorDark,
      bottomAppBarColor: isDarkTheme
          ? AppColors.kbAccentColorDark
          : AppColors.kbAccentColorDark,
      bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
            modalBackgroundColor: isDarkTheme
                ? AppColors.kbAccentColorDark
                : AppColors.kbPureWhite,
            modalElevation: 1,
          ),
      colorScheme: ColorScheme(
        background: isDarkTheme
            ? AppColors.kbPrimaryColorDark
            : AppColors.kbPrimaryColorLight,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        error: isDarkTheme ? AppColors.kbDarkRed : AppColors.kbDarkRed,
        onError: isDarkTheme ? AppColors.kbPureWhite : AppColors.kbPureBlack,
        surface:
            isDarkTheme ? AppColors.kbDark_4 : AppColors.kbPrimaryColorLight,
        primary: isDarkTheme
            ? AppColors.kbPrimaryColorDark
            : AppColors.kbPrimaryColorLight,
        onPrimary: isDarkTheme ? Colors.white : Colors.black,
        primaryVariant:
            isDarkTheme ? AppColors.kbDark_1 : AppColors.kbAliceBlue,
        secondary:
            isDarkTheme ? AppColors.kbDark_3 : AppColors.kbPrimaryColorLight,
        secondaryVariant:
            isDarkTheme ? AppColors.kbDark_2 : AppColors.kbLavender,
        onSecondary: isDarkTheme ? Colors.white : Colors.black,
        onBackground: isDarkTheme ? Colors.white : Colors.black,
        onSurface: isDarkTheme ? Colors.white : Colors.black,
      ),
    );
  }

  static final BottomSheetThemeData bottomSheetThemeData =
      BottomSheetThemeData(backgroundColor: AppColors.kbPureWhite);
  static final AppBarTheme appBarTheme =
      AppBarTheme(color: AppColors.kbPureWhite, brightness: Brightness.light);

  static final TextStyle postDateAndCategoryStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
        color: AppColors.kbDarkGrey,
        fontSize: 10.0,
        fontWeight: FontWeight.w400),
  );

  static SystemUiOverlayStyle uiOverlayStyle(
      bool isDarkTheme, BuildContext context) {
    return isDarkTheme
        ? SystemUiOverlayStyle.light
            .copyWith(statusBarColor: AppColors.kbPrimaryColorDark)
        : SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: AppColors.kbPureWhite);
  }

  static final TextStyle popUpStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: AppColors.kbDarkGrey,
        fontSize: 14.0,
        fontWeight: FontWeight.w400),
  );
  static final TextStyle postHeadLineUserStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: AppColors.kbDarkTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w500),
  );

  static final TextStyle postHeadLineStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: AppColors.kbDarkTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w400),
  );

  static final TextStyle postedAuthorTextMainHeadStyle = GoogleFonts.lato(
    fontSize: 12.0,
    textStyle: TextStyle(
        fontWeight: FontWeight.w400, color: AppColors.kbDarkTextColor),
  );

  static final TextStyle postedAuthorTextSubHeadStyle = GoogleFonts.lato(
    fontSize: 10.0,
    textStyle:
        TextStyle(fontWeight: FontWeight.w400, color: AppColors.kbDarkGrey),
  );

  static final TextStyle normalTextStyle = GoogleFonts.lato(
      fontSize: 14.0,
      textStyle: TextStyle(
          fontWeight: FontWeight.normal, color: AppColors.kbDarkTextColor));

  static final TextStyle normalTextLightStyle = GoogleFonts.lato(
      fontSize: 12.0,
      textStyle: TextStyle(
          fontWeight: FontWeight.w300, color: AppColors.kbDarkTextColor));

  static final TextStyle searchHintStyle = GoogleFonts.muli(
    fontSize: 12.0,
    textStyle:
        TextStyle(fontWeight: FontWeight.w400, color: AppColors.kbDarkGrey),
  );
  static final TextStyle normalSecondaryTextStyle = GoogleFonts.muli(
    fontSize: 12.0,
    textStyle: TextStyle(
        fontWeight: FontWeight.w400, color: AppColors.kbDarkTextColor),
  );

  static final darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.kbNavbarColorDark,
      elevation: 1,
      selectedItemColor: AppColors.kbPrimaryYellow,
      unselectedItemColor: AppColors.kbPureWhite,
    ),
    appBarTheme: AppBarTheme(
        textTheme: TextTheme(
            headline6:
                _appBarDefaultText.copyWith(color: AppColors.kbPrimaryYellow))),
    textTheme: _normalTextTheme,
    colorScheme: ColorScheme(
      background: AppColors.kbNavbarColorDark,
      brightness: Brightness.dark,
      error: AppColors.kbDarkRed,
      onError: AppColors.kbPureWhite,
      surface: AppColors.kbDark_2,
      primary: AppColors.kbPrimaryColorDark,
      onPrimary: Colors.white,
      primaryVariant: AppColors.kbDark_1,
      secondary: AppColors.kbDark_3,
      secondaryVariant: AppColors.kbDark_2,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.kbNavbarColorLight,
      elevation: 1,
      selectedItemColor: AppColors.kbPrimaryYellow,
      unselectedItemColor: AppColors.kbPureWhite,
    ),
    appBarTheme: AppBarTheme(
        textTheme: TextTheme(
            headline6:
                _appBarDefaultText.copyWith(color: AppColors.kbPureBlack))),
    textTheme: _normalTextTheme,
    colorScheme: ColorScheme(
      background: AppColors.kbPrimaryColorLight,
      brightness: Brightness.light,
      error: AppColors.kbDarkRed,
      onError: AppColors.kbPureWhite,
      surface: AppColors.kbAliceBlue,
      primary: AppColors.kbPrimaryColorLight,
      onPrimary: Colors.black,
      primaryVariant: AppColors.kbAliceBlue,
      secondary: AppColors.kbPrimaryColorLight,
      secondaryVariant: AppColors.kbLavender,
      onSecondary: Colors.black,
      onBackground: Colors.black,
      onSurface: Colors.black,
    ),
  );

  /// Creates a [MaterialColor] based on the supplied [Color]
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final r = color.red, g = color.green, b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static ThemeData lightThemedata =
      themeData(lightColorScheme, _appBarThemeLight, AppColors.kLightFocusColor);

  static ThemeData darkThemeData =
      themeData(darkColorScheme, _appBarThemeDark, AppColors.kDarkFocusColor);

  static ThemeData themeData(
      ColorScheme colorScheme, AppBarTheme appbarTheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      primaryColor: colorScheme.primary,
      appBarTheme: appbarTheme.copyWith(color: colorScheme.background, brightness: colorScheme.brightness),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,

    );
  }

  static final TextStyle _appBarDefaultText = GoogleFonts.openSans(
      fontSize: 16, textStyle: TextStyle(fontWeight: FontWeight.bold));

  static AppBarTheme _appBarThemeLight = AppBarTheme(
    elevation: 0,
      textTheme: TextTheme(
          headline6:
              _appBarDefaultText.copyWith(color: AppColors.kbPureBlack)));
  static AppBarTheme _appBarThemeDark = AppBarTheme(
      textTheme: TextTheme(
          headline6:
              _appBarDefaultText.copyWith(color: AppColors.kbPrimaryYellow)));


  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.lato(fontWeight: _bold, fontSize: 32),
    headline2: GoogleFonts.lato(fontWeight: _bold, fontSize: 24),
    headline3: GoogleFonts.lato(
      fontWeight: _bold,
      fontSize: 20,
    ),
    headline4: GoogleFonts.muli(fontWeight: _bold, fontSize: 16),
    headline5: GoogleFonts.muli(fontWeight: _bold, fontSize: 16),
    headline6: GoogleFonts.lato(
      fontWeight: _bold,
      fontSize: 14,
    ),
    subtitle1: GoogleFonts.lato(fontWeight: _medium, fontSize: 14),
    subtitle2: GoogleFonts.muli(fontWeight: _medium, fontSize: 14),
    bodyText1: GoogleFonts.lato(fontWeight: _regular, fontSize: 14),
    bodyText2: GoogleFonts.muli(fontWeight: _regular, fontSize: 14),
    overline: GoogleFonts.lato(fontWeight: _regular, fontSize: 12),
    caption: GoogleFonts.muli(fontWeight: _regular, fontSize: 12),
    button: GoogleFonts.lato(fontWeight: _bold, fontSize: 14),
  );

  static const ColorScheme lightColorScheme = ColorScheme(
      primary: AppColors.kPrimaryLight,
      primaryVariant: AppColors.kPrimaryVariantLight,
      secondary: AppColors.kSecondaryLight,
      secondaryVariant: AppColors.kSecondaryVariantLight,
      background: AppColors.kPureWhite,
      onBackground: AppColors.kPureBlack,
      error: AppColors.kRed,
      onError: AppColors.kPureWhite,
      onPrimary: AppColors.kPureWhite,
      onSecondary: AppColors.kPureBlack,
      surface: AppColors.kbSmokedWhite,
      onSurface: AppColors.kPureBlack,
      brightness: Brightness.light);

  static const ColorScheme darkColorScheme = ColorScheme(
      primary: AppColors.kPrimaryDark,
      primaryVariant: AppColors.kPrimaryVariantDark,
      secondary: AppColors.kSecondaryDark,
      secondaryVariant: AppColors.kSecondaryVariantDark,
      background: AppColors.kDark_1,
      onBackground: AppColors.kPureWhite,
      error: AppColors.kRed,
      onError: AppColors.kPureWhite,
      onPrimary: AppColors.kPureWhite,
      onSecondary: AppColors.kPureWhite,
      surface: AppColors.kDark_10,
      onSurface: AppColors.kPureWhite,
      brightness: Brightness.dark);
}

final TextTheme _normalTextTheme = TextTheme(
  headline6: GoogleFonts.lato(
    fontSize: 12,
  ),
  caption: GoogleFonts.lato(
    fontSize: 12,
  ),
  bodyText1: GoogleFonts.lato(
    fontSize: 14,
  ),
  bodyText2: GoogleFonts.muli(
    fontSize: 14,
  ),
);
