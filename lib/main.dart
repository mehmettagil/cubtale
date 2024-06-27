import 'package:cubtale/app_bloc/core/color_theme_bloc/color_theme_bloc.dart';
import 'package:cubtale/app_bloc/login/login_bloc.dart';
import 'package:cubtale/app_bloc/menu_burger/menu_burger_bloc.dart';
import 'package:cubtale/app_bloc/navigation/navigation_bloc.dart';
import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/enum/theme_enum.dart';
import 'package:cubtale/injection.dart';
import 'package:cubtale/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await setupInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ColorThemeBloc>()..addInitialized(),
        ),
        BlocProvider(
          create: (_) => getIt<LoginBloc>()..add(const LoginFetchEvent()),
        ),
        BlocProvider(
          create: (_) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<NavigationBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<MenuBurgerBloc>(),
        )
      ],
      child: BlocBuilder<ColorThemeBloc, ColorThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'CubTale App',
            debugShowCheckedModeBanner: false,
            theme: state.theme == ThemeEnum.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
