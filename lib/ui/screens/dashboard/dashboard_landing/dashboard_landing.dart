import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';

class DashboardLandingPage extends StatelessWidget {
  const DashboardLandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedSafeArea(

        child: buildNestedScrollView(context),

    );
  }

  NestedScrollView buildNestedScrollView(BuildContext context) {
    return NestedScrollView(
        body: _DashboardBody(),
        headerSliverBuilder: (context, bool innerboxScrolled) {
          return <Widget>[
            _AppBar(context: context),
            SliverSizedBox(
              height: 32,
            ),
          ];
        });
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          children: [
            imageContainer(isDark, theme),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:24, vertical: 28 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.colorScheme.secondaryVariant
              ),
              child: Row(
                children: [
                  customIconSquare(
                    iconAsset: HelloIcons.home_bold_icon,
                    iconSize: 24,
                    backgroundColor: theme.colorScheme.background
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container imageContainer(bool isDark, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            isDark ? theme.colorScheme.onSurface : AppColors.kbSmokedWhite,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image(image: AssetImage(Assets.sample_house)),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      floating: false,
      pinned: true,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: theme.textTheme.headline6.copyWith(
                  fontSize: 18, color: theme.colorScheme.onBackground),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                RichText(
                    text: TextSpan(
                        text: "Vinoop\'s ",
                        style: theme.textTheme.bodyText1.copyWith(
                            fontSize: 14, color: AppColors.kbDarkGrey),
                        children: <InlineSpan>[
                      TextSpan(
                        text: "LittleNest",
                        style: theme.textTheme.headline6.copyWith(
                            fontSize: 14, color: AppColors.kbDarkGrey),
                      )
                    ])),
                SizedBox(width: 4),
                GestureDetector(
                    child: Image.asset(
                      HelloIcons.down_arrow_light_icon,
                      height: 12,
                      color: AppColors.kbDarkGrey,
                    ),
                    onTap: () {
                      print("Implement selecting different projects here");
                      //TODO: Multi project support
                    })
              ],
            )
          ],
        ),
      ),
      actions: [
        customIconSquare(
            isCustomIcon: true,
            iconAsset: HelloIcons.notification_bold_icon,
            iconColor: Theme.of(context).colorScheme.onSurface,
            iconSize: 24.0,
            backgroundSize: 40.0,
            backgroundColor: Theme.of(context).colorScheme.surface,
            borderRadius: 12.0,
            notificationFlag: true,
            actionCall: () {
              ExtendedNavigator.of(context).push(Routes.searchPage);
            }),
      ],
    );
  }
}
