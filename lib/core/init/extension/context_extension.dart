import 'package:flutter/material.dart';
import 'package:cubtale/app_bloc/core/color_theme_bloc/color_theme_bloc.dart';
import 'package:cubtale/core/constants/color_constants.dart';
import 'package:cubtale/core/enum/theme_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_ext.dart';

extension MediaQueryExtension on BuildContext {
  _ThemeExt get appTheme {
    _ThemeExt.context = this;
    return const _ThemeExt._();
  }

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get hlowValue => height * 0.01;
  double get hmediumValue => height * 0.02;
  double get hmediumxValue => height * 0.03;
  double get hhighValue5 => height * 0.05;
  double get hhighValue => height * 0.06;
  double get hveryHighValue => height * 0.1;
  double get hveryHighdValue => height * 0.15;
  double get hveryHighdxValue => height * 0.17;
  double get hveryHighValue2x => height * 0.2;
  double get hveryHighValue3x => height * 0.3;
  double get hveryHighValue4x => height * 0.4;
  double get hveryHighValue5x => height * 0.5;

  double get wlowValue => width * 0.01;
  double get wmediumValue => width * 0.02;
  double get whighValue4 => width * 0.04;
  double get whighValue5 => width * 0.05;
  double get whighValue => width * 0.06;
  double get wveryHighValue => width * 0.1;
  double get wveryHighValuedx => width * 0.15;
  double get wveryHighValue2x => width * 0.2;
  double get wveryHighValue3x => width * 0.3;
  double get wveryHighValue4x => width * 0.4;
  double get wveryHighValue5x => width * 0.5;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
