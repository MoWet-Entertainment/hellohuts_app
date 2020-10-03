import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/states/cost_estimate_state.dart';
import 'package:hellohuts_app/states/search_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

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
              title: Text("Add Details",style: AppThemes.normalTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.kDarkTextColor),),
              actions: Padding(
                padding: EdgeInsets.only(right:24),
                              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Reset",style: AppThemes.normalTextStyle.copyWith(fontSize: 14, color: AppColors.kDarkTextColor),)),
              ),
              onActionPressed: costEstimateState.resetAddDetailsPage ,
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
    return Container(
      width: fullWidth(context),
      color: AppColors.kPureWhite,
      child:Column(
children: [
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Column(children: [
        SizedBox(height: 12,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Storey",style:AppThemes.normalTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16))),
          Row(children: [
           
          ],)
    ],),
  )
],
      ),
    );
  }
}