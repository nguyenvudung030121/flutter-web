import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/utils/utils.dart';

class WelcomePageDesk extends StatelessWidget {
  const WelcomePageDesk({Key? key}) : super(key: key);
  final rowDividerDesk = const SizedBox(
    height: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/masthead.png',
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    StringConstants.yourPropTech,
                    style: TextUtils.headerStyle(),
                  ),
                ),
                rowDividerDesk,
                Text.rich(
                  TextSpan(
                    style: TextUtils.contentStyle(),
                    children: [
                      const TextSpan(text: 'We aim to be the '),
                      TextSpan(
                        text: '#1 provider of Super Apps',
                        style: TextUtils.contentStyle()
                            .copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(text: ' for '),
                      TextSpan(
                        text: 'PropTech in Southeast Asia',
                        style: TextUtils.contentStyle()
                            .copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(text: ', empowering enterprises with '),
                      TextSpan(
                        text: 'secure, innovative technology',
                        style: TextUtils.contentStyle()
                            .copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(text: ' that drives efficiency and growth. With decades of expertise in '),
                      TextSpan(
                        text: 'PropTech and FinTech',
                        style: TextUtils.contentStyle()
                            .copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(text: ' partnerships, we deliver '),
                      TextSpan(
                        text: 'Agile Applications',
                        style: TextUtils.contentStyle()
                            .copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(text: ', optimized '),
                      TextSpan(
                        text: 'Cloud Computing',
                        style: TextUtils.contentStyle()
                            .copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(text: ' services, and '),
                      TextSpan(
                        text: 'Robust Security',
                        style: TextUtils.contentStyle()
                            .copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(
                          text: ' solutions that transform business operations in an evolving digital landscape.'),
                    ],
                  ),
                ),
                rowDividerDesk,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/top_clutch_singapore.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/top_clutch_malaysia.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WelcomePageMob extends StatelessWidget {
  const WelcomePageMob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isSmallScreen = constraints.maxWidth >= 600 ? false : true;
      var textStyle = TextUtils.contentStyleMobile().copyWith(fontSize: 17.spMin);
      var textLinkStyle = textStyle
          .copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/masthead.png',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              StringConstants.yourPropTech,
              style: TextUtils.headerStyle().copyWith(fontSize: 17.spMax),
            ),
            const SizedBox(
              height: 20,
            ),
            Text.rich(
              TextSpan(
                style: textStyle,
                children: [
                  const TextSpan(text: 'We aim to be the '),
                  TextSpan(
                    text: '#1 provider of Super Apps',
                    style: textLinkStyle,
                  ),
                  const TextSpan(text: ' for '),
                  TextSpan(
                    text: 'PropTech in Southeast Asia',
                    style: textLinkStyle,
                  ),
                  const TextSpan(text: ', empowering enterprises with '),
                  TextSpan(
                    text: 'secure, innovative technology',
                    style: textLinkStyle,
                  ),
                  const TextSpan(text: ' that drives efficiency and growth. With decades of expertise in '),
                  TextSpan(
                    text: 'PropTech and FinTech',
                    style: textLinkStyle,
                  ),
                  const TextSpan(text: ' partnerships, we deliver '),
                  TextSpan(
                    text: 'Agile Applications',
                    style: textLinkStyle,
                  ),
                  const TextSpan(text: ', optimized '),
                  TextSpan(
                    text: 'Cloud Computing',
                    style: textLinkStyle,
                  ),
                  const TextSpan(text: ' services, and '),
                  TextSpan(
                    text: 'Robust Security',
                    style: textLinkStyle,
                  ),
                  const TextSpan(
                      text: ' solutions that transform business operations in an evolving digital landscape.'),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/top_clutch_singapore.png',
                  width: isSmallScreen ? 100 : 150,
                  height: isSmallScreen ? 100 : 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 30,
                ),
                Image.asset(
                  'assets/images/top_clutch_malaysia.png',
                  width: isSmallScreen ? 100 : 150,
                  height: isSmallScreen ? 100 : 150,
                  fit: BoxFit.contain,
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
