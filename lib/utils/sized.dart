import 'package:flutter/material.dart';

class SizeUtil {
  static late MediaQueryData _mediaQueryData;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  static MediaQueryData get mediaQuery => _mediaQueryData;
  static int get baseHeight => 913;
  static int get baseWidth => 375;
}
