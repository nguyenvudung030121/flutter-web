import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/main.dart';
import 'package:flutter_webapp/utils/text_utils.dart';

class PrimaryButtonBodyDesk extends StatelessWidget {
  const PrimaryButtonBodyDesk({Key? key, required this.title, this.onPressed}) : super(key: key);
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.lightBlueAccent),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.blue.withOpacity(0.2); // Set your desired hover color here
            }
            return null; // Defer to the widget's default
          },
        ),
        elevation: WidgetStateProperty.all<double>(0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 3.5.sp,
          fontWeight: FontWeight.w400,
          fontFamily: TextUtils.fontFamily(FontSourceSansPro.semiBold),
        ),
      ),
    );
  }
}
