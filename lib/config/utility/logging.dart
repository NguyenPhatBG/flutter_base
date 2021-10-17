import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class Log {
  final String _name = 'Logger';
  Logger? _instance;

  dynamic init() async {
    Logger.root.onRecord.listen((record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    });
    _instance = Logger(_name);
  }

  Future<void> setLevel(Level level) async {
    Logger.root.level = level;
  }

  void info(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.info('$tag: $message', error, stackTrace);
  }

  void warning(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.warning('$tag: $message', error, stackTrace);
  }

  void config(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.config('$tag: $message', error, stackTrace);
  }

  void fine(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.fine(message, error, stackTrace);
  }

  void finer(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.finer('$tag: $message', error, stackTrace);
  }

  void finest(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.finest('$tag: $message', error, stackTrace);
  }

  void severe(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.severe('$tag: $message', error, stackTrace);
  }

  void shout(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.shout('$tag: $message', error, stackTrace);
  }
}
