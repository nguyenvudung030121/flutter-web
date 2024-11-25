import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/utils/string_constants.dart';
import 'package:flutter_webapp/utils/text_utils.dart';
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
              SelectableText(
                StringConstants.yourBattle,
                style: TextUtils.headerStyle(),
                textAlign: TextAlign.center,
              ),
              rowDivider,
              SelectableText(
                StringConstants.yourBattleDesc,
                style: TextUtils.defaultStyle(),
                textAlign: TextAlign.center,
              ),
              rowDivider,
              
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
