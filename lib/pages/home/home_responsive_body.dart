import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';

import 'welcome/welcome.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  final _controller = ScrollController();
  final rowDivider = const SizedBox(
    height: 75,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        controller: _controller,
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: const [
                  WelcomePage(),
                  // rowDivider,
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(child: TwoDesk()),
                  //     Expanded(child: SkillsLogoDesk()),
                  //   ],
                  // ),
                  // rowDivider,
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(child: SkillBarDesk()),
                  //     Expanded(child: ThreeDesk()),
                  //   ],
                  // ),
                  // rowDivider,
                  // Row(
                  //   children: [
                  //     Expanded(child: EducationDesk()),
                  //   ],
                  // ),
                  // rowDivider,
                  // Row(
                  //   children: [
                  //     Expanded(child: AchievementDesk()),
                  //   ],
                  // ),
                  // rowDivider,
                  // Row(
                  //   children: [
                  //     Expanded(child: BlogCenterDesk()),
                  //   ],
                  // ),
                  // rowDivider,
                  // Row(
                  //   children: [
                  //     Expanded(child: ContactCenterDesk()),
                  //     Expanded(
                  //       child: FourDesk(),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Expanded(child: FooterPage()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}