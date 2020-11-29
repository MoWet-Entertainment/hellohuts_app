import 'package:flutter/material.dart';
import 'package:hellohuts_app/states/dashboard/dashboard_state.dart';
import 'package:provider/provider.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DashboardState>(context);
    state.initProjectDetailModel();
    return Scaffold(
        body: Center(
      child: Text("This is a sample container"),
    ));
  }
}
