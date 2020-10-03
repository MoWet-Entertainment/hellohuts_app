import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
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
            body: _ServicesOfferedBody()),
      ),
    );
  }
}

class _ServicesOfferedBody extends StatelessWidget {
  const _ServicesOfferedBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchState = Provider.of<SearchState>(context);
    return Container(
      color: AppColors.kPureWhite,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.servicesOffered_WhatCanWeHelpWithText(
                searchState.getSelectedItem.searchString),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppThemes.normalTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.kDarkTextColor),
          ),
          SizedBox(
            height: 32,
          ),
          CustomListTile(
            backgroundColor: AppColors.kAliceBlue,
            leading: customIconSquare(
              backgroundColor: AppColors.kPureWhite,
              iconAsset: HelloIcons.home_bold_icon,
              iconColor: AppColors.kAlmostBlack,
              backgroundSize: 40,
              iconSize: 24,
              isCustomIcon: true,
            ),
            titleText: Text(
              "Build my home",
              style: AppThemes.normalTextStyle
                  .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subTitle: _HorizontalSeparatedTextItems(
              items: ["Design", "Build", "Smart"],
            ),
            onTap: () => {
              print("User want to Build Home")
            },
          ),
          CustomListTile(
            backgroundColor: AppColors.kAliceBlue,
            leading: customIconSquare(
              backgroundColor: AppColors.kPureWhite,
              iconAsset: HelloIcons.home_bold_icon,
              iconColor: AppColors.kAlmostBlack,
              backgroundSize: 40,
              iconSize: 24,
              isCustomIcon: true,
            ),
            titleText: Text(
              "Build my home",
              style: AppThemes.normalTextStyle
                  .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subTitle: _HorizontalSeparatedTextItems(
              items: ["Design", "Build", "Smart"],
            ),
          ),
        ],
      ),
    );
  }
}

class _HorizontalSeparatedTextItems extends StatelessWidget {
  ///A horixontal Span like text Widget which outputs a set of texts in the list separated by
  ///filled cicles
  _HorizontalSeparatedTextItems({Key key, this.items, this.style})
      : super(key: key);

  ///Accepts a list of Strings , which will get displayed horizontally
  ///seprated by filled circles
  final List<String> items;

  ///To give custom styling to the texts. By default it will have a font size of 12
  final TextStyle style;
  List<Widget> _buildItems(List<String> items) {
    List<Widget> listOfItems = [];

    for (int i = 0; i < items.length; i++) {
      if (i != 0) {
        listOfItems.add(
          SizedBox(
            width: 4,
          ),
        );
      }
      listOfItems.add(Text(
        items[i],
        style: style ?? AppThemes.normalTextStyle.copyWith(fontSize: 12),
      ));

      listOfItems.add(
        SizedBox(
          width: 4,
        ),
      );

      if (i != items.length - 1) {
        listOfItems.add(FilledCircle(
          size: 3.0,
          color: AppColors.kDarkTextColor,
        ));
      }
    }
    return listOfItems;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildItems(items),
    );
  }
}
