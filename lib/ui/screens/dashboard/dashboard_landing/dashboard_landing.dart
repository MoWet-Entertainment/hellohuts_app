import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellohuts_app/constants/constants.dart';
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
              Consumer(
                builder:(context, watch, child){
                  final snapshot = watch(recentActivityProvider);
                 return snapshot.map(
                    data: (_)=> Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 40),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.value.length< 10
                              ? snapshot.data.value.length
                              : 10,
                          itemBuilder: (context, index) {
                            return _itemTile(
                                item: snapshot.data.value[index],
                                context: context,
                                isDarkTheme: isDarkTheme);
                          }),
                    ), loading: (_)=>Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: CircularProgressIndicator(),
                      ),
                    ), error: (_)=>Center(child: Text('error'),));
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
            iconColor: theme.colorScheme.onBackground.withOpacity(0.8),
            textColor: theme.colorScheme.onBackground,
            backgroundSize: 48,
            borderRadius: 16,
          ),
          QuickPickItem(
            text: "Documents",
            call: _documentsCall,
            iconAsset: HelloIcons.folder_bold_icon,
            iconColor: theme.colorScheme.onBackground.withOpacity(0.8),
            textColor: theme.colorScheme.onBackground,
            backgroundSize: 48,
            borderRadius: 16,
          ),
          QuickPickItem(
            text: "Pay",
            call: _payCall,
            iconAsset: HelloIcons.wallet_bold_icon,
            iconColor: theme.colorScheme.onBackground.withOpacity(0.8),
            textColor: theme.colorScheme.onBackground,
            backgroundSize: 48,
            borderRadius: 16,
          ),
          QuickPickItem(
            text: "Reports",
            call: _reportsCall,
            iconAsset: HelloIcons.reports_bold_icon,
            iconColor: theme.colorScheme.onBackground.withOpacity(0.8),
            textColor: theme.colorScheme.onBackground,
            backgroundSize: 48,
            borderRadius: 16,
          ),
          QuickPickItem(
            text: "Calendar",
            call: _calendarCall,
            iconAsset: HelloIcons.calendar_bold_icon,
            iconColor: theme.colorScheme.onBackground.withOpacity(0.8),
            textColor: theme.colorScheme.onBackground,
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
    //TODO: Documents Details page
  }

  _payCall() {
    print("user wants to navigate to the Pay  page");
    //TODO: Pay page
  }

  _reportsCall() {
    print("user wants to navigate to the reports  page");
    //TODO: Reports page
  }

  _calendarCall() {
    print("user wants to navigate to the Calendar  page");
    //TODO: Calendar page
  }

  Widget _itemTile(
      {@required DashboardItem item,
      @required BuildContext context,
      bool isDarkTheme = false}) {
    final theme = Theme.of(context);
    final now = new DateTime.now();
    final difference = now.difference(item.updatedTimeStamp);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomListTile(
        tilePadding:
            const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 12),
        backgroundColor: theme.colorScheme.secondaryVariant,
        borderRadius: BorderRadius.circular(20.0),
        leading: customIconSquare(
          backgroundColor:
              isDarkTheme ? AppColors.kDark_7 : theme.colorScheme.background,
          iconAsset: _getLeadingIcon(item),
          iconColor: isDarkTheme
              ? AppColors.kbMediumGrey
              : theme.colorScheme.onBackground,
          backgroundSize: 48,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          item.itemText1,
          style: theme.textTheme.bodyText2
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subTitle: Text(
          timeago.format(
            now.subtract(difference),
          ),
          style: theme.textTheme.bodyText2
              .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
        ),
        trailing: _getTrailingWidget(item, context),
      ),
    );
  }

  Widget _getTrailingWidget(DashboardItem item, BuildContext context) {
    final theme = Theme.of(context);
    switch (item.itemType) {
      case DashboardItemType.TransactionReceived:
        return item.itemText2 != null
            ? Text("₹" + item.itemText2,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: AppColors.kGreenLight,
                ))
            : SizedBox.shrink();
      case DashboardItemType.TransactionSpent:
        return item.itemText2 != null
            ? Text("₹" + item.itemText2,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: AppColors.kRed,
                ))
            : SizedBox.shrink();
      case DashboardItemType.ItemDelivered:
        return item.itemText2 != null
            ? Text("₹" + item.itemText2,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: AppColors.kRed,
                ))
            : SizedBox.shrink();
      case DashboardItemType.StarcoinsReceived:
        return item.itemText2 != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    HelloIcons.star_bold_icon,
                    height: 14,
                    color: AppColors.kYellowLight,
                  ),
                  SizedBox(width: 4.0),
                  Text(item.itemText2,
                      style: theme.textTheme.headline6.copyWith(
                        fontSize: 14,
                        color: AppColors.kYellowLight,
                      )),
                ],
              )
            : SizedBox.shrink();
      case DashboardItemType.StarcoinsSpent:
        return item.itemText2 != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    HelloIcons.star_bold_icon,
                    height: 14,
                    color: AppColors.kYellowLight,
                  ),
                  SizedBox(width: 4.0),
                  Text(item.itemText2,
                      style: theme.textTheme.headline6.copyWith(
                        fontSize: 14,
                        color: AppColors.kbDarkRed,
                      )),
                ],
              )
            : SizedBox.shrink();
      case DashboardItemType.ServiceDebit:
        return item.itemText2 != null
            ? Text("₹" + item.itemText2,
                style: theme.textTheme.headline6.copyWith(
                  fontSize: 14,
                  color: AppColors.kRed,
                ))
            : SizedBox.shrink();

      case DashboardItemType.PaymentReminder:
        return GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppColors.kbDarkGreen.withOpacity(0.6),
              ),
              child: Text(
                'Pay',
                style: theme.textTheme.bodyText2
                    .copyWith(fontSize: 12, color: AppColors.kbDarkGreen),
              ),
            ),
            onTap: () => {
                  print("User wishes to pay"),
                  //TODO:Add Navigation to Payment Page
                });
      default:
        return SizedBox.shrink();
    }
  }

  String _getLeadingIcon(DashboardItem item) {
    switch (item.itemType) {
      case DashboardItemType.TransactionReceived:
        return HelloIcons.wallet_light_icon;
      case DashboardItemType.TransactionSpent:
        return HelloIcons.wallet_light_icon;
      case DashboardItemType.ItemDelivered:
        return HelloIcons.bag_light_icon;

      case DashboardItemType.StarcoinsReceived:
        return HelloIcons.star_light_icon;
      case DashboardItemType.StarcoinsSpent:
        return HelloIcons.star_light_icon;
      case DashboardItemType.ServiceDebit:
        return HelloIcons.contractor_light_icon;
      default:
        return HelloIcons.wallet_light_icon;
    }
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
        final state = watch(dashbordState);
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
                                  text: state.projectDetailsModel.projectArea,
                                  subTopText: 'sq.ft'),
                              SizedBox(
                                width: 20,
                              ),
                              heroDetailedContainerText(
                                heading: "Project Est",
                                text: _convertProjectEstimate(
                                    state.projectDetailsModel.projectEstimate),
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

String _convertProjectEstimate(String value) {
  double val = double.parse(value);
  final formatter = NumberFormat.compactSimpleCurrency(name: 'INR');
  return formatter.format(val);
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
