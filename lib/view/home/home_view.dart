import 'package:cubtale/app_bloc/navigation/navigation_bloc.dart';
import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/core/listeners/auth_listeners.dart';
import 'package:cubtale/view/home/widget/burger_menu.dart';
import 'package:cubtale/view/home/widget/cubtale_home_appbar.dart';
import 'package:cubtale/view/home/widget/dummy_view.dart';
import 'package:cubtale/view/search/view/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    context.read<SearchBloc>().addSearchTodayNewUserEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.colors.appBarColor,
      appBar: const CubTaleHomeAppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: context.appTheme.colors.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: MultiBlocListener(
          listeners: [
            getAuthListener(),
          ],
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<NavigationBloc, NavigationState>(
                      builder: (context, state) {
                        return state.searchType == null
                            ? const DummyView()
                            : SearchBox(
                                controller: controller,
                                searchType: state.searchType!);
                      },
                    ),
                  ],
                ),
              ),
              const BurgerMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
