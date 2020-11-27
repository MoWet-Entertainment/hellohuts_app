import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/common_widgets/rounded_charts/middle_ring.dart';
import 'package:hellohuts_app/ui/common_widgets/rounded_charts/progress_rings.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class RadialPieChart extends StatelessWidget {
  final double size;
  final double completedPercentage;
  final double widthOfCircle;
  RadialPieChart(
      {Key key, this.size = 100, @required this.completedPercentage, this.widthOfCircle=8});

  @override
  Widget build(BuildContext context) {
    // Outer white circle
    return Center(
      // Container of the pie chart
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.8),
          //     spreadRadius: 20,
          //     blurRadius: 45,
          //     offset: Offset(0, 7), // changes position of shadow
          //   ),
          // ],
        ),
        child: Stack(
          children: <Widget>[
            // Center(child: MiddleRing(width: 300.0)),

            Transform.rotate(
              angle: 0,
              child: CustomPaint(
                child: Center(),
                painter: ProgressRings(
                  completedPercentage: 1,
                  circleWidth:widthOfCircle,
                  gradient: [AppColors.kbMediumGrey, AppColors.kbMediumGrey],
                  gradientStartAngle: 0.0,
                  gradientEndAngle: pi / 3,
                  progressStartAngle: 0,
                  lengthToRemove: 0,
                ),
              ),
            ),
            Transform.rotate(
              angle: 0,
              child: CustomPaint(
                child: Center(),
                painter: ProgressRings(
                  completedPercentage: completedPercentage,
                  circleWidth: widthOfCircle,
                  gradient: [AppColors.kYellowLight, AppColors.kYellowLight],
                  gradientStartAngle: 0.0,
                  gradientEndAngle: pi / 3,
                  progressStartAngle: 0,
                  lengthToRemove: 0,
                ),
              ),
            ),
            Center(
              child: Expanded(
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${completedPercentage * 100}%',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    Text('Completed'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final innerColor = Color.fromRGBO(233, 242, 249, 1);
final shadowColor = Color.fromRGBO(220, 227, 234, 1);

const greenGradient = [
  Color.fromRGBO(223, 250, 92, 1),
  Color.fromRGBO(129, 250, 112, 1)
];
const turqoiseGradient = [
  Color.fromRGBO(91, 253, 199, 1),
  Color.fromRGBO(129, 182, 205, 1)
];

const redGradient = [
  Color.fromRGBO(255, 93, 91, 1),
  Color.fromRGBO(254, 154, 92, 1),
];
const orangeGradient = [
  Color.fromRGBO(251, 173, 86, 1),
  Color.fromRGBO(253, 255, 93, 1),
];
