part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationSelectedEvent extends NavigationEvent {
  final SearchType searchType;
  const NavigationSelectedEvent({required this.searchType});
}

class NavigationClearEvent extends NavigationEvent {
  const NavigationClearEvent();
}
