import 'dart:developer';

import 'package:logger/logger.dart';
import 'package:zapit_demo/utils/enums.dart';

Logger _logger = Logger();

/// normal application log
void normalLog({required String message}) {
  log('-----------------$message-----------------\n');
}

/// high level application log
void extremeLog({required String message, LogLevel? level = LogLevel.Verbose}) {
  if (level == LogLevel.Debug) {
    _logger.d(message);
  } else if (level == LogLevel.Error) {
    _logger.e(message);
  } else if (level == LogLevel.Info) {
    _logger.i(message);
  } else if (level == LogLevel.Warning) {
    _logger.w(message);
  } else {
    _logger.v(message);
  }
}
