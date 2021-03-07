import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';
import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/pages/add_details_body.dart';
import 'package:hellohuts_app/ui/screens/services_offered/build_my_home/widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

class CustomizeDetailsBody extends StatelessWidget {
  final PageController pageController;

  CustomizeDetailsBody({Key key, @required this.pageController});
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    final theme = Theme.of(context);
    return Container(
      width: fullWidth(context),
      color: theme.colorScheme.background,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ScrollableColumn(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            _BuildingMaterialsSelectSection(),
            _FlooringTypeSelectSection(),
            _ElectricalsTypeSelectSection(),
            _PlumbingTypeSelectSection(),
            _DoorsAndWindowsSelectSection(),
            // Spacer(),
            // Spacer(),
            // Expanded(
            //   child: Container(
            //     constraints: BoxConstraints(
            //       maxHeight: fullHeight(context) * 0.2,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _BuildingMaterialsSelectSection extends StatelessWidget {
  const _BuildingMaterialsSelectSection({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return ItemTypeSelectSection(
      nameOfTheSection: "Building Materials",
      selectedItem: state.buildingMaterialTypeSelected,
      detailsList: [
        ItemSelectionModel(
            optionName: "Budget",
            optionType: CustomizeOptions.Budget,
            selectedItem: state.buildingMaterialTypeSelected,
            onTap: () => {
                  state.setBuildingMaterialTypeSelected =
                      CustomizeOptions.Budget
                }),
        ItemSelectionModel(
            optionName: "Balanced",
            optionType: CustomizeOptions.Balanced,
            selectedItem: state.buildingMaterialTypeSelected,
            onTap: () => {
                  state.setBuildingMaterialTypeSelected =
                      CustomizeOptions.Balanced
                }),
        ItemSelectionModel(
            optionName: "Best",
            optionType: CustomizeOptions.Best,
            selectedItem: state.buildingMaterialTypeSelected,
            onTap: () => {
                  state.setBuildingMaterialTypeSelected = CustomizeOptions.Best
                }),
      ],
    );
  }
}

class _FlooringTypeSelectSection extends StatelessWidget {
  const _FlooringTypeSelectSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return ItemTypeSelectSection(
        nameOfTheSection: "Flooring",
        selectedItem: state.flooringTypeSelected,
        detailsList: [
          ItemSelectionModel(
              optionName: "Budget",
              optionType: CustomizeOptions.Budget,
              selectedItem: state.flooringTypeSelected,
              onTap: () =>
                  {state.setFlooringTypeSelected = CustomizeOptions.Budget}),
          ItemSelectionModel(
              optionName: "Balanced",
              optionType: CustomizeOptions.Balanced,
              selectedItem: state.flooringTypeSelected,
              onTap: () =>
                  {state.setFlooringTypeSelected = CustomizeOptions.Balanced}),
          ItemSelectionModel(
              optionName: "Best",
              optionType: CustomizeOptions.Best,
              selectedItem: state.flooringTypeSelected,
              onTap: () =>
                  {state.setFlooringTypeSelected = CustomizeOptions.Best}),
        ]);
  }
}

class _ElectricalsTypeSelectSection extends StatelessWidget {
  const _ElectricalsTypeSelectSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return ItemTypeSelectSection(
        nameOfTheSection: "Electricals",
        selectedItem: state.electricalsTypeSelected,
        detailsList: [
          ItemSelectionModel(
              optionName: "Budget",
              optionType: CustomizeOptions.Budget,
              selectedItem: state.electricalsTypeSelected,
              onTap: () =>
                  {state.setElectricalsTypeSelected = CustomizeOptions.Budget}),
          ItemSelectionModel(
              optionName: "Balanced",
              optionType: CustomizeOptions.Balanced,
              selectedItem: state.electricalsTypeSelected,
              onTap: () => {
                    state.setElectricalsTypeSelected = CustomizeOptions.Balanced
                  }),
          ItemSelectionModel(
              optionName: "Best",
              optionType: CustomizeOptions.Best,
              selectedItem: state.electricalsTypeSelected,
              onTap: () =>
                  {state.setElectricalsTypeSelected = CustomizeOptions.Best}),
        ]);
  }
}

class _PlumbingTypeSelectSection extends StatelessWidget {
  const _PlumbingTypeSelectSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return ItemTypeSelectSection(
        nameOfTheSection: "Plumbing",
        selectedItem: state.plumbingTypeSelected,
        detailsList: [
          ItemSelectionModel(
              optionName: "Budget",
              optionType: CustomizeOptions.Budget,
              selectedItem: state.plumbingTypeSelected,
              onTap: () =>
                  {state.setPlumbingTypeSelected = CustomizeOptions.Budget}),
          ItemSelectionModel(
              optionName: "Balanced",
              optionType: CustomizeOptions.Balanced,
              selectedItem: state.plumbingTypeSelected,
              onTap: () =>
                  {state.setPlumbingTypeSelected = CustomizeOptions.Balanced}),
          ItemSelectionModel(
              optionName: "Best",
              optionType: CustomizeOptions.Best,
              selectedItem: state.plumbingTypeSelected,
              onTap: () =>
                  {state.setPlumbingTypeSelected = CustomizeOptions.Best}),
        ]);
  }
}

class _DoorsAndWindowsSelectSection extends StatelessWidget {
  const _DoorsAndWindowsSelectSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    return ItemTypeSelectSection(
        nameOfTheSection: "Doors and Windows",
        selectedItem: state.doorsAndWindowsTypeSelected,
        detailsList: [
          ItemSelectionModel(
              optionName: "Budget",
              optionType: CustomizeOptions.Budget,
              selectedItem: state.doorsAndWindowsTypeSelected,
              onTap: () => {
                    state.setDoorsAndWindowsTypeSelected =
                        CustomizeOptions.Budget
                  }),
          ItemSelectionModel(
              optionName: "Balanced",
              optionType: CustomizeOptions.Balanced,
              selectedItem: state.doorsAndWindowsTypeSelected,
              onTap: () => {
                    state.setDoorsAndWindowsTypeSelected =
                        CustomizeOptions.Balanced
                  }),
          ItemSelectionModel(
              optionName: "Best",
              optionType: CustomizeOptions.Best,
              selectedItem: state.doorsAndWindowsTypeSelected,
              onTap: () => {
                    state.setDoorsAndWindowsTypeSelected = CustomizeOptions.Best
                  }),
        ]);
  }
}
