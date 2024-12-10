import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/home/featured_work/featured_work.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FeaturedWorkPage extends StatelessWidget {
  const FeaturedWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) =>  const ResponsiveViewMobile(child: FeaturedWorkBodyMobile()),
      desktop: (BuildContext context) =>  const ResponsiveViewDesktop(child: FeaturedWorkBodyDesk()),
      tablet: (BuildContext context) =>  const ResponsiveViewMobile(child: FeaturedWorkBodyMobile()),
    );
  }
}
