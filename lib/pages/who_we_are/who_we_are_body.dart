import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/component/primary_button/primary_button.dart';
import 'package:flutter_webapp/utils/utils.dart';

import '../../component/footer.dart';

class WhoWeAreBodyDesk extends StatefulWidget {
  const WhoWeAreBodyDesk({
    Key? key,
  }) : super(key: key);

  @override
  State<WhoWeAreBodyDesk> createState() => _WhoWeAreBodyDeskState();
}

class _WhoWeAreBodyDeskState extends State<WhoWeAreBodyDesk> {
  final rowDivider = const SizedBox(
    height: 30,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
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
                runSpacing: 30.0, // spacing between rows
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
