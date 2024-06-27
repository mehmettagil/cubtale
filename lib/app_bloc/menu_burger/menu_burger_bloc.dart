import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cubtale/basic_structure/manager/cache_key.dart';
import 'package:cubtale/basic_structure/manager/i_cache_manager.dart';

import 'package:cubtale/core/mixin/api_header_getter_mixin.dart';
import 'package:cubtale/core/model/user/user_model.dart';
import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

part 'menu_burger_event.dart';
part 'menu_burger_state.dart';

class MenuBurgerBloc extends Bloc<MenuBurgerEvent, MenuBurgerState>
    with ApiHeaderCallbackGetterMixin {
  MenuBurgerBloc(
    this._iCacheManager,
  ) : super(MenuBurgerState.initial()) {
    on<MenuBurgerChangeStateEvent>(
      _onMenuBurgerChangeStateEvent,
    );
  }
  void addMenuBurgerChangeStateEvent() {
    add(const MenuBurgerChangeStateEvent());
  }

  final ICacheManager _iCacheManager;

  Future<void> _onMenuBurgerChangeStateEvent(
      MenuBurgerChangeStateEvent event, Emitter<MenuBurgerState> emit) async {
    final userData = _iCacheManager.readMap(key: CacheKey.USER_DATA);
    if (userData != null) {
      emit(state.copyWith(
          menuBurgerState: !(state.menuBurgerState),
          userModel: some(UserModel.fromMap(userData))));
    }
  }
}
