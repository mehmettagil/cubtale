import 'package:flutter/material.dart';

class ColorConstants {
  const ColorConstants._({
    required this.backgroundColor,
    required this.textColor,
    required this.white,
  });
  factory ColorConstants.light() {
    return const ColorConstants._(
      backgroundColor: Color(0xffb8e6db),
      white: Colors.white,
      textColor: Colors.black,
    );
  }
  factory ColorConstants.dark() {
    return const ColorConstants._(
      backgroundColor: Color(0xff475AD7),
      white: Colors.white,
      textColor: Colors.white,
    );
  }
  final Color backgroundColor;
  final Color white;
  final Color textColor;
}
