import 'package:equatable/equatable.dart';

class ApiHeader extends Equatable {
  const ApiHeader();

  Map<String, String> get jsonHeaderMap {
    return {
      _contentTypeKey: _utf8Value,
    };
  }

  @override
  List<Object?> get props => [jsonHeaderMap];
}

const String _contentTypeKey = "Content-Type";

const String _utf8Value = "application/json; charset=UTF-8";
