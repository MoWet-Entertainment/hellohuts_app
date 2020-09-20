import 'package:flutter/material.dart';

class Professionals extends StatelessWidget {
  const Professionals({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Professionals'),
          ),
        ),
      ),
    );
  }
}
