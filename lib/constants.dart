import 'package:flutter/material.dart';

class AppConstants {
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Curve animationCurve = Curves.easeInOut;

  static const TextStyle titleStyle = TextStyle(fontSize: 24);
  static const TextStyle buttonTextStyle = TextStyle(fontSize: 18);

  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 15,
  );

  static const Size buttonMinSize = Size(10, 10);
  static const double spaceBetweenButtons = 20;
}
