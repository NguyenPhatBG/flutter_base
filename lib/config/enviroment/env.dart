import 'dart:async';

import 'package:flutter/material.dart';

abstract class Env {
  Env() {
    _init();
  }

  dynamic _init() {
    runZonedGuarded(() async {
      final app = await onCreate();

      runApp(app);
    }, (error, stack) {});
  }

  FutureOr<StatefulWidget> onCreate();
}
