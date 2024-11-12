import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_responsive_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const ResponsiveViewMobile(child: HomeDesktop()),
      desktop: (BuildContext context) => const ResponsiveViewDesktop(child: HomeDesktop()),
      tablet: (BuildContext context) => const ResponsiveViewMobile(child: HomeDesktop()),
    );
  }
}
