import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/home/welcome/welcome_body.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const ResponsiveViewMobile(child: WelcomePageMob()),
      desktop: (BuildContext context) => const ResponsiveViewDesktop(child: WelcomePageDesk()),
      tablet: (BuildContext context) => const ResponsiveViewMobile(child: WelcomePageMob()),
    );
  }
}
