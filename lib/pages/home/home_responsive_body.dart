import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/pages/home/client_banner/banner.dart';
import 'package:flutter_webapp/pages/home/contact/contact_page.dart';
import 'package:flutter_webapp/pages/home/need_resource_section/need_resource_page.dart';
import 'package:flutter_webapp/pages/home/testimonials/testimonials_page.dart';
import 'package:flutter_webapp/pages/home/what_we_do/what_we_do_page.dart';
import 'package:flutter_webapp/utils/spacing_utils.dart';
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
  final rowDivider = SizedBox(
    height: 20.h,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                  icon:  Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.medium),
              child: Text(
                StringConstants.slogan,
                textAlign: TextAlign.center,
                style: TextUtils.headerStyle()
                    .copyWith(fontSize: 22.spMin, fontWeight: FontWeight.w500, color: Colors.black, letterSpacing: 1),
                key: dataKey,
              ),
            ),
            rowDivider,
            const BannerPage(),
            rowDivider,
            const FeaturedWorkPage(),
            rowDivider,
            const WhatWeDoPage(),
            rowDivider,
            const NeedResourcePage(),
            rowDivider,
            rowDivider,
            const TestimonialsPage(),
            rowDivider,
            const ContactHomePage(),
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
