import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/enviroment/env.dart';
import 'config/route/route_define.dart';
import 'manifest.dart';
import 'views/unAuthenticate/intro/intro_route.dart';

void main() => Main();

class Main extends Env {
  @override
  FutureOr<StatefulWidget> onCreate() {
    ErrorWidget.builder = (details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(
        color: Colors.transparent,
      );
    };
    return const Application();
  }
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Architecture',
        initialRoute: IntroRoute.id,
        onGenerateRoute: (settings) => manifest(generateRoutes, settings),
      ),
    );
  }
}
