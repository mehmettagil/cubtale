import 'package:cubtale/app_bloc/login/login_bloc.dart';
import 'package:cubtale/core/constants/string_constants.dart';
import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/home_view.dart';
import 'package:cubtale/view/login/widget/cubtale_login_appbar.dart';
import 'package:cubtale/view/login/widget/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "../core/listeners/login_chack_listener.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.appTheme.colors.appBarColor,
        appBar: const CubTaleLoginAppBar(),
        body: MultiBlocListener(
          listeners: [
            _getLoginCheckListener(),
            _getLoginCheckErrorListener(),
          ],
          child: Container(
              decoration: BoxDecoration(
                  color: context.appTheme.colors.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  Center(
                    child: Container(
                      width: context.width * 0.44,
                      decoration: BoxDecoration(
                          color:
                              context.appTheme.colors.secondaryBackgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.08),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.userName,
                                    style: f18w700.copyWith(
                                      color: context.appTheme.colors.basic,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                BlocBuilder<LoginBloc, LoginState>(
                                  buildWhen: (previous, current) {
                                    return previous.email != current.email;
                                  },
                                  builder: (context, state) {
                                    return TextField(
                                      onChanged: (value) {
                                        context
                                            .read<LoginBloc>()
                                            .addLoginEmailChangeEvent(
                                                email: value);
                                      },
                                      decoration: _inputDecoration(context),
                                      style: TextStyle(
                                        color: context.appTheme.colors.basic,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  StringConstants.password,
                                  style: f18w700.copyWith(
                                    color: context.appTheme.colors.basic,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                BlocBuilder<LoginBloc, LoginState>(
                                  buildWhen: (previous, current) {
                                    return previous.password !=
                                        current.password;
                                  },
                                  builder: (context, state) {
                                    return TextField(
                                      onChanged: (value) {
                                        context
                                            .read<LoginBloc>()
                                            .addLoginPasswordChangeEvent(
                                                password: value);
                                      },
                                      obscureText: true,
                                      decoration: _inputDecoration(context),
                                      style: TextStyle(
                                        color: context.appTheme.colors.basic,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: context.height / 20),
                          Row(
                            children: [
                              const Spacer(),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      context
                                          .read<LoginBloc>()
                                          .addLoginCompleteEvent();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: context
                                              .appTheme.colors.textFieldColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 45, vertical: 10),
                                        child: Text(
                                          StringConstants.login,
                                          textAlign: TextAlign.center,
                                          style: f22w700.copyWith(
                                            color:
                                                context.appTheme.colors.basic,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: context.width * 0.05,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      fillColor: context.appTheme.colors.textFieldColor,
      border: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.appTheme.colors.textFieldColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.appTheme.colors.backgroundColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.appTheme.colors.textFieldColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}
