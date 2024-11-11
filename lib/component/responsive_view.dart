import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const ResponsiveViewDesktop(child: null,),
      tablet: const ResponsiveViewTablet(),
      mobile: const ResponsiveViewMobile(),
    );
  }
}

class ResponsiveViewDesktop extends StatelessWidget {
  final Widget? child;
  const ResponsiveViewDesktop({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 2000),
        child: child,
      ),
    );
  }
}

class ResponsiveViewMobile extends StatelessWidget {
  final Widget? child;
  const ResponsiveViewMobile({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}

class ResponsiveViewTablet extends StatelessWidget {
  final Widget? child;
  const ResponsiveViewTablet({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
