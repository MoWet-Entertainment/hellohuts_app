import 'package:hellohuts_app/services/firestore_services/analytics_service.dart';
import 'package:hellohuts_app/services/notification_services/push_notification_service.dart';
import 'package:hellohuts_app/services/storage_services/local_storage_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:hellohuts_app/states/auth_state.dart';
import 'package:hellohuts_app/states/app_state.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
];
