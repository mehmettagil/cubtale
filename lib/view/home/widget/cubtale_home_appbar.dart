import 'package:cubtale/app_bloc/core/color_theme_bloc/color_theme_bloc.dart';
import 'package:cubtale/app_bloc/navigation/navigation_bloc.dart';
import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/constants/string_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cubtale/core/enum/image_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubTaleHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CubTaleHomeAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
        )),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: context.appTheme.colors.appBarColor,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                context
                    .read<NavigationBloc>()
                    .add(const NavigationClearEvent());
              },
              child: Row(
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
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context
                    .read<NavigationBloc>()
                    .addNavigationSelectedEvent(searchType: SearchType.EMAIL);
                context.read<SearchBloc>().addSearchInitialEvent();
              },
              child: Text("Search by Mail",
                  style: TextStyle(
                      color: context.appTheme.colors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            _divider(context),
            GestureDetector(
              onTap: () {
                context
                    .read<NavigationBloc>()
                    .addNavigationSelectedEvent(searchType: SearchType.ID);
                context.read<SearchBloc>().addSearchInitialEvent();
              },
              child: Text("Search by ID",
                  style: TextStyle(
                      color: context.appTheme.colors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            _divider(context),
            GestureDetector(
              onTap: () {
                context
                    .read<NavigationBloc>()
                    .addNavigationSelectedEvent(searchType: SearchType.DATE);
                context.read<SearchBloc>().addSearchInitialEvent();
              },
              child: Text("Search by Date",
                  style: TextStyle(
                      color: context.appTheme.colors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            const Spacer(),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: GestureDetector(
                onTap: () {
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          child: Text(StringConstants.darkMode),
                          value: 1,
                        ),
                        const PopupMenuItem(
                          child: Text(StringConstants.darkMode),
                          value: 2,
                        ),
                      ];
                    },
                  );
                },
                child: const MenuBurger(
                  isOpen: false,
                )),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
    );
  }

  Padding _divider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        height: 40,
        width: 3,
        color: context.appTheme.colors.dividerColor,
      ),
    );
  }
}

class MenuBurger extends StatelessWidget {
  const MenuBurger({
    required this.isOpen,
    super.key,
  });
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    if (isOpen) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: context.appTheme.colors.dividerColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 40,
                  width: 4,
                ),
              )
          ],
        ),
      );
    } else {
      return Column(
        children: [
          for (int i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    color: context.appTheme.colors.dividerColor,
                    borderRadius: BorderRadius.circular(10)),
                height: 4,
                width: 40,
              ),
            )
        ],
      );
    }
  }
}
