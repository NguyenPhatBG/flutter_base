import 'dart:async';

import 'package:flutter/material.dart';

abstract class Env {
  Env() {
    _init();
  }

  _init() {
    runZonedGuarded(() async {
      final StatefulWidget app = await onCreate();

      runApp(app);
    }, (error, stack) {});
  }

  FutureOr<StatefulWidget> onCreate();
}
