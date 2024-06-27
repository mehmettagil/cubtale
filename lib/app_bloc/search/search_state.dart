part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({
    required this.searchText,
    required this.processFailureOrUnitOption,
    required this.processFailureOrTodayUserOption,
  });

  factory SearchState.initial() {
    return SearchState(
      searchText: "",
      processFailureOrUnitOption: none(),
      processFailureOrTodayUserOption: none(),
    );
  }

  final String searchText;
  final Option<Either<SearchRepositoryFailure, List<CustomerModel>>>
      processFailureOrUnitOption;
  final Option<Either<SearchRepositoryFailure, List<CustomerModel>>>
      processFailureOrTodayUserOption;
  SearchState copyWith(
      {String? searchText,
      Option<Either<SearchRepositoryFailure, List<CustomerModel>>>?
          processFailureOrUnitOption,
      Option<Either<SearchRepositoryFailure, List<CustomerModel>>>?
          processFailureOrTodayUserOption}) {
    return SearchState(
      searchText: searchText ?? this.searchText,
      processFailureOrUnitOption:
          processFailureOrUnitOption ?? this.processFailureOrUnitOption,
      processFailureOrTodayUserOption: processFailureOrTodayUserOption ??
          this.processFailureOrTodayUserOption,
    );
  }

  List<CustomerModel>? get customerModel {
    final customerModel = processFailureOrUnitOption.fold(
        () => null, (a) => a.fold((l) => null, (r) => r));
    return customerModel;
  }
  List<CustomerModel>? get todayCustomerModel {
    final customerModel = processFailureOrTodayUserOption.fold(
        () => null, (a) => a.fold((l) => null, (r) => r));
    return customerModel;
  }


  @override
  List<Object> get props =>
      [searchText, processFailureOrUnitOption, processFailureOrTodayUserOption];
}
