import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/enum/image_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
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
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(state.customerModel![0].accName),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Mail",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(state.customerModel![0].accMail),
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
                                const Text(
                                  "Surname",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                const SizedBox(width: 5),
                                Text(state.customerModel![0].accSurname),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Creation \nDate",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                const SizedBox(width: 5),
                                Text(state.customerModel![0].accCreationDate),
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
                                const Text(
                                  "Verified",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                const SizedBox(width: 5),
                                Text(state.customerModel![0].accVerified
                                    .toString()),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  "Account ID",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                const SizedBox(width: 5),
                                Text(state.customerModel![0].accId),
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
