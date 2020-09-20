import 'package:flutter/material.dart';

class CostEstimate extends StatelessWidget {
  const CostEstimate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Cost Estimate Screen'),
          ),
        ),
      ),
    );
  }
}
