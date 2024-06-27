import 'package:flutter/material.dart';
import 'package:cubtale/app_bloc/core/color_theme_bloc/color_theme_bloc.dart';
import 'package:cubtale/core/constants/color_constants.dart';
import 'package:cubtale/core/enum/theme_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_ext.dart';

extension MediaQueryExtension on BuildContext {
  // ignore: library_private_types_in_public_api
  _ThemeExt get appTheme {
    _ThemeExt.context = this;
    return const _ThemeExt._();
  }

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
