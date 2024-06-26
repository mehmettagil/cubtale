import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/enum/image_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/widget/cubtale_home_appbar.dart';
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
      body: _buildBody(
        widget.index,
        context,
        SearchType.DATE,
        controller,
      ),
    );
  }
}

Widget _buildBody(int _selectedIndex, BuildContext context,
    SearchType searchType, TextEditingController controller) {
  switch (_selectedIndex) {
    case 0:
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child: const Text("a"),
              ),
            ],
          ),
        ),
      );
    case 1:
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: context.width < 850 ? 400 : context.width / 2.5,
                height: context.height < 1000 ? 500 : 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border:
                        Border.all(color: const Color(0xffd7f1ed), width: 2)),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    SizedBox(
                      width: context.width < 850 ? 350 : context.width / 2.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "email",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "  ${"widget.searchTitle"}",
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
                                  child: TextField(
                                    onTap: () async {
                                      if (searchType == SearchType.DATE) {
                                        final getValue = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2021),
                                            lastDate: DateTime(2090));
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
                                    readOnly: searchType == SearchType.DATE
                                        ? true
                                        : false,
                                    onChanged: (value) {
                                      context
                                          .read<SearchBloc>()
                                          .addSearchTextChangeEvent(
                                              searchText: value);
                                    },
                                    controller: controller,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffb8e6db),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xffb8e6db),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xffb8e6db),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () async {
                                  context
                                      .read<SearchBloc>()
                                      .addSearchCompleteEvent(
                                        searchType: SearchType.DATE,
                                      );
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color(0xffb8e6db),
                                    ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                                color: Colors.transparent)))),
                                child: Text("Search",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.5))),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const SearchCustomerInfo(
                            searchType: SearchType.DATE,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    case 2:
      return Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child: const Text("c"),
              ),
            ],
          ),
        ),
      );
    default:
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child: const Text("Default"),
              ),
            ],
          ),
        ),
      );
  }
}
