import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:provider/provider.dart';

class CostEstimateScreen extends StatelessWidget {
  const CostEstimateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var state = Provider.of<CostEstimateState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
              body: SafeArea(
          child: Scaffold(
              appBar: CustomAppBar(
                isBackButton: true,
                onBackButtonPressed: ExtendedNavigator.of(context).pop,
              ),
              body: _CostEstimateScreenBody()),
        ),
      ),
    );
  
  }
}

class _CostEstimateScreenBody extends StatelessWidget {
  const _CostEstimateScreenBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:Text("Cost Estimate Screen"),
      ),
    );
  }
}