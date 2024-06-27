
import 'package:flutter/material.dart';

class ColorConstants {
  const ColorConstants._({
    required this.backgroundColor,
    required this.secondaryBackgroundColor,
    required this.textColor,
    required this.basic,
    required this.customerTextColor,
    required this.textFieldColor,
    required this.errorText,
    required this.appBarColor,
    required this.dividerColor,
    required this.borderColor,
    required this.searchTitleColor,
    required this.modeButtonColor,
    required this.errorBackground,
    required this.customerListTitleColor,
  });
  factory ColorConstants.light() {
    return const ColorConstants._(
        backgroundColor: Colors.white,
        secondaryBackgroundColor: Color(0xffe8f4f4),
        basic: Colors.black,
        textColor: Color(0xff2ea09d),
        customerTextColor: Color(0xff577b8c),
        textFieldColor: Color(0xffd4ecea),
        errorText: Color(0xff22a9a8),
        appBarColor: Color(0xffb9e1d8),
        dividerColor: Color(0xff219a98),
        borderColor: Color(0xff68a8a7),
        searchTitleColor: Color(0xff005168),
        modeButtonColor: Color(0xffdcf1ec),
        errorBackground: Colors.white,
        customerListTitleColor: Color(0xff219a98));
  }
  factory ColorConstants.dark() {
    return const ColorConstants._(
        backgroundColor: Color(0xff0e1f31),
        secondaryBackgroundColor: Color(0xff162C3A),
        basic: Colors.white,
        textColor: Colors.white,
        customerTextColor: Colors.white,
        textFieldColor: Color(0xff196369),
        errorText: Color(0xff22a9a8),
        appBarColor: Color(0xff184b57),
        dividerColor: Color(0xff219a98),
        borderColor: Color(0xff68a8a7),
        searchTitleColor: Colors.white,
        modeButtonColor: Color(0xff8fa7ae),
        errorBackground: Color(0xff1A323C),
        customerListTitleColor: Colors.white);
  }
  final Color backgroundColor;
  final Color secondaryBackgroundColor;
  final Color basic;
  final Color textColor;
  final Color customerTextColor;
  final Color textFieldColor;
  final Color errorText;
  final Color appBarColor;
  final Color dividerColor;
  final Color borderColor;
  final Color searchTitleColor;
  final Color modeButtonColor;
  final Color errorBackground;
  final Color customerListTitleColor;
}
