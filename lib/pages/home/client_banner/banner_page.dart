import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/home/client_banner/banner.dart';
import 'package:flutter_webapp/pages/home/welcome/welcome_body.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const ResponsiveViewMobile(child: BannerBodyDesktop()),
      desktop: (BuildContext context) => const ResponsiveViewDesktop(child: BannerBodyDesktop()),
      tablet: (BuildContext context) => const ResponsiveViewTablet(child: BannerBodyDesktop()),
    );
  }
}
