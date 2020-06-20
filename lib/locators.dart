import 'package:get_it/get_it.dart';
import 'package:hellohuts_app/services/auth_services/firebase_auth_service.dart';
import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';
import 'package:hellohuts_app/services/firestore_services/firestore_service.dart';

GetIt locator = GetIt.instance;

Future setUpLocator() async {

  locator.registerLazySingleton(() => FirestoreService.instance);
  locator.registerLazySingleton(() => FireBaseAuthService());
  locator.registerLazySingleton(() => AnalyticsService());
}
