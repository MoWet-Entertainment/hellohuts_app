import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text('EXPLORE PAGE'),
            Spacer(),
            FlatButton(
              onPressed: () =>
                  ExtendedNavigator.of(context).pushNamed(Routes.explorePage),
              child: Text("Go"),
              color: Colors.yellow,
            ),
            SizedBox(height: 50,)
          ],
        ),
    );
  }
}
