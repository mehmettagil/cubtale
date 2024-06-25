part of 'context_extension.dart';

class _ThemeExt {
  const _ThemeExt._();

  static late BuildContext context;

  bool get isDarkTheme {
    final state = _colorThemeState;

    return state.theme == ThemeEnum.dark;
  }

  bool get isLightTheme {
    return !isDarkTheme;
  }

  ColorConstants get colors {
    final state = _colorThemeState;
    if (state.theme == ThemeEnum.dark) {
      return ColorConstants.dark();
    } else {
      return ColorConstants.light();
    }
  }

  ColorThemeState get _colorThemeState {
    return context.watch<ColorThemeBloc>().state;
  }
}
