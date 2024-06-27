import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorConstants {
  const ColorConstants._({
    required this.backgroundColor,
    required this.textColor,
    required this.white,
    required this.customerTextColor,
  });
  factory ColorConstants.light() {
    return const ColorConstants._(
      backgroundColor: Color(0xffb8e6db),
      white: Colors.white,
      textColor: Colors.black,
      customerTextColor: Color(0x0fff7587),
    );
  }
  factory ColorConstants.dark() {
    return const ColorConstants._(
      backgroundColor: Color(0xff475AD7),
      white: Colors.white,
      textColor: Colors.white,
      customerTextColor: Color(0xfff7f8f8),
    );
  }
  final Color backgroundColor;
  final Color white;
  final Color textColor;
  final Color customerTextColor;
}
