part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState({
    required this.selectedSearch,
  });

  factory NavigationState.initial() {
    return NavigationState(
      selectedSearch: none(),
    );
  }

  final Option<SearchType> selectedSearch;

  NavigationState copyWith({
    Option<SearchType>? selectedSearch,
  }) {
    return NavigationState(
      selectedSearch: selectedSearch ?? this.selectedSearch,
    );
  }

  SearchType? get searchType {
    final searchType = selectedSearch.fold(() => null, (a) => a);
    return searchType;
  }

  @override
  List<Object> get props => [selectedSearch];
}
