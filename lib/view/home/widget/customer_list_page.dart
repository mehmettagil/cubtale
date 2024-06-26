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
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                      child:
                          Text('Name', style: TextStyle(color: Colors.teal))),
                  Expanded(
                      child:
                          Text('Email', style: TextStyle(color: Colors.teal))),
                  Expanded(
                      child:
                          Text('Name', style: TextStyle(color: Colors.teal))),
                  Expanded(
                      child:
                          Text('Email', style: TextStyle(color: Colors.teal))),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(firstHalf[index].accName)),
                                  Expanded(
                                      child: Text(firstHalf[index].accMail)),
                                  const Icon(Icons.arrow_forward_ios_rounded,
                                      size: 16),
                                ],
                              ),
                            ),
                            Divider(thickness: 1, color: Colors.grey.shade300),
                          ],
                        );
                      },
                    ),
                  ),
                  // Second Column
                  Expanded(
                    child: ListView.builder(
                      itemCount: secondHalf.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(secondHalf[index].accName)),
                                  Expanded(
                                      child: Text(secondHalf[index].accMail)),
                                  const Icon(Icons.arrow_forward_ios_rounded,
                                      size: 16),
                                ],
                              ),
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


