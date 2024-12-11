import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_webapp/component/primary_button/primary_button.dart';

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
          imageUrl: 'assets/images/ipc_resized.png',
          hoverImageUrl: 'assets/images/ipc_logo.png',
        ),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 2,
        mainAxisExtent: imageHeight,
        child: const HoverImage(
          imageUrl: 'assets/images/workct_pro_resized.png',
          hoverImageUrl: 'assets/images/workct_pro_logo.png',
        ),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 2,
        mainAxisExtent: imageHeight,
        child: const HoverImage(
          imageUrl: 'assets/images/cs-hitb-resized.png',
          hoverImageUrl: 'assets/images/HITB_logo.png',
        ),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 3,
        mainAxisExtent: imageHeight2,
        child: const HoverImage(
          imageUrl: 'assets/images/fave-resized.png',
          hoverImageUrl: 'assets/images/fave_reclogo.png',
          isBigImage: true,
        ),
      ),
      StaggeredGridTile.extent(
        crossAxisCellCount: 3,
        mainAxisExtent: imageHeight2,
        child: const HoverImage(
          imageUrl: 'assets/images/cs-experian-resized.png',
          hoverImageUrl: 'assets/images/experian_reclogo.png',
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
              style: TextUtils.contentStyle().copyWith(fontSize: 14.spMin),
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

class FeaturedWorkBodyMobile extends StatelessWidget {
  const FeaturedWorkBodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<HoverImage> hoverImageList = [
      const HoverImage(
        imageUrl: 'assets/images/ipc_resized.png',
        hoverImageUrl: 'assets/images/ipc_logo.png',
        isMobileImage: true,
      ),
      const HoverImage(
        imageUrl: 'assets/images/workct_pro_resized.png',
        hoverImageUrl: 'assets/images/workct_pro_logo.png',
        isMobileImage: true,
      ),
      const HoverImage(
        imageUrl: 'assets/images/cs-hitb-resized.png',
        hoverImageUrl: 'assets/images/HITB_logo.png',
        isMobileImage: true,
      ),
      const HoverImage(
        imageUrl: 'assets/images/fave-resized.png',
        hoverImageUrl: 'assets/images/fave_reclogo.png',
        isMobileImage: true,
      ),
      const HoverImage(
        imageUrl: 'assets/images/cs-experian-resized.png',
        hoverImageUrl: 'assets/images/experian_reclogo.png',
        isMobileImage: true,
      ),
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              StringConstants.featuredWork,
              style: TextUtils.headerStyle().copyWith(fontSize: 17.spMax),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            StringConstants.featuredWorkDescription,
            style: TextUtils.contentStyle().copyWith(fontSize: 15.spMin),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: hoverImageList.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: SpacingUtils.small,
            ),
            itemBuilder: (context, index) {
              return hoverImageList[index];
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: PrimaryButton(
              title: StringConstants.viewMoreProjects,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
