import 'package:flutter/material.dart';

class UserSettings {
  static late final Size userSize;
  static late final double width;
  static late double height;
  static bool isGet = false;

  static void setSize(Size size) {
    if (!isGet) {
      userSize = size;
      width = size.width;
      height = size.height;
      isGet = true;
    }
  }
}
