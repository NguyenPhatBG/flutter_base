import 'package:flutter/material.dart';

final List<RouteDefine> routes = [];

abstract class RouteDefine {
  RouteDefine() {
    routes.add(this);
  }

  dynamic build(
      Map<String?, WidgetBuilder?>? routeBuilders, RouteSettings settings) {
    initRoute(settings.arguments == null ? null : settings.arguments as Map)
        .forEach((element) {
      routeBuilders?.addAll(element.path());
    });
  }

  List<Path> initRoute(Map? arguments);
}

class Path {
  Path({required this.name, required this.builder});

  String name;
  WidgetBuilder builder;

  Map<String, WidgetBuilder> path() => {name: builder};
}

MaterialPageRoute? manifest(Function generateRoute, RouteSettings settings) {
  final Map<String?, WidgetBuilder?>? routeBuilders = <String, WidgetBuilder>{};
  generateRoute();
  for (final route in routes) {
    route.build(routeBuilders, settings);
  }

  final routeBuilder = routeBuilders?[settings.name ?? ""];

  return MaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name));
}
