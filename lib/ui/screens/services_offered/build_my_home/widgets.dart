import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';
import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

class RoundedSelectableContainer extends StatelessWidget {
  final CustomizeOptions optionType;
  final String optionName;
  final CustomizeOptions selected;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const RoundedSelectableContainer({
    Key key,
    this.optionType,
    this.optionName,
    this.width,
    this.height,
    this.selected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isSelected = selected == optionType ? true : false;
    final theme = Theme.of(context);
    return GestureDetector(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: const EdgeInsets.all(8.0),
              curve: Curves.bounceInOut,
              height: height ?? 40,
              width: width ?? 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color:
                    _isSelected ? theme.colorScheme.secondary : theme.colorScheme.secondaryVariant,
              ),
              child: Center(
                child: Text(
                  optionName,
                  style:
                   theme.textTheme.bodyText2.copyWith(fontSize: 12),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  color: AppColors.kGreenDark,
                  curve: Curves.fastOutSlowIn,
                  height: 2.0,
                  width: _isSelected ? 24.0 : 0,
                ))
          ],
        ),
        onTap: onPressed);
  }
}

///For resuability of the code,
class ItemSelectionModel {
  final String optionName;
  final CustomizeOptions optionType;
  final CustomizeOptions selectedItem;
  final VoidCallback onTap;

  ItemSelectionModel({
    @required this.optionName,
    @required this.optionType,
    @required this.selectedItem,
    @required this.onTap,
  });
}

class ItemTypeSelectSection extends StatelessWidget {
  final String nameOfTheSection;
  final List<ItemSelectionModel> detailsList;
  final CustomizeOptions selectedItem;

  const ItemTypeSelectSection({
    Key key,
    @required this.nameOfTheSection,
    @required this.detailsList,
    this.selectedItem,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(nameOfTheSection,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16))),
          SizedBox(
            height: 16.h,
          ),
          _CustomSelectItemsBody(
            detailsList: detailsList,
          )
        ],
      ),
    );
  }
}

class _CustomSelectItemsBody extends StatelessWidget {
  final List<ItemSelectionModel> detailsList;
  const _CustomSelectItemsBody({Key key, @required this.detailsList})
      : super(key: key);

  List<Widget> _buildListOfWidget(BuildContext context) {
    final width = (fullWidth(context) - 88.0 - (detailsList.length - 1) * 10) /
        detailsList.length;
    List<Widget> list = [];
    detailsList.forEach((element) {
      list.add(RoundedSelectableContainer(
          width: width,
          optionName: element.optionName,
          optionType: element.optionType,
          selected: element.selectedItem,
          onPressed: element.onTap));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CostEstimateState>(context);
    final _selectedItem = state.buildingMaterialTypeSelected;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildListOfWidget(context),
      ),
    );
  }
}
