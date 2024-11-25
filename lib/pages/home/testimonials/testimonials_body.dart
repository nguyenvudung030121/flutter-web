import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/utils/utils.dart';

class TestimonialsBodyDesk extends StatefulWidget {
  const TestimonialsBodyDesk({Key? key}) : super(key: key);

  @override
  State<TestimonialsBodyDesk> createState() => _TestimonialsBodyDesk();
}

class _TestimonialsBodyDesk extends State<TestimonialsBodyDesk> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://madison-technologies.com/wp-content/themes/madison/assets/images/testimonial-bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(StringConstants.testimonials, style: TextUtils.headerStyle().copyWith(color: Colors.black)),
          const SizedBox(height: 10),
          Text(StringConstants.ourSuccessStories, style: TextUtils.defaultStyle().copyWith(fontSize: 24)),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 280.h,
                autoPlay: false,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.35,
                viewportFraction: 0.35,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.lightBlueAccent.withOpacity(0.8), width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Experian APAC',
                            style: TextUtils.defaultStyle().copyWith(
                              fontSize: 5.sp,
                              fontFamily: TextUtils.fontFamily(FontSourceSansPro.semiBold),
                            ),
                          ),
                          Text(
                            '99',
                            style: TextUtils.defaultStyle().copyWith(
                              fontSize: 7.sp,
                              color: Colors.lightBlueAccent.withOpacity(0.5),
                              fontFamily: TextUtils.fontFamily(FontSourceSansPro.semiBold),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          'The Madison team works seamlessly internally to get our tasks and work done efficiently. Their coordination work and transparency with the client (us) has made the entire process much easier to manage for us with lesser unnecessary back and forth communication and lesser hiccups. Always feel safe to count on them even when I’m away on leave! ',
                          style: TextUtils.defaultStyle().copyWith(fontSize: 3.7.sp),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 8,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.message_outlined, color: Colors.black, size: 5.sp),
                          const SizedBox(width: 20,),
                          Text(
                            'Experian APAC',
                            style: TextUtils.defaultStyle().copyWith(
                              fontFamily: TextUtils.fontFamily(FontSourceSansPro.semiBold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
