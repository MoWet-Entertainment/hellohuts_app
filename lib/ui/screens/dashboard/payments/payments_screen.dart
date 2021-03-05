import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/states/dashboard/dashboard_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/welcome_page.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = Theme.of(context);

    bool isDark = Get.isDarkMode;
    return Scaffold(
      appBar: CustomAppBar(
        isBackButton: true,
        onBackButtonPressed: _onBackButtonPressed,
        title: Text(
          "Payments",
          style: theme.textTheme.bodyText1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: _PaymentScreenBody(),
    );
  }

  void _onBackButtonPressed() {
    ExtendedNavigator.root.pop();
  }
}

class _NextPaymentsActionWidget extends StatelessWidget {
  const _NextPaymentsActionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nextPayment = "100000";
    String nextPaymentDate = "28 February";
    return Builder(builder: (context) {
      final theme = Theme.of(context);
      return Container(
        child: Column(
          children: [
            Text(
              "Next payment " + convertCurrency(nextPayment),
              style: theme.textTheme.bodyText2
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "before " + nextPaymentDate,
              style: theme.textTheme.bodyText2.copyWith(fontSize: 12),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                color: theme.colorScheme.primary,
                child: Text("Pay"),
                onPressed: () {})
          ],
        ),
      );
    });
  }
}

class _PaymentScreenBody extends StatefulWidget {
  const _PaymentScreenBody({
    Key key,
  }) : super(key: key);

  @override
  _PaymentScreenBodyState createState() => _PaymentScreenBodyState();
}

class _PaymentScreenBodyState extends State<_PaymentScreenBody>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<String> _tabs = <String>["Transactions", "Activities"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    bool isDark = Get.isDarkMode;
    return NestedScrollView(
      headerSliverBuilder: (context, _) {
        return [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: <Widget>[
                _PaymentsCardWidget(),
                SizedBox(
                  height: 24,
                ),
                _NextPaymentsActionWidget(),
                SizedBox(
                  height: 24,
                )
              ],
            )
          ]))
        ];
      },
      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            indicatorPadding:
                const EdgeInsets.only(bottom: 4, left: 2, right: 16),
            indicatorColor: AppColors.kYellowLight,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: theme.colorScheme.onBackground,
            unselectedLabelColor:
                isDark ? AppColors.kbDarkGrey : AppColors.kbDarkestGrey,
            labelStyle: theme.textTheme.bodyText1
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelStyle: theme.textTheme.bodyText1
                .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
            tabs: _tabs
                .map((String name) => Tab(
                      text: name,
                    ))
                .toList(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // GridView.count(
                  //   padding: EdgeInsets.zero,
                  //   crossAxisCount: 3,
                  //   children: Colors.primaries.map((color) {
                  //     return Container(color: color, height: 150.0);
                  //   }).toList(),
                  // ),
                  _transactionsWidget(),
                  _activitiesWidget(),
                  // ListView(
                  //   padding: EdgeInsets.zero,
                  //   children: Colors.primaries.map((color) {
                  //     return Container(color: color, height: 150.0);
                  //   }).toList(),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionsWidget() {
    bool isDarkTheme = Get.isDarkMode;
    return Consumer(builder: (context, watch, child) {
      final snapshot = watch(transactionsProvider);
      return snapshot.map(
          data: (_) => Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, bottom: 40, right: 8, left: 8),
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

        );
  }

  Widget _activitiesWidget() {
    bool isDarkTheme = Get.isDarkMode;
    return Consumer(builder: (context, watch, child) {
      final snapshot = watch(activitiesProvider);
      final theme = Theme.of(context);
      return snapshot.map(
          data: (_) => Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, bottom: 40, right: 8, left: 8),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.value.length < 10
                        ? snapshot.data.value.length
                        : 10,
                    itemBuilder: (context, index) {
                      return OpenContainer(
                        openBuilder: (context, closedContainer) {
                          return WelcomePage();
                        },
                        openColor: theme.cardColor,
                        closedShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        closedElevation: 0,
                        closedColor: theme.cardColor,
                        closedBuilder: (context, openContainer) {
                          return InkWell(
                            onTap: () {
                              print("do action here");
                              openContainer();
                            },
                            child:  itemTile(
                            item: snapshot.data.value[index],
                            context: context,
                            isDarkTheme: isDarkTheme),
                          );
                        },
                      );
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

        );
  }
}

class _TransactionsAndActivitiesWidget extends StatefulWidget {
  const _TransactionsAndActivitiesWidget({
    Key key,
  }) : super(key: key);

  @override
  _TransactionsAndActivitiesWidgetState createState() =>
      _TransactionsAndActivitiesWidgetState();
}

class _TransactionsAndActivitiesWidgetState
    extends State<_TransactionsAndActivitiesWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Get.isDarkMode;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Text(
                "Tabbar with out Appbar",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            color: Colors.blue,
          ),
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red,
            tabs: [
              Tab(
                text: '1st tab',
              ),
              Tab(
                text: '2 nd tab',
              )
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(child: Center(child: Text('people'))),
                Text('Person')
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentsCardWidget extends StatelessWidget {
  const _PaymentsCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: isDark
            ? Theme.of(context).colorScheme.surface
            : AppColors.kbSmokedWhite,
      ),
      child: Container(
        child: LayoutBuilder(builder: (context, constrains) {
          print(constrains.maxWidth);

          return Container(
              width: constrains.maxWidth * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Total Paid",
                      style: theme.textTheme.bodyText2,
                    ),
                    Text(convertCurrency("3100000"),
                        style: theme.textTheme.headline1
                            .copyWith(color: theme.colorScheme.onBackground)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        width: constrains.maxWidth * 0.15,
                        height: 2,
                        color: theme.dividerColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Star Coins Balance",
                        style: theme.textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(HelloIcons.star_bold_icon,
                              color: AppColors.kbPrimaryYellow, height: 24),
                          Text("1920",
                              style: theme.textTheme.headline3.copyWith(
                                  color: theme.colorScheme.onBackground))
                        ],
                      ),
                    )
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
