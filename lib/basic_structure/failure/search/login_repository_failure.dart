import 'package:equatable/equatable.dart';

abstract class SearchRepositoryFailure extends Equatable {
  const SearchRepositoryFailure();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class SearchRepositoryInternalFailure extends SearchRepositoryFailure {
  const SearchRepositoryInternalFailure();
}

class SearchRepositoryNotFoundFailure extends SearchRepositoryFailure {
  const SearchRepositoryNotFoundFailure();
}

class SearchRepositoryConnectionFailure extends SearchRepositoryFailure {
  const SearchRepositoryConnectionFailure();
}

class SearchRepositoryUnknownFailure extends SearchRepositoryFailure {
  const SearchRepositoryUnknownFailure(this._message);
  final String? _message;

  @override
  String toString() {
    return "SearchRepositoryUnknownFailure(); Exception message was: $message";
  }

  @override
  List<Object?> get props => [_message];

  String? get message => _message;
}
