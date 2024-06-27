import 'package:cubtale/app_bloc/core/color_theme_bloc/color_theme_bloc.dart';
import 'package:cubtale/app_bloc/login/login_bloc.dart';
import 'package:cubtale/app_bloc/menu_burger/menu_burger_bloc.dart';
import 'package:cubtale/app_bloc/navigation/navigation_bloc.dart';
import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/basic_structure/manager/i_cache_manager.dart';
import 'package:cubtale/basic_structure/manager/shared_preferences_cache_manager.dart';
import 'package:cubtale/basic_structure/repository/login/i_login_repository.dart';
import 'package:cubtale/basic_structure/repository/login/login_repository.dart';
import 'package:cubtale/basic_structure/repository/search/i_search_repository.dart';
import 'package:cubtale/basic_structure/repository/search/search_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<bool> setupInjection() async {
  GetIt.asNewInstance();
  final isPackageDone = await _injectPackages();
  if (!isPackageDone) return false;



  final isFacadeDone = await _injectFacades();
  if (!isFacadeDone) return false;

  final isBlocDone = await _injectBlocs();
  if (!isBlocDone) return false;

  return true;
}

Future<bool> _injectPackages() async {
  final pref = await SharedPreferences.getInstance();
  getIt.registerSingleton<Client>(Client());

  getIt.registerSingleton<SharedPreferences>(pref);

  return true;
}

Future<bool> _injectBlocs() async {
  getIt.registerFactory(() => ColorThemeBloc(
        getIt<ICacheManager>(),
      ));
  getIt.registerFactory(() => LoginBloc(
        getIt<ILoginRepository>(),
        getIt<ICacheManager>(),
      ));
  getIt.registerFactory(() => SearchBloc(
        getIt<ISearchRepository>(),
      ));
  getIt.registerFactory(() => NavigationBloc());
  getIt.registerFactory(() => MenuBurgerBloc(
        getIt<ICacheManager>(),
      ));

  return true;
}


Future<bool> _injectFacades() async {

  getIt.registerSingleton<ICacheManager>(SharedPreferencesCacheManager(
    getIt<SharedPreferences>(),
  ));
  getIt.registerSingleton<ILoginRepository>(LoginRepository(
    getIt<Client>(),
  ));
  getIt.registerSingleton<ISearchRepository>(SearchRepository(
    getIt<Client>(),
  ));

  return true;
}


