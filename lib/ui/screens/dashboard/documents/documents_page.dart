import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/states/dashboard/documents_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:hooks_riverpod/all.dart';

class DocumentsPage extends ConsumerWidget {
  const DocumentsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = Theme.of(context);

    bool isDark = Get.isDarkMode;
    return Scaffold(
      appBar: CustomAppBar(
        isBackButton: true,
        onBackButtonPressed: _onBackButtonPressed,
        title: Text(
          "Documents",
          style: theme.textTheme.bodyText1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: _DocumentsPageBody(),
    );
  }

  void _onBackButtonPressed() {
    ExtendedNavigator.root.pop();
  }
}

class _DocumentsPageBody extends StatelessWidget {
  const _DocumentsPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 32),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Project Documents',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 16),
                  )),
              Consumer(builder: (context, watch, child) {
                final snapshot = watch(documentStateProvider);
                return snapshot.map(
                    data: (_) => Padding(
                          padding: const EdgeInsets.only(top: 18.0, bottom: 40),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return CustomListTile();
                              }),
                        ),
                    loading: (_) => Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    error: (_) => Center(
                          child: Text('error'),
                        ));
              }
                  // future: dashboardState.getRecentActivityList(),

                  ),
            ],
          ),
        ),
      ),
    );
  }
}
