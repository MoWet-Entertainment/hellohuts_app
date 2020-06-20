import 'package:meta/meta.dart';

enum AppFlavor { dev, qa, prod }

class AppConfig {
  final String appTitle;
  final AppFlavor buildFlavor;

  AppConfig({@required this.appTitle, @required this.buildFlavor});
}
