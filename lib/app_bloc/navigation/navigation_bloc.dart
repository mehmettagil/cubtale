import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubtale/core/enum/search_type.dart';

import 'package:cubtale/core/mixin/api_header_getter_mixin.dart';
import 'package:cubtale/core/model/customer/customer_model.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState>
    with ApiHeaderCallbackGetterMixin {
  NavigationBloc() : super(NavigationState.initial()) {
    on<NavigationSelectedEvent>(
      _onNavigationSelectedEvent,
    );

    on<NavigationClearEvent>(
      _onNavigationClearEvent,
    );
  }
  addNavigationSelectedEvent({required SearchType searchType}) {
    add(NavigationSelectedEvent(searchType: searchType));
  }

  Future<void> _onNavigationSelectedEvent(
      NavigationSelectedEvent event, Emitter<NavigationState> emit) async {
    emit(state.copyWith(
      selectedSearch: some(event.searchType),
    ));
  }

  Future<void> _onNavigationClearEvent(
      NavigationClearEvent event, Emitter<NavigationState> emit) async {
    emit(state.copyWith(
      selectedSearch: none(),
    ));
  }
}
