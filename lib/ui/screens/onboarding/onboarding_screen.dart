import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hellohuts_app/ui/screens/base_page.dart';
import 'package:hellohuts_app/ui/screens/explore.dart';
import 'package:hellohuts_app/ui/screens/onboarding/onboarding_data.dart';
import 'package:hellohuts_app/ui/screens/onboarding/onboarding_widget.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key key}) : super(key: key);

  final List<OnboardingData> list = [
    OnboardingData(
      imagePath: Assets.onboarding1,
      title: "Reinventing Housing",
      desc: "Some blah blah blah",
    ),
    OnboardingData(
      imagePath: Assets.onboarding2,
      title: "Worth for every Penny",
      desc: "Some blah blah blah",
    ),
    OnboardingData(
      imagePath:  Assets.onboarding3,
      title: "No Tension, We got you covered",
      desc: "Some blah blah blah",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      onboardingScreenDataList: list,
      pageRoute: MaterialPageRoute(builder: (context) => BasePage()),
    );
  }
}
