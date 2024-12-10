import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_webapp/utils/utils.dart';

class WhatWeDoItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String content;

  const WhatWeDoItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<WhatWeDoItem> createState() => _WhatWeDoItemState();
}

class _WhatWeDoItemState extends State<WhatWeDoItem> {
  bool isHovered = false;
  late TextStyle textStyle;

  @override
  void initState() {
    super.initState();
    textStyle = TextUtils.defaultStyle().copyWith(
      fontFamily: TextUtils.fontFamily(FontSourceSansPro.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            widget.imageUrl,
            height: 55,
            width: 55,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
            ),
            onHover: (value) {
              if (value) {
                setState(() {
                  textStyle = textStyle.copyWith(
                    color: Colors.lightBlueAccent,
                  );
                });
              } else {
                setState(() {
                  textStyle = textStyle.copyWith(
                    color: Colors.black,
                  );
                });
              }
            },
            child: Text(
              widget.title,
              style: textStyle,
            ),
          ),
            Opacity(
              opacity: isHovered ? 1 : 0,
              child: Text(
                widget.content,
                style: TextUtils.defaultStyle().copyWith(fontSize: 14),
              ),
            ),
        ],
      ),
    );
  }
}

class WhatWeDoItemMob extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String content;

  const WhatWeDoItemMob({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<WhatWeDoItemMob> createState() => _WhatWeDoItemMobState();
}

class _WhatWeDoItemMobState extends State<WhatWeDoItemMob> {
  bool isHovered = false;
  late TextStyle textStyle;

  @override
  void initState() {
    super.initState();
    textStyle = TextUtils.defaultStyle().copyWith(
      fontFamily: TextUtils.fontFamily(FontSourceSansPro.bold),
      fontSize: 14.spMin,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            widget.imageUrl,
            height: 25.w,
            width: 25.h,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
            ),
            onHover: (value) {
              if (value) {
                setState(() {
                  textStyle = textStyle.copyWith(
                    color: Colors.lightBlueAccent,
                  );
                });
              } else {
                setState(() {
                  textStyle = textStyle.copyWith(
                    color: Colors.black,
                  );
                });
              }
            },
            child: Text(
              widget.title,
              style: textStyle,
            ),
          ),
          Opacity(
            opacity: isHovered ? 1 : 0,
            child: Text(
              widget.content,
              style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin),
            ),
          ),
        ],
      ),
    );
  }
}

