import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/enum/image_constants.dart';
import 'package:cubtale/core/enum/search_type.dart';
import 'package:cubtale/view/home/widget/customer_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCustomerInfo extends StatelessWidget {
  const SearchCustomerInfo({
    super.key,
    required this.searchType,
  });
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
                      width: 90,
                      height: 90,
                      child: IconConstants.profileLight.toImage),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Text("Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        const SizedBox(width: 10),
                        Text(state.customerModel![0].accName),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Mail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        const SizedBox(width: 10),
                        Text(state.customerModel![0].accMail),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Text("Surname",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        const SizedBox(width: 10),
                        Text(state.customerModel![0].accSurname),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Creation Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        const SizedBox(width: 10),
                        Text(state.customerModel![0].accCreationDate),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Text("Verified",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        const SizedBox(width: 10),
                        Text(state.customerModel![0].accVerified.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Account id",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        const SizedBox(width: 10),
                        Text(state.customerModel![0].accId),
                      ],
                    )
                  ],
                )
              ],
            );
          }
        }
      },
    );
  }
}
