import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/pages/add_details_body.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/pages/customize_screen.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/pages/nice_to_have_screen.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/widgets.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:provider/provider.dart';

import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class AddDetailsForHomePage extends StatefulWidget {
  const AddDetailsForHomePage({Key key}) : super(key: key);

  @override
  _AddDetailsForHomePageState createState() => _AddDetailsForHomePageState();
}

class _AddDetailsForHomePageState extends State<AddDetailsForHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int pageIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var costEstimateState = Provider.of<CostEstimateState>(context);
    final theme = Theme.of(context);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          key: _scaffoldKey,
          appBar: CustomAppBar(
            isBackButton: true,
            centerTitle: true,
            title: AnimatedSwitcher(
              switchInCurve: Curves.easeInSine,
              switchOutCurve: Curves.easeOutSine,
              duration: Duration(milliseconds: 500),
              child: costEstimateState.pageIndexOfCollectSection == 0
                  ? Text(
                      "Add Details",
                      style: theme.textTheme.headline3.copyWith(
                          fontSize: 18,
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.9)),
                      key: ValueKey<int>(1),
                    )
                  : costEstimateState.pageIndexOfCollectSection == 1
                      ? Text(
                          "Customize",
                          style: theme.textTheme.headline3.copyWith(
                              fontSize: 18,
                              color: theme.colorScheme.onBackground
                                  .withOpacity(0.9)),
                          key: ValueKey<int>(2),
                        )
                      : costEstimateState.pageIndexOfCollectSection == 2
                          ? Text(
                              "Customize",
                              style: theme.textTheme.headline3.copyWith(
                                  fontSize: 18,
                                  color: theme.colorScheme.onBackground
                                      .withOpacity(0.9)),
                              key: ValueKey<int>(3),
                            )
                          : Text("", key: ValueKey<int>(4)),
            ),
            actions: costEstimateState.pageIndexOfCollectSection != 0
                ? AnimatedSwitcher(
                    switchInCurve: Curves.easeInSine,
                    switchOutCurve: Curves.easeOutSine,
                    duration: Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child:
                              Text("Reset", style: theme.textTheme.bodyText1)),
                    ),
                  )
                : Container(),
            onActionPressed: () => {
              if (costEstimateState.pageIndexOfCollectSection == 1)
                {costEstimateState.resetCustomizePage()}
              else if (costEstimateState.pageIndexOfCollectSection == 2)
                {costEstimateState.resetNiceToHave()}
            },
            onBackButtonPressed: () => {
              // costEstimateState.resetAddDetailsPage(),
              if (costEstimateState.pageIndexOfCollectSection == 0)
                {
                  costEstimateState.resetCostEstimateSectionAllPages(),
                  ExtendedNavigator.of(context).pop()
                }
              else
                {
                  print(costEstimateState.pageIndexOfCollectSection),
                  costEstimateState.setPageIndexOfCollectSection =
                      costEstimateState.pageIndexOfCollectSection - 1,
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOutSine)
                }
            },
          ),
          bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CallToActionButtonCostEstimate(pageController: _pageController),
                AddDetailsProgressIndicator()
              ]),
          body: PageView(
            controller: _pageController,
            onPageChanged: (page) {
              costEstimateState.setPageIndexOfCollectSection = page;
            },
            physics: NeverScrollableScrollPhysics(),
            children: [
              AddDetailsBody(
                pageController: _pageController,
              ),
              CustomizeDetailsBody(
                pageController: _pageController,
              ),
              NiceToHaveDetailsBody(
                pageController: _pageController,
              )
            ],
          ),
        ),
        onWillPop: () {
          if (costEstimateState.pageIndexOfCollectSection == 0) {
            costEstimateState.resetCostEstimateSectionAllPages();
            return Future.sync(() => true);
          } else {
            print(costEstimateState.pageIndexOfCollectSection);
            costEstimateState.setPageIndexOfCollectSection =
                costEstimateState.pageIndexOfCollectSection - 1;
            _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutSine);
            return Future.sync(() => false);
          }
        });
  }
}

class CallToActionButtonCostEstimate extends StatelessWidget {
  const CallToActionButtonCostEstimate({
    Key key,
    @required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    bool isLastPageOfSection =
        state.pageIndexOfCollectSection == state.lastPageIndexOfTheSection
            ? true
            : false;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 12, right: 32),
      child: Align(
        alignment: Alignment.bottomRight,
        child: CupertinoButton(
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.primary,
            child: Text(
              isLastPageOfSection ? "Calculate Rate" : "Next",
              style: theme.textTheme.bodyText1
                  .copyWith(fontSize: 14, color: AppColors.kbAccentColor),
            ),
            onPressed: () => {
                  print("User Clicked Next"),
                  if (!isLastPageOfSection)
                    {
                      state.setPageIndexOfCollectSection =
                          state.pageIndexOfCollectSection + 1,
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOutSine)
                    }
                  else
                    {
                      print("User Wants to Calculate the Rate"),
                      state.calculateRate(),
                      ExtendedNavigator.root.push(Routes.costEstimatePage),
                    }
                }),
      ),
    );
  }
}

class AddDetailsProgressIndicator extends StatelessWidget {
  const AddDetailsProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    final theme = Theme.of(context);
    final screenWidth = fullWidth(context);
    final widthExtent = (screenWidth * 0.8) / 4;
    return Container(
      width: screenWidth,
      height: 60,
      color: theme.colorScheme.background,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 2.0,
            color: AppColors.kbDarkGrey,
            width: widthExtent * 4,
          ),
          Positioned(
            left: widthExtent,
            child: FilledCircle.animated(
              size: state.pageIndexOfCollectSection == 0 ? 26 : 24,
              color: state.pageIndexOfCollectSection == 0
                  ? AppColors.kbPrimaryYellow
                  :AppColors.kbDarkGrey,
              child: Center(
                child: Text("1",
                    style:theme.textTheme.bodyText1
                        .copyWith(fontSize: 12, color: theme.colorScheme.background)),
              ),
            ),
          ),
          Positioned(
            left: 2 * widthExtent,
            child: FilledCircle.animated(
              size:state.pageIndexOfCollectSection == 1 ? 26 : 24,
              color: state.pageIndexOfCollectSection == 1
                  ? AppColors.kbPrimaryYellow
                  : AppColors.kbDarkGrey,
              child: Center(
                child: Text("2",
                    style:theme.textTheme.bodyText1
                        .copyWith(fontSize: 12, color: theme.colorScheme.background)),
              ),
            ),
          ),
          Positioned(
            left: 3 * widthExtent,
            child: FilledCircle.animated(
              size: state.pageIndexOfCollectSection == 2 ? 26 : 24,
              color: state.pageIndexOfCollectSection == 2
                  ? AppColors.kbPrimaryYellow
                  :AppColors.kbDarkGrey,
              child: Center(
                child: Text("3",
                    style:theme.textTheme.bodyText1
                        .copyWith(fontSize: 12, color: theme.colorScheme.background)),
              ),
            ),
          ),
          Positioned(
            left: 4 * widthExtent,
            child: FilledCircle.animated(
              size: 26,
              color: AppColors.kbDarkGrey,
              child: Center(
                child: Image.asset(
                  HelloIcons.home_bold_icon,
                  height: 14,
                  color: AppColors.kbPureWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
