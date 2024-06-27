part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitialEvent extends SearchEvent {
  const SearchInitialEvent();
}

class SearchTextChangeEvent extends SearchEvent {
  final String searchText;

  const SearchTextChangeEvent({required this.searchText});
}

class SearchClearEvent extends SearchEvent {
  const SearchClearEvent();
}
class SearchTodayNewUserEvent extends SearchEvent {
  const SearchTodayNewUserEvent();
}

class SearchCompleteEvent extends SearchEvent {
  final SearchType searchType;
  const SearchCompleteEvent({required this.searchType});
}
