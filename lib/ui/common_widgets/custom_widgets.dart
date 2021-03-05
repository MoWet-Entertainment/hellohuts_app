import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/dashboard/dashboard_item/dashboard_item.dart';

import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

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
  Color backgroundColor,
  double iconSize = 24,
  Color iconColor,
  double borderRadius = 12,
  GestureTapCallback actionCall,
  bool notificationFlag = false,
  Color notificationColor,
  double notificationIconSize = 3,
  double extraGapNotification = 2,
}) {
  return Builder(builder: (BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor ??
                (isDarkTheme
                    ? AppColors.kDark_2
                    : theme.colorScheme.secondaryVariant),
          ),
          height: backgroundSize,
          width: backgroundSize,
        ),
        IconButton(
            splashColor: theme.splashColor,
            icon: isCustomIcon
                ? Stack(children: [
                    Image.asset(
                      iconAsset,
                      color: iconColor ??
                          (isDarkTheme
                              ? AppColors.kbMediumGrey
                              : theme.colorScheme.onBackground),
                      width: iconSize,
                      height: iconSize,
                    ),
                    notificationFlag
                        ? Positioned(
                            top: 1,
                            right: 2,
                            child: Container(
                              width: 2 *
                                  (notificationIconSize + extraGapNotification),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: theme.colorScheme.surface,
                                    width: 2.0,
                                  )),
                              child: CircleAvatar(
                                radius: notificationIconSize,
                                backgroundColor: AppColors.kYellowLight,
                              ),
                            ),
                          )
                        : SizedBox.shrink()
                  ])
                : Icon(
                    iconData,
                    color: iconColor ??
                        (isDarkTheme
                            ? AppColors.kbMediumGrey
                            : theme.colorScheme.onBackground),
                    size: iconSize,
                  ),
            onPressed: actionCall),
      ],
    );
  });
}

class CustomListTile extends StatelessWidget {
  ///Creates a custom tile as per hellohuts design standards.

  const CustomListTile(
      {Key key,
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
      this.internalPadding})
      : super(key: key);

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
  final EdgeInsetsGeometry tilePadding;
  final double internalPadding;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(16.0),
            color: backgroundColor ?? theme.colorScheme.surface,
          ),
          padding: tilePadding ?? EdgeInsets.symmetric(horizontal: 0.0),
          child: Container(
            padding: EdgeInsets.all(internalPadding ?? 8.0),
            height: height ?? 64,
            width: width ?? fullWidth(context),
            child: Row(
                children: [
                  leading ?? SizedBox.shrink(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        titleText ?? SizedBox.shrink(),
                        subTitle ?? SizedBox.shrink(),
                      ],
                    ),
                  ),
                  Spacer(),
                  trailing ?? SizedBox.shrink(),
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
    this.color,
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
    final theme = Theme.of(context);
    if (isAnimated) {
      return AnimatedContainer(
        duration: duration,
        curve: curve,
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? theme.colorScheme.onBackground,
        ),
        child: child ?? Container(),
      );
    } else {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? theme.colorScheme.onBackground,
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
    this.backgroundColor,
    this.selectedColor,
  });

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList(BuildContext context) {
    final theme = Theme.of(context);
    List<Widget> choices = List();
    selectedChoices = widget.alreadySelected;
    widget.itemList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(4.0),
        child: ChoiceChip(
          label: Text(
            item,
            style: selectedChoices.contains(item)
                ? theme.textTheme.bodyText2.copyWith(fontSize: 12)
                : theme.textTheme.bodyText2.copyWith(fontSize: 12),
          ),
          backgroundColor:
              widget.backgroundColor ?? theme.colorScheme.secondaryVariant,
          selectedColor: widget.selectedColor ?? theme.colorScheme.secondary,
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
      children: _buildChoiceList(context),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  const RoundedContainer(
      {Key key, this.child, this.borderRadius, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
        color: backgroundColor ?? AppColors.kbPureWhite,
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

class AnnotatedSafeArea extends StatelessWidget {
  final Widget child;
  final Color statusBarColor;
  const AnnotatedSafeArea({Key key, @required this.child, this.statusBarColor})
      : assert(child != null, "Child is not provided for the Annotated Area."),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBarColor != null
          ? ThemeOptions.of(context)
              .getSystemUIOverlayStyle(context)
              .copyWith(statusBarColor: statusBarColor)
          : ThemeOptions.of(context).getSystemUIOverlayStyle(context),
      child: SafeArea(child: child),
    );
  }
}

class AnnotatedScaffold extends StatelessWidget {
  final Widget body;
  final Color statusBarColor;
  const AnnotatedScaffold({Key key, @required this.body, this.statusBarColor})
      : assert(body != null, "Bodt is not provided for the Annotated Area."),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBarColor != null
          ? ThemeOptions.of(context)
              .getSystemUIOverlayStyle(context)
              .copyWith(statusBarColor: statusBarColor)
          : ThemeOptions.of(context).getSystemUIOverlayStyle(context),
      child: Scaffold(body: body),
    );
  }
}

class SliverSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const SliverSizedBox({
    Key key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);

  const SliverSizedBox.shrink({Key key})
      : width = 0.0,
        height = 0.0,
        child = null,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: height ?? 0,
      width: width ?? 0,
      child: child ?? SizedBox.shrink(),
    ));
  }
}

class QuickPickItem extends StatelessWidget {
  final String iconAsset;
  final Color iconColor;
  final double iconSize;
  final String text;
  final Color textColor;
  final Function call;
  final double backgroundSize;
  final Color backgroundColor;
  final double borderRadius;

  QuickPickItem({
    Key key,
    this.iconAsset,
    this.text,
    this.textColor,
    this.call,
    this.backgroundSize,
    this.iconColor,
    this.iconSize,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 801), allowFontScaling: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        child: Column(
          children: <Widget>[
            customIconSquare(
              iconAsset: iconAsset,
              isCustomIcon: true,
              iconSize: iconSize ?? 24.0,
              iconColor:
                  iconColor ?? Theme.of(context).colorScheme.onBackground,
              backgroundSize: backgroundSize ?? 56,
              borderRadius: borderRadius ?? 16.0,
              backgroundColor:
                  backgroundColor ?? Theme.of(context).colorScheme.surface,
              actionCall: call,
            ),
            spacer(height: 8.0),
            Align(
              alignment: Alignment.center,
              child: text != null
                  ? Text(text,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: textColor ??
                              Theme.of(context).colorScheme.onBackground))
                  : Container(),
            )
          ],
        ),
        onTap: call,
      ),
    );
  }
}

Widget heroDetailedContainerText(
    {@required String heading,
    @required String text,
    double textSize = 24.0,
    String subTopText = '',
    bool centerHeading = false}) {
  return Builder(builder: (context) {
    final theme = Theme.of(context);
    print(theme.colorScheme.onBackground);
    return enhancedBoldText(
        heading,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              maxLines: 2,
              style: theme.textTheme.headline2.copyWith(
                  color: theme.colorScheme.onBackground, fontSize: textSize),
            ),
            subTopText != ''
                ? SizedBox(
                    width: 2,
                  )
                : SizedBox.shrink(),
            subTopText != ''
                ? Text(
                    subTopText,
                    style: theme.textTheme.headline6
                        .copyWith(color: theme.colorScheme.onBackground),
                  )
                : SizedBox.shrink(),
          ],
        ));
  });
}

Widget enhancedBoldText(String heading, Widget textInBold,{bool centerHeading = false}) {
  return Builder(
    builder: (context) {
      final theme = Theme.of(context);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           centerHeading?Center(child: Text(heading,
                style: theme.textTheme.bodyText1
                    .copyWith(color: AppColors.kbDarkGrey, fontSize: 12)),):Text(heading,
                style: theme.textTheme.bodyText1
                    .copyWith(color: AppColors.kbDarkGrey, fontSize: 12)),
            textInBold,
          ],
        ),
      );
    },
  );
}

launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class ExpandedSection extends StatefulWidget {

  final Widget child;
  final bool expand;
  ExpandedSection({this.expand = false, this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection> with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation; 

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.easeInOutSine,
    );
  }

  void _runExpandCheck() {
    if(widget.expand) {
      expandController.forward();
    }
    else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: animation,
      child: widget.child
    );
  }
}

Widget itemTile(
      {@required DashboardItem item,
      @required BuildContext context,
      bool isDarkTheme = false}) {
    final theme = Theme.of(context);
    final now = new DateTime.now();
    final difference = now.difference(item.updatedTimeStamp);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomListTile(
        tilePadding:
            const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 12),
        backgroundColor: theme.colorScheme.secondaryVariant,
        borderRadius: BorderRadius.circular(20.0),
        leading: customIconSquare(
          backgroundColor:
              isDarkTheme ? AppColors.kDark_7 : theme.colorScheme.background,
          iconAsset: getLeadingIcon(item),
          iconColor: isDarkTheme
              ? AppColors.kbMediumGrey
              : theme.colorScheme.onBackground,
          backgroundSize: 48,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          item.itemText1,
          style: theme.textTheme.bodyText2
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subTitle: Text(
          timeago.format(
            now.subtract(difference),
          ),
          style: theme.textTheme.bodyText2
              .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
        ),
        trailing: getTrailingWidget(item, context),
      ),
    );
  }

  Widget getTrailingWidget(DashboardItem item, BuildContext context) {
    final theme = Theme.of(context);
    switch (item.itemType) {
      case DashboardItemType.TransactionReceived:
        return item.itemText2 != null
            ? Text("₹" + item.itemText2,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: AppColors.kGreenLight,
                ))
            : SizedBox.shrink();
      case DashboardItemType.TransactionSpent:
        return item.itemText2 != null
            ? Text("₹" + item.itemText2,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: AppColors.kRed,
                ))
            : SizedBox.shrink();
      case DashboardItemType.ItemDelivered:
        return item.itemText2 != null
            ? Text("₹" + item.itemText2,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: AppColors.kRed,
                ))
            : SizedBox.shrink();
      case DashboardItemType.StarcoinsReceived:
        return item.itemText2 != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    HelloIcons.star_bold_icon,
                    height: 14,
                    color: AppColors.kYellowLight,
                  ),
                  SizedBox(width: 4.0),
                  Text(item.itemText2,
                      style: theme.textTheme.headline6.copyWith(
                        fontSize: 14,
                        color: AppColors.kYellowLight,
                      )),
                ],
              )
            : SizedBox.shrink();
      case DashboardItemType.StarcoinsSpent:
        return item.itemText2 != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    HelloIcons.star_bold_icon,
                    height: 14,
                    color: AppColors.kYellowLight,
                  ),
                  SizedBox(width: 4.0),
                  Text(item.itemText2,
                      style: theme.textTheme.headline6.copyWith(
                        fontSize: 14,
                        color: AppColors.kbDarkRed,
                      )),
                ],
              )
            : SizedBox.shrink();
      case DashboardItemType.ServiceDebit:
        return item.itemText2 != null
            ? Text("₹" + item.itemText2,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: AppColors.kRed,
                ))
            : SizedBox.shrink();

      case DashboardItemType.PaymentReminder:
        return GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppColors.kbDarkGreen.withOpacity(0.6),
              ),
              child: Text(
                'Pay',
                style: theme.textTheme.bodyText2
                    .copyWith(fontSize: 12, color: AppColors.kbDarkGreen),
              ),
            ),
            onTap: () => {
                  print("User wishes to pay"),
                  //TODO:Add Navigation to Payment Page
                });
      default:
        return SizedBox.shrink();
    }
  }

  String getLeadingIcon(DashboardItem item) {
    switch (item.itemType) {
      case DashboardItemType.TransactionReceived:
        return HelloIcons.wallet_light_icon;
      case DashboardItemType.TransactionSpent:
        return HelloIcons.wallet_light_icon;
      case DashboardItemType.ItemDelivered:
        return HelloIcons.bag_light_icon;

      case DashboardItemType.StarcoinsReceived:
        return HelloIcons.star_light_icon;
      case DashboardItemType.StarcoinsSpent:
        return HelloIcons.star_light_icon;
      case DashboardItemType.ServiceDebit:
        return HelloIcons.contractor_light_icon;
      default:
        return HelloIcons.wallet_light_icon;
    }
  }
 
