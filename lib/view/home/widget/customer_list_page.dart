import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/core/model/customer/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({
    super.key,
    required this.customers,
    required this.isHomePage,
  });

  final List<CustomerModel> customers;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    final int halfLength = (customers.length / 2).ceil();
    final List<CustomerModel> firstHalf = customers.sublist(0, halfLength);
    final List<CustomerModel> secondHalf = customers.sublist(halfLength);
    return Container(
      height: context.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text('Name',
                          style: f10w400.copyWith(
                            color:
                                context.appTheme.colors.customerListTitleColor,
                          ))),
                  Expanded(
                      child: Text('Email',
                          style: f10w400.copyWith(
                            color:
                                context.appTheme.colors.customerListTitleColor,
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text('Name',
                          style: f10w400.copyWith(
                            color:
                                context.appTheme.colors.customerListTitleColor,
                          ))),
                  Expanded(
                      child: Text('Email',
                          style: f10w400.copyWith(
                            color:
                                context.appTheme.colors.customerListTitleColor,
                          ))),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Row(
                children: [
                  // First Column
                  Expanded(
                    child: ListView.builder(
                      itemCount: firstHalf.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  firstHalf[index].accName,
                                  style: f8w500.copyWith(
                                      color: isHomePage
                                          ? Colors.black
                                          : context.appTheme.colors.basic),
                                )),
                                Text(
                                  firstHalf[index].accMail,
                                  style: f8w500.copyWith(
                                      color: isHomePage
                                          ? Colors.black
                                          : context.appTheme.colors.basic),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 10,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            Divider(thickness: 1, color: Colors.grey.shade300),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Second Column
                  Expanded(
                    child: ListView.builder(
                      itemCount: secondHalf.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  secondHalf[index].accName,
                                  style: f8w500.copyWith(
                                      color: isHomePage
                                          ? Colors.black
                                          : context.appTheme.colors.basic),
                                )),
                                Text(
                                  secondHalf[index].accMail,
                                  style: f8w500.copyWith(
                                      color: isHomePage
                                          ? Colors.black
                                          : context.appTheme.colors.basic),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 10,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            Divider(thickness: 1, color: Colors.grey.shade300),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
