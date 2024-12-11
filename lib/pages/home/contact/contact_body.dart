import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/component/primary_button/primary_button.dart';
import 'package:flutter_webapp/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactHomePageBodyDesk extends StatefulWidget {
  const ContactHomePageBodyDesk({Key? key}) : super(key: key);

  @override
  State<ContactHomePageBodyDesk> createState() => _ContactHomePageBodyDeskState();
}

class _ContactHomePageBodyDeskState extends State<ContactHomePageBodyDesk> {
  final List<String> items = [
    'Website Development',
    'Mobile App Development',
    'Item3',
    'Item4',
    'Item5',
  ];

  var dropdownTextItemStyle = TextUtils.defaultStyle().copyWith(fontWeight: FontWeight.w300);

  _launchURL() async {
    Uri url = Uri.parse('https://mail.google.com/');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool isAgreePolicy = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(StringConstants.letUsTake, style: TextUtils.headerStyle().copyWith(color: Colors.black)),
                const SizedBox(height: 20),
                Text(StringConstants.letUsTakeContent, style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.mail_outline_rounded, color: Colors.lightBlueAccent, size: 10.sp),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        _launchURL;
                      },
                      child: Text(
                        'hello@madison-technology.com',
                        style: TextUtils.linkStyle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.perm_phone_msg_outlined, color: Colors.lightBlueAccent, size: 10.sp),
                    const SizedBox(width: 10),
                    InkWell(
                      child: Text(
                        'WhatsApp us',
                        style: TextUtils.linkStyle(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 30.w),
          buildContactBox()
        ],
      ),
    );
  }

  Widget buildContactBox() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          border: Border.fromBorderSide(
            BorderSide(
              color: Colors.lightBlueAccent,
              width: 2,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownComponent(
              items: items,
              onChanged: (value) {},
              dropdownTextItemStyle: dropdownTextItemStyle,
              title: StringConstants.imLookingFor,
            ),
            const SizedBox(height: 30),
            DropdownComponent(
              items: items,
              onChanged: (value) {},
              dropdownTextItemStyle: dropdownTextItemStyle,
              title: StringConstants.howDidYouHearAboutUs,
            ),
            const SizedBox(height: 30),
            _buildTextFiled(StringConstants.fullName),
            const SizedBox(height: 30),
            _buildTextFiled(StringConstants.companyName),
            const SizedBox(height: 30),
            _buildTextFiled(StringConstants.email),
            const SizedBox(height: 30),
            buildCountryPhoneField(),
            const SizedBox(height: 30),
            _buildTextFiled(StringConstants.message, isTextArea: true),
            const SizedBox(height: 20),
            buildCheckPolicy(),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'This site is protected by reCAPTCHA and the Google ',
                style: TextUtils.defaultStyle().copyWith(fontSize: 3.5.sp),
                children: [
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextUtils.linkStyle().copyWith(fontSize: 3.5.sp),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextUtils.defaultStyle().copyWith(fontSize: 3.5.sp),
                  ),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextUtils.linkStyle().copyWith(fontSize: 3.5.sp),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: ' apply.',
                    style: TextUtils.defaultStyle().copyWith(fontSize: 3.5.sp),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Spacer(),
                PrimaryButton(
                  onPressed: () {},
                  title: StringConstants.submit.toUpperCase(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row buildCheckPolicy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.8,
          child: Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              child: Checkbox(
                activeColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isAgreePolicy, // Set to true if checked, false if unchecked
                onChanged: (bool? value) {
                  setState(() {
                    isAgreePolicy = value!;
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'I agree to receive communications in line with Madison Technologies ',
              style: TextUtils.defaultStyle(),
              children: [
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextUtils.linkStyle().copyWith(fontSize: 4.sp),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(); // Your Privacy Policy URL
                    },
                ),
                TextSpan(
                  text: '. I can unsubscribe at any time.',
                  style: TextUtils.defaultStyle(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCountryPhoneField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            style: TextUtils.defaultStyle().copyWith(fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              hintText: '+1',
              hintStyle: TextUtils.defaultStyle().copyWith(color: Colors.grey[400], fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
            ),
          ),
        ),
        Container(
          height: 40.h,
          width: 1,
          color: Colors.black,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            style: TextUtils.defaultStyle().copyWith(fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              hintText: StringConstants.phoneNumber,
              hintStyle: TextUtils.defaultStyle().copyWith(color: Colors.grey[400], fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildTextFiled(String placeholder, {bool isTextArea = false}) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            maxLines: isTextArea ? 4 : 1,
            style: TextUtils.defaultStyle().copyWith(fontWeight: FontWeight.w200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: isTextArea ? 25 : 8),
              hintText: placeholder,
              hintStyle: TextUtils.defaultStyle().copyWith(color: Colors.grey[400], fontWeight: FontWeight.w200),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ContactHomePageBodyMobile extends StatefulWidget {
  const ContactHomePageBodyMobile({Key? key}) : super(key: key);

  @override
  State<ContactHomePageBodyMobile> createState() => _ContactHomePageBodyMobile();
}

class _ContactHomePageBodyMobile extends State<ContactHomePageBodyMobile> {
  final List<String> items = [
    'Website Development',
    'Mobile App Development',
    'Item3',
    'Item4',
    'Item5',
  ];

  var dropdownTextItemStyle = TextUtils.defaultStyle().copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 14.spMin,
  );

  _launchURL() async {
    Uri url = Uri.parse('https://mail.google.com/');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool isAgreePolicy = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 400;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstants.letUsTake,
                style: TextUtils.headerStyle().copyWith(
                  color: Colors.black,
                  fontSize: 17.spMax,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                StringConstants.letUsTakeContent,
                style: TextUtils.defaultStyle().copyWith(fontSize: 15.spMin),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.mail_outline_rounded, color: Colors.lightBlueAccent, size: 34.spMin),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'hello@madison-technology.com',
                      style: TextUtils.linkStyle().copyWith(fontSize: 15.spMin),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.perm_phone_msg_outlined, color: Colors.lightBlueAccent, size: 34.spMin),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'WhatsApp us',
                      style: TextUtils.linkStyle().copyWith(fontSize: 15.spMin),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildContactBox(isSmallScreen)
            ],
          ),
        );
      }
    );
  }

  Widget buildContactBox(bool isSmallScreen) {
    return Container(
      padding: isSmallScreen ? EdgeInsets.zero : const EdgeInsets.all(20),
      decoration: isSmallScreen ? null : const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.lightBlueAccent,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownComponent(
            items: items,
            onChanged: (value) {},
            dropdownTextItemStyle: dropdownTextItemStyle,
            title: StringConstants.imLookingFor,
          ),
          const SizedBox(height: 30),
          DropdownComponent(
            items: items,
            onChanged: (value) {},
            dropdownTextItemStyle: dropdownTextItemStyle,
            title: StringConstants.howDidYouHearAboutUs,
          ),
          const SizedBox(height: 30),
          _buildTextFiled(StringConstants.fullName),
          const SizedBox(height: 30),
          _buildTextFiled(StringConstants.companyName),
          const SizedBox(height: 30),
          _buildTextFiled(StringConstants.email),
          const SizedBox(height: 30),
          buildCountryPhoneField(),
          const SizedBox(height: 30),
          _buildTextFiled(StringConstants.message, isTextArea: true),
          const SizedBox(height: 20),
          _buildCheckPolicy(),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'This site is protected by reCAPTCHA and the Google ',
              style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin),
              children: [
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: ' and ',
                  style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin),
                ),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: ' apply.',
                  style: TextUtils.defaultStyle().copyWith(fontSize: 14.spMin),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: PrimaryButton(
              onPressed: () {},
              title: StringConstants.submit.toUpperCase(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCheckPolicy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.9,
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.zero,
            child: Checkbox(
              activeColor: Colors.lightBlueAccent,
              hoverColor: Colors.transparent,
              splashRadius: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: isAgreePolicy, // Set to true if checked, false if unchecked
              onChanged: (bool? value) {
                setState(() {
                  isAgreePolicy = value!;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'I agree to receive communications in line with Madison Technologies ',
              style: TextUtils.defaultStyle().copyWith(fontSize: 15.spMin),
              children: [
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextUtils.linkStyle().copyWith(fontSize: 15.spMin),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(); // Your Privacy Policy URL
                    },
                ),
                TextSpan(
                  text: '. I can unsubscribe at any time.',
                  style: TextUtils.defaultStyle().copyWith(fontSize: 15.spMin),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCountryPhoneField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            style: TextUtils.defaultStyle().copyWith(fontWeight: FontWeight.w300, fontSize: 14.spMin),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              hintText: '+1',
              hintStyle: TextUtils.defaultStyle()
                  .copyWith(color: Colors.grey[400], fontWeight: FontWeight.w300, fontSize: 14.spMin),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
            ),
          ),
        ),
        Container(
          height: 40.h,
          width: 1,
          color: Colors.black,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            style: TextUtils.defaultStyle().copyWith(fontWeight: FontWeight.w300, fontSize: 14.spMin),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              hintText: StringConstants.phoneNumber,
              hintStyle: TextUtils.defaultStyle()
                  .copyWith(color: Colors.grey[400], fontWeight: FontWeight.w300, fontSize: 14.spMin),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildTextFiled(String placeholder, {bool isTextArea = false}) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            maxLines: isTextArea ? 4 : 1,
            style: TextUtils.defaultStyle().copyWith(fontWeight: FontWeight.w200, fontSize: 14.spMin),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: isTextArea ? 25 : 8),
              hintText: placeholder,
              hintStyle: TextUtils.defaultStyle().copyWith(
                color: Colors.grey[400],
                fontWeight: FontWeight.w200,
                fontSize: 14.spMin,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
