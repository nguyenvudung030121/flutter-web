import 'package:flutter/material.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/home/client_banner/banner.dart';
import 'package:flutter_webapp/pages/home/what_we_do/what_we_do_page.dart';
import 'package:flutter_webapp/utils/string_constants.dart';
import 'package:flutter_webapp/utils/text_utils.dart';

import 'featured_work/featured_work_page.dart';
import 'welcome/welcome.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  final dataKey = GlobalKey();
  final _controller = ScrollController();
  final rowDivider = const SizedBox(
    height: 30,
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
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            const WelcomePage(),
            rowDivider,
            Row(
              children: <Widget>[
                const Spacer(),
                IconButton(
                  onPressed: () {
                    if (dataKey.currentContext != null) {
                      Scrollable.ensureVisible(
                        dataKey.currentContext!,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 75),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              StringConstants.slogan,
              style: TextUtils.headerStyle()
                  .copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black, letterSpacing: 1),
              key: dataKey,
            ),
            rowDivider,
            const BannerPage(),
            rowDivider,
            const FeaturedWorkPage(),
            rowDivider,
            const WhatWeDoPage(),
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
            const SizedBox(
              height: 100,
            ),
            const Row(
              children: [
                Expanded(child: FooterPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
