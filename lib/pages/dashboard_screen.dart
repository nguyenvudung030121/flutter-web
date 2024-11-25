import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/navbar/drawer/drawernav.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../component/navbar/navigationbar.dart';

class MyDashboardScreen extends StatelessWidget {
  const MyDashboardScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //Define your dashboard UI, such as a bottom bar, navigation rail, etc.
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) => Scaffold(
        endDrawer: const CustomDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: Column(
          children: [
            const CustomNavigationBar(),
            Expanded(
              child: SafeArea(child: SelectionArea(child: child)),
            ),
          ],
        ),
      ),
    );
  }
}

