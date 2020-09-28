import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: SafeArea(
                      child: Scaffold(
        appBar: AppBar(
            title: Text("First Screen"),
        ),
        body: SafeArea(
                  child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text('Lorem Ipsum'),
                subtitle: Text('$index'),
              );
            }),
        ),
      ),
          ),
    );
  }
}