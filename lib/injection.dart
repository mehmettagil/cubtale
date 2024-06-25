import 'dart:io';

import 'package:cubtale/app_bloc/core/color_theme_bloc/color_theme_bloc.dart';
import 'package:cubtale/basic_structure/manager/i_cache_manager.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<bool> setupInjection() async {
  GetIt.asNewInstance();
  final isPackageDone = await _injectPackages();
  if (!isPackageDone) return false;

  final isStorageDone = await _injectStorages();
  if (!isStorageDone) return false;

  final isFacadeDone = await _injectFacades();
  if (!isFacadeDone) return false;

  final isBlocDone = await _injectBlocs();
  if (!isBlocDone) return false;

  return true;
}

Future<bool> _injectPackages() async {
  final pref = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(pref);

  return true;
}

Future<bool> _injectBlocs() async {
  getIt.registerFactory(() => ColorThemeBloc(
        getIt<ICacheManager>(),
      ));

  return true;
}

Future<bool> _injectStorages() async {
  //getIt.registerSingleton<IRecordStorage>(RecordStorage());

  return true;
}

Future<bool> _injectFacades() async {
  // getIt.registerSingleton<ISplashRepository>(SplashRepository(
  //   getIt<MetricHttpClient>(),
  //   getIt<IUserStorage>(),
  // ));
  getIt.registerSingleton<ICacheManager>(SpCacheController(
    getIt<SharedPreferences>(),
  ));

  return true;
}

// Future<void> removeInMemoryStorages() async {
//   await DataSubject.removeAll();
//   await MemoryStorage.removeAll();
//   return;
// }
