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
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:provider/provider.dart';

class ServicesOfferedBasePage extends StatelessWidget {
  const ServicesOfferedBasePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SearchStateMain>(context);
    return AnnotatedSafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            isBackButton: true,
            onBackButtonPressed: ExtendedNavigator.of(context).pop,
          ),
          body: _ServicesOfferedBody()),
    );
  }
}

class _ServicesOfferedBody extends StatelessWidget {
  const _ServicesOfferedBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchState = Provider.of<SearchStateMain>(context);
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: ScrollableColumn(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.servicesOffered_WhatCanWeHelpWithText(
                searchState.getSelectedItem.searchString),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline3.copyWith(
                  fontSize: 18,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.9),
                ),
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

  List<Widget> getServicesOffered(BuildContext context) {
    return [
      _getBuildMyHome(context),
      _getProffessionals(context),
      _getDesignAndPlans(context),
      _getHomeStores(context)
    ];
  }

  Widget _getBuildMyHome(BuildContext context) {
    final theme = Theme.of(context);
        final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CustomListTile(
        backgroundColor: theme.colorScheme.secondaryVariant,
        leading: customIconSquare(
          iconAsset: HelloIcons.home_bold_icon,
          backgroundColor:  (isDarkTheme
                    ? AppColors.kDark_2
                    : theme.colorScheme.background),
          backgroundSize: 40,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          "Build my home",
          style:theme.textTheme.headline6
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

  Widget _getProffessionals(BuildContext context) {
        final theme = Theme.of(context);
                final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CustomListTile(
        backgroundColor: theme.colorScheme.secondaryVariant,
        leading: customIconSquare(
          iconAsset: HelloIcons.profile_bold_icon,
           backgroundColor:  (isDarkTheme
                    ? AppColors.kDark_2
                    : theme.colorScheme.background),
          backgroundSize: 40,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          "Professionals",
          style:theme.textTheme.headline6,
        ),
        subTitle: Text(
          "Professionals",
        ),
        onTap: () => {
          //TODO: Add Navigation to Professionals Screen
          print("User want to Navigate to Proffessionals Screen")
        },
      ),
    );
  }

  Widget _getDesignAndPlans(BuildContext context) {
            final theme = Theme.of(context);
                final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CustomListTile(
        backgroundColor: theme.colorScheme.secondaryVariant,
        leading: customIconSquare(
          iconAsset: HelloIcons.chart_bold_icon,
           backgroundColor:  (isDarkTheme
                    ? AppColors.kDark_2
                    : theme.colorScheme.background),
          backgroundSize: 40,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          "Design and Plans",
          style: theme.textTheme.headline6,
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

  Widget _getHomeStores(BuildContext context) {
                final theme = Theme.of(context);
                final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CustomListTile(
        backgroundColor: theme.colorScheme.secondaryVariant,
        leading: customIconSquare(
          iconAsset: HelloIcons.bag_bold_icon,
           backgroundColor:  (isDarkTheme
                    ? AppColors.kDark_2
                    : theme.colorScheme.background),
          backgroundSize: 40,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          "Home Stores",
          style: theme.textTheme.headline6,
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
      children: getServicesOffered(context),
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
  List<Widget> _buildItems(List<String> items,BuildContext context) {
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
        style: style ?? Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12),
      ));

      listOfItems.add(
        SizedBox(
          width: 4,
        ),
      );

      if (i != items.length - 1) {
        listOfItems.add(FilledCircle(
          size: 3.0,
          color: Theme.of(context).colorScheme.onBackground,
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
      children: _buildItems(items,context),
    );
  }
}
