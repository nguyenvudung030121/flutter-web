import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_webapp/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavbarLogo extends StatelessWidget {
  const NavbarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const NavbarLogoMob(),
      tablet: (BuildContext context) => const NavbarLogoMob(),
      desktop: (BuildContext context) => const NavbarLogoDesk(),
    );
  }
}

class NavbarLogoMob extends StatelessWidget {
  const NavbarLogoMob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/maddie_logo.svg',
    );
  }
}

class NavbarLogoDesk extends StatelessWidget {
  const NavbarLogoDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/maddie_logo.svg',
    );
  }
}
