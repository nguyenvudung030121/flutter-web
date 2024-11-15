import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/home/what_we_do/what_we_do_body.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WhatWeDoPage extends StatelessWidget {
  const WhatWeDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) =>   const ResponsiveViewMobile(child: WhatWeDoBodyDesk()),
      desktop: (BuildContext context) =>   const ResponsiveViewDesktop(child: WhatWeDoBodyDesk()),
      tablet: (BuildContext context) =>   const ResponsiveViewTablet(child: WhatWeDoBodyDesk()),
    );
  }
}
