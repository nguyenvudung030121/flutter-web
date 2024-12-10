import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/home/contact/contact.dart';
import 'package:responsive_builder/responsive_builder.dart';


class ContactHomePage extends StatelessWidget {
  const ContactHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) =>   const ResponsiveViewMobile(child: ContactHomePageBodyMobile()),
      desktop: (BuildContext context) =>   const ResponsiveViewDesktop(child: ContactHomePageBodyDesk()),
      tablet: (BuildContext context) =>   const ResponsiveViewMobile(child: ContactHomePageBodyMobile()),
    );
  }
}
