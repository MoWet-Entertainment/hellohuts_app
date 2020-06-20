import 'package:logger/logger.dart';

class CustomLogPrinter extends LogPrinter {
  final String className;

  CustomLogPrinter(this.className);



  @override
  List<String> log(LogEvent event) {
    var message = event.message;
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    return [color('$emoji $className - $message')];
  }
}



Logger getLogger(String className) {
  return Logger(printer: CustomLogPrinter(className));
}
