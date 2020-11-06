import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
                  : isFontAwesomeSolid
                      ? 'AwesomeSolid'
                      : 'Fontello',
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
    String postedUser = '',
    TextStyle postedUserTextStyle,
    String userTitle = '',
    TextStyle userTitleTextStyle,
    double extraGap = 2,
    double radiusOfAvatar = 8,
    VoidCallback onTap}) {
  return Container(
    child: InkWell(
      splashColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 2 * (radiusOfAvatar + extraGap),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.kYellowLight,
                  width: 2.0,
                )),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1.0,
                  )),
              child: CircleAvatar(
                radius: radiusOfAvatar,
                backgroundColor: AppColors.kbDarkGrey,
                backgroundImage: NetworkImage(imagePath),
              ),
            ),
          ),
          spacer(width: 8.0),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  constraints:
                      BoxConstraints(maxHeight: fullWidth(context) / 1.6),
                  child: Text(postedUser,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: postedUserTextStyle ??
                          Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 12)),
                ),
                Container(
                  constraints:
                      BoxConstraints(maxHeight: fullWidth(context) / 1.6),
                  child: Text(userTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: userTitleTextStyle ??
                          Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 10)),
                ),
              ]),
        ],
      ),
      onTap: () {
        if (onTap != null) onTap();
        print(
            'User wants to navigate to user profile. A page which is yet to implement. Cause Vinoop is too busy watching netflix :D');
      },
      //TODO: Add Navigation to the user profile
    ),
  );
}

Widget spacer({double height, double width}) {
  return SizedBox(
    height: height ?? 0,
    width: width ?? 0,
  );
}

Widget customIconSquare({
  IconData iconData,
  bool isCustomIcon = true,
  String iconAsset,
  double backgroundSize = 30,
  Color backgroundColor = AppColors.kbSmokedWhite,
  double iconSize = 24,
  Color iconColor = AppColors.kbDarkTextColor,
  double borderRadius = 12,
  GestureTapCallback actionCall,
}) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
        ),
        height: backgroundSize,
        width: backgroundSize,
      ),
      IconButton(
          splashColor: Colors.white,
          icon: isCustomIcon
              ? Image.asset(
                  iconAsset,
                  color: iconColor,
                  width: iconSize,
                  height: iconSize,
                )
              : Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
          onPressed: actionCall),
    ],
  );
}

class CustomListTile extends StatelessWidget {
  ///Creates a custom tile as per hellohuts design standards.

  const CustomListTile({
    Key key,
    this.titleText,
    this.subTitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.contentPadding,
    this.borderRadius,
    this.hoverColor,
    this.selectedColor,
    this.disabledColor,
    this.height,
    this.width,
    this.tilePadding,
    this. internalPadding
  }) : super(key: key);

  ///title text widget. Either pass as Text("your text") or a specific widget
  final Widget titleText;

  final Widget subTitle;

  ///leadinng widget: usually this is a icon specific to the list tile
  final Widget leading;

  ///trailing widget: usually, this is a  text or icon or a action widget
  final Widget trailing;

  ///height of the list tile. By default this will be 56
  final double height;

  ///width of the list tile. By default this will be , full device width
  final double width;

  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;

  ///color of the background of the tile. By default this uses [AppColors.smokedWhite] or [Color(0xffF6F7F9)]
  final Color backgroundColor;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;
  final bool isSelected = false;
  final bool isEnabled = false;
  final bool isDisabled = false;
  final Color hoverColor;
  final Color selectedColor;
  final Color disabledColor;
  final double tilePadding;
  final double internalPadding;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        child: Container(
        color: backgroundColor ?? theme.colorScheme.surface,
          padding: EdgeInsets.symmetric(horizontal:tilePadding ?? 0.0),
          child: Container(
             padding: EdgeInsets.all(internalPadding ?? 8.0),
            height: height ?? 64,
            width: width ?? fullWidth(context),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(16.0),
             
            ),
            child: Row(
              children: [
                leading ?? SizedBox(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      titleText ?? SizedBox(),
                      subTitle ?? SizedBox(),
                    ],
                  ),
                ),
                Spacer(),
                trailing ?? SizedBox(),
              ],
            ),
          ),
        ),
        onTap: onTap,
        onLongPress: onLongPress);
  }
}

class FilledCircle extends StatelessWidget {
  //FilledCircle is a simple widgte which creates a circle with color

  const FilledCircle.animated(
      {Key key,
      this.size,
      this.color,
      this.child,
      this.curve = Curves.easeInOutSine,
      this.duration = const Duration(milliseconds: 400)})
      : isAnimated = true,
        super(key: key);
  const FilledCircle({
    Key key,
    this.color = AppColors.kbAlmostBlack,
    this.size = 2.0,
    this.child,
  })  : isAnimated = false,
        curve = null,
        duration = null,
        super(key: key);
  final double size;
  final Color color;
  final Widget child;
  final bool isAnimated;
  final dynamic curve;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    if (isAnimated) {
      return AnimatedContainer(
        duration: duration,
        curve: curve,
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: child ?? Container(),
      );
    } else {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: child ?? Container(),
      );
    }
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> itemList;
  final List<String> alreadySelected;
  final Function(List<String>) onSelectionChanged;
  final Color backgroundColor;
  final Color selectedColor;

  MultiSelectChip({
    this.itemList,
    this.alreadySelected,
    this.onSelectionChanged,
    this.backgroundColor = AppColors.kbAliceBlue,
    this.selectedColor = AppColors.kbLavender,
  });

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();
    selectedChoices = widget.alreadySelected;
    widget.itemList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(4.0),
        child: ChoiceChip(
          label: Text(
            item,
            style: selectedChoices.contains(item)
                ? AppThemes.normalSecondaryTextStyle
                    .copyWith(fontSize: 12, color: AppColors.kbDarkTextColor)
                : AppThemes.normalSecondaryTextStyle
                    .copyWith(fontSize: 12, color: AppColors.kbDarkTextColor),
          ),
          backgroundColor: widget.backgroundColor,
          selectedColor: widget.selectedColor,
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color backGroundColor;
  const RoundedContainer(
      {Key key, this.child, this.borderRadius, this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
        color: backGroundColor ?? AppColors.kbPureWhite,
      ),
      child: child ?? Container(),
    );
  }
}

class ScrollableColumn extends StatelessWidget {
  ///Overflow Glow Behaviour. This is false by default
  final bool overFlowGlow;
  Axis scrollDirection;
  bool reverse;
  ScrollController controller;
  bool primary;
  ScrollPhysics physics;
  bool shrinkWrap;
  EdgeInsetsGeometry padding;
  bool addAutomaticKeepAlives;
  bool addRepaintBoundaries;
  bool addSemanticIndexes;
  double cacheExtent;
  List<Widget> children;
  int semanticChildCount;
  DragStartBehavior dragStartBehavior;
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  String restorationId;
  Clip clipBehavior = Clip.hardEdge;
  ScrollableColumn({
    Key key,
    this.overFlowGlow = false,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.children = const <Widget>[],
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          if (!overFlowGlow) {
            overscroll.disallowGlow();
          }
        },
        child: ListView(
            shrinkWrap: shrinkWrap,
            scrollDirection: scrollDirection,
            controller: controller,
            children: children,
            reverse: reverse,
            primary: primary,
            physics: physics,
            padding: padding,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            cacheExtent: cacheExtent,
            semanticChildCount: semanticChildCount,
            dragStartBehavior: dragStartBehavior,
            keyboardDismissBehavior: keyboardDismissBehavior,
            restorationId: restorationId,
            clipBehavior: clipBehavior));
  }
}
