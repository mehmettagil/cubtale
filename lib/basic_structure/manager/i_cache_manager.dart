import 'package:cubtale/basic_structure/manager/cache_key.dart';

abstract class ICacheManager {
  String? readString({required CacheKey key});

  int? readInt({required CacheKey key});
  double? readDouble({required CacheKey key});
  Map<String, dynamic>? readMap({required CacheKey key});

  Future<void> writeString({required CacheKey key, required String value});

  Future<void> writeBool({required CacheKey key, required bool value});

  Future<void> writeInt({required CacheKey key, required int value});
  Future<void> writeDouble({required CacheKey key, required double value});
  Future<void> writeMap({required CacheKey key, required Map<String, dynamic> value});

  Future<void> clear();
  Future<void> delete({required CacheKey key});
}
