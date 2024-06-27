// ignore_for_file: constant_identifier_names

enum SearchType {
  EMAIL('email'),
  ID('id'),
  DATE('date');

  final String value;
  const SearchType(this.value);

  String fromString(SearchType value) {
    if (value == SearchType.EMAIL) {
      return "Search by Mail";
    } else if (value == SearchType.ID) {
      return "Search by ID";
    } else if (value == SearchType.DATE) {
      return "Search by Date";
    } else {
      return "Search by Mail";
    }
  }

  String fromShortString(SearchType value) {
    if (value == SearchType.EMAIL) {
      return "Email";
    } else if (value == SearchType.ID) {
      return "Id";
    } else if (value == SearchType.DATE) {
      return "Date";
    } else {
      return "Email";
    }
  }
}
