import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/search/view/search_box_content.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox(
      {super.key, required this.controller, required this.searchType});

  final TextEditingController controller;
  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width < 850 ? 400 : context.width / 2.5,
      height: context.height < 1000 ? 500 : 300,
      decoration: BoxDecoration(
        color: context.appTheme.colors.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border:
            Border.all(color: context.appTheme.colors.borderColor, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          SearchBoxContent(controller: controller, searchType: searchType),
        ],
      ),
    );
  }
}
