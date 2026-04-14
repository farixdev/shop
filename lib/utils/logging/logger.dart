import 'package:logger/logger.dart';

class tLoggerHelper{
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    //customize the logger as needed, e.g., set log level, add file output, etc.
    level: Level.debug, //set the log level to debug for development
  );

  static void debug(String message) {
    _logger.d(message);
  }
  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message , [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}