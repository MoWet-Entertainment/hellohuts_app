import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:hellohuts_app/states/cost_estimate_state.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';

class AddDetailsForHome extends StatelessWidget {
  const AddDetailsForHome({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    var state = Provider.of<SearchState>(context);
    var costEstimateState = Provider.of<CostEstimateState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              isBackButton: true,
              centerTitle: true,
              title: Text(
                "Add Details",
                style: AppThemes.normalTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.kDarkTextColor),
              ),
              actions: Padding(
                padding: EdgeInsets.only(right: 24),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Reset",
                      style: AppThemes.normalTextStyle.copyWith(
                          fontSize: 14, color: AppColors.kDarkTextColor),
                    )),
              ),
              onActionPressed: costEstimateState.resetAddDetailsPage,
              onBackButtonPressed: ExtendedNavigator.of(context).pop,
            ),
            body: _AddDetailsBody()),
      ),
    );
  }
}

class _AddDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375.0, 801.0));
    return Container(
      width: fullWidth(context),
      color: AppColors.kPureWhite,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                _StoreySelectionSection(),
                SizedBox(
                  height: 32,
                ),
                _BedroomSelectionSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _StoreySelectionSection extends StatelessWidget {
  const _StoreySelectionSection({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Storey",
                  style: AppThemes.normalTextStyle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16))),
          SizedBox(
            height: 16.h,
          ),
          _StoreyContainer(),
        ],
      ),
    );
  }
}

class _StoreyContainer extends StatelessWidget {
  const _StoreyContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _StoreyContainerWidget(
          storeyCount: 1,
          storeyTextFirstLine: "Single",
          storeyTextSecondLine: "Storey",
        ),
        _StoreyContainerWidget(
          storeyCount: 2,
          storeyTextFirstLine: "Double",
          storeyTextSecondLine: "Storey",
        ),
        _StoreyContainerWidget(
          storeyCount: 3,
          storeyTextFirstLine: "Triple",
          storeyTextSecondLine: "Storey",
        ),
      ]),
    );
  }
}

class _StoreyContainerWidget extends StatefulWidget {
  const _StoreyContainerWidget({
    Key key,
    this.storeyCount,
    this.storeyTextFirstLine = "",
    this.storeyTextSecondLine = "",
  }) : super(key: key);
  @required
  final int storeyCount;
  final String storeyTextFirstLine;
  final String storeyTextSecondLine;

  @override
  __StoreyContainerWidgetState createState() => __StoreyContainerWidgetState();
}

class __StoreyContainerWidgetState extends State<_StoreyContainerWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8.0),
                curve: Curves.bounceInOut,
                height: state.selectedNumberOfStoryes == widget.storeyCount
                    ? 73
                    : 72,
                width: state.selectedNumberOfStoryes == widget.storeyCount
                    ? 73
                    : 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: state.selectedNumberOfStoryes == widget.storeyCount
                      ? AppColors.kLavender
                      : AppColors.kAliceBlue,
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._getCircleIndicatorWidgets(widget.storeyCount),
                          ],
                        )),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.storeyTextFirstLine,
                            overflow: TextOverflow.ellipsis,
                            style: AppThemes.normalSecondaryTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 12),
                            textAlign: TextAlign.start),
                        Text(
                          widget.storeyTextSecondLine,
                          overflow: TextOverflow.ellipsis,
                          style: AppThemes.normalSecondaryTextStyle
                              .copyWith(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    color: AppColors.kDarkGreen,
                    curve: Curves.fastOutSlowIn,
                    height: 2.0,
                    width: state.selectedNumberOfStoryes == widget.storeyCount
                        ? 24.0
                        : 0,
                  ))
            ],
          ),
        ),
        onTap: () => {state.setSelectedNumberOfStoreys = widget.storeyCount});
  }

  ///Outputs a list of Colours as per the [number] input
  List<Widget> _getCircleIndicatorWidgets(int number) {
    List<Color> _colorsList = [
      AppColors.kPrimaryYellow,
      AppColors.kDarkRed,
      AppColors.kPrimaryDarkBlue
    ];
    List<Widget> _listOfWidgets = [];

    for (int i = number - 1; i >= 0; i--) {
      _listOfWidgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: FilledCircle(
            size: 5.0,
            color: _colorsList[i],
          ),
        ),
      );
    }
    return _listOfWidgets;
  }
}

class _RoomSelectionSection extends StatelessWidget {
  const _RoomSelectionSection(
      {Key key,
      this.roomTypeName,
      this.minVisibleValue,
      this.maxVisibleValue,
      this.minValue,
      this.maxValue})
      : super(key: key);

  ///Example : Bedroom, Bathroom etc
  final String roomTypeName;

///Minimum value to be displayed on the screen when the app launches
  final int minVisibleValue;

  ///Maximum value to be displaed on the screen when the app launches
  final int maxVisibleValue;

  ///Minimum value upto which user can go, manually
  final int minValue;

  ///Maximum value upto which the user can go, manually
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
