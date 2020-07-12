import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hellohuts_app/constants/hello_icons.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

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
            prefixIcon: Padding(
              padding: EdgeInsets.only(left:8,right: 2),
              child: Icon(HelloIcons.search,size:18,color: AppColors.kDarkGrey,)),
          
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
