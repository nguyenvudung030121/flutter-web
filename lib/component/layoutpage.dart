// import 'package:DeveloperFolio/configure/navigation_service.dart';
// import 'package:DeveloperFolio/configure/routing.dart';
// import 'package:DeveloperFolio/include/navbar/drawer/drawernav.dart' as custom_drawer;
// import 'package:DeveloperFolio/include/navbar/navigationbar.dart' as custom_navbar;
import 'package:flutter/material.dart';
import 'package:flutter_webapp/config/config.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        // endDrawer: custom_drawer.NavigationDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: Column(
          children: <Widget>[
            // custom_navbar.NavigationBar(),
          ],
        ),
      ),
    );
  }
}