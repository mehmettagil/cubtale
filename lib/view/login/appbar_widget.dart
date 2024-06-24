import 'package:cubtale/core/constants/color_constants.dart';
import 'package:cubtale/core/constants/string_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:cubtale/core/enum/image_constants.dart';

class CubTaleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CubTaleAppBar({super.key});
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
        toolbarHeight: 80,
        backgroundColor: context.appTheme.colors.backgroundColor,
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
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffd7f1ed),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              height: 50,
              width: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: IconConstants.darkMode.toImage),
                  const Text(
                    StringConstants.darkMode,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}
