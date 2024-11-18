import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
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
            'imageUrl': 'https://madison-technologies.com/wp-content/uploads/2020/12/Infrastructure.svg',
            'title': StringConstants.superAppInfrastructure,
            'content': StringConstants.superAppInfrastructureContent,
          },
          {
            'imageUrl': 'https://madison-technologies.com/wp-content/uploads/2021/12/flexibility.svg',
            'title': StringConstants.cloudComputingForFinTech,
            'content': StringConstants.cloudComputingForFinTechContent,
          },
          {
            'imageUrl': 'https://madison-technologies.com/wp-content/uploads/2020/12/ITSecurity.svg',
            'title': StringConstants.cyberSecurity,
            'content': StringConstants.cyberSecurityContent,
          },
        ]),
        const SizedBox(
          height: 20,
        ),
        _buildStaggeredGridRow([
          {
            'imageUrl': 'https://madison-technologies.com/wp-content/uploads/2020/12/WebDevelopment.svg',
            'title': StringConstants.largeScaleWebDevelopment,
            'content': StringConstants.largeScaleWebDevelopmentContent,
          },
          {
            'imageUrl': 'https://madison-technologies.com/wp-content/uploads/2020/12/MobileDevelopment.svg',
            'title': StringConstants.mobileAppDevelopment,
            'content': StringConstants.mobileAppDevelopmentContent,
          },
          {
            'imageUrl': 'https://madison-technologies.com/wp-content/uploads/2020/12/UIDesign.svg',
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
