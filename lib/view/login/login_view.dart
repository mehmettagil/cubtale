import 'package:cubtale/app_bloc/login/login_bloc.dart';
import 'package:cubtale/core/constants/string_constants.dart';
import 'package:cubtale/core/constants/style_constants.dart';
import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:cubtale/view/home/home_view.dart';
import 'package:cubtale/view/login/widget/cubtale_appbar.dart';
import 'package:cubtale/view/login/widget/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.colors.backgroundColor,
      appBar: const CubTaleAppBar(),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
            )),
        child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) {
            return previous.processFailureOrUnitOption !=
                current.processFailureOrUnitOption;
          },
          builder: (context, state) {
            if (state.processFailureOrUnitOption.isSome()) {
              final failure =
                  state.processFailureOrUnitOption.fold(() => null, (a) => a);
              if (failure!.isLeft()) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ErrorView(errorMessage: "HATA");
                    },
                  );
                  context.read<LoginBloc>().add(const LoginClearEvent());
                });
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeView(
                                index: 1,
                              )));
                });
                context.read<LoginBloc>().add(const LoginClearEvent());
              }
            }

            return Column(
              children: [
                SizedBox(
                  height: context.height * 0.1,
                ),
                Center(
                  child: Container(
                    width: context.width * 0.44,
                    height: context.height * 0.5,
                    decoration: BoxDecoration(
                        color: context.appTheme.colors.secondaryBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.08),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.userName,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.6))),
                                const SizedBox(
                                  height: 30,
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
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  StringConstants.password,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                const SizedBox(height: 30),
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
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
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
                                          color: Colors.black.withOpacity(0.5),
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
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
