import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class DashboardLandingPage extends StatelessWidget {
  const DashboardLandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedSafeArea(
      child: Scaffold(
        body: buildNestedScrollView(),
      ),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
        body: Container(
          child: Center(
            child: Text("Dashboard"),
          ),
        ),
        headerSliverBuilder: (context, bool innerboxScrolled) {
          return <Widget>[buildAppBar(context)];
        });
  }

  Widget buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: theme.textTheme.headline6.copyWith(
                    fontSize: 16, color: theme.colorScheme.onBackground),
              ),
              SizedBox(height: 2,),
              Row(
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Vinoop\'s ",
                          style: theme.textTheme.bodyText1.copyWith(
                              fontSize: 12, color: AppColors.kbDarkGrey),
                          children: <InlineSpan>[
                        TextSpan(
                          text: "LittleNest",
                          style: theme.textTheme.headline6.copyWith(
                              fontSize: 12, color: AppColors.kbDarkGrey),
                        )
                      ])),
                      SizedBox(width:4),
                  GestureDetector(
                      child: Image.asset(
                        HelloIcons.down_arrow_light_icon,
                        height: 12,
                        color: AppColors.kbDarkGrey,
                      ),
                      onTap: () {
                        print("Implement selecting different projects here");
                        //TODO: Multi project support
                      })
                ],
              )
            ],
          ),
        ),
        actions: [customIconSquare(iconAsset: HelloIcons.flame_bold_icon)],
      ),
    );
  }
}
