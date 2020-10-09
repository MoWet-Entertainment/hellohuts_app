import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class CostEstimateScreen extends StatelessWidget {
  const CostEstimateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<CostEstimateState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: AppColors.kPureWhite),
          child: SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.kPureWhite,
                appBar: CustomAppBar(
                  isBackButton: true,
                  onBackButtonPressed: ExtendedNavigator.of(context).pop,
                ),
                body: _CostEstimateScreenBody()),
          ),
        ),
      ),
    );
  }
}

class _CostEstimateScreenBody extends StatelessWidget {
  const _CostEstimateScreenBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      child: Column(
        children: [Text("Based on your selections,")],
      ),
    );
  }
}
