import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/states/app_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  final PageController pageController;
  BottomNavBar({Key key, this.pageController}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIcon = 0;
  double ICON_OFF = -3;
  double ICON_ON = 0;
  double TEXT_OFF = 5;
  double TEXT_ON = 1;
  double ALPHA_OFF = 0;
  double ALPHA_ON = 1;
  int ANIM_DURATION = 300;
  @override
  void initState() {
    super.initState();
  }

  Widget _iconRow() {
    var width = fullWidth(context);
    var height = fullHeight(context);
    //TODO: Remove this line
    print("width : $width");
    print("height: $height");
    print("height nav : ${height * 0.07}");
    var state = Provider.of<AppState>(context);
    return Container(
      padding: width > 500
          ? EdgeInsets.symmetric(horizontal: 0.25 * width)
          : EdgeInsets.symmetric(horizontal: 0.1 * width),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      height: (height * 0.07) > 64 ? 80 : 64,
      width: width > 500 ? 0.5 * width : width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _icon(null, 0,
              icon: 0 == state.pageIndex
                  ? HelloIcons.explore_bold_icon
                  : HelloIcons.explore_light_icon,
              isCustomIcon: true,
              iconSize: 24),
          _icon(null, 1,
              icon: 1 == state.pageIndex
                  ? HelloIcons.category_bold_icon
                  : HelloIcons.category_light_icon,
              isCustomIcon: true,
              iconSize: 24),
          _icon(null, 2,
              icon: 2 == state.pageIndex
                  ? HelloIcons.home_bold_icon
                  : HelloIcons.home_light_icon,
              isCustomIcon: true,
              iconSize: 24),
          _icon(null, 3,
              icon: 3 == state.pageIndex
                  ? HelloIcons.bookmark_bold_icon
                  : HelloIcons.bookmark_light_icon,
              isCustomIcon: true,
              iconSize: 24),
          _icon(null, 4,
              icon: 4 == state.pageIndex
                  ? HelloIcons.profile_bold_icon
                  : HelloIcons.profile_light_icon,
              isCustomIcon: true,
              iconSize: 24),
        ],
      ),
    );
  }

  Widget _icon(IconData iconData, int index,
      {bool isCustomIcon = false, String icon, double iconSize = 22}) {
    var state = Provider.of<AppState>(context);
    return Container(
      child: AnimatedAlign(
        duration: Duration(milliseconds: ANIM_DURATION),
        curve: Curves.easeIn,
        alignment: Alignment(0, ICON_ON),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: ANIM_DURATION),
          opacity: ALPHA_ON,
          child: IconButton(
            highlightColor: AppColors.kAccentColor,
            color: index == state.pageIndex
                ? AppColors.kAccentColor
                : AppColors.kPureWhite,
            padding: EdgeInsets.all(0),
            alignment: Alignment(0, 0),
            icon: isCustomIcon
                ? Image.asset(
                    icon,
                    color: index == state.pageIndex
                        ? AppColors.kAccentColor
                        : AppColors.kPureWhite,
                    height: iconSize,
                  )
                : Icon(iconData),
            iconSize: iconSize,
            onPressed: () {
              setState(() {
                _selectedIcon = index;
                state.setPageIndex = index;
                widget.pageController.jumpToPage(index);
              });
              //TODO: Remove this line

              print("Page Index is ${state.pageIndex}");
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 32,
          offset: Offset(0, -2),
        ),
      ]),
      child: _iconRow(),
    );
  }
}
