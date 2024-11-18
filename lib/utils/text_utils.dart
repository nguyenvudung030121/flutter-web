import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FontSourceSansPro { regular, bold, semiBold }

enum FontAlfa { regular }

class TextUtils {
  static String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  static String capitalizeFirstCharOfWords(String sentence) {
    return sentence.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return word;
    }).join(' ');
  }

  static TextStyle navBarStyle(bool isSelected, bool isHover) {
    return TextStyle(
        fontSize: 15,
        color: isSelected
            ? Colors.lightBlueAccent
            : isHover
                ? Colors.lightBlueAccent
                : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal);
  }

  static TextStyle headerStyle() {
    return TextStyle(
        fontSize: 11.sp,
        color: Colors.lightBlueAccent,
        fontWeight: FontWeight.w800,
        height: 1.2,
        fontFamily: 'AlfaSlabOne',
        letterSpacing: 3);
  }

  static TextStyle contentStyle() {
    return  TextStyle(
        fontSize: 6.sp, color: Colors.black, fontWeight: FontWeight.w400, height: 1.5, fontFamily: 'SourceSansPro');
  }

  static TextStyle defaultStyle() {
    return TextStyle(
        fontSize: 4.5.sp, color: Colors.black, fontWeight: FontWeight.w400, height: 1.5, fontFamily: 'SourceSansPro');
  }

  static String fontFamily(FontSourceSansPro fontSourceSansPro) {
    return fontSourceSansPro == FontSourceSansPro.regular
        ? 'SourceSansPro'
        : fontSourceSansPro == FontSourceSansPro.bold
            ? 'SourceSansProBold'
            : 'SourceSansProSemiBold';
  }
}
