import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/widget/dummy_card.dart';
import 'package:flutter/material.dart';

class DummyView extends StatelessWidget {
  const DummyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.08),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                DummyCard(
                  title: "Todays New Users",
                  isUsers: true,
                ),
                SizedBox(
                  width: 40,
                ),
                DummyCard(
                  title: "Dummy Card 1",
                  isUsers: false,
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                DummyCard(
                  title: "Dummy Card 2",
                  isUsers: false,
                ),
                SizedBox(
                  width: 40,
                ),
                DummyCard(
                  title: "Dummy Card 3",
                  isUsers: false,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
