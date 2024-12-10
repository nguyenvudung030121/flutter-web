import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/component/primary_button/primary_button.dart';
import 'package:flutter_webapp/config/config.dart';
import 'package:flutter_webapp/utils/utils.dart';

import '../../component/footer.dart';

class WhoWeAreBodyDesk extends StatelessWidget {
  const WhoWeAreBodyDesk({
    Key? key,
  }) : super(key: key);

  final rowDivider = const SizedBox(
    height: 30,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                StringConstants.yourBattle,
                style: TextUtils.headerStyle(),
                textAlign: TextAlign.center,
              ),
              rowDivider,
              Text(
                StringConstants.yourBattleDesc,
                style: TextUtils.defaultStyle(),
                textAlign: TextAlign.center,
              ),
              rowDivider,
              Wrap(
                spacing: 30.0, // spacing between items
                runSpacing: 30.0, // spacing between rows$
                alignment: WrapAlignment.center,
                children: List.generate(
                  5,
                  (index) {
                    return Container(
                      padding: const EdgeInsets.all(30),
                      width: 78.w,
                      height: 220.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          ItemDetailsRoute(id: index.toString()).replace(context);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              StringConstants.whoWeAreImages[index],
                              height: 55.h,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              StringConstants.whoWeAreDesc[index],
                              style: TextUtils.headerStyle().copyWith(fontSize: 7.sp, color: Colors.black),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              rowDivider,
              Text(
                StringConstants.comeTalkToUs,
                style: TextUtils.defaultStyle(),
              ),
              rowDivider,
              PrimaryButton(title: StringConstants.contactUs.toUpperCase(), onPressed: () {}),
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
      ),
    );
  }
}

class WhoWeAreBodyMobile extends StatelessWidget {
  const WhoWeAreBodyMobile({
    Key? key,
  }) : super(key: key);

  final rowDivider = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.yourBattle,
                    style: TextUtils.headerStyle().copyWith(fontSize: 14.spMax),
                  ),
                  rowDivider,
                  Text(
                    StringConstants.yourBattleDesc,
                    style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin),
                    textAlign: TextAlign.start,
                  ),
                  rowDivider,
                  Wrap(
                    spacing: 30.0, // spacing between items
                    runSpacing: 30.0, // spacing between rows$
                    alignment: WrapAlignment.start,
                    children: List.generate(
                      5,
                          (index) {
                        return Container(
                          padding: const EdgeInsets.all(15),
                          width: 120.w,
                          height: 160.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              ItemDetailsRoute(id: index.toString()).replace(context);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  StringConstants.whoWeAreImages[index],
                                  height: 50.h,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  StringConstants.whoWeAreDesc[index],
                                  style: TextUtils.headerStyle().copyWith(fontSize: 15.spMin, color: Colors.black),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    StringConstants.comeTalkToUs,
                    style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin),
                  ),
                  rowDivider,
                  Center(child: PrimaryButton(title: StringConstants.contactUs.toUpperCase(), onPressed: () {})),
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
            );
          }
        ),
      ),
    );
  }
}

