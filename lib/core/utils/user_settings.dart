import 'package:flutter/material.dart';

// Класс, который получает размеры экрана пользователя. В дальнейшем
// Вместо того чтобы заново получать размеры экрана пользователя, они
// будут браться из этого класса.
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
