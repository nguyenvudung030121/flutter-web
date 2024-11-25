import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
