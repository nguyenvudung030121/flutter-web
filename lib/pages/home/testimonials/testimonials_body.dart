import 'package:flutter/material.dart';
import 'package:flutter_webapp/utils/utils.dart';

class TestimonialsBodyDesk extends StatefulWidget {
  const TestimonialsBodyDesk({Key? key}) : super(key: key);
  @override
  State<TestimonialsBodyDesk> createState() => _TestimonialsBodyDesk();
}

class _TestimonialsBodyDesk  extends State<TestimonialsBodyDesk > {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
      child: Column(
        children: [
          Text(StringConstants.testimonials, style: TextUtils.headerStyle().copyWith(color: Colors.black)),
          const SizedBox(height: 10),
          Text(StringConstants.ourSuccessStories, style: TextUtils.defaultStyle().copyWith(fontSize: 24)),
        ],
      ),
    );
  }
}
