import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/config/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/utils.dart';
import 'logo/navbarlogo.dart';

enum NavbarRoutes { home, whoWeAre, whatWeDo, dedicatedTeam, ourWork, ourBlog, contact }

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

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

  NavbarRoutes getCurrentRoute(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(whoWeAre)) {
      return NavbarRoutes.whoWeAre;
    }
    return NavbarRoutes.home;
  }

  final colDivider = const SizedBox(
    width: 20,
  );

  @override
  Widget build(BuildContext context) {
    final NavbarRoutes selectedIndex = getCurrentRoute(context);
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                HomeRoute().go(context);
              },
              child: const NavbarLogo()),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavbarItem(StringConstants.whoWeAre, NavbarRoutes.whoWeAre,
                    isSelected: selectedIndex == NavbarRoutes.whoWeAre),
                colDivider,
                NavbarItem(StringConstants.whatWeDo, NavbarRoutes.whatWeDo,
                    isSelected: selectedIndex == NavbarRoutes.whatWeDo),
                colDivider,
                NavbarItem(StringConstants.dedicatedTeam, NavbarRoutes.dedicatedTeam,
                    isSelected: selectedIndex == NavbarRoutes.dedicatedTeam),
                colDivider,
                NavbarItem(StringConstants.ourWork, NavbarRoutes.ourWork,
                    isSelected: selectedIndex == NavbarRoutes.ourWork),
                colDivider,
                NavbarItem(StringConstants.ourBlog, NavbarRoutes.ourBlog,
                    isSelected: selectedIndex == NavbarRoutes.ourBlog),
                colDivider,
                NavbarItem(StringConstants.contact, NavbarRoutes.contact,
                    isSelected: selectedIndex == NavbarRoutes.contact),
                IconButton(
                  onPressed: () {
                    AdaptiveTheme.of(context).toggleThemeMode();
                  },
                  icon: const Icon(
                    Icons.brightness_3,
                    size: 25,
                    color: Colors.lightBlueAccent,
                  ),
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
                HomeRoute().go(context);
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

class NavbarItem extends StatelessWidget {
  final String title;
  final NavbarRoutes navbarRoutes;
  final bool isSelected;

  const NavbarItem(this.title, this.navbarRoutes, {Key? key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        switch (navbarRoutes) {
          case NavbarRoutes.home:
            HomeRoute().go(context);
            break;
          case NavbarRoutes.whoWeAre:
            ProfileRoute().go(context);
            break;
          case NavbarRoutes.whatWeDo:
            // TODO: Handle this case.
            break;
          case NavbarRoutes.dedicatedTeam:
            // TODO: Handle this case.
            break;
          case NavbarRoutes.ourWork:
            // TODO: Handle this case.
            break;
          case NavbarRoutes.contact:
            // TODO: Handle this case.
            break;
          case NavbarRoutes.ourBlog:
            // TODO: Handle this case.
            break;
        }
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18, color: isSelected ? Colors.lightBlueAccent : Colors.black),
      ),
    );
  }
}
