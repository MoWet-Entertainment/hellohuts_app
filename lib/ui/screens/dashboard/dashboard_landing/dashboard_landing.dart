import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/models/dashboard/dashboard_item/dashboard_item.dart';
import 'package:hellohuts_app/models/dashboard/project_details/project_details.dart';
import 'package:hellohuts_app/states/dashboard/dashboard_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/flippable_box.dart';
import 'package:hellohuts_app/ui/common_widgets/rounded_charts/radial_chart.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:timeago/timeago.dart' as timeago;

class DashboardLandingPage extends StatelessWidget {
  const DashboardLandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedSafeArea(
      child: Scaffold(
        body: buildNestedScrollView(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.kYellowLight,
          elevation: 0.5,
          heroTag: 'DahboardCustomerCare',
          child: Image.asset(HelloIcons.comment_bold_icon,
              height: 28, color: theme.colorScheme.background),
          onPressed: () {},
        ),
      ),
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
    final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // _ProjectImageContainer(),
              _ImageContainer(),
              SizedBox(height: 24),
              dashboardQuickPicks(context),
              SizedBox(
                height: 24,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recent Activities',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 16),
                  )),
              Consumer(builder: (context, watch, child) {
                final snapshot = watch(recentActivityProvider);
                return snapshot.map(
                    data: (_) => Padding(
                          padding: const EdgeInsets.only(top: 18.0, bottom: 40),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.value.length < 10
                                  ? snapshot.data.value.length
                                  : 10,
                              itemBuilder: (context, index) {
                                return itemTile(
                                    item: snapshot.data.value[index],
                                    context: context,
                                    isDarkTheme: isDarkTheme);
                              }),
                        ),
                    loading: (_) => Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    error: (_) => Center(
                          child: Text('error'),
                        ));
              }
                  // future: dashboardState.getRecentActivityList(),

                  ),
            ],
          ),
        ),
      ),
    );
  }

  Container dashboardQuickPicks(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = ThemeOptions.of(context).isDarkTheme(context);
    print(isDark);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.secondaryVariant),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuickPickItem(
            text: "Project Details",
            call: _projectDetailsCall,
            iconAsset: HelloIcons.home_bold_icon,
            iconColor: isDark
                ? Colors.grey[300]
                : theme.colorScheme.onBackground.withOpacity(0.8),
            textColor:
                isDark ? Colors.grey[300] : theme.colorScheme.onBackground,
            backgroundColor: isDark
                ? Colors.grey[300].withOpacity(0.2)
                : theme.colorScheme.surface,
            backgroundSize: 48,
            borderRadius: 16,
          ),
          QuickPickItem(
            text: "Documents",
            call: _documentsCall,
            iconAsset: HelloIcons.folder_bold_icon,
            iconColor: isDark
                ? Colors.grey[300]
                : theme.colorScheme.onBackground.withOpacity(0.8),
            textColor:
                isDark ? Colors.grey[300] : theme.colorScheme.onBackground,
            backgroundColor: isDark
                ? Colors.grey[300].withOpacity(0.2)
                : theme.colorScheme.surface,
            backgroundSize: 48,
            borderRadius: 16,
          ),
          QuickPickItem(
            text: "Pay",
            call: _payCall,
            iconAsset: HelloIcons.wallet_bold_icon,
            iconColor: isDark
                ? Colors.grey[300]
                : theme.colorScheme.onBackground.withOpacity(0.8),
            textColor:
                isDark ? Colors.grey[300] : theme.colorScheme.onBackground,
            backgroundColor: isDark
                ? Colors.grey[300].withOpacity(0.2)
                : theme.colorScheme.surface,
            backgroundSize: 48,
            borderRadius: 16,
          ),
          QuickPickItem(
            text: "Reports",
            call: _reportsCall,
            iconAsset: HelloIcons.reports_bold_icon,
            iconColor: isDark
                ? Colors.grey[300]
                : theme.colorScheme.onBackground.withOpacity(0.8),
            textColor:
                isDark ? Colors.grey[300] : theme.colorScheme.onBackground,
            backgroundColor: isDark
                ? Colors.grey[300].withOpacity(0.2)
                : theme.colorScheme.surface,
            backgroundSize: 48,
            borderRadius: 16,
          ),
          QuickPickItem(
            text: "Calendar",
            call: _calendarCall,
            iconAsset: HelloIcons.calendar_bold_icon,
            iconColor: isDark
                ? Colors.grey[300]
                : theme.colorScheme.onBackground.withOpacity(0.8),
            textColor:
                isDark ? Colors.grey[300] : theme.colorScheme.onBackground,
            backgroundColor: isDark
                ? Colors.grey[300].withOpacity(0.2)
                : theme.colorScheme.surface,
            backgroundSize: 48,
            borderRadius: 16,
          ),
        ],
      ),
    );
  }

  _projectDetailsCall() {
    print("user wants to navigate to the project details page");
    ExtendedNavigator.root.push(Routes.projectDetailsPage);
    //TODO: Project Details page
  }

  _documentsCall() {
    print("user wants to navigate to the documents  page");
    ExtendedNavigator.root.push(Routes.documentsPage);
    //TODO: Documents Details page
  }

  _payCall() {
    print("user wants to navigate to the Pay  page");
    ExtendedNavigator.root.push(Routes.paymentsPage);
    //TODO: Pay page
  }

  _reportsCall() {
    print("user wants to navigate to the reports  page");
    ExtendedNavigator.root.push(Routes.reportsPage);
    //TODO: Reports page
  }

  _calendarCall() {
    print("user wants to navigate to the Calendar  page");
    //TODO: Calendar page
  }
}

class _ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return imageContainer(context);
  }

  Widget imageContainer(BuildContext context) {
    final width = fullWidth(context) * 0.9;
    final height = fullHeight(context) * 0.35;
    return FlipCard(
      front: _ProjectImageContainer(
        width: width,
        height: height,
      ),
      back: _QuickProjectSnapshot(),
    );
  }
}

class _QuickProjectSnapshot extends StatelessWidget {
  const _QuickProjectSnapshot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build called Quick snapshot");
    return buildContainer(context);
  }

  Widget buildContainer(BuildContext context, {double width, double height}) {
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);
    return Consumer(
      builder: (context, watch, child) {
        final projectDetail = watch(projectDetailsProvider);
        final state = watch(dashboardState);
        return projectDetail.map(
          data: (_) => Container(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isDark
                    ? Theme.of(context).colorScheme.surface
                    : AppColors.kbSmokedWhite,
              ),
              child: Stack(
                children: [
                  Positioned(
                      right: 24,
                      top: 16,
                      child: Opacity(
                          opacity: 0.3,
                          child: SvgPicture.asset(Assets.colored_circles_svg))),
                  Positioned(
                    left: -6,
                    bottom: -68,
                    child: Opacity(
                      opacity: 0.3,
                      child: SvgPicture.asset(
                        Assets.colored_circles_svg,
                        height: 128,
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 40),
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              heroDetailedContainerText(
                                  heading: "Area",
                                  text: projectDetail.data.value.projectArea,
                                  subTopText: 'sq.ft'),
                              SizedBox(
                                width: 20,
                              ),
                              heroDetailedContainerText(
                                heading: "Project Est",
                                text: convertProjectEstimate(
                                    projectDetail.data.value.projectEstimate),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              heroDetailedContainerText(
                                  heading: "Project by",
                                  text: "Hellohuts Pvt Ltd",
                                  textSize: 16.0),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              heroDetailedContainerText(
                                  heading: "Exp. Completion",
                                  text: "22 Mar 2021",
                                  textSize: 16.0),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ))),
                ],
              ),
            ),
          ),
          loading: (_) => Center(child: CircularProgressIndicator()),
          error: (_) => Text(
            _.error.toString(),
            style: TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }
}

class _ProjectImageContainer extends StatefulWidget {
  final double width;
  final double height;
  const _ProjectImageContainer({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _ProjectImageContainerState createState() => _ProjectImageContainerState();
}

class _ProjectImageContainerState extends State<_ProjectImageContainer> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    print("build called image container");

    bool isDark = ThemeOptions.of(context).isDarkTheme(context);
    final theme = Theme.of(context);
    return Container(
      child: GestureDetector(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutSine,
              width: widget.width ?? fullWidth(context) * 0.9,
              height: widget.height ?? fullHeight(context) * 0.35,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                    image: AssetImage(Assets.sample_house), fit: BoxFit.cover),
              ),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: IconButton(
                  icon: Stack(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            // color: Colors.black.withOpacity(0.1),
                            gradient: RadialGradient(
                                center: Alignment.center,
                                colors: [
                                  AppColors.kDark_1.withOpacity(0.2),
                                  Colors.transparent,
                                ]),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      Icon(
                        Icons.filter_center_focus_rounded,
                        color: AppColors.kPureWhite,
                      ),
                    ],
                  ),
                  onPressed: () {
                    print("User wants to see the VR View");
                    //TODO: When the image VR View is tapped by the user
                  },
                ))
          ],
        ),
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
