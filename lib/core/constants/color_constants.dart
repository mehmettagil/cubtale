import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorConstants {
  const ColorConstants._({
    required this.backgroundColor,
    required this.secondaryBackgroundColor,
    required this.textColor,
    required this.white,
    required this.customerTextColor,
    required this.textFieldColor,
    required this.errorText,
    required this.appBarColor,
    required this.dividerColor,
    required this.borderColor,
    required this.searchTitleColor,
  });
  factory ColorConstants.light() {
    return const ColorConstants._(
        backgroundColor: Color(0xffb8e6db),
        secondaryBackgroundColor: Color(0xffe8f4f4),
        white: Colors.white,
        textColor: Color(0xff2ea09d),
        customerTextColor: Color(0xff577b8c),
        textFieldColor: Color(0xffd4ecea),
        errorText: Color(0xff22a9a8),
        appBarColor: Color(0xffb9e1d8),
        dividerColor: Color(0xff219a98),
        borderColor: Color(0xff68a8a7),
        searchTitleColor: Color(0xff005168));
  }
  factory ColorConstants.dark() {
    return const ColorConstants._(
        backgroundColor: Color(0xff475AD7),
        secondaryBackgroundColor: Color(0xffe8f4f4),
        white: Colors.white,
        textColor: Color(0xff2ea09d),
        customerTextColor: Color(0x0fff7587),
        textFieldColor: Color(0xffd4ecea),
        errorText: Color(0xff22a9a8),
        appBarColor: Color(0xffb9e1d8),
        dividerColor: Color(0xff219a98),
        borderColor: Color(0xff68a8a7),
        searchTitleColor: Color(0xff005168));
  }
  final Color backgroundColor;
  final Color secondaryBackgroundColor;
  final Color white;
  final Color textColor;
  final Color customerTextColor;
  final Color textFieldColor;
  final Color errorText;
  final Color appBarColor;
  final Color dividerColor;
  final Color borderColor;
  final Color searchTitleColor;
}
