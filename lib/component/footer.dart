import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => const FooterDesk(),
      tablet: (BuildContext context) => const FooterTab(),
      mobile: (BuildContext context) => const FooterMob(),
    );
  }
}

class FooterDesk extends StatelessWidget {
  const FooterDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Made with ❤️ by Dung Nguyen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey.shade500),
          )
        ],
      ),
    );
  }
}

class FooterTab extends StatelessWidget {
  const FooterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Made with ❤️ by Dung Nguyen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey.shade500),
          )
        ],
      ),
    );
  }
}

class FooterMob extends StatelessWidget {
  const FooterMob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Made with ❤️ by Dung Nguyen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey.shade500),
            )
          ],
        ),
      ),
    );
  }
}
