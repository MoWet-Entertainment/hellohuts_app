import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:intl/intl.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';

final AnalyticsService _analyticsService = locator<AnalyticsService>();
String setCurrentDateTime() {
  var dt = DateTime.now().toUtc();
  var dat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dt);
  return dat;
}

String getJoiningDateLocal(String dateTime) {
  if (dateTime == null || dateTime.isEmpty) {
    return '';
  }
  var dt = DateTime.parse(dateTime).toLocal();
  var dat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dt);
  return dat;
}

String getPostTime(String date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  var dt = DateTime.parse(date).toLocal();
  var dat =
      DateFormat.jm().format(dt) + ' - ' + DateFormat("dd MMM yyyy").format(dt);
  return dat;
}

String getChatTime(String date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  String msg = '';
  var dt = DateTime.parse(date).toLocal();

  if (DateTime.now().toLocal().isBefore(dt)) {
    return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
  }

  var dur = DateTime.now().toLocal().difference(dt);
  if (dur.inDays > 0) {
    msg = '${dur.inDays} day';
    return dur.inDays == 1 ? 'yesterday' : DateFormat("dd MMM").format(dt);
  } else if (dur.inHours > 0) {
    msg = '${dur.inHours} hour';
  } else if (dur.inMinutes > 0) {
    msg = '${dur.inMinutes} min';
  } else if (dur.inSeconds > 0) {
    msg = '${dur.inSeconds} sec';
  } else {
    msg = 'now';
  }
  return msg;
}

void cprint(dynamic data, {String errorIn, String event}) {
  if (errorIn != null) {
    print(
        '****************************** error ******************************');
    print('[Error] $errorIn $data');
    print(
        '****************************** error ******************************');
  } else if (data != null) {
    print(data);
  }
  if (event != null) {
    _analyticsService.logEvent(event: event);
  }
}

void debugLog(String log, {dynamic param = ""}) {
  final String time = DateFormat("mm:ss:mmm").format(DateTime.now());
  print("[$time][Log]: $log, $param");
}

bool validateCredentials(
    GlobalKey<ScaffoldState> _scaffoldKey, String email, String password) {
  if (email == null || email.isEmpty) {
    customSnackBar(_scaffoldKey, 'Please enter email id');
    return false;
  } else if (password == null || password.isEmpty) {
    customSnackBar(_scaffoldKey, 'Please enter password');
    return false;
  } else if (password.length < 8) {
    customSnackBar(_scaffoldKey, 'Password must me 8 character long');
    return false;
  }

  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  var status = regExp.hasMatch(email);
  if (!status) {
    customSnackBar(_scaffoldKey, 'Please enter valid email id');
    return false;
  }
  return true;
}

launchURL(String url) async {
  cprint('Yet to implement');
}

  Color randomColor() {
    return Color(Random().nextInt(0xffffffff));
  }
  Color randomOpaqueColor() {
  return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
}
/*
void main() {
  var testDate = "2020-04-04T10:10:20Z";
  print(setJoiningDateUTC());
  print(getJoiningDateLocal(testDate));
  print(getPostTime(testDate));
  print(getChatTime(testDate));
}
*/
String convertProjectEstimate(String value) {
  double val = double.parse(value);
  final formatter = NumberFormat.compactSimpleCurrency(name: 'INR');
  return formatter.format(val);
}
