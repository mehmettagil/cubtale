part of 'color_theme_bloc.dart';

class ColorThemeState extends Equatable {
  const ColorThemeState({
    required this.theme,
  });

  factory ColorThemeState.initial() {
    return const ColorThemeState(
      theme: ThemeEnum.system,
    );
  }

  final ThemeEnum theme;

  ColorThemeState copyWith({
    ThemeEnum? theme,
  }) {
    return ColorThemeState(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object> get props {
    return [
      theme,
    ];
  }
}
