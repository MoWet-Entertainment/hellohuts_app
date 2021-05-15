import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/states/collect_details_states/cost_estimate_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:provider/provider.dart';

class CostEstimatePage extends StatelessWidget {
  const CostEstimatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<CostEstimateState>(context);
    final theme = Theme.of(context);
    return AnnotatedSafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: CustomAppBar(
          isBackButton: true,
          onBackButtonPressed: ExtendedNavigator.of(context).pop,
        ),
        body: _CostEstimateScreenBody(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24, top: 12, bottom: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text(
                  "Connect with HelloTeam",
                  style: AppThemes.normalTextStyle.copyWith(
                      color: AppColors.kbPrimaryYellow,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                color:Theme.of(context).colorScheme.primary,
                onPressed: () {
                  //TODO: Add onPressed action whhen user clicks on Connect with HelloTeam button
                },
              ),
            ],
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
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ScrollableColumn(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Based on your selections,",
                  style: theme.textTheme.bodyText1
                      .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                ),
                Text(
                  "We've got the best rate for you!",
                  style: theme.textTheme.bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          RoundedContainer(
              borderRadius: 20,
              backgroundColor: theme.colorScheme.secondaryVariant,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: fullHeight(context) * 0.25,
                  minHeight: 150,
                  minWidth: fullWidth(context) - 100,
                ),
                child: Stack(
                  children: [
                    Positioned(
                        right: 24,
                        top: 16,
                        child: Opacity(
                            opacity: 0.7,
                            child:
                                SvgPicture.asset(Assets.colored_circles_svg))),
                    Positioned(
                      left: -16,
                      bottom: -68,
                      child: Opacity(
                        opacity: 0.5,
                        child: SvgPicture.asset(
                          Assets.colored_circles_svg,
                          height: 128,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 130,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "starts from",
                              style: theme.textTheme.bodyText1
                                  .copyWith(fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  "₹",
                                  style: theme.textTheme.headline4
                                      .copyWith(fontSize: 24),
                                ),
                                Text("1885",
                                    style: theme.textTheme.headline1.copyWith(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                              ],
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "per sq.ft",
                                  style: theme.textTheme.bodyText1
                                      .copyWith(fontSize: 16),
                                )),
                            SizedBox(
                              height: 4,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "with ",
                                    style: theme.textTheme.bodyText1
                                        .copyWith(fontSize: 12),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: "HelloPro Builders",
                                      style: theme.textTheme.bodyText1.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ]))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 24.h,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Features",
                  style: theme.textTheme.bodyText1
                      .copyWith(fontSize: 14, color: AppColors.kbDarkGrey),
                ),
                SizedBox(
                  height: 12,
                ),
                TitleSubTitleText(
                  title: "Realtime Project Tracking with Hellohuts app ",
                  subTitle:
                      "Monitor your projects’ progress anywhere, anytime!",
                ),
                SizedBox(
                  height: 12,
                ),
                TitleSubTitleText(
                  title: "HelloCare Support",
                  subTitle: "Connect with HelloCare executive for support",
                ),
                SizedBox(
                  height: 12,
                ),
                TitleSubTitleText(
                  title: "Flexibility",
                  subTitle: "Easily upgrade with a clear-cut view on cost",
                ),
                SizedBox(
                  height: 12,
                ),
                TitleSubTitleText(
                  title: "Welcome offers",
                  subTitle: "upto  ₹50,000* cashback upon project completion",
                ),
                SizedBox(
                  height: 12,
                ),
                TitleSubTitleText(
                  title: "5 Year HelloCare  Extensive Warranty",
                  subTitle: "Long term support, even after project completion",
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 54.h,
          ),
        ],
      ),
    );
  }
}

class TitleSubTitleText extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  const TitleSubTitleText(
      {Key key,
      this.title = "",
      this.subTitle = "",
      this.titleStyle,
      this.subTitleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              theme.textTheme.bodyText1
                  .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          subTitle,
          style: subTitleStyle ??
            theme.textTheme.bodyText2
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
