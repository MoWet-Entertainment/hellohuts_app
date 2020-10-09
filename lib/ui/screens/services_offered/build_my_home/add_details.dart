import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/pages/add_details_body.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/pages/customize_screen.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/pages/nice_to_have_screen.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/widgets.dart';
import 'package:provider/provider.dart';

import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class AddDetailsForHome extends StatefulWidget {
  const AddDetailsForHome({Key key}) : super(key: key);

  @override
  _AddDetailsForHomeState createState() => _AddDetailsForHomeState();
}

class _AddDetailsForHomeState extends State<AddDetailsForHome> {
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
    return WillPopScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark
                  .copyWith(statusBarColor: Colors.transparent),
              child: SafeArea(
                child: Scaffold(
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
                              style: AppThemes.normalTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.kDarkTextColor),
                            )
                          : costEstimateState.pageIndexOfCollectSection == 1
                              ? Text(
                                  "Customize",
                                  style: AppThemes.normalTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColors.kDarkTextColor),
                                  key: ValueKey<int>(1),
                                )
                              : costEstimateState.pageIndexOfCollectSection == 2
                                  ? Text(
                                      "Nice to Have",
                                      style: AppThemes.normalTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: AppColors.kDarkTextColor),
                                      key: ValueKey<int>(2),
                                    )
                                  : Text("", key: ValueKey<int>(3)),
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
                                  child: Text(
                                    "Reset",
                                    style: AppThemes.normalTextStyle.copyWith(
                                        fontSize: 14,
                                        color: AppColors.kDarkTextColor),
                                  )),
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
                          ExtendedNavigator.of(context).pop()}
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
                  bottomNavigationBar: AddDetailsProgressIndicator(),
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
              ),
            ),
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

class AddDetailsProgressIndicator extends StatelessWidget {
  const AddDetailsProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    ScreenUtil.init(context, designSize: Size(375.0, 801.0));
    final screenWidth = fullWidth(context);
    final widthExtent = (screenWidth * 0.8) / 4;
    return Container(
      width: screenWidth,
      height: 60,
      color: AppColors.kPureWhite,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 2.0,
            color: AppColors.kDarkGrey,
            width: widthExtent * 4,
          ),
          Positioned(
            left: widthExtent,
            child: FilledCircle.animated(
              size: state.pageIndexOfCollectSection == 1 ? 26 : 24,
              color: state.pageIndexOfCollectSection == 0
                  ? AppColors.kPrimaryYellow
                  : AppColors.kPrimaryDarkBlue,
              child: Center(
                child: Text("1",
                    style: AppThemes.normalSecondaryTextStyle
                        .copyWith(fontSize: 12, color: AppColors.kPureWhite)),
              ),
            ),
          ),
          Positioned(
            left: 2 * widthExtent,
            child: FilledCircle.animated(
              size: 24,
              color: state.pageIndexOfCollectSection == 1
                  ? AppColors.kPrimaryYellow
                  : AppColors.kPrimaryDarkBlue,
              child: Center(
                child: Text("2",
                    style: AppThemes.normalSecondaryTextStyle
                        .copyWith(fontSize: 12, color: AppColors.kPureWhite)),
              ),
            ),
          ),
          Positioned(
            left: 3 * widthExtent,
            child: FilledCircle.animated(
              size: state.pageIndexOfCollectSection == 2 ? 26 : 24,
              color: state.pageIndexOfCollectSection == 2
                  ? AppColors.kPrimaryYellow
                  : AppColors.kPrimaryDarkBlue,
              child: Center(
                child: Text("3",
                    style: AppThemes.normalSecondaryTextStyle
                        .copyWith(fontSize: 12, color: AppColors.kPureWhite)),
              ),
            ),
          ),
          Positioned(
            left: 4 * widthExtent,
            child: FilledCircle.animated(
              size: state.pageIndexOfCollectSection == 3 ? 26 : 24,
              color: AppColors.kDarkGrey,
              child: Center(
                child: Image.asset(
                  HelloIcons.home_bold_icon,
                  height: 14,
                  color: AppColors.kPureWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
