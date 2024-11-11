import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webapp/pages/pages.dart';

const String skillsRoute = 'skills';
const String projectsRoute = 'projects';
const String educationRoute = 'education';
const String achievementsRoute = 'achievements';
const String contactRoute = 'contact';
const String blogRoute = 'blogs';
const String homeRoute = 'Home';
const String dashBoard = '/';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(const HomePage(), settings.name ?? "");
    default:
      return _getPageRoute(const HomePage(), settings.name ?? "");
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({required this.child, required this.routeName})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          settings: RouteSettings(name: routeName),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
