import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/dashboard/dashboard_item.dart';
import 'package:hellohuts_app/states/dashboard/dashboard_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:provider/provider.dart';

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

    final dashboardState = Provider.of<DashboardState>(context);
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
              imageContainer(context),
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
           
              FutureBuilder(
                future: dashboardState.getRecentActivityList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                   return  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length<10?snapshot.data.length:10,
                    itemBuilder: (context, index) {
                    return _itemTile( item: snapshot.data[index], context:context,isDarkTheme: isDarkTheme);
                    });
                  }else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                
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

  Container imageContainer(BuildContext context) {
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isDark ? theme.colorScheme.onSurface : AppColors.kbSmokedWhite,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image(image: AssetImage(Assets.sample_house)),
      ),
    );
  }

  Widget _itemTile({@required DashboardItem item, @required BuildContext context, bool isDarkTheme =false}) {
    final theme = Theme.of(context);
    final now = new DateTime.now();
    final difference = now.difference(item.updatedTimeStamp);
    return CustomListTile(
      tilePadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      backgroundColor: theme.colorScheme.background,
      borderRadius: BorderRadius.zero,
      leading: customIconSquare(
        backgroundColor: isDarkTheme
            ? AppColors.kDark_7
            : theme.colorScheme.secondaryVariant,
        iconAsset: _getLeadingIcon(item),
        iconColor: isDarkTheme
            ? AppColors.kbMediumGrey
            : theme.colorScheme.onBackground,
        backgroundSize: 40,
        iconSize: 24,
        isCustomIcon: true,
      ),
      titleText: Expanded(
          child: Text(
        item.itemText1,
        style: theme.textTheme.bodyText2
            .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      )),
      subTitle: Text(
        difference.toString(),
        style: theme.textTheme.bodyText2
            .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
      ),
      trailing: _getTrailingWidget(item, context),
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
