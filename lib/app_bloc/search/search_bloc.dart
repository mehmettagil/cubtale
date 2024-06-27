import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubtale/basic_structure/failure/search/login_repository_failure.dart';
import 'package:cubtale/basic_structure/repository/search/i_search_repository.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/mixin/api_header_getter_mixin.dart';
import 'package:cubtale/core/model/customer/customer_model.dart';
import 'package:intl/intl.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>
    with ApiHeaderCallbackGetterMixin {
  SearchBloc(
    this._iSearchRepository,
  ) : super(SearchState.initial()) {
    on<SearchInitialEvent>(
      _onSearchInitialEvent,
    );
    on<SearchTextChangeEvent>(
      _onSearchEmailChangeEvent,
    );
    on<SearchTodayNewUserEvent>(
      _onSearchTodayNewUserEvent,
    );

    on<SearchClearEvent>(
      _onSearchClearEvent,
    );
    on<SearchCompleteEvent>(
      _onSearchCompleteEvent,
    );
  }
  final ISearchRepository _iSearchRepository;

  addSearchInitialEvent() {
    add(const SearchInitialEvent());
  }

  addSearchTextChangeEvent({required String searchText}) {
    add(SearchTextChangeEvent(searchText: searchText));
  }

  addSearchCompleteEvent({required SearchType searchType}) {
    add(SearchCompleteEvent(searchType: searchType));
  }

  addSearchTodayNewUserEvent() {
    add(const SearchTodayNewUserEvent());
  }

  Future<void> _onSearchEmailChangeEvent(
      SearchTextChangeEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(searchText: event.searchText));
  }

  Future<void> _onSearchCompleteEvent(
      SearchCompleteEvent event, Emitter<SearchState> emit) async {
    if (state.searchText.isNotEmpty) {
      late Either<SearchRepositoryFailure, List<CustomerModel>> checkSearch;
      if (SearchType.EMAIL == event.searchType) {
        checkSearch = await _iSearchRepository.searchEmail(
          email: state.searchText,
          apiHeaderCallback: apiHeaderCallback,
        );
      } else if (SearchType.ID == event.searchType) {
        checkSearch = await _iSearchRepository.searchId(
          accId: state.searchText,
          apiHeaderCallback: apiHeaderCallback,
        );
      } else if (SearchType.DATE == event.searchType) {
        checkSearch = await _iSearchRepository.searchDate(
          accCreationDate: state.searchText,
          apiHeaderCallback: apiHeaderCallback,
        );
      }
      emit(state.copyWith(processFailureOrUnitOption: some(checkSearch)));
    } else {
      emit(state.copyWith(
        processFailureOrUnitOption: some(
          left(
            const SearchRepositoryUnknownFailure("Email or password is empty"),
          ),
        ),
      ));
    }
  }

  Future<void> _onSearchClearEvent(
      SearchClearEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
      processFailureOrUnitOption: none(),
      searchText: "",
    ));
  }

  Future<void> _onSearchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
      processFailureOrUnitOption: none(),
      searchText: "",
    ));
  }

  Future<void> _onSearchTodayNewUserEvent(
      SearchTodayNewUserEvent event, Emitter<SearchState> emit) async {
    final accCreationDate = DateTime.now();
    final formattedDate = DateFormat('dd-MM-yyyy').format(accCreationDate);
    final checkSearch = await _iSearchRepository.searchDate(
        accCreationDate: formattedDate, apiHeaderCallback: apiHeaderCallback);
    emit(state.copyWith(processFailureOrTodayUserOption: some(checkSearch)));
  }
}
