part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({
    required this.searchText,
    required this.processFailureOrUnitOption,
  });

  factory SearchState.initial() {
    return const SearchState(
      searchText: "",
      processFailureOrUnitOption: None(),
    );
  }

  final String searchText;
  final Option<Either<SearchRepositoryFailure, List<CustomerModel>>>
      processFailureOrUnitOption;

  SearchState copyWith({
    String? searchText,
    Option<Either<SearchRepositoryFailure, List<CustomerModel>>>?
        processFailureOrUnitOption,
  }) {
    return SearchState(
      searchText: searchText ?? this.searchText,
      processFailureOrUnitOption:
          processFailureOrUnitOption ?? this.processFailureOrUnitOption,
    );
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$',
        caseSensitive: false);

    return emailRegex.hasMatch(email);
  }

  List<CustomerModel>? get customerModel {
    final customerModel = processFailureOrUnitOption.fold(
        () => null, (a) => a.fold((l) => null, (r) => r));
    return customerModel;
  }

  @override
  List<Object> get props => [searchText, processFailureOrUnitOption];
}
