import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'need_resource_body.dart';

class NeedResourcePage extends StatelessWidget {
  const NeedResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) =>   const ResponsiveViewMobile(child: NeedResourceBodyMobile()),
      desktop: (BuildContext context) =>   const ResponsiveViewDesktop(child: NeedResourceBodyDesk()),
      tablet: (BuildContext context) =>   const ResponsiveViewMobile(child: NeedResourceBodyMobile()),
    );
  }
}
