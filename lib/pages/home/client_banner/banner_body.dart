import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          buildImageContainer(context, 'assets/images/gamuda_logo.png'),
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
        bool isMobileView = false;
        if (constraints.maxWidth >= 700) {
          imageCount = 4;
          isMobileView = false;
        } else {
          imageCount = 3;
          isMobileView = true;
        }

        List<Widget> images = [
          buildImageContainer(context, 'assets/images/gamuda_logo.png', isMobileView: isMobileView),
          buildImageContainer(context, 'assets/images/fave_logo.png', isMobileView: isMobileView),
          buildImageContainer(context, 'assets/images/experian_logo.png', isMobileView: isMobileView),
          buildImageContainer(context, 'assets/images/koinworks_logo.png', isMobileView: isMobileView),
        ];

        return Container(
          width: constraints.maxWidth,
          constraints: const BoxConstraints(
            minHeight: 160,
            maxHeight: 300,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: images.take(imageCount).toList(),
          ),
        );
      },
    );
  }

  Widget buildImageContainer(BuildContext context, String imageUrl, {bool isMobileView = false}) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 80,
        maxWidth: isMobileView ? 130 : 80.w,
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
