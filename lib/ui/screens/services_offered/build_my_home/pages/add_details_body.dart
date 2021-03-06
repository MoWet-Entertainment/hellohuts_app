import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_style_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/number_picker.dart';
import 'package:hellohuts_app/ui/common_widgets/scroll_behavior/neat_scroll_behavior.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:provider/provider.dart';

class AddDetailsBody extends StatelessWidget {
  final PageController pageController;

  AddDetailsBody({Key key, @required this.pageController});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = Provider.of<CostEstimateState>(context);
    return Container(
      width: fullWidth(context),
      color: theme.colorScheme.background,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ScrollableColumn(
          shrinkWrap: true,
          children: [
            _StoreySelectionSection(),
            _BedroomSelectionSection(),
            _BathroomSelectionSection(),
            _OtherDetailsSelectionSection(),
            // Expanded(
            //     child: Container(
            //     constraints: BoxConstraints(
            //       maxHeight: fullHeight(context) * 0.1,
            //     ),
            //     ),
            // ),
          ],
        ),
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
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Storey",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
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
    final theme = Theme.of(context);
    final state = Provider.of<CostEstimateState>(context);
    final bool isSelected = state.selectedNumberOfStoryes == widget.storeyCount;
    final bool isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8.0),
                curve: Curves.bounceInOut,
                height: isSelected ? 73 : 72,
                width: isSelected ? 73 : 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: isSelected
                      ? theme.colorScheme.secondary
                      : theme.colorScheme.secondaryVariant,
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
                            style: theme.textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: isSelected
                                    ? theme.colorScheme.onSecondary
                                    : theme.colorScheme.onBackground),
                            textAlign: TextAlign.start),
                        Text(
                          widget.storeyTextSecondLine,
                          overflow: TextOverflow.ellipsis,
                          style:
                              theme.textTheme.bodyText2.copyWith(fontSize: 12),
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
                    color: AppColors.kbDarkGreen,
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
      AppColors.kbPrimaryYellow,
      AppColors.kbDarkRed,
      AppColors.kbPrimaryDarkBlue
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
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Bedrooms",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16))),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              new NumberPicker.horizontal(
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
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Bathrooms",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16))),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              new NumberPicker.horizontal(
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
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
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
    final state = Provider.of<CostEstimateState>(context);
    final theme = Theme.of(context);
    final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);
    double widthOfContainer = (fullWidth(context) - (2 * 32) - (2 * 8)) / 3;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _OtherDetailsContainerWidget(
            width: widthOfContainer,
            details: state.pack1,
            packId: 1,
            onTap: () => {
              state.setSelectedPack = 1,
              state.setIsCustomOtherDetails = false,
              state.resetCustomDetail,
            },
          ),
          _OtherDetailsContainerWidget(
            width: widthOfContainer,
            details: state.pack2,
            packId: 2,
            onTap: () => {
              state.setSelectedPack = 2,
              state.setIsCustomOtherDetails = false,
              state.resetCustomDetail,
            },
          ),
          state.isCustomOtherDetails && state.selectedDetailsItems.length != 0
              ? _OtherDetailsContainerWidget(
                  width: widthOfContainer,
                  details: state.selectedDetailsItems,
                  packId: 3,
                  onTap: () => {
                    state.setSelectedPack = 3,
                    state.setIsCustomOtherDetails = true,
                    _showCustomBottomSheet(context),
                  },
                )
              : Column(children: [
                  GestureDetector(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: widthOfContainer,
                      height: 115,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      decoration: BoxDecoration(
                        color: state.selectedPack == 3
                            ? theme.colorScheme.secondary
                            : theme.colorScheme.secondaryVariant,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            customIconSquare(
                                iconAsset: HelloIcons.plus_light_icon,
                                iconColor: theme.colorScheme.onBackground,
                                iconSize: 24,
                                backgroundColor: state.selectedPack == 3
                                    ? theme.colorScheme.secondary
                                    : theme.colorScheme.secondaryVariant,
                                backgroundSize: 24),
                            Text(
                              "Custom",
                              style: theme.textTheme.bodyText2
                                  .copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      // state.setSelectedPack = 3;
                      // state.setIsCustomOtherDetails = true;
                      state.resetCustomDetail();
                      _showCustomBottomSheet(context);
                      print("Custom");
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        color: AppColors.kbDarkGreen,
                        curve: Curves.fastOutSlowIn,
                        height: 2.0,
                        width: state.selectedPack == 3 ? 32.0 : 0,
                      ))
                ])
        ],
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context,
      {List<Widget> listOfWidgets}) {
    var state = Provider.of<CostEstimateState>(context, listen: false);
    final theme = Theme.of(context);
    state.setIsCustomOtherDetails = true;
    if (GetPlatform.isAndroid || GetPlatform.isIOS || GetPlatform.isMobile) {
      print("platform is mobile");
      changeStatusColor(Colors.transparent);
    }
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
                padding: EdgeInsets.only(top: 8, bottom: 0),
                // height: fullHeight(context) * 0.9,
                width: fullWidth(context),
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: fullWidth(context) * .15,
                      height: 5,
                      decoration: BoxDecoration(
                        color: theme.dividerColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("Custom Select",
                                  style: theme.textTheme.headline2.copyWith(
                                      color: theme.colorScheme.onBackground
                                          .withOpacity(0.8)))),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        MultiSelectChip(
                          itemList: state.listForCustomSelection,
                          alreadySelected: state.selectedDetailsItems,
                          onSelectionChanged: (list) {
                            state.setSelectedDetailsItems = list;
                          },
                        ),
                        SizedBox(height: 32),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 32, right: 16),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: fullWidth(context) * 0.3,
                                  maxHeight: 40,
                                  minHeight: 40,
                                  minWidth: 60,
                                ),
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.kbDarkGreen.withOpacity(0.2),
                                    // border: Border.all(
                                    //     color: AppColors.kDarkGreen, width: 1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: Text(
                                  "Done",
                                  style: AppThemes.normalTextStyle.copyWith(
                                      fontSize: 14,
                                      color: AppColors.kbDarkGreen,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }).whenComplete(() {
      if (state.selectedDetailsItems.length != 0 &&
          state.isCustomOtherDetails) {
        state.setSelectedPack = 3;
      } else {
        state.setSelectedPack = state.lastSelectedPack;
      }
      changeStatusColor(Theme.of(context).colorScheme.background);
    });
  }
}

class _OtherDetailsContainerWidget extends StatelessWidget {
  final double width;
  final int packId;
  final List<String> details;
  final GestureTapCallback onTap;
  _OtherDetailsContainerWidget(
      {Key key, this.width, this.details, this.packId, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<CostEstimateState>(context);
    final theme = Theme.of(context);
    final bool isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);
    return Column(
      children: [
        GestureDetector(
            child: CupertinoScrollbar(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: width ?? 80,
                constraints: BoxConstraints(minHeight: 115, maxHeight: 130),
                padding: const EdgeInsets.only(
                    left: 8, right: 12, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: state.selectedPack == packId
                      ? (isDarkTheme
                          ? theme.colorScheme.secondary.withOpacity(0.5)
                          : theme.colorScheme.secondary)
                      : theme.colorScheme.secondaryVariant,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ScrollConfiguration(
                  behavior: NeatScrollBehavior(),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: _getDetailedListWidget(details, context),
                  ),
                ),
              ),
            ),
            onTap: onTap),
        SizedBox(
          height: 8.0,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              color: AppColors.kbDarkGreen,
              curve: Curves.fastOutSlowIn,
              height: 2.0,
              width: state.selectedPack == packId ? 32.0 : 0,
            ))
      ],
    );
  }

  List<Widget> _getDetailedListWidget(
      List<String> items, BuildContext context) {
    final theme = Theme.of(context);
    List<Widget> list = [];
    for (String item in items) {
      list.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilledCircle(size: 4.0, color: theme.colorScheme.onBackground),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              item,
              style: theme.textTheme.bodyText2.copyWith(
                fontSize: 12,
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
