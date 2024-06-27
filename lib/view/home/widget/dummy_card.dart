import 'package:cubtale/app_bloc/search/search_bloc.dart';
import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/core/model/customer/customer_model.dart';
import 'package:cubtale/view/home/widget/customer_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            color: context.appTheme.colors.errorBackground,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
                color: context.appTheme.colors.borderColor, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0),
                blurRadius: 2,
              ),
            ]),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: f26w700.copyWith(
                  color: context.appTheme.colors.searchTitleColor),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                  width: context.width < 1350 ? 450 : context.width / 3,
                  height: 210,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: context.appTheme.isDarkTheme
                            ? [
                                Color.fromARGB(255, 156, 154, 149)
                                    .withOpacity(0.7),
                                Colors.white,
                              ]
                            : [
                                const Color(0xffb8e6db).withOpacity(0.6),
                                Colors.white,
                              ],
                      )),
                  child: BlocBuilder<SearchBloc, SearchState>(
                    buildWhen: (previous, current) {
                      return previous.processFailureOrTodayUserOption !=
                          current.processFailureOrTodayUserOption;
                    },
                    builder: (context, state) {
                      if (state.todayCustomerModel == null) {
                        return const SizedBox();
                      } else {
                        return CustomerListPage(
                          customers: state.todayCustomerModel!,
                          isHomePage: true,
                        );
                      }
                    },
                  )),
            ),
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            color: context.appTheme.colors.errorBackground,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
                color: context.appTheme.colors.borderColor, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0),
                blurRadius: 2,
              ),
            ]),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: f26w700.copyWith(
                  color: context.appTheme.colors.searchTitleColor),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
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
              ),
            )
          ],
        ),
      );
    }
  }
}
