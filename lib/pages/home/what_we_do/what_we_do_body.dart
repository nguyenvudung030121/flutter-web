import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/utils/utils.dart';

class WhatWeDoBodyDesk extends StatefulWidget {
  const WhatWeDoBodyDesk({Key? key}) : super(key: key);

  @override
  State<WhatWeDoBodyDesk> createState() => _WhatWeDoBodyDeskState();
}

class _WhatWeDoBodyDeskState extends State<WhatWeDoBodyDesk> {
  late Uint8List imageBytes;
  late TextStyle textStyle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const String base64Image = StringConstants.imgBase64;
    imageBytes = base64Decode(base64Image.split(',')[1]);
    textStyle = TextUtils.defaultStyle().copyWith(
      fontFamily: TextUtils.fontFamily(FontSourceSansPro.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _buildWhatWeDoWidget(),
          ),
          Expanded(
            child: Image.memory(
              imageBytes,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatWeDoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextUtils.capitalizeFirstCharOfWords(StringConstants.whatWeDo),
          style: TextUtils.headerStyle(),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          StringConstants.whatWeDoContent,
          style: TextUtils.contentStyle().copyWith(
            fontSize: 23,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        _buildStaggeredGridRow([
          {
            'imageUrl': 'assets/images/infrastructure.svg',
            'title': StringConstants.superAppInfrastructure,
            'content': StringConstants.superAppInfrastructureContent,
          },
          {
            'imageUrl': 'assets/images/UIDesign.svg',
            'title': StringConstants.cloudComputingForFinTech,
            'content': StringConstants.cloudComputingForFinTechContent,
          },
          {
            'imageUrl': 'assets/images/ITSecurity.svg',
            'title': StringConstants.cyberSecurity,
            'content': StringConstants.cyberSecurityContent,
          },
        ]),
        const SizedBox(
          height: 20,
        ),
        _buildStaggeredGridRow([
          {
            'imageUrl': 'assets/images/web_development.svg',
            'title': StringConstants.largeScaleWebDevelopment,
            'content': StringConstants.largeScaleWebDevelopmentContent,
          },
          {
            'imageUrl': 'assets/images/mobile_development.svg',
            'title': StringConstants.mobileAppDevelopment,
            'content': StringConstants.mobileAppDevelopmentContent,
          },
          {
            'imageUrl': 'assets/images/UIDesign.svg',
            'title': StringConstants.uxUi,
            'content': StringConstants.uxUiContent,
          },
        ]),
      ],
    );
  }

  Widget _buildStaggeredGridRow(List<Map<String, String>> items) {
    List<Widget> rowItems = [];
    for (int i = 0; i < items.length; i++) {
      rowItems.add(
        Expanded(
          child: WhatWeDoItem(
            imageUrl: items[i]['imageUrl']!,
            title: items[i]['title']!,
            content: items[i]['content']!,
          ),
        ),
      );
      if (i < items.length - 1) {
        rowItems.add(const SizedBox(width: 30));
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowItems,
    );
  }
}

class WhatWeDoBodyMobile extends StatefulWidget {
  const WhatWeDoBodyMobile({Key? key}) : super(key: key);

  @override
  State<WhatWeDoBodyMobile> createState() => _WhatWeDoBodyMobileState();
}

class _WhatWeDoBodyMobileState extends State<WhatWeDoBodyMobile> {
  late Uint8List imageBytes;
  late TextStyle textStyle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const String base64Image = StringConstants.imgBase64;
    imageBytes = base64Decode(base64Image.split(',')[1]);
    textStyle = TextUtils.defaultStyle().copyWith(
      fontFamily: TextUtils.fontFamily(FontSourceSansPro.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double imageHeight = constraints.maxWidth >= 800
          ? MediaQuery.of(context).size.height * 0.8
          : MediaQuery.of(context).size.height * 0.5;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.memory(
              imageBytes,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.7,
              height: imageHeight,
            ),
            const SizedBox(
              height: 30,
            ),
            _buildWhatWeDoWidget(constraints),
          ],
        ),
      );
    });
  }

  Widget _buildWhatWeDoWidget(BoxConstraints constraints) {
    int itemsPerRow = constraints.maxWidth >= 600 ? 3 : 2;

    List<Map<String, String>> items = [
      {
        'imageUrl': 'assets/images/infrastructure.svg',
        'title': StringConstants.superAppInfrastructure,
        'content': StringConstants.superAppInfrastructureContent,
      },
      {
        'imageUrl': 'assets/images/UIDesign.svg',
        'title': StringConstants.cloudComputingForFinTech,
        'content': StringConstants.cloudComputingForFinTechContent,
      },
      {
        'imageUrl': 'assets/images/ITSecurity.svg',
        'title': StringConstants.cyberSecurity,
        'content': StringConstants.cyberSecurityContent,
      },
      {
        'imageUrl': 'assets/images/web_development.svg',
        'title': StringConstants.largeScaleWebDevelopment,
        'content': StringConstants.largeScaleWebDevelopmentContent,
      },
      {
        'imageUrl': 'assets/images/mobile_development.svg',
        'title': StringConstants.mobileAppDevelopment,
        'content': StringConstants.mobileAppDevelopmentContent,
      },
      {
        'imageUrl': 'assets/images/UIDesign.svg',
        'title': StringConstants.uxUi,
        'content': StringConstants.uxUiContent,
      },
    ];

    List<Widget> rows = [];
    for (int i = 0; i < items.length; i += itemsPerRow) {
      rows.add(
        _buildStaggeredGridRow(items.sublist(i, i + itemsPerRow > items.length ? items.length : i + itemsPerRow)),
      );
      if (i + itemsPerRow < items.length) {
        rows.add(const SizedBox(height: 20));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextUtils.capitalizeFirstCharOfWords(StringConstants.whatWeDo),
          style: TextUtils.headerStyle().copyWith(fontSize: 17.spMax),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          StringConstants.whatWeDoContent,
          style: TextUtils.contentStyle().copyWith(
            fontSize: 15.spMin,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows,
        ),
      ],
    );
  }

  Widget _buildStaggeredGridRow(List<Map<String, String>> items) {
    List<Widget> rowItems = [];
    for (int i = 0; i < items.length; i++) {
      rowItems.add(
        Expanded(
          child: WhatWeDoItemMob(
            imageUrl: items[i]['imageUrl']!,
            title: items[i]['title']!,
            content: items[i]['content']!,
          ),
        ),
      );
      if (i < items.length - 1) {
        rowItems.add(const SizedBox(width: 30));
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowItems,
    );
  }
}
