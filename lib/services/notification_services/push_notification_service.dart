import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer' as dev;

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool initialized = false;
  String token;

  PushNotificationService();

  FirebaseMessaging get firebaseMessaging => _firebaseMessaging;

  Future<String> init() async {
    if (!initialized) {
      if (Platform.isIOS) {
        _requestPermission();
      }
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});
      token = await _firebaseMessaging.getToken();
      if (token != null) {
        initialized = true;
      }
      dev.log("token", error: token);
      return token;
    }
    return token;
  }

  Future<bool> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }
}
