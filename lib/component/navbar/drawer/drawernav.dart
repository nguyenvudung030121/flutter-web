import 'package:flutter/material.dart';
import 'package:flutter_webapp/config/config.dart';
import 'package:flutter_webapp/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../navigationbar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  NavbarRoutes getCurrentRoute(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(whoWeAre)) {
      return NavbarRoutes.whoWeAre;
    }
    return NavbarRoutes.home;
  }

  @override
  Widget build(BuildContext context) {
    final NavbarRoutes selectedIndex = getCurrentRoute(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, color: Colors.grey[700], size: 30),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      LandingPageRoute().replace(context);
                      Navigator.of(context).pop();
                    },
                    child: const Center(
                      child: Text(
                        StringConstants.appName,
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 30,
                          fontFamily: 'Agustina',
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close, color: Colors.grey[700], size: 30),
                    ),
                  )
                ],
              ),
            ),
            DrawerItem(
              StringConstants.whoWeAre,
              FontAwesomeIcons.listCheck,
              NavbarRoutes.whoWeAre,
              isSelected: selectedIndex == NavbarRoutes.whoWeAre,
            ),
            DrawerItem(
              StringConstants.whatWeDo,
              FontAwesomeIcons.graduationCap,
              NavbarRoutes.whatWeDo,
              isSelected: selectedIndex == NavbarRoutes.whatWeDo,
            ),
            DrawerItem(
              StringConstants.dedicatedTeam,
              FontAwesomeIcons.trophy,
              NavbarRoutes.dedicatedTeam,
              isSelected: selectedIndex == NavbarRoutes.dedicatedTeam,
            ),
            DrawerItem(
              StringConstants.ourBlog,
              FontAwesomeIcons.bloggerB,
              NavbarRoutes.ourBlog,
              isSelected: selectedIndex == NavbarRoutes.ourBlog,
            ),
            DrawerItem(
              StringConstants.contact,
              FontAwesomeIcons.user,
              NavbarRoutes.contact,
              isSelected: selectedIndex == NavbarRoutes.contact,
            ),
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
  final bool isSelected;

  const DrawerItem(this.title, this.icon, this.navbarRoutes, {Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: isSelected ? Colors.lightBlueAccent : Colors.black,
          ),
          const SizedBox(
            width: 30,
          ),
          NavbarItem(
            title,
            navbarRoutes,
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }
}
