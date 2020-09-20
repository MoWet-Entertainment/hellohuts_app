// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class CustomCarousal extends StatelessWidget {
   final List<String> imagePathList;
  const CustomCarousal({
   
    Key key, this.imagePathList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Carousel(
      //   boxFit: BoxFit.cover,
      //   autoplay: false,
      //   animationCurve: Curves.fastOutSlowIn,
      //   animationDuration: Duration(milliseconds: 1000),
      //   dotSize: 4.0,
      //   dotIncreasedColor: AppColors.kPureWhite,
      //   dotBgColor: Colors.transparent,
      //   dotPosition: DotPosition.bottomCenter,
      //   dotVerticalPadding: 10.0,
      //   showIndicator: true,
      //   indicatorBgPadding: 2.0,
      //   dotSpacing: 10.0,
      //   images: imagePathList
      // ),
    );
  }
}

