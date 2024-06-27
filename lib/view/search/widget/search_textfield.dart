import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/constants/string_constants.dart';
import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, required this.controller, required this.searchType});

  final TextEditingController controller;
  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: SizedBox(
            width: context.width < 855 ? 200 : context.width / 4,
            child: BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) =>
                  previous.searchText != current.searchText,
              builder: (context, stateSearch) {
                controller.text = stateSearch.searchText;
                return TextField(
                  onTap: () async {
                    if (searchType == SearchType.DATE) {
                      final getValue = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2090),
                      );
                      if (getValue != null) {
                        // ignore: use_build_context_synchronously
                        context.read<SearchBloc>().addSearchTextChangeEvent(
                              searchText:
                                  '${getValue.day}-${getValue.month}-${getValue.year}',
                            );
                        controller.text =
                            '${getValue.day}-${getValue.month}-${getValue.year}';
                      }
                    }
                  },
                  readOnly: searchType == SearchType.DATE,
                  onChanged: (value) {
                    context
                        .read<SearchBloc>()
                        .addSearchTextChangeEvent(searchText: value);
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        context.appTheme.colors.textFieldColor.withOpacity(0.4),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.appTheme.colors.textFieldColor
                            .withOpacity(0.4),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.appTheme.colors.textFieldColor
                            .withOpacity(0.4),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.appTheme.colors.textFieldColor
                            .withOpacity(0.4),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: context.appTheme.colors.basic),
                );
              },
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context
                .read<SearchBloc>()
                .addSearchCompleteEvent(searchType: searchType);
          },
          child: Container(
            decoration: BoxDecoration(
              color: context.appTheme.colors.textFieldColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                StringConstants.search,
                style: f18w700.copyWith(color: context.appTheme.colors.basic),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
