import 'package:flutter/material.dart';
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
    return const SizedBox(
        height: 80,
        child: Row(
          children: [
            Text(
              StringConstants.appName,
              style: TextStyle(color: Colors.blueAccent, fontSize: 20, fontFamily: 'Agustina'),
            ),
          ],
        )
        //Image.asset('assets/images/logo.png'),
        );
  }
}

class NavbarLogoDesk extends StatelessWidget {
  const NavbarLogoDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.2,
        child: const Row(
          children: [
            Text(
              StringConstants.appName,
              style: TextStyle(color: Colors.blueAccent, fontSize: 30, fontFamily: 'Agustina'),
            ),
          ],
        )
        //Image.asset('assets/images/logo.png'),
        );
  }
}
