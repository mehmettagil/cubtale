import 'package:cubtale/app_bloc/navigation/navigation_bloc.dart';
import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/enum/image_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/widget/cubtale_home_appbar.dart';
import 'package:cubtale/view/home/widget/dummy_view.dart';
import 'package:cubtale/view/home/widget/searh_customer_info.dart';
import 'package:flutter/cupertino.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.appTheme.colors.backgroundColor,
        appBar: const CubTaleHomeAppBar(),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Başlık',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Öğe 1'),
                onTap: () {
                  // İsteğe bağlı: Drawer öğesi tıklandığında yapılacak işlem
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Öğe 2'),
                onTap: () {
                  // İsteğe bağlı: Drawer öğesi tıklandığında yapılacak işlem
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
                  if (state.searchType == null) {
                    return DummyView();
                  } else {
                    return Center(
                      child: Container(
                        width: context.width < 850 ? 400 : context.width / 2.5,
                        height: context.height < 1000 ? 500 : 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            border: Border.all(
                                color: const Color(0xffd7f1ed), width: 2)),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            SizedBox(
                              width: context.width < 850
                                  ? 350
                                  : context.width / 2.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      state.searchType!
                                          .fromString(state.searchType!),
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    state.searchType!
                                        .fromShortString(state.searchType!),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.5)),
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
                                            buildWhen: (previous, current) {
                                              return previous.searchText !=
                                                  current.searchText;
                                            },
                                            builder: (context, stateSearch) {
                                              controller.text =
                                                  stateSearch.searchText;
                                              return TextField(
                                                onTap: () async {
                                                  if (state.searchType ==
                                                      SearchType.DATE) {
                                                    final getValue =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2021),
                                                            lastDate:
                                                                DateTime(2090));
                                                    if (getValue != null) {
                                                      context
                                                          .read<SearchBloc>()
                                                          .addSearchTextChangeEvent(
                                                              searchText:
                                                                  '${getValue.day}-${getValue.month}-${getValue.year}');
                                                      controller.text =
                                                          '${getValue.day}-${getValue.month}-${getValue.year}';
                                                    }
                                                  }
                                                },
                                                readOnly: state.searchType ==
                                                        SearchType.DATE
                                                    ? true
                                                    : false,
                                                onChanged: (value) {
                                                  context
                                                      .read<SearchBloc>()
                                                      .addSearchTextChangeEvent(
                                                          searchText: value);
                                                },
                                                controller: controller,
                                                decoration:
                                                    const InputDecoration(
                                                  filled: true,
                                                  fillColor: Color(0xffb8e6db),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xffb8e6db),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15))),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xffb8e6db),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                ),
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
                                                searchType: state.searchType!,
                                              );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: context.appTheme.colors
                                                  .backgroundColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 12),
                                            child: Text("Search",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                        .withOpacity(0.5))),
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
        ));
  }
}
