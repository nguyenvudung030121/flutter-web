import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_webapp/component/dropdown_button.dart';

class BannerBodyDesktop extends StatelessWidget {
  const BannerBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      constraints: const BoxConstraints(
        minHeight: 250,
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildImageContainer(
              context, 'assets/images/gamuda_logo.png'),
          buildImageContainer(context, 'assets/images/fave_logo.png'),
          buildImageContainer(context, 'assets/images/experian_logo.png'),
          buildImageContainer(context, 'assets/images/koinworks_logo.png'),
          buildImageContainer(context, 'assets/images/abraham_logo.png'),
        ],
      ),
    );
  }

  SizedBox buildImageContainer(BuildContext context, String imageUrl) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BannerBodyMobile extends StatelessWidget {
  const BannerBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int imageCount;
        if (constraints.maxWidth >= 1000) {
          imageCount = 4;
        } else if (constraints.maxWidth >= 400) {
          imageCount = 3;
        } else {
          imageCount = 2; // Default to 2 images for smaller screens
        }

        List<Widget> images = [
          buildImageContainer(context, 'assets/images/gamuda_logo.png'),
          buildImageContainer(context, 'assets/images/fave_logo.png'),
          buildImageContainer(context, 'assets/images/experian_logo.png'),
          buildImageContainer(context, 'assets/images/koinworks_logo.png'),
        ];

        return Container(
          width: constraints.maxWidth,
          constraints:  BoxConstraints(
            minHeight: 160.h,
            maxHeight: 300.h,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: images.take(imageCount).toList(),
          ),
        );
      },
    );
  }


  Widget buildImageContainer(BuildContext context, String imageUrl) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 50.w,
        maxWidth: 100.w,
      ),
      height: 120.h,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}

