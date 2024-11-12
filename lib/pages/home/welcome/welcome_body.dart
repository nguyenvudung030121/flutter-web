import 'package:flutter/material.dart';
import 'package:flutter_webapp/utils/text_utils.dart';
import 'package:flutter_webapp/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomePageDesk extends StatelessWidget {
  const WelcomePageDesk({Key? key}) : super(key: key);

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
                const Text(
                  "Hi ! Dung Nguyen",
                  style: TextStyle(fontWeight: FontWeight.w800, height: 1.3, fontSize: 50),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.network('https://madison-technologies.com/wp-content/uploads/2024/07/masthead-resized.jpg'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Your PropTech Super App Solution', style: TextUtils.headerStyle(),),
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
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                "Hi ! I'm Naveen Jujaray",
                style: TextStyle(fontWeight: FontWeight.w800, height: 1.3, fontSize: 32),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "I help out Spider-man with his web slingers, or you could call me a web designer.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.7,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://www.facebook.com/naveenjujaray"]);
                      },
                    )),
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.lightBlue,
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://twitter.com/naveenjujaray"]);
                      },
                    )),
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.linkedin,
                        color: Color.fromRGBO(40, 103, 178, 1),
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://www.linkedin.com/in/naveenjujaray"]);
                      },
                    )),
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.bloggerB,
                        color: Colors.red,
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://naveenjujaray.js.org"]);
                      },
                    )),
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.github,
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://www.github.com/naveenjujaray"]);
                      },
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.gitlab,
                        color: Colors.orange,
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://www.gitlab.com/naveenjujaray"]);
                      },
                    )),
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.medium,
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://medium.com/@naveenjujaray"]);
                      },
                    )),
                Container(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.dev,
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://dev.to/naveenjujaray"]);
                      },
                    )),
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.reddit,
                        color: Colors.deepOrangeAccent,
                        size: 40,
                      ),
                      onPressed: () {
                        // js.context.callMethod("open", ["https://www.reddit.com/user/jujaraynaveen"]);
                      },
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    // onTap: () => locator<NavigationService>().navigateTo(ContactRoute),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'CONTACT ME',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // js.context.callMethod("open",
                      //     ["https://drive.google.com/file/d/1PZYWMJEQMLIh5g5mXnENQcOL1vlunq6_/view?usp=sharing"]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'SEE MY RESUME',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
