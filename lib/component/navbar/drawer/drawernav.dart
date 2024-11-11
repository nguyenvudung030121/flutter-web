import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webapp/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../navigationbar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SizedBox(
        width: 300,
        child: Column(
          children: <Widget>[
            DrawerItem(StringConstants.home, FontAwesomeIcons.house, NavbarRoutes.home),
            DrawerItem(StringConstants.whoWeAre, FontAwesomeIcons.listCheck, NavbarRoutes.whoWeAre),
            DrawerItem(StringConstants.whatWeDo, FontAwesomeIcons.graduationCap, NavbarRoutes.whatWeDo),
            DrawerItem(StringConstants.dedicatedTeam, FontAwesomeIcons.trophy, NavbarRoutes.dedicatedTeam),
            DrawerItem(StringConstants.ourBlog, FontAwesomeIcons.bloggerB, NavbarRoutes.ourWork),
            DrawerItem(StringConstants.contact, FontAwesomeIcons.user, NavbarRoutes.contact),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final NavbarRoutes navbarRoutes;

  const DrawerItem(this.title, this.icon, this.navbarRoutes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          const SizedBox(
            width: 30,
          ),
          NavbarItem(title, navbarRoutes),
        ],
      ),
    );
  }
}
