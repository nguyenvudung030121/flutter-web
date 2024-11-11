import 'dart:html' as html;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/utils.dart';
import 'logo/navbarlogo.dart';

enum NavbarRoutes { home, skills, education, achievements, blog, contact }

class NavbarItem extends StatelessWidget {
  final String title;
  final NavbarRoutes navbarRoutes;

  const NavbarItem(this.title, this.navbarRoutes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const ResponsiveViewMobile(child: NavbarMob()),
      tablet: const ResponsiveViewTablet(child: NavbarMob()),
      desktop: const ResponsiveViewDesktop(child: NavbarTbDt()),
    );
  }
}

class NavbarTbDt extends StatelessWidget {
  const NavbarTbDt({Key? key}) : super(key: key);

  final colDivider = const SizedBox(
    width: 30,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                html.window.location.reload();
              },
              child: const NavbarLogo()),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const NavbarItem(StringConstants.home, NavbarRoutes.home),
                colDivider,
                const NavbarItem(StringConstants.skills, NavbarRoutes.skills),
                colDivider,
                const NavbarItem(StringConstants.achievements, NavbarRoutes.achievements),
                colDivider,
                const NavbarItem(StringConstants.education, NavbarRoutes.education),
                colDivider,
                const NavbarItem(StringConstants.blogs, NavbarRoutes.blog),
                colDivider,
                const NavbarItem(StringConstants.contact, NavbarRoutes.contact),
                colDivider,
                IconButton(
                  onPressed: () {
                    AdaptiveTheme.of(context).toggleThemeMode();
                  },
                  icon: const Icon(Icons.brightness_3, size: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavbarMob extends StatelessWidget {
  const NavbarMob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                html.window.location.reload();
              },
              child: const NavbarLogo()),
          Expanded(
              child: Container(
            width: 100,
          )),
          IconButton(
            alignment: Alignment.topRight,
            onPressed: () {
              AdaptiveTheme.of(context).toggleThemeMode();
            },
            icon: const Icon(Icons.brightness_3, size: 25),
          ),
          IconButton(
            alignment: Alignment.topRight,
            icon: const Icon(
              FontAwesomeIcons.bars,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}
