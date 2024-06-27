import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/widget/searh_customer_info.dart';
import 'package:cubtale/view/search/widget/search_textfield.dart';
import 'package:flutter/material.dart';

class SearchBoxContent extends StatelessWidget {
  const SearchBoxContent(
      {super.key, required this.controller, required this.searchType});

  final TextEditingController controller;
  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width < 850 ? 350 : context.width / 2.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              searchType.fromString(searchType),
              style: f26w700.copyWith(
                color: context.appTheme.colors.searchTitleColor,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            searchType.fromShortString(searchType),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.appTheme.colors.basic,
            ),
          ),
          const SizedBox(height: 10),
          SearchTextField(controller: controller, searchType: searchType),
          const SizedBox(height: 30),
          SearchCustomerInfo(searchType: searchType),
        ],
      ),
    );
  }
}
