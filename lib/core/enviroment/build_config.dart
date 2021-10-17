import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../utility/logging.dart';

enum Flavor { development, staging, preprod, release }

class BuildConfig {
  final String baseUrl;
  final String socketUrl;
  final int connectTimeout;
  final int receiveTimeout;
  final Flavor flavor;
  final Color color;

  const BuildConfig._(
      {required this.baseUrl,
      required this.socketUrl,
      required this.connectTimeout,
      required this.receiveTimeout,
      required this.flavor,
      this.color = Colors.blue});

  static BuildConfig? _instance;

  const BuildConfig._development()
      : this._(
            baseUrl: 'http://.../',
            socketUrl: 'http://.../',
            connectTimeout: 5000,
            receiveTimeout: 5000,
            flavor: Flavor.development);
  const BuildConfig._staging()
      : this._(
            baseUrl: 'http://.../',
            socketUrl: 'http://.../',
            connectTimeout: 5000,
            receiveTimeout: 5000,
            flavor: Flavor.staging);
  const BuildConfig._preprod()
      : this._(
            baseUrl: 'http://.../',
            socketUrl: 'http://.../',
            connectTimeout: 5000,
            receiveTimeout: 5000,
            flavor: Flavor.preprod);
  const BuildConfig._release()
      : this._(
            baseUrl: 'http://.../',
            socketUrl: 'http://.../',
            connectTimeout: 5000,
            receiveTimeout: 5000,
            flavor: Flavor.release);

  static init({flavor}) {
    if (_instance == null) {
      switch (flavor) {
        case 'development':
          _instance = const BuildConfig._development();
          break;
        case 'staging':
          _instance = const BuildConfig._staging();
          break;
        case 'preprod':
          _instance = const BuildConfig._preprod();
          break;
        default:
          _instance = const BuildConfig._release();
          break;
      }
    }
    _iniLog(flavor);
  }

  static BuildConfig? get() {
    return _instance;
  }

  static _iniLog(flavor) async {
    await Log.init();
    switch (_instance?.flavor) {
      case Flavor.development:
      case Flavor.staging:
      case Flavor.preprod:
        Log.setLevel(Level.ALL);
        break;
      case Flavor.release:
        Log.setLevel(Level.OFF);
        break;
      default:
        break;
    }
  }

  static bool isDevelopment() => _instance?.flavor == Flavor.development;

  static bool isStaging() => _instance?.flavor == Flavor.staging;

  static bool isProduction() => _instance?.flavor == Flavor.preprod;

  static bool isRelease() => _instance?.flavor == Flavor.release;
}
