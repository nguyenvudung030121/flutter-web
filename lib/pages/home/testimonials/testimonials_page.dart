import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/home/testimonials/testimonials_body.dart';
import 'package:responsive_builder/responsive_builder.dart';


class TestimonialsPage extends StatelessWidget {
  const TestimonialsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) =>   const ResponsiveViewMobile(child: TestimonialsBodyDesk()),
      desktop: (BuildContext context) =>   const ResponsiveViewDesktop(child: TestimonialsBodyDesk()),
      tablet: (BuildContext context) =>   const ResponsiveViewTablet(child: TestimonialsBodyDesk()),
    );
  }
}
