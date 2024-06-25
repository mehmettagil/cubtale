import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/widget/cubtale_home_appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.colors.backgroundColor,
      appBar: const CubTaleHomeAppBar(),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
            )),
        child: Center(
          child: const Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
