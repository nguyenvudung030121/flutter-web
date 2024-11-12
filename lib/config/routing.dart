import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webapp/pages/pages.dart';
import 'package:go_router/go_router.dart';

part 'routing.g.dart';

const String skillsRoute = '/skills';
const String projectsRoute = '/projects';
const String educationRoute = '/education';
const String achievementsRoute = '/achievements';
const String contactRoute = '/contact';
const String blogRoute = '/blogs';
const String whoWeAre = '/who-we-are';
const String dashBoard = '/';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<DashboardShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(
      path: dashBoard,
      routes: [
        // TypedGoRoute<ItemDetailsRoute>(path: 'items/:id'),
      ],
    ),
    TypedGoRoute<WhoWeAreRoute>(path: whoWeAre),
  ],
)
class DashboardShellRoute extends ShellRouteData {
  const DashboardShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MyDashboardScreen(child: navigator);
  }
}

class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class WhoWeAreRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const ProfileScreen();
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
