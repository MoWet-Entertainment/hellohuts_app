import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:hellohuts_app/helper/logger.dart';

class AnalyticsService {
  var logger = getLogger('AnalyticsService');
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

//User properties to get info on user
  Future setUserProperties({
    @required String userId,
    String userRole,
  }) async {
    await _analytics.setUserId(userId);
    await _analytics.setUserProperty(name: 'user_role', value: userRole);
  }

  Future logLogin(String method) async {
    await _analytics.logLogin(loginMethod: method);
  }

  Future logSignUp(String method) async {
    await _analytics.logSignUp(signUpMethod: method);
  }

  Future logSearch({String query}) async {
    await _analytics.logSearch(searchTerm: query);
  }

  void logEvent({
    @required String event,
    Map<String, dynamic> parameter,
    String name,
  }) async {
    print("kReleaseMode is :" + kReleaseMode.toString());
    kReleaseMode
        ? await _analytics.logEvent(name: event, parameters: parameter)
        : print("[EVENT]: $event");
    logger.d(event);
  }
}
