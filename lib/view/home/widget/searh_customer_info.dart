import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/enum/image_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/widget/customer_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCustomerInfo extends StatelessWidget {
  const SearchCustomerInfo({
    Key? key,
    required this.searchType,
  }) : super(key: key);

  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.customerModel == null || state.customerModel!.isEmpty) {
          return const SizedBox();
        } else {
          if (searchType == SearchType.DATE) {
            return CustomerListPage(customers: state.customerModel!);
          } else {
            return Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: IconConstants.profileDark.toImage,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Name:",
                                  style: f18w400.copyWith(
                                      color: context
                                          .appTheme.colors.customerTextColor),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  state.customerModel![0].accName,
                                  style: f18w400.copyWith(
                                      color:
                                          context.appTheme.colors.dividerColor),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Mail:",
                                  style: f18w400.copyWith(
                                      color: context
                                          .appTheme.colors.customerTextColor),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(state.customerModel![0].accMail,
                                    style: f18w400.copyWith(
                                        color: context
                                            .appTheme.colors.dividerColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Surname:",
                                  style: f18w400.copyWith(
                                      color: context
                                          .appTheme.colors.customerTextColor),
                                ),
                                const SizedBox(width: 5),
                                Text(state.customerModel![0].accSurname,
                                    style: f18w400.copyWith(
                                        color: context
                                            .appTheme.colors.dividerColor)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Creation \nDate:",
                                  style: f18w400.copyWith(
                                      color: context
                                          .appTheme.colors.customerTextColor),
                                ),
                                const SizedBox(width: 5),
                                Text(state.customerModel![0].accCreationDate,
                                    style: f18w400.copyWith(
                                        color: context
                                            .appTheme.colors.dividerColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Verified:",
                                  style: f18w400.copyWith(
                                      color: context
                                          .appTheme.colors.customerTextColor),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    state.customerModel![0].accVerified
                                        .toString(),
                                    style: f18w400.copyWith(
                                        color: context
                                            .appTheme.colors.dividerColor)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Account ID:",
                                  style: f18w400.copyWith(
                                      color: context
                                          .appTheme.colors.customerTextColor),
                                ),
                                const SizedBox(width: 5),
                                Text(state.customerModel![0].accId,
                                    style: f18w400.copyWith(
                                        color: context
                                            .appTheme.colors.dividerColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }
      },
    );
  }
}
