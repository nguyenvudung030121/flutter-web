import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/component/primary_button/primary_button.dart';
import 'package:flutter_webapp/utils/utils.dart';

class NeedResourceBodyDesk extends StatelessWidget {
  const NeedResourceBodyDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.medium, vertical: 60),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.needMoreResources,
                    style: TextUtils.headerStyle().copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Text(StringConstants.needMoreResourcesContent, style: TextUtils.defaultStyle()),
                ],
              ),
            ),
            const SizedBox(width: 70),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: buildContainerResource(
                      StringConstants.developmentBundle,
                      StringConstants.developmentBundleContent,
                      'https://madison-technologies.com/wp-content/uploads/2021/12/home-dev-bundle.svg',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: buildContainerResource(
                      StringConstants.qaSupport,
                      StringConstants.qaSupportContent,
                      'https://madison-technologies.com/wp-content/uploads/2021/12/home-qa-support.svg',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildContainerResource(String title, String content, String imageUrl) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Image.network(
            imageUrl,
            height: 60.h,
            width: 60.w,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: TextUtils.defaultStyle().copyWith(
              fontFamily: TextUtils.fontFamily(FontSourceSansPro.bold),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            content,
            style: TextUtils.defaultStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          PrimaryButton(title: StringConstants.findOutMore.toUpperCase(), onPressed: () {}),
        ],
      ),
    );
  }
}
