import 'package:flutter/material.dart';

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
              context, 'https://madison-technologies.com/wp-content/uploads/2021/08/GamudaLandLogo.png'),
          buildImageContainer(context, 'https://madison-technologies.com/wp-content/uploads/2021/12/Group-2863.png'),
          buildImageContainer(context, 'https://madison-technologies.com/wp-content/uploads/2021/08/Group-2857.png'),
          buildImageContainer(context, 'https://madison-technologies.com/wp-content/uploads/2024/10/koinworks-logo.png'),
          buildImageContainer(context, 'https://madison-technologies.com/wp-content/uploads/2024/10/abraham.png'),
        ],
      ),
    );
  }

  SizedBox buildImageContainer(BuildContext context, String imageUrl) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
