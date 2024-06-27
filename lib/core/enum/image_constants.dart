import 'package:flutter/material.dart';

enum IconConstants {
  appIcon('cubtale_logo'),
  watermark('cubtale_watermark'),
  darkMode('darkmode_icon'),
  lightMode('lightmode_icon'),
  menu('menu_burger'),
  error('oops_icon'),
  profileDark('profile_image_dark'),
  profileLight('profile_image_light'),
  verticalDivider('vertical_divider');

  final String value;
  // ignore: sort_constructors_first
  const IconConstants(this.value);

  String get toPng => 'assets/icon/ic_$value.png';
  Image get toImage => Image.asset(toPng);
}
