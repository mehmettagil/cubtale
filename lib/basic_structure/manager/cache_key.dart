// ignore_for_file: constant_identifier_names

enum CacheKey {
  // Color theme
  COLOR_THEME('theme_color'),

  // user data
  USER_DATA('user_data'),

  // last login
  LAST_LOGIN('last_login');

  const CacheKey(this.value);
  final String value;
}
