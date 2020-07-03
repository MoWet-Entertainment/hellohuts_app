import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

double getDimention(context, double unit) {
  if (fullWidth(context) <= 360.0) {
    return unit / 1.3;
  } else {
    return unit;
  }
}

double fullWidth(BuildContext context) {
  // cprint(MediaQuery.of(context).size.width.toString());
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Widget customTitleText(String title,
    {BuildContext context, FontWeight fontWeight, double fontSize}) {
  return Text(
    title ?? '',
    style: TextStyle(
        // color: AppColors.darkPrimary,
        color: Colors.deepOrange,
        fontFamily: 'SFProDisplay',
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 24),
  );
}

Widget customIcon(BuildContext context,
    {int icon,
    bool isEnable = false,
    double size = 18,
    bool isMaterialIcon = false,
    bool isFeatherIcon = false,
    bool isCustomIcon = true,
    bool isFontAwesomeRegular = false,
    bool isFontAwesomeSolid = false,
    Color iconColor,
    double paddingIcon = 10}) {
  iconColor = iconColor ?? Theme.of(context).textTheme.caption.color;
  return Padding(
      padding: EdgeInsets.only(bottom: isFeatherIcon ? paddingIcon : 0),
      child: Icon(
        IconData(
          icon,
          fontFamily: isCustomIcon
              ? 'TwitterIcon'
              : isFontAwesomeRegular
                  ? 'AwesomeRegular'
                  : isFontAwesomeSolid ? 'AwesomeSolid' : 'Fontello',
        ),
        size: size,
        color: isEnable ? Theme.of(context).primaryColor : iconColor,
      ));
}

void customSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String msg,
    {double height = 30, Color backgroundColor = Colors.black}) {
  if (_scaffoldKey == null || _scaffoldKey.currentState == null) {
    return;
  }
  _scaffoldKey.currentState.hideCurrentSnackBar();
  final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        msg,
        style: TextStyle(
          color: Colors.white,
        ),
      ));
  _scaffoldKey.currentState.showSnackBar(snackBar);
}

Widget customText(String msg,
    {Key key,
    TextStyle style,
    TextAlign textAlign = TextAlign.justify,
    TextOverflow overflow = TextOverflow.visible,
    BuildContext context,
    bool softwrap = true}) {
  if (msg == null) {
    return SizedBox(
      height: 0,
      width: 0,
    );
  } else {
    if (context != null && style != null) {
      var fontSize =
          style.fontSize ?? Theme.of(context).textTheme.bodyText2.fontSize;
      style = style.copyWith(
          fontSize: fontSize - (fullWidth(context) <= 375 ? 2 : 0));
    }
    return Text(
      msg,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softwrap,
      key: key,
    );
  }
}

Widget customInkWell(
    {Widget child,
    BuildContext context,
    Function(bool, int) function1,
    Function onPressed,
    bool isEnable = false,
    int no = 0,
    Color color = Colors.transparent,
    Color splashColor,
    BorderRadius radius}) {
  if (splashColor == null) {
    splashColor = Theme.of(context).primaryColorLight;
  }
  if (radius == null) {
    radius = BorderRadius.circular(0);
  }
  return Material(
    color: color,
    child: InkWell(
      borderRadius: radius,
      onTap: () {
        if (function1 != null) {
          function1(isEnable, no);
        } else if (onPressed != null) {
          onPressed();
        }
      },
      splashColor: splashColor,
      child: child,
    ),
  );
}

/** 
Widget customImage(
  BuildContext context,
  String path, {
  double height = 50,
  bool isBorder = false,
}) {
  return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            Border.all(color: Colors.grey.shade100, width: isBorder ? 2 : 0),
      ),
      child: CircleAvatar(
        maxRadius: height / 2,
        backgroundColor: Theme.of(context).cardColor,
        backgroundImage: customAdvanceNetworkImage(path ?? dummyProfilePic),
      ));
}


dynamic customAdvanceNetworkImage(String path) {
  return AdvancedNetworkImage(
    path ?? dummyProfilePic,
    useDiskCache: true,
    printError: true,
    loadFailedCallback: () => cprint('Image Load failed' + path),
    cacheRule: CacheRule(
      maxAge: const Duration(days: 7),
    ),
  );


}

**/

Widget postedUserSection(BuildContext context,
    {String imagePath = "http://www.gravatar.com/avatar/?d=identicon",
    String postedUser,
    String userTitle,
    double radiusOfAvatar = 8}) {
  return Container(
    child: Row(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: radiusOfAvatar,
            backgroundColor: AppColors.kDarkGrey,
            backgroundImage: NetworkImage(imagePath),
          ),
        ),
        spacer(width: 4.0),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                constraints:
                    BoxConstraints(maxHeight: fullWidth(context) / 1.6),
                child: Text(
                  postedUser,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppThemes.postedAuthorTextMainHeadStyle,
                ),
              ),
              Container(
                constraints:
                    BoxConstraints(maxHeight: fullWidth(context) / 1.6),
                child: Text(userTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppThemes.postedAuthorTextSubHeadStyle),
              ),
            ]),
      ],
    ),
  );
}

Widget spacer({double height, double width}) {
  return SizedBox(
    height: height ?? 0,
    width: width ?? 0,
  );
}
