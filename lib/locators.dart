import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:hellohuts_app/services/auth_services/auth_service.dart';
import 'package:hellohuts_app/services/auth_services/firebase_auth_service.dart';
import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';
import 'package:hellohuts_app/services/firestore_services/firestore_service.dart';
import 'package:hellohuts_app/services/storage_services/shared_preference_service.dart';

GetIt locator = GetIt.instance;

Future setUpLocator() async {
  locator.registerLazySingleton(() => FirestoreService.instance);
  locator.registerLazySingleton(() => FireBaseAuthService());
  locator.registerLazySingleton<AuthService>(() => FireBaseAuthService());
  locator.registerLazySingleton(() => AnalyticsService());
  var sharedPreferences = await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPreferences);
}
