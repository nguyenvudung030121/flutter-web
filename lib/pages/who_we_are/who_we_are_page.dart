import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/pages.dart';
import 'package:responsive_builder/responsive_builder.dart';


class WhoAreWePage extends StatelessWidget {
  const WhoAreWePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const ResponsiveViewMobile(child: WhoWeAreBodyMobile()),
      desktop: (BuildContext context) => const ResponsiveViewDesktop(child: WhoWeAreBodyDesk()),
      tablet: (BuildContext context) => const ResponsiveViewMobile(child: WhoWeAreBodyMobile()),
    );
  }
}
