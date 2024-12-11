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
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const ResponsiveViewMobile(child: NavbarMob()),
      tablet: (BuildContext context) => const ResponsiveViewMobile(child: NavbarMob()),
      desktop: (BuildContext context) => const ResponsiveViewDesktop(child: NavbarDesktop()),
    );
  }
}

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  NavbarRoutes getCurrentRoute(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(whoWeAre)) {
      return NavbarRoutes.whoWeAre;
    }
    return NavbarRoutes.home;
  }

  final colDivider = const SizedBox(
    width: 15,
  );

  @override
  Widget build(BuildContext context) {
    final NavbarRoutes selectedIndex = getCurrentRoute(context);
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: InkWell(
                mouseCursor: WidgetStateMouseCursor.clickable,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () {
                  LandingPageRoute().replace(context);
                },
                child: const NavbarLogo()),
          ),
          Expanded(
            flex: 2,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.end,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              alignment: Alignment.topRight,
              icon:  Icon(
                FontAwesomeIcons.bars,
                color: Colors.grey[700],
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
            Expanded(
              child: InkWell(
                mouseCursor: WidgetStateMouseCursor.clickable,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () {
                  LandingPageRoute().replace(context);
                },
                child: const NavbarLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavbarItem extends StatefulWidget {
  final String title;
  final NavbarRoutes navbarRoutes;
  final bool isSelected;

  const NavbarItem(this.title, this.navbarRoutes, {Key? key, this.isSelected = false}) : super(key: key);

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  late TextStyle textStyle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textStyle = TextUtils.navBarStyle(widget.isSelected, false);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
        switch (widget.navbarRoutes) {
          case NavbarRoutes.home:
            LandingPageRoute().replace(context);
            break;
          case NavbarRoutes.whoWeAre:
            WhoWeAreRoute().replace(context);
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
      onHover: (value) {
        if (value) {
          setState(() {
            textStyle = TextUtils.navBarStyle(widget.isSelected, true);
          });
        } else {
          setState(() {
            textStyle = TextUtils.navBarStyle(widget.isSelected, false);
          });
        }
      },
      child: Text(
        widget.title,
        style: textStyle,
      ),
    );
  }
}
