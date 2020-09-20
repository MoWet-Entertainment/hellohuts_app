import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/states/app_state.dart';
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
    var state = Provider.of<AppState>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48.0),
      decoration: BoxDecoration(
        color: AppColors.kNavBarColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      height: 64.h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _icon(HelloIcons.compass, 0, iconSize: 26),
          _icon(HelloIcons.apps, 1, iconSize: 22),
          _icon(HelloIcons.heart, 2, iconSize: 26),
          _icon(HelloIcons.hello_icon, 3, iconSize: 20)
        ],
      ),
    );
  }

  Widget _icon(IconData iconData, int index,
      {bool isCustomIcon = false, int icon, double iconSize = 22}) {
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
            icon: Icon(iconData),
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
     ScreenUtil.init(context,width: 375, height: 801);
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
