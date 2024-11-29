import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webapp/pages/pages.dart';
import 'package:flutter_webapp/pages/who_we_are/detail/detail_item.dart';
import 'package:go_router/go_router.dart';

import '../pages/who_we_are/detail/who_we_are_detail.dart';

part 'routing.g.dart';

const String contactRoute = '/contact';
const String blogRoute = '/blogs';
const String whoWeAre = '/who-we-are';
const String whoWeAreDetail = '/detail';
const String dashBoard = '/';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<DashboardShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<LandingPageRoute>(
      path: dashBoard,
    ),
    TypedGoRoute<WhoWeAreRoute>(
      path: whoWeAre,
      routes: [
        TypedShellRoute<WhoWeAreDetailShellRoute>(
            routes: <TypedRoute<RouteData>>[
              TypedGoRoute<ItemDetailsRoute>(
                path: 'detail/:id',
              ),
            ]
        ),
      ],
    ),
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

class LandingPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class WhoWeAreRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const WhoAreWePage();
}

class WhoWeAreDetailShellRoute extends ShellRouteData {
  const WhoWeAreDetailShellRoute();

  static final GlobalKey<NavigatorState> $navigatorWhoWeAreKey = GlobalKey<NavigatorState>();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return WhoAreWeDetailPage(
    child: navigator);
  }
}


class ItemDetailsRoute extends GoRouteData {
  final String id;

  const ItemDetailsRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) => DetailItem(id: id);
}

// PageRoute _getPageRoute(Widget child, String routeName) {
//   return _FadeRoute(child: child, routeName: routeName);
// }
//
// class _FadeRoute extends PageRouteBuilder {
//   final Widget child;
//   final String routeName;
//
//   _FadeRoute({required this.child, required this.routeName})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               child,
//           settings: RouteSettings(name: routeName),
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//         );
// }
