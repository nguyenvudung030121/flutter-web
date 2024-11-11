import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webapp/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../navigationbar.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SizedBox(
        width: 300,
        child: Column(
          children: <Widget>[
            DrawerItem(StringConstants.home, FontAwesomeIcons.house, NavbarRoutes.home),
            DrawerItem(StringConstants.skills, FontAwesomeIcons.listCheck, NavbarRoutes.skills),
            DrawerItem(StringConstants.education, FontAwesomeIcons.graduationCap, NavbarRoutes.education),
            DrawerItem(StringConstants.achievements, FontAwesomeIcons.trophy, NavbarRoutes.achievements),
            DrawerItem(StringConstants.blogs, FontAwesomeIcons.bloggerB, NavbarRoutes.blog),
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
