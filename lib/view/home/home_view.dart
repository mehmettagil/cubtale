import 'package:cubtale/app_bloc/menu_burger/menu_burger_bloc.dart';
import 'package:cubtale/app_bloc/navigation/navigation_bloc.dart';
import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/core/listeners/auth_listeners.dart';
import 'package:cubtale/view/home/widget/cubtale_home_appbar.dart';
import 'package:cubtale/view/home/widget/dummy_view.dart';
import 'package:cubtale/view/home/widget/menu_profile.dart';
import 'package:cubtale/view/home/widget/searh_customer_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController controller = TextEditingController();
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
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
            ),
          ),
          child: MultiBlocListener(
            listeners: [
              getAuthListener(),
            ],
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<NavigationBloc, NavigationState>(
                      builder: (context, state) {
                        if (state.searchType == null) {
                          return const DummyView();
                        } else {
                          return Center(
                            child: Container(
                              width: context.width < 850
                                  ? 400
                                  : context.width / 2.5,
                              height: context.height < 1000 ? 500 : 300,
                              decoration: BoxDecoration(
                                  color:
                                      context.appTheme.colors.backgroundColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  border: Border.all(
                                      color:
                                          context.appTheme.colors.borderColor,
                                      width: 2),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 0),
                                      blurRadius: 6,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  const SizedBox(height: 30),
                                  SizedBox(
                                    width: context.width < 850
                                        ? 350
                                        : context.width / 2.8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            state.searchType!
                                                .fromString(state.searchType!),
                                            style: f26w700.copyWith(
                                              color: context.appTheme.colors
                                                  .searchTitleColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          state.searchType!.fromShortString(
                                              state.searchType!),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              child: SizedBox(
                                                width: context.width < 855
                                                    ? 200
                                                    : context.width / 4,
                                                child: BlocBuilder<SearchBloc,
                                                    SearchState>(
                                                  buildWhen:
                                                      (previous, current) {
                                                    return previous
                                                            .searchText !=
                                                        current.searchText;
                                                  },
                                                  builder:
                                                      (context, stateSearch) {
                                                    controller.text =
                                                        stateSearch.searchText;
                                                    return TextField(
                                                      onTap: () async {
                                                        if (state.searchType ==
                                                            SearchType.DATE) {
                                                          final getValue =
                                                              await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          2021),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2090));
                                                          if (getValue !=
                                                              null) {
                                                            context
                                                                .read<
                                                                    SearchBloc>()
                                                                .addSearchTextChangeEvent(
                                                                    searchText:
                                                                        '${getValue.day}-${getValue.month}-${getValue.year}');
                                                            controller.text =
                                                                '${getValue.day}-${getValue.month}-${getValue.year}';
                                                          }
                                                        }
                                                      },
                                                      readOnly: state
                                                                  .searchType ==
                                                              SearchType.DATE
                                                          ? true
                                                          : false,
                                                      onChanged: (value) {
                                                        context
                                                            .read<SearchBloc>()
                                                            .addSearchTextChangeEvent(
                                                                searchText:
                                                                    value);
                                                      },
                                                      controller: controller,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        fillColor: context
                                                            .appTheme
                                                            .colors
                                                            .textFieldColor
                                                            .withOpacity(0.4),
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: context
                                                                      .appTheme
                                                                      .colors
                                                                      .textFieldColor
                                                                      .withOpacity(
                                                                          0.4),
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            6))),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: context
                                                                .appTheme
                                                                .colors
                                                                .textFieldColor
                                                                .withOpacity(
                                                                    0.4),
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: context
                                                                      .appTheme
                                                                      .colors
                                                                      .textFieldColor
                                                                      .withOpacity(
                                                                          0.4),
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            10))),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () async {
                                                context
                                                    .read<SearchBloc>()
                                                    .addSearchCompleteEvent(
                                                      searchType:
                                                          state.searchType!,
                                                    );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: context.appTheme
                                                        .colors.textFieldColor,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 25,
                                                      vertical: 10),
                                                  child: Text("Search",
                                                      style: f18w700.copyWith(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.5))),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        SearchCustomerInfo(
                                          searchType: state.searchType!,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                BlocBuilder<MenuBurgerBloc, MenuBurgerState>(
                  buildWhen: (previous, current) {
                    return previous.menuBurgerState != current.menuBurgerState;
                  },
                  builder: (context, state) {
                    if (state.menuBurgerState) {
                      return Positioned(
                          child: MenuProfile(
                        userModel: state.userModelValue!,
                      ));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
