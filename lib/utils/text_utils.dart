import 'package:flutter/material.dart';

class TextUtils {
  static String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
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
    return const TextStyle(fontSize: 60, color: Colors.lightBlueAccent, fontWeight: FontWeight.w800);
  }
}
