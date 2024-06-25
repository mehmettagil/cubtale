import 'package:cubtale/app_bloc/core/color_theme_bloc/color_theme_bloc.dart';
import 'package:cubtale/core/enum/theme_enum.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/injection.dart';
import 'package:cubtale/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  final injected = await setupInjection();

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
      ],
      child: BlocConsumer<ColorThemeBloc, ColorThemeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'CubTale App',
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
