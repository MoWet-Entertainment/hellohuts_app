import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/ui/common_widgets/number_picker.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
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
              // actions: Padding(
              //   padding: EdgeInsets.only(right: 24),
              //   child: Align(
              //       alignment: Alignment.centerRight,
              //       child: Text(
              //         "Reset",
              //         style: AppThemes.normalTextStyle.copyWith(
              //             fontSize: 14, color: AppColors.kDarkTextColor),
              //       )),
              // ),
              // onActionPressed: () => {
              //   costEstimateState.resetAddDetailsPage()},
              onBackButtonPressed: () => {
                costEstimateState.resetAddDetailsPage(),
                ExtendedNavigator.of(context).pop()
              },
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
                  height: 4,
                ),
                _StoreySelectionSection(),
                SizedBox(
                  height: 24,
                ),
                _BedroomSelectionSection(),
                SizedBox(
                  height: 24,
                ),
                _BathroomSelectionSection(),
                SizedBox(
                  height: 24,
                ),
                _OtherDetailsSelectionSection(),
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
        onTap: () => {state.setNumberOfStoreys = widget.storeyCount});
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

class _BedroomSelectionSection extends StatelessWidget {
  _BedroomSelectionSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<CostEstimateState>(context);
    int _currentValue = state.selectedNumberOfBedrooms;
    var width = fullWidth(context);
    ScreenUtil.init(context, designSize: Size(375.0, 801.0));
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Bedrooms",
                  style: AppThemes.normalTextStyle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16))),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              NumberPicker.horizontal(
                highlightSelectedValue: true,
                initialValue: _currentValue,
                itemExtent: 60,
                minValue: 1,
                maxValue: 12,
                step: 1,
                listViewHeight: 60,
                haptics: true,
                zeroPad: true,
                onChanged: (value) {
                  state.setNumberOfBedrooms = value;
                },
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}

class _BathroomSelectionSection extends StatelessWidget {
  _BathroomSelectionSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<CostEstimateState>(context);
    int _currentValue = state.selectedNumberOfBathrooms;
    ScreenUtil.init(context, designSize: Size(375.0, 801.0));
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Bathrooms",
                  style: AppThemes.normalTextStyle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16))),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              NumberPicker.horizontal(
                highlightSelectedValue: true,
                initialValue: _currentValue,
                itemExtent: 60,
                minValue: 1,
                maxValue: 12,
                step: 1,
                listViewHeight: 60,
                haptics: true,
                zeroPad: true,
                onChanged: (value) {
                  state.setNumberOfBathrooms = value;
                },
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}

class _OtherDetailsSelectionSection extends StatelessWidget {
  const _OtherDetailsSelectionSection({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Other Details",
                  style: AppThemes.normalTextStyle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16))),
          SizedBox(
            height: 16.h,
          ),
          _OtherDetailsContainer(),
        ],
      ),
    );
  }
}

class _OtherDetailsContainer extends StatelessWidget {
  _OtherDetailsContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthOfContainer = (fullWidth(context) - (2 * 40) - (2 * 20)) / 3;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _OtherDetailsContainerWidget(
            width: widthOfContainer,
            details: pack1,
            packId: 1,
          ),
          _OtherDetailsContainerWidget(
            width: widthOfContainer,
            details: pack2,
            packId: 2,
          ),
          Container(
            width: widthOfContainer,
            height: 115,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.kAliceBlue,
              borderRadius: BorderRadius.circular(12.0),
            ),
          )
        ],
      ),
    );
  }

  final List<String> pack1 = [
    "Kitchen",
    "Living Room",
    "Dining Room",
    "Porch",
    "Sitout",
    "Store Room"
  ];

  final List<String> pack2 = [
    "Kitchen",
    "Living + Dining Room",
    "Porch",
    "Sitout",
    "Balcony",
  ];
}

class _OtherDetailsContainerWidget extends StatelessWidget {
  final double width;
  final int packId;
  final List<String> details;
  _OtherDetailsContainerWidget({Key key, this.width, this.details, this.packId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<CostEstimateState>(context);
    return Column(
      children: [
        GestureDetector(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: width ?? 80,
            height: 115,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: state.getSelectedPack == packId
                  ? AppColors.kLavender
                  : AppColors.kAliceBlue,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ScrollConfiguration(
              behavior: NeatScrollBehavior(),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
                children: _getDetailedListWidget(details),
              ),
            ),
          ),
          onTap: () {
            state.setSelectedPack = packId;
          },
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
                    width: state.getSelectedPack == packId
                        ? 32.0
                        : 0,
                  ))
        
      ],
    );
  }

  List<Widget> _getDetailedListWidget(List<String> items) {
    List<Widget> list = [];
    for (String item in items) {
      list.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilledCircle(
            size: 4.0,
            color: AppColors.kDarkTextColor,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              item,
              style: AppThemes.normalSecondaryTextStyle.copyWith(
                color: AppColors.kDarkTextColor,
                fontSize: 10,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ));
    }
    return list;
  }
}
