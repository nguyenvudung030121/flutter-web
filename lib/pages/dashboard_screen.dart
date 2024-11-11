import 'package:flutter/material.dart';
import 'package:flutter_webapp/config/config.dart';
import 'package:go_router/go_router.dart';

class MyDashboardScreen extends StatelessWidget {
  const MyDashboardScreen({Key? key, required this.child}) : super(key: key);

  final Widget child;

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/profile')) {
      return 1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = getCurrentIndex(context);
    //Define your dashboard UI, such as a bottom bar, navigation rail, etc.
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Profile'),
              ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              switch (index) {
                case 0:
                // Note: All navigation methods will be accessible after the code generation process.
                  HomeRoute().go(context);
                  break;
                case 1:
                  ProfileRoute().go(context);
                  break;
              }
            },
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}