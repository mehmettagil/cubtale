import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cubtale/basic_structure/manager/cache_key.dart';
import 'package:cubtale/basic_structure/manager/i_cache_manager.dart';
import 'package:cubtale/core/enum/theme_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_theme_event.dart';
part 'color_theme_state.dart';

class ColorThemeBloc extends Bloc<ColorThemeEvent, ColorThemeState> {
  ColorThemeBloc(this._iCacheController) : super(ColorThemeState.initial()) {
    on<ColorThemeInitializedEvent>(
      _onColorThemeInitializedEvent,
      transformer: droppable(),
    );
    on<ColorThemeEvent>(
      (event, emit) async {
        if (event is ColorThemeLightSelectedEvent) {
          await _onLightSelected(event, emit);
        } else if (event is ColorThemeDarkSelectedEvent) {
          await _onDarkSelected(event, emit);
        } else if (event is ColorThemeSystemSelectedEvent) {
          await _onSystemSelected(event, emit);
        }
      },
      // sequential transformer ensures that events are processed one at a time, in sequence.
      // This prevents race conditions and ensures data consistency.
      transformer: sequential(),
    );
  }

  void addInitialized() {
    add(ColorThemeInitializedEvent());
  }

  void addLightSelected() {
    add(ColorThemeLightSelectedEvent());
  }

  void addDarkSelected() {
    add(ColorThemeDarkSelectedEvent());
  }

  void addSystemSelected() {
    add(ColorThemeSystemSelectedEvent());
  }

  Future<void> _onColorThemeInitializedEvent(
    ColorThemeInitializedEvent event,
    Emitter<ColorThemeState> emit,
  ) async {
    final theme = _iCacheController.readInt(key: CacheKey.COLOR_THEME);

    if (theme == _light) {
      emit(state.copyWith(theme: ThemeEnum.light));
    } else if (theme == _dark) {
      emit(state.copyWith(theme: ThemeEnum.dark));
    } else if (theme == _system) {
      emit(state.copyWith(theme: ThemeEnum.system));
    } else {
      emit(state.copyWith(theme: ThemeEnum.system));
    }
  }

  Future<void> _onLightSelected(
    ColorThemeLightSelectedEvent event,
    Emitter<ColorThemeState> emit,
  ) async {
    await _iCacheController.writeInt(
      key: CacheKey.COLOR_THEME,
      value: _light,
    );

    emit(state.copyWith(theme: ThemeEnum.light));
  }

  Future<void> _onDarkSelected(
    ColorThemeDarkSelectedEvent event,
    Emitter<ColorThemeState> emit,
  ) async {
    await _iCacheController.writeInt(
      key: CacheKey.COLOR_THEME,
      value: _dark,
    );

    emit(state.copyWith(theme: ThemeEnum.dark));
  }

  Future<void> _onSystemSelected(
    ColorThemeSystemSelectedEvent event,
    Emitter<ColorThemeState> emit,
  ) async {
    await _iCacheController.writeInt(
      key: CacheKey.COLOR_THEME,
      value: _system,
    );

    emit(state.copyWith(theme: ThemeEnum.system));
  }

  final ICacheManager _iCacheController;

  static const _dark = -1;
  static const _light = 1;
  static const _system = 0;
}
