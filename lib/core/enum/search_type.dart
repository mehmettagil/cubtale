// ignore_for_file: constant_identifier_names

enum SearchType {
  EMAIL('email'),
  ID('id'),
  DATE('date');

  final String value;
  const SearchType(this.value);
}
