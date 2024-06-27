import 'package:cubtale/core/model/customer/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({
    super.key,
    required this.customers,
  });

  final List<CustomerModel> customers;

  @override
  Widget build(BuildContext context) {
    final int halfLength = (customers.length / 2).ceil();
    final List<CustomerModel> firstHalf = customers.sublist(0, halfLength);
    final List<CustomerModel> secondHalf = customers.sublist(halfLength);
    return Container(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text('Name',
                          style: TextStyle(color: Colors.teal, fontSize: 13))),
                  Expanded(
                      child: Text('Email',
                          style: TextStyle(color: Colors.teal, fontSize: 13))),
                  Expanded(
                      child: Text('Name',
                          style: TextStyle(color: Colors.teal, fontSize: 13))),
                  Expanded(
                      child: Text('Email',
                          style: TextStyle(color: Colors.teal, fontSize: 13))),
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 8),
                                )),
                                Text(firstHalf[index].accMail,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 8)),
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
                  SizedBox(
                    width: 4,
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
                                    child: Text(secondHalf[index].accName,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 8))),
                                Text(secondHalf[index].accMail,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 8)),
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
