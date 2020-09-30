import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:provider/provider.dart';

import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class CustomSearchBar extends HookWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Size appBarHeight = Size.fromHeight(72.0);
  final IconData iconData;
  final bool isBackButton;
  final bool isBottomLine;
  final bool isCrossButton;
  final Widget leading;
  final Function onActionPressed;

  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget title;
  final String hintText;
  final ValueChanged<String> onSearchChanged;
  String searchText = '';
  bool isAnyTextPresent = false;
  CustomSearchBar({
    Key key,
    this.actions,
    this.iconData,
    this.isBackButton = true,
    this.isBottomLine = false,
    this.isCrossButton = false,
    this.leading,
    this.onActionPressed,
    this.scaffoldKey,
    this.title,
    this.hintText = '',
    this.onSearchChanged,
  }) : super(key: key);

  Widget _searchField(BuildContext context, TextEditingController controller) {
    final state = Provider.of<SearchState>(context);
    return Container(
      height: 64,
      padding: const EdgeInsets.only(top: 16, bottom: 8.0 , left: 24,right: 16),
      child: TextField(
        style: AppThemes.searchHintStyle.copyWith(
            color: AppColors.kDarkTextColor, fontSize: 14),
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        cursorColor: AppColors.kDarkGrey,
        onChanged: (text) {
          state.setSearchText(text);
        },
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            fillColor: AppColors.kAliceBlue,  
            // isDense: true,          
            prefixIcon: leading??Padding(
              padding: EdgeInsets.only(left:12.0, right: 8.0),
              child: Image.asset(HelloIcons.search_icon, color: AppColors.kDarkGrey, height: 22,)),
            prefixIconConstraints: BoxConstraints(maxHeight: 44, maxWidth: 44),
            hintText: hintText,
            hintStyle: AppThemes.searchHintStyle,
            focusColor: AppColors.kPureWhite,
            filled: true,
            suffixIcon: (controller.text.trim().length == 0)
                ? Container(
                    width: 0,
                  )
                : GestureDetector(
                    child:Padding(
                      padding: const EdgeInsets.only(left:4,right: 12.0),
                      child: Image.asset(HelloIcons.close_circle_bold_icon, color: AppColors.kDarkGrey,height: 16,),
                    ),
                    onTap: () {
                      controller.text = '';
                      state.resetSearch();
                    }),
            contentPadding: const EdgeInsets.only(left: 5, right: 4),
            suffixIconConstraints: BoxConstraints(maxWidth: 40, maxHeight: 40)),
      ),
    );
  }

  List<Widget> _getActionButtons(BuildContext context) {
    return <Widget>[
      iconData == null
          ? Container()
          : GestureDetector(
              onTap: () {
                if (onActionPressed != null) onActionPressed();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 0, right: 16),
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Icon(
                    iconData,
                    size: 24,
                    color: AppColors.kAccentColor,
                  ),
                ),
              ),
            )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchState>(context);
    final controller = useTextEditingController();
    final update = useValueListenable(controller);

    return AppBar(
      titleSpacing: 8.0,
      backgroundColor: AppColors.kPureWhite,
      elevation: 0,

      // leading: isBackButton
      //     ? BackButton(

      //         color: AppColors.kDarkGrey,
      //         onPressed: () {
      //           FocusScope.of(context).unfocus();
      //           state.resetSearch();
      //           ExtendedNavigator.of(context).pop();
      //         },
      //       )
      //     : isCrossButton
      //         ? IconButton(
      //             icon: Icon(HelloIcons.times),
      //             onPressed: () {
      //               FocusScope.of(context).unfocus();
      //               ExtendedNavigator.of(context).pop();
      //             },
      //           )
      //         : Container(),
      title: title != null ? title : _searchField(context, controller),
      // actions: _getActionButtons(context),
      actions: <Widget>[
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              state.resetSearch();
              ExtendedNavigator.of(context).pop();
            },
            child: Container(
              padding:
                  const EdgeInsets.only(right: 24, top: 4.0, bottom: 4.0),
              child: Text('Cancel',
                  style: AppThemes.normalTextStyle
                      .copyWith(color: AppColors.kDarkTextColor, fontSize: 12.0)),
            ),
          ),
        )
      ],
      bottom: PreferredSize(
        child: isBottomLine
            ? Container(
                color: Colors.grey.shade200,
                height: 1.0,
              )
            : Container(),
        preferredSize: Size.fromHeight(0.0),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => appBarHeight;
}
