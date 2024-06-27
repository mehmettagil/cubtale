import 'dart:convert';

import 'package:cubtale/basic_structure/manager/cache_key.dart';
import 'package:cubtale/basic_structure/manager/i_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCacheManager implements ICacheManager {
  SharedPreferencesCacheManager(this._sharedPref);
  final SharedPreferences _sharedPref;

  @override
  Future<void> clear() {
    return _sharedPref.clear();
  }

  @override
  Future<void> delete({required CacheKey key}) {
    return _sharedPref.remove(key.value);
  }

  @override
  Future<void> writeDouble({required CacheKey key, required double value}) {
    return _sharedPref.setDouble(key.value, value);
  }

  @override
  Future<void> writeInt({required CacheKey key, required int value}) {
    return _sharedPref.setInt(key.value, value);
  }

  @override
  Future<void> writeString({required CacheKey key, required String value}) {
    return _sharedPref.setString(key.value, value);
  }

  @override
  Future<void> writeBool({required CacheKey key, required bool value}) {
    return _sharedPref.setBool(key.value, value);
  }

  @override
  Future<void> writeMap({
    required CacheKey key,
    required Map<String, dynamic> value,
  }) {
    final encodedMap = jsonEncode(value);
    return _sharedPref.setString(key.value, encodedMap);
  }

  @override
  double? readDouble({required CacheKey key}) {
    return _sharedPref.getDouble(key.value);
  }

  @override
  int? readInt({required CacheKey key}) {
    return _sharedPref.getInt(key.value);
  }

  @override
  String? readString({required CacheKey key}) {
    return _sharedPref.getString(key.value);
  }

  @override
  Map<String, dynamic>? readMap({required CacheKey key}) {
    final encodedString = _sharedPref.getString(key.value);
    if (encodedString != null) {
      return jsonDecode(encodedString) as Map<String, dynamic>;
    }
    return null;
  }
}
