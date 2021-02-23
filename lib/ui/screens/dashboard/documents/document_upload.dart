import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DocumentsUploadPage extends ConsumerWidget {
  const DocumentsUploadPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = Theme.of(context);

    bool isDark = Get.isDarkMode;
    return Hero(
      tag: 'DocumentsFileUpload',
      child: Scaffold(
        
        appBar: CustomAppBar(
          isBackButton: true,
          onBackButtonPressed: _onBackButtonPressed,
          title: Text(
            "Upload",
            style: theme.textTheme.bodyText1
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          centerTitle: false,
        ),
        body: Container(
          child: Center(
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("body"),
                MaterialButton(
                  color: AppColors.kYellowDark,
                  child: Text("Hello"),
                  onPressed: ()=>ExtendedNavigator.root.push(Routes.onboardingScreen))
              ],
            ),

          ),
        ),
      ),
    );
  }

  void _onBackButtonPressed() {
    ExtendedNavigator.root.pop();
  }
}
