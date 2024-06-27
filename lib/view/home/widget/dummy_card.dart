import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/core/model/customer/customer_model.dart';
import 'package:cubtale/view/home/widget/customer_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DummyCard extends StatelessWidget {
  final String title;
  final bool isUsers;
  const DummyCard({
    super.key,
    required this.title,
    required this.isUsers,
  });

  @override
  Widget build(BuildContext context) {
    if (isUsers) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
          border: Border.all(color: const Color(0xffb8e6db), width: 2),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.5)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: context.width < 1350 ? 450 : context.width / 3,
                  height: 210,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          const Color(0xffb8e6db).withOpacity(0.6),
                        ],
                      )),
                  child: CustomerListPage(
                    customers: [
                      CustomerModel(
                          accId: "accId",
                          accMail: "accMail",
                          accName: "accName",
                          accSurname: "accSurname",
                          accVerified: true,
                          accCreationDate: "accCreationDate"),
                      CustomerModel(
                          accId: "accId",
                          accMail: "accMail",
                          accName: "accName",
                          accSurname: "accSurname",
                          accVerified: true,
                          accCreationDate: "accCreationDate"),
                    ],
                  )),
            ),
          ],
        ),
      );
    } else {
      return Container(
        width: context.width < 1350 ? 490 : context.width / 2.9,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xffb8e6db), width: 2)),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.5)),
            ),
            Container(
              width: context.width < 1350 ? 450 : context.width / 3,
              height: 210,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      const Color(0xffb8e6db).withOpacity(0.6),
                    ],
                  )),
            )
          ],
        ),
      );
    }
  }
}
