import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';

class Materials extends StatelessWidget {
  const Materials({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
         
          body: Center(
            child: Text('Materials'),
          ),
        ),
      ),
    );
  }
}
