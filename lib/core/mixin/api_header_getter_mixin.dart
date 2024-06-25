import 'package:cubtale/basic_structure/manager/i_cache_manager.dart';
import 'package:cubtale/core/common/api_header.dart';

mixin ApiHeaderCallbackGetterMixin {
  ApiHeader apiHeaderCallback() {
    // Burasına session eklenebilir dil bilgsi eklenebilir
    return const ApiHeader();
  }
}
