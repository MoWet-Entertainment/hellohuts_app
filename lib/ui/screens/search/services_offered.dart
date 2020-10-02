import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class ServicesOffered extends StatelessWidget {
  const ServicesOffered({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SearchState>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
                  child: Scaffold(
            appBar: CustomAppBar(
              isBackButton: true,
              onBackButtonPressed: ExtendedNavigator.of(context).pop,
            ),
            body: Container(
              child: Center(
                child: Text(
                  state.getSelectedItem.searchString,
                ),
              ),
            ),
          ),
        ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///CustomAppBar is the default appbar for Hellohuts Pages .
  CustomAppBar({
    Key key,
    this.isBackButton = false,
    this.isCrossButton = false,
    this.title,
    this.actions,
    this.onBackButtonPressed,
    this.customBackButton,
    this.onCrossButtonPressed,
    this.onActionPressed,
    this.backgroundColor,
    this.centerTitle = true,
  }) : super(key: key);

  ///if the leading is a BackButton. Defaults to arrow based button(as in iOS). By default this will be [false]
  final bool isBackButton;

//Custom action, when back button is pressed. Example. Log something in the database
  final GestureTapCallback onBackButtonPressed;

  ///pass custom back button widget instead of the default back button
  final Widget customBackButton;

  ///if the leading is CrossButton
  final bool isCrossButton;

  ///Custom action, when cross button is pressed. Example. Log something in the database
  final GestureTapCallback onCrossButtonPressed;

  final Widget title;

  ///To center the title widget. Defaults to [true]
  final bool centerTitle;

  final Widget actions;
  final GestureTapCallback onActionPressed;
  final Size appBarHeight = Size.fromHeight(72.0);
  final Color backgroundColor;

  @override
  Size get preferredSize => appBarHeight;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.kPureWhite,
      elevation: 0,
      leading: isBackButton
          ? GestureDetector(
              
                child: customBackButton ??
                    Icon(Icons.arrow_back_ios,color: AppColors.kAlmostBlack,),
                  
              
              onTap: onBackButtonPressed ?? () => {},
            )
          : isCrossButton
              ? GestureDetector(
                  child: customBackButton ??
                      Image.asset(HelloIcons.close_circle_bold_icon,),
                  onTap: onCrossButtonPressed ?? () => {},
                )
              : SizedBox(),
      title: title ?? SizedBox(),
      centerTitle: centerTitle ? true : false,
      actions: [
        GestureDetector(
          child: actions ?? SizedBox(),
          onTap: onActionPressed ?? () => {},
        ),
      ],
    );
  }
}
