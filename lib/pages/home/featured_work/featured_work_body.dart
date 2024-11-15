import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_webapp/component/primary_button/primary_button.dart';
import 'package:hovering/hovering.dart';

import '../../../component/hover_image.dart';
import '../../../utils/utils.dart';

class FeaturedWorkBodyDesk extends StatelessWidget {
  const FeaturedWorkBodyDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageHeight = MediaQuery.of(context).size.height * 0.3;
    var imageHeight2 = MediaQuery.of(context).size.height * 0.4;
    final List<StaggeredGridTile> cardTile = [
       StaggeredGridTile.extent(
        crossAxisCellCount: 2,
        mainAxisExtent: imageHeight,
        child: const HoverImage(
          imageUrl: 'https://madison-technologies.com/wp-content/uploads/2020/11/cs-ipc-resized.png',
          hoverImageUrl: 'https://madison-technologies.com/wp-content/uploads/2020/11/IPC-Shopping-Centre-1@2x.png',
        ),
      ),
       StaggeredGridTile.extent(
        crossAxisCellCount: 2,
        mainAxisExtent: imageHeight,
        child: const HoverImage(
          imageUrl: 'https://madison-technologies.com/wp-content/uploads/2020/11/cs-workct-pro-resized.png',
          hoverImageUrl: 'https://madison-technologies.com/wp-content/uploads/2020/11/WorkCT-Pro-1-resized.png',
        ),
      ),
       StaggeredGridTile.extent(
        crossAxisCellCount: 2,
        mainAxisExtent: imageHeight,
        child: const HoverImage(
          imageUrl: 'https://madison-technologies.com/wp-content/uploads/2020/11/cs-hitb-resized.png',
          hoverImageUrl: 'https://madison-technologies.com/wp-content/uploads/2020/11/HITB-featured-image@2x.png',
        ),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 3,
        mainAxisExtent: imageHeight2,
        child: const HoverImage(
          imageUrl: 'https://madison-technologies.com/wp-content/uploads/2022/02/cs-fave-resized.png',
          hoverImageUrl: 'https://madison-technologies.com/wp-content/uploads/2022/02/Fave-1024x529-1.png',
          isBigImage: true,
        ),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 3,
        mainAxisExtent: imageHeight2,
        child: const HoverImage(
          imageUrl: 'https://madison-technologies.com/wp-content/uploads/2021/07/cs-experian-resized.png',
          hoverImageUrl: 'https://madison-technologies.com/wp-content/uploads/2021/07/Experian-–-1@2x@2x.png',
          isBigImage: true,
        ),
      ),
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringConstants.featuredWork,
            style: TextUtils.headerStyle(),
          ),
          const SizedBox(
            height: SpacingUtils.small,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              StringConstants.featuredWorkDescription,
              style: TextUtils.contentStyle().copyWith(fontSize: 23),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: SpacingUtils.small,
          ),
          StaggeredGrid.count(
            crossAxisCount: 6,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: cardTile,
          ),
          const SizedBox(
            height: SpacingUtils.small,
          ),
          PrimaryButton(title: StringConstants.viewMoreProjects, onPressed: () {}),
        ],
      ),
    );
  }
}
