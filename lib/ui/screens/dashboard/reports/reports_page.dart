import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = Theme.of(context);
    bool isDark = Get.isDarkMode;
    return Scaffold(
      appBar: CustomAppBar(
        isBackButton: true,
        onBackButtonPressed: _onBackButtonPressed,
        title: Text(
          "Reports",
          style: theme.textTheme.bodyText1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: _ReportsPageBody(),
    );
  }

  void _onBackButtonPressed() {
    ExtendedNavigator.root.pop();
  }
}

class _ReportsPageBody extends StatelessWidget {
  const _ReportsPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _stageOfTheProjectTileWidget(),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
          Container(
            height: 200,
            color: randomColor(),
            child: Center(
              child: Text("Hi Hello"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stageOfTheProjectTileWidget({
    String stageHeading,
    DateTime expDateCompletion,
    bool isCompleted= false,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        bool isDark = Get.isDarkMode;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("Active Stage", style: theme.textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold, fontSize: 16,color: AppColors.kbDarkGreen),),
              //     Text("12-June-2020"),
              //   ],
              // ),
              // SizedBox(height:16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: isDark
                      ? Theme.of(context).colorScheme.surface
                      : AppColors.kbSmokedWhite,
                ),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        constraints:
                            BoxConstraints(maxWidth: fullWidth(context) * 0.5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stageHeading ?? 'Custom Stage',
                              style: theme.textTheme.bodyText2.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                            RichText(
                                overflow: TextOverflow.clip,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: 'Target: ',
                                    style: theme.textTheme.bodyText1.copyWith(
                                        fontSize: 12,
                                        color: AppColors.kbDarkGrey),
                                  ),
                                  TextSpan(
                                    text: expDateCompletion!=null?  DateFormat.yMMMd()
                        .format(expDateCompletion.toLocal()):'Not Available',
         
                                    style: theme.textTheme.bodyText1.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kbDarkGrey,
                                        fontSize: 12),
                                  ),
                                ])),
                            SizedBox(height: 18),
                            ActiveTextWidget(theme: theme)
                          ],
                        ),
                      ),
                      Container(
                        width: fullWidth(context) * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                              image: AssetImage(Assets.sample_house),
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
