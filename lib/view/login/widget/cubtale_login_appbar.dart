import 'package:cubtale/app_bloc/core/color_theme_bloc/color_theme_bloc.dart';
import 'package:cubtale/core/constants/string_constants.dart';
import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:cubtale/core/enum/image_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubTaleLoginAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CubTaleLoginAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appTheme.colors.backgroundColor,
      child: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
        )),
        toolbarHeight: 80,
        backgroundColor: context.appTheme.colors.appBarColor,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 6,
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: IconConstants.appIcon.toImage,
            ),
            const SizedBox(
              width: 14,
            ),
            SizedBox(
              height: 70,
              width: 150,
              child: IconConstants.watermark.toImage,
            )
          ],
        ),
        actions: [
          BlocBuilder<ColorThemeBloc, ColorThemeState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  final bloc = context.read<ColorThemeBloc>();
                  if (context.appTheme.isDarkTheme) {
                    bloc.addLightSelected();
                  } else {
                    bloc.addDarkSelected();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: context.appTheme.colors.modeButtonColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 40,
                            height: 40,
                            child: IconConstants.darkMode.toImage),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(StringConstants.darkMode,
                            style: f16w200.copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}
