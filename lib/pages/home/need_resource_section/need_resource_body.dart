import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_webapp/utils/utils.dart';

class NeedResourceBodyDesk extends StatelessWidget {
  const NeedResourceBodyDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 50.h),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: buildContainerResource(
                        StringConstants.developmentBundle,
                        StringConstants.developmentBundleContent,
                        'assets/images/home-dev-bundle.svg',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: buildContainerResource(
                          StringConstants.qaSupport,
                          StringConstants.qaSupportContent,
                          'assets/images/home-qa-support.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainerResource(String title, String content, String imageUrl) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SvgPicture.asset(
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
          buildElevatedButton(),
        ],
      ),
    );
  }

  Widget buildElevatedButton() {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.blue.withOpacity(0.2),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          StringConstants.findOutMore.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 3.5.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            fontFamily: TextUtils.fontFamily(FontSourceSansPro.semiBold),
          ),
        ),
      ),
    );
  }
}
