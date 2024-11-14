import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/component/primary_button/primary_button_body.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title, this.onPressed}) : super(key: key);
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) =>  ResponsiveViewMobile(child: PrimaryButtonBodyDesk(title: title, onPressed: onPressed)),
      desktop: (BuildContext context) =>  ResponsiveViewDesktop(child: PrimaryButtonBodyDesk(title: title, onPressed: onPressed)),
      tablet: (BuildContext context) =>  ResponsiveViewTablet(child: PrimaryButtonBodyDesk(title: title, onPressed: onPressed)),
    );
  }
}
