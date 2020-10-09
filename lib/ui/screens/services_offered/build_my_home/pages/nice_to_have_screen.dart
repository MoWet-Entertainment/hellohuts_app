import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';
import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

class NiceToHaveDetailsBody extends StatelessWidget {
  final PageController pageController;

  const NiceToHaveDetailsBody({Key key, @required this.pageController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    ScreenUtil.init(context, designSize: Size(375.0, 801.0));
    return Container(
      width: fullWidth(context),
      color: AppColors.kPureWhite,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            _KitchenDecorTypeSelectSection(),
            _InteriorDecorTypeSelectSection(),
            _ExteriorDecorTypeSelectSection(),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: fullHeight(context) * 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 12),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.kPrimaryDarkBlue,
                    child: Text(
                      "Calculate Rate",
                      style: AppThemes.normalTextStyle.copyWith(
                          fontSize: 14, color: AppColors.kAccentColor),
                    ),
                    onPressed: () => {
                          print("User Wants to Calculate the Rate"),
                          ExtendedNavigator.root.push(Routes.costEstimateScreen),
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KitchenDecorTypeSelectSection extends StatelessWidget {
  const _KitchenDecorTypeSelectSection({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return ItemTypeSelectSection(
      nameOfTheSection: "Kitchen Decor",
      selectedItem: state.kitchenDecorTypeSelected,
      detailsList: [
        ItemSelectionModel(
            optionName: "None",
            optionType: CustomizeOptions.None,
            selectedItem: state.kitchenDecorTypeSelected,
            onTap: () =>
                {state.setKitchenDecorTypeSelected = CustomizeOptions.None}),
        ItemSelectionModel(
            optionName: "Basic",
            optionType: CustomizeOptions.Basic,
            selectedItem: state.kitchenDecorTypeSelected,
            onTap: () =>
                {state.setKitchenDecorTypeSelected = CustomizeOptions.Basic}),
        ItemSelectionModel(
            optionName: "Standard",
            optionType: CustomizeOptions.Standard,
            selectedItem: state.kitchenDecorTypeSelected,
            onTap: () => {
                  state.setKitchenDecorTypeSelected = CustomizeOptions.Standard
                }),
        ItemSelectionModel(
            optionName: "Classic",
            optionType: CustomizeOptions.Classic,
            selectedItem: state.kitchenDecorTypeSelected,
            onTap: () =>
                {state.setKitchenDecorTypeSelected = CustomizeOptions.Classic}),
      ],
    );
  }
}

class _InteriorDecorTypeSelectSection extends StatelessWidget {
  const _InteriorDecorTypeSelectSection({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return ItemTypeSelectSection(
      nameOfTheSection: "Interior Decor",
      selectedItem: state.interiorDecorTypeSelected,
      detailsList: [
        ItemSelectionModel(
            optionName: "None",
            optionType: CustomizeOptions.None,
            selectedItem: state.interiorDecorTypeSelected,
            onTap: () =>
                {state.setInteriorDecorTypeSelected = CustomizeOptions.None}),
        ItemSelectionModel(
            optionName: "Basic",
            optionType: CustomizeOptions.Basic,
            selectedItem: state.interiorDecorTypeSelected,
            onTap: () =>
                {state.setInteriorDecorTypeSelected = CustomizeOptions.Basic}),
        ItemSelectionModel(
            optionName: "Standard",
            optionType: CustomizeOptions.Standard,
            selectedItem: state.interiorDecorTypeSelected,
            onTap: () => {
                  state.setInteriorDecorTypeSelected = CustomizeOptions.Standard
                }),
        ItemSelectionModel(
            optionName: "Classic",
            optionType: CustomizeOptions.Classic,
            selectedItem: state.interiorDecorTypeSelected,
            onTap: () => {
                  state.setInteriorDecorTypeSelected = CustomizeOptions.Classic
                }),
      ],
    );
  }
}

class _ExteriorDecorTypeSelectSection extends StatelessWidget {
  const _ExteriorDecorTypeSelectSection({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return ItemTypeSelectSection(
      nameOfTheSection: "Exterior Decor",
      selectedItem: state.exteriorDecorTypeSelected,
      detailsList: [
        ItemSelectionModel(
            optionName: "None",
            optionType: CustomizeOptions.None,
            selectedItem: state.exteriorDecorTypeSelected,
            onTap: () =>
                {state.setExteriorDecorTypeSelected = CustomizeOptions.None}),
        ItemSelectionModel(
            optionName: "Basic",
            optionType: CustomizeOptions.Basic,
            selectedItem: state.exteriorDecorTypeSelected,
            onTap: () =>
                {state.setExteriorDecorTypeSelected = CustomizeOptions.Basic}),
        ItemSelectionModel(
            optionName: "Standard",
            optionType: CustomizeOptions.Standard,
            selectedItem: state.exteriorDecorTypeSelected,
            onTap: () => {
                  state.setExteriorDecorTypeSelected = CustomizeOptions.Standard
                }),
        ItemSelectionModel(
            optionName: "Classic",
            optionType: CustomizeOptions.Classic,
            selectedItem: state.exteriorDecorTypeSelected,
            onTap: () => {
                  state.setExteriorDecorTypeSelected = CustomizeOptions.Classic
                }),
      ],
    );
  }
}