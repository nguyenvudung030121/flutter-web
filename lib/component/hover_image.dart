import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class HoverImage extends StatelessWidget {
  const HoverImage({
    Key? key,
    required this.imageUrl,
    required this.hoverImageUrl, this.isBigImage = false,
  }) : super(key: key);
  final String imageUrl;
  final String hoverImageUrl;
  final bool isBigImage;

  @override
  Widget build(BuildContext context) {
    final imageHeight = isBigImage ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height *
        0.3;
    return HoverCrossFadeWidget(
      cursor: SystemMouseCursors.click,
      firstChild: SizedBox(
        width: double.infinity,
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          height: imageHeight,
        ),
      ),
      secondChild: Stack(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.fill,
            width: double.infinity,
            height: imageHeight,
          ),
          Opacity(
            opacity: 0.85, // Đặt mức độ trong suốt (0.0 là hoàn toàn trong suốt, 1.0 là không trong suốt)
            child: Image.network(
              hoverImageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              height: imageHeight,
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 500),
    );
  }
}
