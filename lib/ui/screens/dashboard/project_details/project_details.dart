import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/states/dashboard/dashboard_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/rounded_charts/radial_chart.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:hooks_riverpod/all.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);

    return Scaffold(
      appBar: CustomAppBar(
        isBackButton: true,
        onBackButtonPressed: _onBackButtonPressed,
        title: Text(
          "Project Details",
          style: theme.textTheme.bodyText1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: isDark
                      ? Theme.of(context).colorScheme.surface
                      : AppColors.kbSmokedWhite,
                ),
                child: Container(
                  child: LayoutBuilder(
                    builder: (context, constrains) {
                      print(constrains.maxWidth);
                      if (constrains.maxWidth > 330) {
                        return _NormalLayoutContainer();
                      } else {
                        return _SmallLayoutContainer();
                      }
                    },
                  ),
                )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customIconSquare(
                          iconAsset: HelloIcons.location_light_icon,
                          backgroundColor: Colors.transparent),
                      Flexible(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                softWrap: true,
                                text: TextSpan(
                                    text: "Hevea Garden Villas",
                                    style: theme.textTheme.bodyText1
                                        .copyWith(fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(text: ","),
                                      TextSpan(
                                        text: " Kizhakkambalam",
                                        style: theme.textTheme.bodyText1,
                                      ),
                                    ]),
                              ),
                              Text("Ernakulam ",
                                  style: theme.textTheme.bodyText1
                                      .copyWith(color: AppColors.kbDarkGrey)),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customIconSquare(
                          iconAsset: HelloIcons.bag_light_icon,
                          backgroundColor: Colors.transparent),
                      Flexible(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                softWrap: true,
                                text: TextSpan(
                                  text: "Hellohuts Builders",
                                  style: theme.textTheme.bodyText1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text("from Hellohuts Team",
                                  style: theme.textTheme.bodyText1
                                      .copyWith(color: AppColors.kbDarkGrey)),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            customIconSquare(
                                iconAsset: HelloIcons.contractor_light_icon,
                                backgroundColor: Colors.transparent),
                            Flexible(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RichText(
                                      softWrap: true,
                                      text: TextSpan(
                                        text: "Anoop P A",
                                        style: theme.textTheme.bodyText1
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text("Senior Project Engineer",
                                        style: theme.textTheme.bodyText1
                                            .copyWith(
                                                color: AppColors.kbDarkGrey)),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          customIconSquare(
                              iconAsset: HelloIcons.phone_bold_icon,
                              backgroundColor: Colors.transparent,
                              actionCall: () => {
                                    //TODO: Phone button clicked . This should launch phone dialer
                                    print("User wants to call the engineer"),
                                  }),
                          customIconSquare(
                              iconAsset: HelloIcons.mail_bold_icon,
                              backgroundColor: Colors.transparent,
                              actionCall: () => {
                                //TODO: This should lauch the default mail app / whatsapp with to as users email 
                                print("user wants to mail/chat with engineer"),
                              }),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void _onBackButtonPressed() {
    ExtendedNavigator.root.pop();
  }
}

class _NormalLayoutContainer extends StatelessWidget {
  const _NormalLayoutContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      heroDetailedContainerText(
                          heading: 'Area', text: '2187', subTopText: 'sq.ft'),
                      Spacer(),
                      heroDetailedContainerText(
                          heading: 'Project Est', text: '4.5m'),
                      Spacer(),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 24,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    heroDetailedContainerText(
                        heading: 'Exp. completion',
                        text: '22 Mar 2021',
                        textSize: 16),
                    Spacer(),
                    heroDetailedContainerText(
                        heading: 'Total Paid', text: '1.9m', textSize: 16),
                    Spacer(),
                  ]),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: RadialPieChart(
                  completedPercentage: 0.6,
                  widthOfCircle: 4,
                  progressIndicatorGradient: isDark
                      ? [Colors.orange[700], Colors.orange[600]]
                      : [AppColors.kbPrimaryYellow, AppColors.kbPrimaryYellow],
                  circleIndicatorGradient: isDark
                      ? [AppColors.kbDarkGrey, AppColors.kbDarkGrey]
                      : [AppColors.kbMediumGrey, AppColors.kbMediumGrey],
                  size: 80,
                ))
          ],
        ));
  }
}

class _SmallLayoutContainer extends StatelessWidget {
  const _SmallLayoutContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            RadialPieChart(
              completedPercentage: 0.6,
              widthOfCircle: 6,
              circleIndicatorGradient: isDark
                  ? [AppColors.kbDarkGrey, AppColors.kbDarkGrey]
                  : [AppColors.kbMediumGrey, AppColors.kbMediumGrey],
              mainTextFontSize: 24,
              size: 120,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heroDetailedContainerText(
                        heading: 'Area', text: '2187', subTopText: 'sq.ft'),
                    heroDetailedContainerText(
                        heading: 'Project Est', text: '4.5m'),
                  ],
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 24,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      heroDetailedContainerText(
                          heading: 'Exp. completion',
                          text: '22 Mar 2021',
                          textSize: 16),
                      heroDetailedContainerText(
                          heading: 'Total Paid', text: '1.9m', textSize: 16),
                    ]),
              ],
            ),
          ],
        ));
  }
}
