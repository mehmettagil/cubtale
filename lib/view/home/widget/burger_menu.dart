import 'package:cubtale/app_bloc/menu_burger/menu_burger_bloc.dart';
import 'package:cubtale/view/home/widget/menu_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBurgerBloc, MenuBurgerState>(
      buildWhen: (previous, current) =>
          previous.menuBurgerState != current.menuBurgerState,
      builder: (context, state) {
        return state.menuBurgerState
            ? Positioned(child: MenuProfile(userModel: state.userModelValue!))
            : const SizedBox();
      },
    );
  }
}
