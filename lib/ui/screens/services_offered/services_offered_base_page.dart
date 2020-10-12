import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/constants/strings.dart';
import 'package:hellohuts_app/states/search/search_state_main.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

class ServicesOfferedBasePage extends StatelessWidget {
  const ServicesOfferedBasePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SearchStateMain>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
              body: SafeArea(
          child: Scaffold(
              appBar: CustomAppBar(
                isBackButton: true,
                onBackButtonPressed: ExtendedNavigator.of(context).pop,
              ),
              body: _ServicesOfferedBody()),
        ),
      ),
    );
  }
}

class _ServicesOfferedBody extends StatelessWidget {
  const _ServicesOfferedBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchState = Provider.of<SearchStateMain>(context);
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
         ServicesOffferedItems(),
        ],
      ),
    );
  }
}

class ServicesOffferedItems extends StatelessWidget {
  const ServicesOffferedItems({Key key}) : super(key: key);

  List<Widget> getServicesOffered() {
    return [
      _getBuildMyHome(),
      _getProffessionals(),
      _getDesignAndPlans(),
      _getHomeStores()
    ];
  }

  Widget _getBuildMyHome() {
    return Padding(
            padding: const EdgeInsets.only(bottom: 12),

          child: CustomListTile(
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
         ExtendedNavigator.root.push(Routes.addDetailsForHome),
        },
      ),
    );
  }

  Widget _getProffessionals() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
          child: CustomListTile(
        backgroundColor: AppColors.kAliceBlue,
        leading: customIconSquare(
          backgroundColor: AppColors.kPureWhite,
          iconAsset: HelloIcons.profile_bold_icon,
          iconColor: AppColors.kAlmostBlack,
          backgroundSize: 40,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          "Professionals",
          style: AppThemes.normalTextStyle
              .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subTitle: Text(
          "Professionals",
          style: AppThemes.normalTextStyle
              .copyWith(color: AppColors.kDarkTextColor, fontSize: 12),
        ),
        onTap: () => {
          //TODO: Add Navigation to Professionals Screen
          print("User want to Navigate to Proffessionals Screen")
        },
      ),
    );
  }

  Widget _getDesignAndPlans() {
     return Padding(
      padding: const EdgeInsets.only(bottom: 12),
       child: CustomListTile(
        backgroundColor: AppColors.kAliceBlue,
        leading: customIconSquare(
          backgroundColor: AppColors.kPureWhite,
          iconAsset: HelloIcons.chart_bold_icon,
          iconColor: AppColors.kAlmostBlack,
          backgroundSize: 40,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          "Design and Plans",
          style: AppThemes.normalTextStyle
              .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subTitle: _HorizontalSeparatedTextItems(
          items: ["Creative", "Pocket friendly"],
        ),
        onTap: () => {
          //TODO: Add Navigation to Design and Plans
          print("User want to Navigate to Design and Plans")
        },
    ),
     );
  }
  Widget _getHomeStores() {
     return Padding(
      padding: const EdgeInsets.only(bottom: 12),
       child: CustomListTile(
        backgroundColor: AppColors.kAliceBlue,
        leading: customIconSquare(
          backgroundColor: AppColors.kPureWhite,
          iconAsset: HelloIcons.chart_bold_icon,
          iconColor: AppColors.kAlmostBlack,
          backgroundSize: 40,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          "Home Stores",
          style: AppThemes.normalTextStyle
              .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subTitle: _HorizontalSeparatedTextItems(
          items: ["Nearest Stores", "Latest Offers"],
        ),
        onTap: () => {
          //TODO: Add Navigation to Home Stores
          print("User want to Navigate to Homes Stores")
        },
    ),
     );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: getServicesOffered(),
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
