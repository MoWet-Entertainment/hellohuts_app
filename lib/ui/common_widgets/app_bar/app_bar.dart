import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

Widget appBarIcon(
    {@required IconData icon,
    Color color,
    double size = 24,
    bool notification = false,
    Function actionCall}) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.kLightGrey,
        ),
        height: 40.0,
        width: 40.0,
      ),
      IconButton(
          icon: Icon(
            icon,
            color: color ?? AppColors.kPureBlack,
            size: size,
          ),
          onPressed: actionCall),
      notification
          ? new Positioned(
              right: 2,
              top: 8,
              child: new Container(
                padding: EdgeInsets.all(1),
                decoration: new BoxDecoration(
                  color: AppColors.kPureWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Container(
                  decoration: new BoxDecoration(
                    color: AppColors.kAccentColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 12,
                    maxWidth: 12,
                  ),
                ),
              ),
            )
          : Container(),
    ],
  );
}

class CustomSearchBar extends HookWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Size appBarHeight = Size.fromHeight(64.0);
  final IconData iconData;
  final bool isBackButton;
  final bool isBottomLine;
  final bool isCrossButton;
  final Widget leading;
  final Function onActionPressed;
  final Function onSubmitText;
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
    this.onSubmitText,
    this.title,
    this.hintText = 'Search cost for 4 bedroom home..',
    this.onSearchChanged,
  }) : super(key: key);

  Widget _searchField(BuildContext context, TextEditingController controller) {
    final state = Provider.of<SearchState>(context);
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        style: AppThemes.searchHintStyle.copyWith(
            color: AppColors.kDarkTextColor, fontWeight: FontWeight.w500),
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        cursorColor: AppColors.kDarkGrey,
        onChanged: (text) {
          state.setSearchText(text);
        },
        onSubmitted: onSubmitText,
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: const BorderRadius.all(
                const Radius.circular(12.0),
              ),
            ),
            fillColor: AppColors.kLightGrey,
            filled: true,
            hintText: hintText,
            hintStyle: AppThemes.searchHintStyle,
            focusColor: AppColors.kPureWhite,
            suffixIcon: (controller.text.trim().length == 0)
                ? Container(
                    width: 0,
                  )
                : GestureDetector(
                    child: Icon(
                      HelloIcons.times_circle,
                      color: AppColors.kDarkGrey,
                      size: 14,
                    ),
                    onTap: () {
                      controller.text = '';
                      state.resetSearch();
                    }),
            contentPadding: const EdgeInsets.only(left: 16, right: 5)),
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
      backgroundColor: AppColors.kPureWhite,
      elevation: 0,
      leading: isBackButton
          ? BackButton(
              color: AppColors.kDarkGrey,
              onPressed: () {
                FocusScope.of(context).unfocus();
                state.resetSearch();
                ExtendedNavigator.of(context).pop();
              },
            )
          : isCrossButton
              ? IconButton(
                  icon: Icon(HelloIcons.times),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    ExtendedNavigator.of(context).pop();
                  },
                )
              : Container(),
      title: title != null ? title : _searchField(context, controller),
      actions: _getActionButtons(context),
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
